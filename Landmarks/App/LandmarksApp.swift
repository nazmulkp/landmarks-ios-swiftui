//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    var body: some Scene {
        WindowGroup {
            let appConfiguration = AppConfiguration()
            
            let jsonLoader = JSONLoader()
            let localDataSource = LocalLandmarkDataSource(jsonLoader: jsonLoader, configuration: appConfiguration)
            
            let repository = LandmarkRepositoryImpl(dataSource: localDataSource)
            let fetchLandmarkUseCase = FetchLandmarkUseCase(repository: repository)
            let viewModel = LandmarkViewModel(fetchLandmarkUseCase: fetchLandmarkUseCase)
            
            LandmarkView(viewModel: viewModel)
        }
    }
}
