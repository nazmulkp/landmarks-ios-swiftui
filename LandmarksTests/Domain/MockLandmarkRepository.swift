//
//  MockLandmarkRepository.swift
//  LandmarksTests
//
//  Created by MacBook Air M1 on 21/6/24.
//

import XCTest
import Combine
@testable import Landmarks

class MockLandmarkRepository: LandmarkRepository {
    var shouldReturnError = false
    var landmarks = [
        Landmark(name: "Test Landmark", id: 1, subtitle: "Test Subtitle", imageName: "test_image")
    ]
    
    func fetchLandmark() -> AnyPublisher<[Landmark], Error> {
        if shouldReturnError {
            return Fail(error: NSError(domain: "TestError", code: 1, userInfo: nil))
                .eraseToAnyPublisher()
        } else {
            return Just(landmarks)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}

