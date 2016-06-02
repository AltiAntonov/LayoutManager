//
//  LayoutManager.swift
//  LayoutManager
//
//  Created by Altimir Antonov on 6/2/16.
//  Copyright © 2016 Altimir Antonov. All rights reserved.
//

#if os(iOS)
    import UIKit
    typealias View = UIView
#else
    import Cocoa
    typealias View = NSView
#endif

extension View {
    public var superFrame: CGRect {
        guard let superview = superview else {
            return CGRectZero
        }
        
        return superview.frame
    }
    
    public func setDimensionAutomatically() {
        #if os(iOS)
            self.sizeToFit()
        #else
            self.autoresizesSubviews = true
            self.autoresizingMask = [.ViewWidthSizable, .ViewHeightSizable]
        #endif
    }
}

extension CALayer {
    public var superFrame: CGRect {
        guard let superlayer = superlayer else {
            return CGRectZero
        }
        
        return superlayer.frame
    }
    
    public func setDimensionAutomatically() { /* no-op here as this shouldn't apply to CALayers */ }
}