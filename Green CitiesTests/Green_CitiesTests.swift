//
//  Green_CitiesTests.swift
//  Green CitiesTests
//
//  Created by Marko Rankovic on 11/26/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import XCTest
@testable import Green_Cities

class Green_CitiesTests: XCTestCase {

    func testStringContainmentMethod() {
        
        let cityName = "Belgrade"
        let bool = cityName.contains(string: cityName, substring: "lgr", stringIndex: INDEX, substringIndex: INDEX)
        XCTAssert(bool)
    }
    
    func testStartingIndexes() {
        
        let index = 0
        let cityName = "Hildesheim"
        let _ = cityName.contains(string: cityName, substring: "desh", stringIndex: index, substringIndex: index)
        XCTAssertEqual(index, 0)
    }
}
