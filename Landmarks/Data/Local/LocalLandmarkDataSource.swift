//
//  LocalLandmarkDataSource.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import Foundation
import Combine

public class LocalLandmarkDataSource: LandmarkDataSource {
    private let jsonLoader: JSONLoaderProtocol
    private let configuration: ConfigurationProtocol
    
    public init(jsonLoader: JSONLoaderProtocol, configuration: ConfigurationProtocol) {
        self.jsonLoader = jsonLoader
        self.configuration = configuration
    }
    
    public func fetchLandmark() -> AnyPublisher<[Landmark], Error> {
        let filename = configuration.localLandmarkDataFilename
        return Future<[Landmark], Error> { promise in
            if let data = self.jsonLoader.loadJSON(filename: filename) {
                do {
                    let landmarks = try JSONDecoder().decode([Landmark].self, from: data)
                    promise(.success(landmarks))
                } catch {
                    promise(.failure(error))
                }
            } else {
                promise(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to load local data"])))
            }
        }
        .eraseToAnyPublisher()
    }
}

