//
//  AppConfigurationTests.swift
//  LandmarksTests
//
//  Created by MacBook Air M1 on 21/6/24.
//

import XCTest
@testable import Landmarks

class AppConfigurationTests: XCTestCase {
    
    func testLocalLandmarkDataFilename() {
        let config = AppConfiguration()
        XCTAssertEqual(config.localLandmarkDataFilename, "landmarkData")
    }
}
