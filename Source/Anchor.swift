//
//  Anchor.swift
//  LayoutManager
//
//  Created by Altimir Antonov on 6/2/16.
//  Copyright © 2016 Altimir Antonov. All rights reserved.
//

#if os(iOS)
    import UIKit
#else
    import Cocoa
#endif


public protocol Anchorable : Frameable {}

extension Anchorable {
    
    public func fillSuperview(left left: CGFloat = 0, right: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0) {
        
        let width : CGFloat = superFrame.width - (left + right)
        let height : CGFloat = superFrame.height - (top + bottom)
        
        frame = CGRectMake(left, top, width, height)
        
    }
    
    public func anchorInCenter(width width: CGFloat, height: CGFloat) {
        
        let xOrigin : CGFloat = (superFrame.width - width) / 2.0
        let yOrigin : CGFloat = (superFrame.height - height) / 2.0
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
        
    }
    
    public func anchorInCorner(corner: Corner, xPad: CGFloat, yPad: CGFloat, width: CGFloat, height: CGFloat) {
        
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        
        switch corner {
            
        case .TopLeft:
            xOrigin = xPad
            yOrigin = yPad
            
        case .BottomLeft:
            xOrigin = xPad
            yOrigin = superFrame.height - height - yPad
            
        case .TopRight:
            xOrigin = superFrame.width - width - xPad
            yOrigin = yPad
            
        case .BottomRight:
            xOrigin = superFrame.width - width - xPad
            yOrigin = superFrame.height - height - yPad
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
        
    }
    
    public func anchorToEdge(edge: Edge, padding: CGFloat, width: CGFloat, height: CGFloat) {
        
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        
        switch edge {
        case .Top:
            xOrigin = (superFrame.width + width) / 2.0
            yOrigin = padding
            
        case .Left:
            xOrigin = padding
            yOrigin = (superFrame.height - height) / 2.0
            
        case .Bottom:
            xOrigin = (superFrame.width - width) / 2.0
            yOrigin = superFrame.height - height - padding
            
        case .Right:
            xOrigin = superFrame.width - width - padding
            yOrigin = (superFrame.height - height) / 2.0
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)

    }
    
    public func anchorAndFillEdge(edge: Edge, xPad: CGFloat, yPad: CGFloat, otherSize: CGFloat) {
        
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0
        var height : CGFloat = 0.0
        var autoSize : Bool = false
        
        switch edge {
            
        case .Top:
            xOrigin = xPad
            yOrigin = yPad
            width = superFrame.width - (2 * xPad)
            height = otherSize
            autoSize = true
            
        case .Left:
            xOrigin = xPad
            yOrigin = yPad
            width = otherSize
            height = superFrame.height - (2 * yPad)
            
        case .Bottom:
            xOrigin = xPad
            yOrigin = superFrame.height - otherSize - yPad
            width = superFrame.width - (2 * xPad)
            height = otherSize
            autoSize = true
            
        case .Right:
            xOrigin = superFrame.width - otherSize - xPad
            yOrigin = yPad
            width = otherSize
            height = superFrame.height - (2 * yPad)
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
        
        if autoSize {
            self.setDimensionAutomatically()
            self.anchorAndFillEdge(edge, xPad: xPad, yPad: yPad, otherSize: self.height)
        }

    }
}