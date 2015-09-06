//
//  UIUpdaterTests.swift
//  ActivityBar
//
//  Created by Nils Breunese on 06-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

import XCTest
@testable import ActivityBar

class UIUpdaterTests: XCTestCase {
    
    func testStartElement() {
        // Given
        let history = History<CPUSample>(maxElements: 10)
        history.add(CPUSample(system: 10, user: 20, idle: 30, nice: 40))
        history.add(CPUSample(system: 15, user: 20, idle: 30, nice: 35))
        history.add(CPUSample(system: 15, user: 45, idle: 15, nice: 25))
        
        let uiUpdater = UIUpdater(button: NSButton())
        let size = NSSize(width: 20, height: 10)
        
        // When
        let path = uiUpdater.createPathFromCPUHistory(history, size: size)
        let points = NSPointArray.alloc(1) // There can be up to three NSPoints associated with a path element
        let firstElement = path.elementAtIndex(0, associatedPoints: points)
        
        // Then
        XCTAssertEqual(firstElement, NSBezierPathElement.MoveToBezierPathElement)
        XCTAssertEqual(points[0].x, size.width)
        XCTAssertEqual(points[0].y, size.height)
    }
    
    func testElementCount() {
        // Given
        let history = History<CPUSample>(maxElements: 10)
        history.add(CPUSample(system: 10, user: 20, idle: 30, nice: 40))
        history.add(CPUSample(system: 15, user: 20, idle: 30, nice: 35))
        history.add(CPUSample(system: 15, user: 45, idle: 15, nice: 25))
        
        let uiUpdater = UIUpdater(button: NSButton())
        let size = NSSize(width: 20, height: 10)
        
        // When
        let path = uiUpdater.createPathFromCPUHistory(history, size: size)
        
        // Then
        XCTAssertEqual(path.elementCount, 7) // Number of CPU samples + 4 (start, baseline, close & fill)
    }
    
    func testDistance() {
        let uiUpdater = UIUpdater(button: NSButton())
        let distance = uiUpdater.distance(10, numberOfElements: 11)
        XCTAssertEqual(distance, 1)
    }
}
