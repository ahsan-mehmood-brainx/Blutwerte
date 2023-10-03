//
//  CustomTabbarViewController.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 30/08/2023.
//

import UIKit

enum TabItem: Int {
    
    case home = 0
    case tests
    case add
    case charts
    case more
}

class CustomTabbarViewController: ViewController<CustomTabbarViewModel> {

    //MARK: - Outlets
    
    @IBOutlet var tabView: CustomTabbarView!
    
    //MARK: - Properties
    
    private var selectedTab: TabItem = .home
    private var selectedController: UIViewController {
        switch selectedTab {
        case .home:
            return UIViewController()
        case .tests:
            return UIViewController()
        case .add:
            return UIViewController()
        case .charts:
            return UIViewController()
        case .more:
            return UIViewController()
        }
    }
    
    //MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        addTargets()
    }
    
    //MARK: - Action Methods
    
    @objc
    func tabItemTapped(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag,
              let tab = TabItem(rawValue: tag) else {
            return
        }
        setSelectedTab(tab)
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        setSelectedTab(selectedTab)
    }
    
    private func addTargets() {
        tabView.homeView.tag = TabItem.home.rawValue
        tabView.homeView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(tabItemTapped))
        )
        
        tabView.testView.tag = TabItem.tests.rawValue
        tabView.testView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(tabItemTapped))
        )
        
        tabView.addView.tag = TabItem.add.rawValue
        tabView.addView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(tabItemTapped))
        )
        
        tabView.chartsView.tag = TabItem.charts.rawValue
        tabView.chartsView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(tabItemTapped))
        )
        
        tabView.moreView.tag = TabItem.more.rawValue
        tabView.moreView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(tabItemTapped))
        )
    }
    
    private func setSelectedTab(_ tab: TabItem) {
        remove(asChildViewController: selectedController)
        tabView.setActiveView(tab: tab)
        selectedTab = tab
        add(asChildViewController: selectedController)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        tabView.containerView.addSubview(viewController.view)
        viewController.view.frame = tabView.containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addChild(viewController)
        viewController.didMove(toParent: self)
    }
}
