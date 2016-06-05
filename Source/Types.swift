//
//  Types.swift
//  LayoutManager
//
//  Created by Altimir Antonov on 6/2/16.
//  Copyright © 2016 Altimir Antonov. All rights reserved.
//

public enum Corner {
    case TopLeft
    case TopRight
    case BottomLeft
    case BottomRight
}

public enum Edge {
    case Top
    case Left
    case Bottom
    case Right
}

public enum Group {
    case Horizontal
    case Vertical
}

public enum Align {
    case ToTheRightMatchingTop
    case ToTheRightMatchingBottom
    case ToTheRightCentered
    case ToTheLeftMatchingTop
    case ToTheLeftMatchingBottom
    case ToTheLeftCentered
    case UnderMatchingLeft
    case UnderMatchingRight
    case UnderCentered
    case AboveMatchingLeft
    case AboveMatchingRight
    case AboveCentered
}