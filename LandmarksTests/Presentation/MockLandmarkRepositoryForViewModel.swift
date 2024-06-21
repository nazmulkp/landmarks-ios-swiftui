//
//  MockLandmarkRepositoryForViewModel.swift
//  LandmarksTests
//
//  Created by MacBook Air M1 on 21/6/24.
//

import XCTest
import Combine
@testable import Landmarks

class MockLandmarkRepositoryForViewModel: LandmarkRepository {
    var shouldReturnError = false
    var landmarks: [Landmark] = [
        Landmark(name: "Test Landmark 1", id: 1, subtitle: "Subtitle 1", imageName: "image1"),
        Landmark(name: "Test Landmark 2", id: 2, subtitle: "Subtitle 2", imageName: "image2")
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



