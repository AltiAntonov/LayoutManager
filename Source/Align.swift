//
//  Align.swift
//  LayoutManager
//
//  Created by Altimir Antonov on 6/5/16.
//  Copyright © 2016 Altimir Antonov. All rights reserved.
//
#if os(iOS)
    import UIKit
#else
    import Cocoa
#endif


public protocol Alignable : Frameable {}

public extension Alignable {
 
    public func align(align: Align, relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat, offset: CGFloat = 0) {
        
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        
        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y + offset
            
        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMax - height + offset
            
        case .ToTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMid - (height / 2.0) + offset
            
        case .ToTheLeftMatchingTop:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.y + offset
            
        case .ToTheLeftMatchingBottom:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.yMax - height + offset
            
        case .ToTheLeftCentered:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.yMid - (height / 2.0) + offset
            
        case .UnderMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.yMax + padding
            
        case .UnderMatchingRight:
            xOrigin = sibling.xMax - width + offset
            yOrigin = sibling.yMax + padding
            
        case .UnderCentered:
            xOrigin = sibling.xMid - (width / 2.0) + offset
            yOrigin = sibling.yMax + padding
            
        case .AboveMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.y - padding - height
            
        case .AboveMatchingRight:
            xOrigin = sibling.xMax - width + offset
            yOrigin = sibling.y - padding - height
            
        case .AboveCentered:
            xOrigin = sibling.xMid - (width / 2.0) + offset
            yOrigin = sibling.y - padding - height
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
        
    }
    
    public func alignAndFillWidth(align align: Align, relativeTo sibling: Frameable, padding: CGFloat, height: CGFloat, offset: CGFloat = 0) {
        
        let superviewWidth = superFrame.width
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0
        
        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y + offset
            width = superviewWidth - xOrigin - padding
            
        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMax - height + offset
            width = superviewWidth - xOrigin - padding
            
        case .ToTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMid - (height / 2.0) + offset
            width = superviewWidth - xOrigin - padding
            
        case .ToTheLeftMatchingTop:
            xOrigin = padding
            yOrigin = sibling.y + offset
            width = sibling.x - (2 * padding)
            
        case .ToTheLeftMatchingBottom:
            xOrigin = padding
            yOrigin = sibling.yMax - height + offset
            width = sibling.x - (2 * padding)
            
        case .ToTheLeftCentered:
            xOrigin = padding
            yOrigin = sibling.yMid - (height / 2.0) + offset
            width = sibling.x - (2 * padding)
            
        case .UnderMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - xOrigin - padding
            
        case .UnderMatchingRight:
            xOrigin = padding + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - (superviewWidth - sibling.xMax) - padding
            
        case .UnderCentered:
            xOrigin = padding + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - (2 * padding)
            
        case .AboveMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.y - padding - height
            width = superviewWidth - xOrigin - padding
            
        case .AboveMatchingRight:
            xOrigin = padding + offset
            yOrigin = sibling.y - padding - height
            width = superviewWidth - (superviewWidth - sibling.xMax) - padding
            
        case .AboveCentered:
            xOrigin = padding + offset
            yOrigin = sibling.y - padding - height
            width = superviewWidth - (2 * padding)
        }
        
        if width < 0.0 {
            width = 0.0
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
       
    }
    
