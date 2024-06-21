//
//  LandmarkRepositoryImpl.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import Combine

public class LandmarkRepositoryImpl: LandmarkRepository {
    private let dataSource: LandmarkDataSource
    
    public init(dataSource: LandmarkDataSource) {
        self.dataSource = dataSource
    }
    
    public func fetchLandmark() -> AnyPublisher<[Landmark], Error> {
        return dataSource.fetchLandmark()
    }
}

