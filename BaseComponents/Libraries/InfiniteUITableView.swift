//
//  InfiniteUITableView.swift
//  Infinite Scrolling
//
//  Created by Hunain Shahid on 13/11/2018.
//  Copyright © 2018 BrainX Technologies. All rights reserved.
//

import UIKit

@objc
protocol InfiniteUITableViewDelegate : class {
    func infiniteTableViewShouldLoadNextPage() -> Bool
    func infiniteTableViewDidRefresh() -> Void
    func infiniteTableViewLoadNextPage() -> Void
}

@IBDesignable
class InfiniteUITableView: UITableView {

    private let kContentOffsetChangeProperty = "contentOffset"
    private let kActivityIndicatorSize = CGSize(width: 20, height: 20)
    
    private var refControl = UIRefreshControl()
    private var lazyLoadingFooterView: UIView!
    private var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var infiniteDelegate: InfiniteUITableViewDelegate?
    
    // MARK: Inspectable Properties
    @IBInspectable var lazyLoaderFooterHeight: CGFloat = 50.0 {
        didSet {
            indicator.frame = CGRect(
                x: self.frame.size.width / 2,
                y: (lazyLoaderFooterHeight - kActivityIndicatorSize.height) / 2,
                width: kActivityIndicatorSize.width,
                height: kActivityIndicatorSize.height
            )
            lazyLoadingFooterView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: lazyLoaderFooterHeight)
        }
    }
    
    @IBInspectable var lazyLoaderTintColor: UIColor = UIColor.gray {
        didSet {
            indicator.color = lazyLoaderTintColor
        }
    }
    
    @IBInspectable var refreshControlTintColor: UIColor = UIColor.black {
        didSet {
            refControl.tintColor = refreshControlTintColor
        }
    }
    
    // MARK: Readonly properties
    open private(set) var isRefresh = false
    open private(set) var nextPageRequested = false
    
    // MARK: Override methods
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == kContentOffsetChangeProperty {
            let actualPosition = self.contentOffset.y
            let contentHeight = self.contentSize.height - self.frame.size.height
            if contentHeight > 0 && contentHeight - actualPosition <= 10 {
                let shouldLoadNextPage = infiniteDelegate?.infiniteTableViewShouldLoadNextPage() ?? false
                if !nextPageRequested && shouldLoadNextPage {
                    nextPageRequested = true
                    self.tableFooterView = lazyLoadingFooterView
                    
                    infiniteDelegate?.infiniteTableViewLoadNextPage ()
                }
            }
        }
    }
    
    func reloadInfiniteScrollingLayout() {
        // Stop refreshing controls
        self.isRefresh = false
        self.refControl.endRefreshing()
        
        // Hide lazy loading footer view
        self.nextPageRequested = false
        self.tableFooterView = UIView()
    }
    
    // MARK: Private method
    private func commonInit() {
        indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.color = lazyLoaderTintColor
        indicator.frame = CGRect(
            x: self.frame.size.width / 2,
            y: (lazyLoaderFooterHeight - kActivityIndicatorSize.height) / 2,
            width: kActivityIndicatorSize.width,
            height: kActivityIndicatorSize.height
        )
        
        lazyLoadingFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: lazyLoaderFooterHeight))
        lazyLoadingFooterView.addSubview(indicator)
        refControl.tintColor = refreshControlTintColor
        refControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControl.Event.valueChanged)
        
        self.addSubview(refControl)
        self.tableFooterView = UIView()
        
        addObserver(self, forKeyPath: kContentOffsetChangeProperty, options: .new, context: nil)
    }
    
    // MARK: Actions
    @objc
    func handleRefresh(refreshControl: UIRefreshControl) {
        isRefresh = true
    
        infiniteDelegate?.infiniteTableViewDidRefresh()
    }
}
