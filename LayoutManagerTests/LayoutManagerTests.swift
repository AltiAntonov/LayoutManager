//
//  LayoutManagerTests.swift
//  LayoutManagerTests
//
//  Created by Altimir Antonov on 6/2/16.
//  Copyright © 2016 Altimir Antonov. All rights reserved.
//

import XCTest
@testable import LayoutManager

class LayoutManagerTests: XCTestCase {
    
    let testSuperview : UIView = UIView(frame: CGRectMake(0, 0, 100, 100))
    let testAnchorView : UIView = UIView()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testSuperview.addSubview(testAnchorView)
        
        testAnchorView.frame = CGRectZero
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testAnchorView.frame = CGRectZero
        
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFillSuperview() {
        testAnchorView.removeFromSuperview()
        testAnchorView.fillSuperview()
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectZero))
        
        testSuperview.addSubview(testAnchorView)
        
        testAnchorView.fillSuperview()
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, testSuperview.frame))
        
        testAnchorView.fillSuperview(left: 0, right: 0, top: 0, bottom: 0)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, testSuperview.frame))
        
        testAnchorView.fillSuperview(left: 20, right: 30, top: 20, bottom: 35)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(20, 20, 50, 45)))
    }
    
    func testAnchorInCenter() {
        testAnchorView.removeFromSuperview()
        testAnchorView.anchorInCenter(width: 0, height: 0)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectZero))
        
        testSuperview.addSubview(testAnchorView)
        
        testAnchorView.anchorInCenter(width: 0, height: 0)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(50, 50, 0, 0)))
        
        testAnchorView.anchorInCenter(width: 20, height: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(40, 35, 20, 30)))
    }
}
