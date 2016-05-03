//
//  DetailCellNode.swift
//  ASViewController
//
//  Created by TonThatVinh on 5/3/16.
//  Copyright © 2016 vn.tonthatvinh. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class DetailCellNode : ASCellNode {
    var row : Int
    var imageCategory: String
    let imageNode : ASNetworkImageNode
    
    init(row: Int, imageCategory: String) {
        self.imageNode = ASNetworkImageNode()
        self.imageNode.backgroundColor = ASDisplayNodeDefaultPlaceholderColor()
        self.row = row
        self.imageCategory = imageCategory
        
        super.init()
        
        self.addSubnode(self.imageNode)
    }
    
    override func layoutDidFinish() {
        self.imageNode.URL = self.imageURL()
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        super.layoutSpecThatFits(constrainedSize)
        self.imageNode.position = CGPointZero
        self.imageNode.sizeRange = ASRelativeSizeRangeMakeWithExactCGSize(constrainedSize.max)
        return ASStaticLayoutSpec(children: [self.imageNode])
    }
    
    func imageURL() -> NSURL {
        let imageSize = self.calculatedSize
        if let imageURLString : String = String(format: "http://lorempixel.com/%ld/%ld/%@/%ld", imageSize.width, imageSize.height, self.imageCategory, self.row) {
            return NSURL(string: imageURLString)!
        }
        return NSURL()
    }
}