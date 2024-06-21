//
//  LandmarkViewModel.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import Combine
import SwiftUI

public class LandmarkViewModel: ObservableObject {
    private let fetchLandmarkUseCase: FetchLandmarkUseCase
    @Published var landmarks: [Landmark]?
    @Published var errorMessage: String?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    
    public init(fetchLandmarkUseCase: FetchLandmarkUseCase) {
        self.fetchLandmarkUseCase = fetchLandmarkUseCase
    }
    
    public func fetchLandmarks() {
        isLoading = true
        fetchLandmarkUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] landmarks in
                self?.landmarks = landmarks
            })
            .store(in: &cancellables)
    }
}



