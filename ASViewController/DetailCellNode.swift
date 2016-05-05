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
    var imageNode : ASNetworkImageNode
    
    init(row: Int, imageCategory: String) {
        self.row = row
        self.imageCategory = imageCategory
        self.imageNode = ASNetworkImageNode()
        self.imageNode.backgroundColor = ASDisplayNodeDefaultPlaceholderColor()
        
        super.init()
        
        self.addSubnode(self.imageNode)
    }
    
    override func layoutDidFinish() {
        super.layoutDidFinish()
        
        self.imageNode.URL = self.imageURL()
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        self.imageNode.position = CGPointZero
        self.imageNode.sizeRange = ASRelativeSizeRangeMakeWithExactCGSize(constrainedSize.max)
        return ASStaticLayoutSpec(children: [self.imageNode])
    }
    
    func imageURL() -> NSURL {
        let imageSize = self.calculatedSize
        if let imageURLString : String = String(format: "http://lorempixel.com/\(Int(imageSize.width))/\(Int(imageSize.height))/\(self.imageCategory)/\(Int(self.row))" ) {
            print("imageURLString \(imageURLString)")
            return NSURL(string: imageURLString)!
        }
        return NSURL()
    }
}