    public func alignAndFillHeight(align align: Align, relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, offset: CGFloat = 0) {
        
        let superviewHeight : CGFloat = superFrame.height
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var height : CGFloat = 0.0
        
        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y + offset
            height = superviewHeight - sibling.y - padding
            
        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = padding + offset
            height = superviewHeight - (superviewHeight - sibling.yMax) - padding
            
        case .ToTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = padding + offset
            height = superviewHeight - (2 * padding)
            
        case .ToTheLeftMatchingTop:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.y + offset
            height = superviewHeight - sibling.y - padding
            
        case .ToTheLeftMatchingBottom:
            xOrigin = sibling.x - width - padding
            yOrigin = padding + offset
            height = superviewHeight - (superviewHeight - sibling.yMax) - padding
            
        case .ToTheLeftCentered:
            xOrigin = sibling.x - width - padding
            yOrigin = padding + offset
            height = superviewHeight - (2 * padding)
            
        case .UnderMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.yMax + padding
            height = superviewHeight - yOrigin - padding
            
        case .UnderMatchingRight:
            xOrigin = sibling.xMax - width + offset
            yOrigin = sibling.yMax + padding
            height = superviewHeight - yOrigin - padding
            
        case .UnderCentered:
            xOrigin = sibling.xMid - (width / 2.0) + offset
            yOrigin = sibling.yMax + padding
            height = superviewHeight - yOrigin - padding
            
        case .AboveMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = padding
            height = sibling.y - (2 * padding)
            
        case .AboveMatchingRight:
            xOrigin = sibling.xMax - width + offset
            yOrigin = padding
            height = sibling.y - (2 * padding)
            
        case .AboveCentered:
            xOrigin = sibling.xMid - (width / 2.0) + offset
            yOrigin = padding
            height = sibling.y - (2 * padding)
        }
        
