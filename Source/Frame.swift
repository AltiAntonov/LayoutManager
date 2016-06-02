//
//  Frame.swift
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

public protocol Frameable : class {
    
    var frame: CGRect { get set }
    
    var superFrame: CGRect { get }

    var x: CGFloat { get }

    var xMid: CGFloat { get }

    var xMax: CGFloat { get }

    var y: CGFloat { get }

    var yMid: CGFloat { get }

    var yMax: CGFloat { get }

    var width: CGFloat { get }
    
    var height: CGFloat { get }
    
    func setDimensionAutomatically()
}

extension Frameable {
    
    public var x: CGFloat {
        return CGRectGetMinX(frame)
    }
    
    public  var xMid: CGFloat {
        return CGRectGetMinX(frame) + (CGRectGetWidth(frame) / 2.0)
    }
    
    public var xMax: CGFloat {
        return CGRectGetMaxX(frame)
    }
    
    public var y: CGFloat {
        return CGRectGetMinY(frame)
    }
    
    public var yMid: CGFloat {
        return CGRectGetMinY(frame) + (CGRectGetHeight(frame) / 2.0)
    }
    
    public var yMax: CGFloat {
        return CGRectGetMaxY(frame)
    }
    
    public var width: CGFloat {
        return CGRectGetWidth(frame)
    }
    
    public var height: CGFloat {
        return CGRectGetHeight(frame)
    }
}
