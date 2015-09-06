//
//  HistoryTests.swift
//  ActivityBar
//
//  Created by Nils Breunese on 06-09-15.
//  Copyright © 2015 breun. All rights reserved.
//

import XCTest
@testable import ActivityBar

class HistoryTests: XCTestCase {
    
    func testCount() {
        let history = History<Int>(maxElements: 10)
        for i in 1...9 {
            history.add(i)
        }
        XCTAssertEqual(history.count, 9)
    }
    
    func testMaxElements() {
        let history = History<Int>(maxElements: 10)
        for i in 1...20 {
            history.add(i)
        }
        XCTAssertEqual(history.count, 10)
    }
    
    func testMostRecentlyAdded() {
        let history = History<Int>(maxElements: 10)
        for i in 1...20 {
            history.add(i)
        }
        XCTAssertEqual(history[9], 20)
    }
    
    func testOldestEntry() {
        let history = History<Int>(maxElements: 10)
        for i in 1...20 {
            history.add(i)
        }
        XCTAssertEqual(history[0], 11)
    }
}