//
//  LandmarkView.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import SwiftUI

struct LandmarkView: View {
    @StateObject private var viewModel: LandmarkViewModel
    
    init(viewModel: LandmarkViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                content
            }
            .navigationTitle("Landmarks")
            .onAppear {
                viewModel.fetchLandmarks()
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            loadingView
        } else if let landmarks = viewModel.landmarks {
            landmarkList(landmarks)
        } else if let errorMessage = viewModel.errorMessage {
            errorView(errorMessage)
        }
    }

    private var loadingView: some View {
        Text("Loading landmarks...")
    }

    private func landmarkList(_ landmarks: [Landmark]) -> some View {
        List {
            ForEach(landmarks, id: \.id) { landmark in
                LandmarkRowView(landmark: landmark)
            }
        }
    }

    private func errorView(_ message: String) -> some View {
        Text(message)
            .foregroundColor(.red)
    }
}


