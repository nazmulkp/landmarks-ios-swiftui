//
//  JSONLoaderProtocol.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import Foundation

public protocol JSONLoaderProtocol {
    func loadJSON(filename: String) -> Data?
}
