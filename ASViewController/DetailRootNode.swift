//
//  DetailRootNode.swift
//  ASViewController
//
//  Created by TonThatVinh on 5/3/16.
//  Copyright © 2016 vn.tonthatvinh. All rights reserved.
//

import UIKit
import AsyncDisplayKit

let kImageHeight : CGFloat = 200

class DetailRootNode : ASDisplayNode {
    
    var collectionNode : ASCollectionNode
    var imageCategory : String
    
    init(imageCategory : String){
        self.imageCategory = imageCategory
        self.collectionNode = ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
        
        super.init()
        
        self.collectionNode.delegate = self
        self.collectionNode.dataSource = self
        self.collectionNode.backgroundColor = UIColor.whiteColor()
        self.usesImplicitHierarchyManagement = true
    }
    
    deinit {
        self.collectionNode.delegate = nil
        self.collectionNode.dataSource = nil
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        self.collectionNode.position = CGPointZero
        self.collectionNode.sizeRange = ASRelativeSizeRangeMakeWithExactCGSize(constrainedSize.max)
        return ASStaticLayoutSpec(children: [self.collectionNode])
    }
}
extension DetailRootNode : ASCollectionDelegate {
    
}

extension DetailRootNode : ASCollectionDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func collectionView(collectionView: ASCollectionView, nodeForItemAtIndexPath indexPath: NSIndexPath) -> ASCellNode {
        let imageCategory : String = self.imageCategory
        return DetailCellNode(row: indexPath.row, imageCategory: imageCategory)
    }
    
    func collectionView(collectionView: ASCollectionView, constrainedSizeForNodeAtIndexPath indexPath: NSIndexPath) -> ASSizeRange {
        let imageSize : CGSize = CGSizeMake(CGRectGetWidth(collectionView.frame), kImageHeight)
        return ASSizeRangeMake(imageSize, imageSize)
    }
}
