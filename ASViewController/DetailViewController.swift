//
//  DetailViewController.swift
//  ASViewController
//
//  Created by TonThatVinh on 5/3/16.
//  Copyright © 2016 vn.tonthatvinh. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class DetailViewController: ASViewController {
    var collectionNode : DetailRootNode?
    
    override init(node: ASDisplayNode) {
        super.init(node: node)
        self.collectionNode = (node as! DetailRootNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        self.collectionNode?.collectionNode.view.collectionViewLayout.invalidateLayout()
    }
}
