//
//  JSONFixerTests.swift
//  LandmarksTests
//
//  Created by MacBook Air M1 on 21/6/24.
//

import XCTest
@testable import Landmarks

class JSONFixerTests: XCTestCase {
    
    func testFixJSON() {
        let brokenJSON = """
        {
            "name": "Landmark"
            "location": "Somewhere"
        }
        """
        let expectedFixedJSON = """
        {
            "name": "Landmark",
            "location": "Somewhere"
        }
        """
        
        let fixedJSON = JSONFixer.fix(jsonString: brokenJSON)

        // Convert strings to Data for JSONSerialization
        guard let fixedJSONData = fixedJSON.data(using: .utf8),
              let expectedFixedJSONData = expectedFixedJSON.data(using: .utf8) else {
            XCTFail("Failed to convert strings to data")
            return
        }
        
        do {
            let fixedJSONObject = try JSONSerialization.jsonObject(with: fixedJSONData, options: [])
            let expectedFixedJSONObject = try JSONSerialization.jsonObject(with: expectedFixedJSONData, options: [])
            
            // Compare JSON objects
            XCTAssertTrue(NSDictionary(dictionary: fixedJSONObject as! [AnyHashable: Any]).isEqual(to: expectedFixedJSONObject as! [AnyHashable: Any]))
        } catch {
            XCTFail("JSON Serialization failed: \(error.localizedDescription)")
        }
    }
}

