//
//  JSONLoaderTests.swift
//  LandmarksTests
//
//  Created by MacBook Air M1 on 21/6/24.
//

import XCTest
@testable import Landmarks

class JSONLoaderTests: XCTestCase {
    
    func testLoadJSONSuccess() {
        let loader = JSONLoader()
        
        guard let data = loader.loadJSON(filename: "landmarkData") else {
            XCTFail("Failed to load JSON")
            return
        }
        
        if let jsonString = String(data: data, encoding: .utf8) {
            XCTAssertTrue(jsonString.contains("\"name\": \"Turtle Rock\""))
        } else {
            XCTFail("Data could not be converted to a string")
        }
    }
    
    func testLoadJSONFailure() {
        let loader = JSONLoader()
        let data = loader.loadJSON(filename: "non_existent_file")
        XCTAssertNil(data)
    }
}

