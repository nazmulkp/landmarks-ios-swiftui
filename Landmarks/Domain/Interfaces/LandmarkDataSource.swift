//
//  LandmarkDataSource.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import Combine

public protocol LandmarkDataSource {
    func fetchLandmark() -> AnyPublisher<[Landmark], Error>
}
