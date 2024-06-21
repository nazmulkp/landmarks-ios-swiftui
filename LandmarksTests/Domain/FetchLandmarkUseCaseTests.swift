//
//  FetchLandmarkUseCaseTests.swift
//  LandmarksTests
//
//  Created by MacBook Air M1 on 21/6/24.
//

import XCTest
import Combine
@testable import Landmarks

class FetchLandmarkUseCaseTests: XCTestCase {
    
    var mockRepository: MockLandmarkRepository!
    var useCase: FetchLandmarkUseCase!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockLandmarkRepository()
        useCase = FetchLandmarkUseCase(repository: mockRepository)
        cancellables = []
    }
    
    override func tearDown() {
        mockRepository = nil
        useCase = nil
        cancellables = nil
        super.tearDown()
    }
    
    func test_execute_withSuccessfulFetch_returnsLandmarks() {
        let expectation = self.expectation(description: "Fetch landmarks successfully")
        
        useCase.execute()
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail("Expected success but got failure")
                }
            }, receiveValue: { landmarks in
                XCTAssertEqual(landmarks.count, 1, "Expected one landmark")
                
                if let landmark = landmarks.first {
                    XCTAssertEqual(landmark.name, "Test Landmark", "Expected name to be 'Test Landmark'")
                    XCTAssertEqual(landmark.id, 1, "Expected id to be 1")
                    XCTAssertEqual(landmark.subtitle, "Test Subtitle", "Expected subtitle to be 'Test Subtitle'")
                    XCTAssertEqual(landmark.imageName, "test_image", "Expected image name to be 'test_image'")
                } else {
                    XCTFail("Expected landmark to be present")
                }
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_execute_withFetchError_returnsError() {
        mockRepository.shouldReturnError = true
        let expectation = self.expectation(description: "Fetch landmarks failure")
        
        useCase.execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("Expected failure but got success")
                case .failure(let error):
                    XCTAssertEqual((error as NSError).domain, "TestError", "Expected error domain to be 'TestError'")
                    expectation.fulfill()
                }
            }, receiveValue: { _ in
                XCTFail("Expected failure but got success")
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}

