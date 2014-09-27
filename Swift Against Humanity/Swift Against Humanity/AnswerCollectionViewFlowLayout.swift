//
//  AnswerCollectionViewFlowLayout.swift
//  Swift Against Humanity
//
//  Created by Daniel Valencia on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import UIKit

//class AnswerCollectionViewFlowLayout: UICollectionViewFlowLayout {
//   
//    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        let collectionViewSize:CGSize? = self.collectionView?.bounds.size
//        let width:CGFloat = self.collectionView?.bounds.size.width ?? 0.0
//        
//        let proposedContentOffsetCenterX = proposedContentOffset.x + width * 0.5
//        let proposedRect = self.collectionView?.bounds
//        
//        let attributesArray: [AnyObject]? = self.layoutAttributesForElementsInRect(proposedRect!)
//        var candidateAttributes: UICollectionViewLayoutAttributes
//        let attributesArrayUnwrapped: [AnyObject] = attributesArray ?? []
//        
//        for attributes:UICollectionViewLayoutAttributes in attributesArrayUnwrapped {
//            if attributes.representedElementCategory! == UICollectionElementCategory.Cell {
//                continue
//            }
//            
//            candidateAttributes = candidateAttributes ?? attributes
//                continue;
//            }
////            if attributes
//        }
//    }
//}
