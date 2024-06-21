//
//  FetchLandmarkUseCase.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import Combine

public class FetchLandmarkUseCase {
    private let repository: LandmarkRepository
    
    public init(repository: LandmarkRepository) {
        self.repository = repository
    }
    
    public func execute() -> AnyPublisher<[Landmark], Error> {
        return repository.fetchLandmark()
    }
}

