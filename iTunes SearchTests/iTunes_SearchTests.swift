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
        let mock = MockDataLoader()
        mock.data = goodResultsData
        
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectation = expectation(description: "Wait for results")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 2)
        // Now check results
        XCTAssertTrue(controller.searchResults.count == 2, "Expecting two results for GarageBand")
        XCTAssertEqual("GarageBand", controller.searchResults[0].title)
        XCTAssertEqual("Apple", controller.searchResults[0].artist)
    }
    
    func testBadResultData() {
        let mock = MockDataLoader()
        mock.data = badResultsData
        
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectation = expectation(description: "Wait for search results")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 2)
        // Now check results
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting nil result for GarageBand using bad data")
        XCTAssertNotNil(controller.error)
    }
    
    func testNoResult() {
        let mock = MockDataLoader()
        mock.data = noResultsData
        
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectation = expectation(description: "Wait for search results")
        
        controller.performSearch(for: "asdfgh", resultType: .software) {
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 2)
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting no results for asdfgh")
        XCTAssertNil(controller.error)
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
