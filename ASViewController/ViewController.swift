//
//  ViewController.swift
//  ASViewController
//
//  Created by TonThatVinh on 5/3/16.
//  Copyright © 2016 vn.tonthatvinh. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASViewController {
    var imageCategories : [String]
    var tableNode : ASTableNode {
        get {
            return self.node as! ASTableNode
        }
    }
    
    init() {
        imageCategories = ["abstract", "animals", "business", "cats", "city", "food", "nightlife", "fashion", "people", "nature", "sports", "technics", "transport"]
        
        super.init(node: ASTableNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.tableNode.dataSource = nil
        self.tableNode.delegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Image Categories";
        
        self.tableNode.dataSource = self
        self.tableNode.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedRow = self.tableNode.view.indexPathForSelectedRow {
            self.tableNode.view.deselectRowAtIndexPath(selectedRow, animated: true)
        }
    }
}

extension ViewController : ASTableDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageCategories.count
    }
    
    func tableView(tableView: ASTableView, nodeForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNode {
        let textCellNode : ASTextCellNode = ASTextCellNode()
        textCellNode.text = self.imageCategories[indexPath.row].capitalizedString
        return textCellNode
    }
}

extension ViewController : ASTableDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let imageCategory : String = self.imageCategories[indexPath.row];
        
        let detailRootNode : DetailRootNode = DetailRootNode(imageCategory: imageCategory)
        let detailViewController : DetailViewController = DetailViewController(node: detailRootNode)
        detailViewController.title = imageCategory.capitalizedString
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}