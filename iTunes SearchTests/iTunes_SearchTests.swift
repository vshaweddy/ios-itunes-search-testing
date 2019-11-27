//
//  iTunes_SearchTests.swift
//  iTunes SearchTests
//
//  Created by Vici Shaweddy on 11/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

// What should we test?
// Does decoding work?
// Does decoding fail when given bad data?
// Does it build the correct URL?
// Does it build the correct URLRequest?
// Are the results saved properly?
// Is completion handler called if the networking fails
// Is the completion handler called if the data is bad?
// Is the completion handler called if the data is good?

class iTunes_SearchTests: XCTestCase {
    
    func testForSomeResults() {
        let controller = SearchResultController()
        let resultsExpectation = expectation(description: "Wait for results")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 2)
        XCTAssertTrue(controller.searchResults.count > 0, "Expecting at least one result for GarageBand")
    }
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
