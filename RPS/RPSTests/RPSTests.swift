//
//  RPSTests.swift
//  RPSTests
//
//  Created by Artsiom Sakratar on 2/26/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import XCTest
@testable import RPS

class RPSTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRockResult() {
        let sign = Sign.rock
        print(sign)
        print(sign.emoji)
        XCTAssert(sign.takeTurn(.rock) == .draw)
        XCTAssert(sign.takeTurn(.paper) == .lose)
        XCTAssert(sign.takeTurn(.scissors) == .win)
    }
    
    func testPaperResult() {
        let sign = Sign.paper
        print(sign)
        print(sign.emoji)
        XCTAssert(sign.takeTurn(.rock) == .win)
        XCTAssert(sign.takeTurn(.paper) == .draw)
        XCTAssert(sign.takeTurn(.scissors) == .lose)
    }
    
    func testScissorsResult() {
        let sign = Sign.scissors
        print(sign)
        print(sign.emoji)
        XCTAssert(sign.takeTurn(.rock) == .lose)
        XCTAssert(sign.takeTurn(.paper) == .win)
        XCTAssert(sign.takeTurn(.scissors) == .draw)
    }
}
