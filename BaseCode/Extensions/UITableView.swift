//
//  UITableView.swift
//  Education Platform
//
//  Created by Thanh-Tam Le on 2/10/17.
//  Copyright © 2017 Duy Cao. All rights reserved.
//

import UIKit

extension UITableView {
    
    ///usage: let cell = tableView.dequeueReusableCell(ofType: CustomeTableViewCell.self)
    func dequeueReusableCell<Cell: UITableViewCell>(ofType type: Cell.Type) -> Cell {
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: type))
        return cell as! Cell
    }
    
    ///usage let cell: CustomTableViewCell = tableView.dequeueCell(for: indexPath)
    func dequeueCell<T: UITableViewCell>(for indexpath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexpath) as! T
    }
    
    func setAndLayoutTableHeaderView(header: UIView) {
        self.tableHeaderView = header
        header.setNeedsLayout()
        header.layoutIfNeeded()
        let height = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = header.frame
        frame.size.height = height
        header.frame = frame
        self.tableHeaderView = header
    }
    
    func reloadRowsInSection(section: Int, oldCount:Int, newCount: Int){
        
        let maxCount = max(oldCount, newCount)
        let minCount = min(oldCount, newCount)
        
        var changed = [NSIndexPath]()
        
        for i in minCount..<maxCount {
            let indexPath = NSIndexPath(item: i, section: section)
            changed.append(indexPath)
        }
        
        var reload = [NSIndexPath]()
        for i in 0..<minCount{
            let indexPath = NSIndexPath(item: i, section: section)
            reload.append(indexPath)
        }
        
        beginUpdates()
        if(newCount > oldCount) {
            insertRows(at: changed as [IndexPath], with: .fade)
        }
        else if(oldCount > newCount){
            deleteRows(at: changed as [IndexPath], with: .fade)
        }
        
        if(newCount > oldCount || newCount == oldCount) {
            reloadRows(at: reload as [IndexPath], with: .bottom)
        }
        endUpdates()
        
    }
}
