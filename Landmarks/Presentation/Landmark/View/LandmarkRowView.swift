//
//  LandmarkRowView.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import SwiftUI

struct LandmarkRowView: View {
    let landmark: Landmark
    
    var body: some View {
        HStack {
            if let imageName = landmark.imageName, !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            
            VStack(alignment: .leading) {
                Text(landmark.name ?? "Unknown Landmark")
                    .font(.headline)
                Text(landmark.subtitle ?? "No additional information")
                    .font(.callout)
            }
        }
        .padding(.horizontal)
    }
}