        if height < 0.0 {
            height = 0.0
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)

    }
    
    public func alignAndFill(align align: Align, relativeTo sibling: Frameable, padding: CGFloat, offset: CGFloat = 0) {
        let superviewWidth : CGFloat = superFrame.width
        let superviewHeight : CGFloat = superFrame.height
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0
        var height : CGFloat = 0.0
        
        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y + offset
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - yOrigin - padding
            
        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = padding + offset
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - (superviewHeight - sibling.yMax) - padding
            
        case .ToTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = padding + offset
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - (2 * padding)
            
        case .ToTheLeftMatchingTop:
            xOrigin = padding
            yOrigin = sibling.y + offset
            width = superviewWidth - (superviewWidth - sibling.x) - (2 * padding)
            height = superviewHeight - yOrigin - padding
            
        case .ToTheLeftMatchingBottom:
            xOrigin = padding
            yOrigin = padding + offset
            width = superviewWidth - (superviewWidth - sibling.x) - (2 * padding)
            height = superviewHeight - (superviewHeight - sibling.yMax) - padding
            
        case .ToTheLeftCentered:
            xOrigin = padding
            yOrigin = padding + offset
            width = superviewWidth - (superviewWidth - sibling.x) - (2 * padding)
            height = superviewHeight - (2 * padding)
            
        case .UnderMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - yOrigin - padding
            
        case .UnderMatchingRight:
            xOrigin = padding + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - (superviewWidth - sibling.xMax) - padding
            height = superviewHeight - yOrigin - padding
            
        case .UnderCentered:
            xOrigin = padding + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - (2 * padding)
            height = superviewHeight - yOrigin - padding
            
        case .AboveMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = padding
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - (superviewHeight - sibling.y) - (2 * padding)
            
        case .AboveMatchingRight:
            xOrigin = padding + offset
            yOrigin = padding
            width = superviewWidth - (superviewWidth - sibling.xMax) - padding
            height = superviewHeight - (superviewHeight - sibling.y) - (2 * padding)
            
        case .AboveCentered:
            xOrigin = padding + offset
            yOrigin = padding
            width = superviewWidth - (2 * padding)
            height = superviewHeight - (superviewHeight - sibling.y) - (2 * padding)
        }
        
        if width < 0.0 {
            width = 0.0
        }
        
        if height < 0.0 {
            height = 0.0
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }
    
    public func alignBetweenHorizontal(align align: Align, primaryView: Frameable, secondaryView: Frameable, padding: CGFloat, height: CGFloat, offset: CGFloat = 0) {
        
        let superviewWidth : CGFloat = superFrame.width
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0
        
        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = primaryView.xMax + padding
            yOrigin = primaryView.y + offset
            width = superviewWidth - primaryView.xMax - (superviewWidth - secondaryView.x) - (2 * padding)
            
        case .ToTheRightMatchingBottom:
            xOrigin = primaryView.xMax + padding
            yOrigin = primaryView.yMax - height + offset
            width = superviewWidth - primaryView.xMax - (superviewWidth - secondaryView.x) - (2 * padding)
            
        case .ToTheRightCentered:
            xOrigin = primaryView.xMax + padding
            yOrigin = primaryView.yMid - (height / 2.0) + offset
            width = superviewWidth - primaryView.xMax - (superviewWidth - secondaryView.x) - (2 * padding)
            
        case .ToTheLeftMatchingTop:
            xOrigin = secondaryView.xMax + padding
            yOrigin = primaryView.y + offset
            width = superviewWidth - secondaryView.xMax - (superviewWidth - primaryView.x) - (2 * padding)
            
        case .ToTheLeftMatchingBottom:
            xOrigin = secondaryView.xMax + padding
            yOrigin = primaryView.yMax - height + offset
            width = superviewWidth - secondaryView.xMax - (superviewWidth - primaryView.x) - (2 * padding)
            
        case .ToTheLeftCentered:
            xOrigin = secondaryView.xMax + padding
            yOrigin = primaryView.yMid - (height / 2.0) + offset
            width = superviewWidth - secondaryView.xMax - (superviewWidth - primaryView.x) - (2 * padding)
            
        case .UnderMatchingLeft, .UnderMatchingRight, .UnderCentered,  .AboveMatchingLeft, .AboveMatchingRight, .AboveCentered:
            fatalError("Doesn't work for Horizontal.")
        }
        
        if width < 0.0 {
            width = 0.0
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
        
    }
    
    public func alignBetweenVertical(align align: Align, primaryView: Frameable, secondaryView: Frameable, padding: CGFloat, width: CGFloat, offset: CGFloat = 0) {
        
        let superviewHeight : CGFloat = superFrame.height
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var height : CGFloat = 0.0
        
        switch align {
        
        case .UnderMatchingLeft:
            xOrigin = primaryView.x + offset
            yOrigin = primaryView.yMax + padding
            height = superviewHeight - primaryView.yMax - (superviewHeight - secondaryView.y) - (2 * padding)
            
        case .UnderMatchingRight:
            xOrigin = primaryView.xMax - width + offset
            yOrigin = primaryView.yMax + padding
            height = superviewHeight - primaryView.yMax - (superviewHeight - secondaryView.y) - (2 * padding)
            
        case .UnderCentered:
            xOrigin = primaryView.xMid - (width / 2.0) + offset
            yOrigin = primaryView.yMax + padding
            height = superviewHeight - primaryView.yMax - (superviewHeight - secondaryView.y) - (2 * padding)
            
        case .AboveMatchingLeft:
            xOrigin = primaryView.x + offset
            yOrigin = secondaryView.yMax + padding
            height = superviewHeight - secondaryView.yMax - (superviewHeight - primaryView.y) - (2 * padding)
            
        case .AboveMatchingRight:
            xOrigin = primaryView.xMax - width + offset
            yOrigin = secondaryView.yMax + padding
            height = superviewHeight - secondaryView.yMax - (superviewHeight - primaryView.y) - (2 * padding)
            
        case .AboveCentered:
            xOrigin = primaryView.xMid - (width / 2.0) + offset
            yOrigin = secondaryView.yMax + padding
            height = superviewHeight - secondaryView.yMax - (superviewHeight - primaryView.y) - (2 * padding)
            
        case .ToTheLeftMatchingTop, .ToTheLeftMatchingBottom, .ToTheLeftCentered, .ToTheRightMatchingTop, .ToTheRightMatchingBottom, .ToTheRightCentered:
            fatalError("Doesn't work for Vertical.")
        }
        
        if height < 0 {
            height = 0
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
        
    }
}
