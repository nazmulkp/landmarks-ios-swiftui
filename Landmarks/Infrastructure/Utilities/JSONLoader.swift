//
//  JSONLoader.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import Foundation

class JSONLoader: JSONLoaderProtocol {
    func loadJSON(filename: String) -> Data? {
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let jsonString = try String(contentsOf: url)
                // Fix the JSON string
                let fixedJsonString = JSONFixer.fix(jsonString: jsonString)
                // Convert the fixed JSON string back to data
                if let fixedData = fixedJsonString.data(using: .utf8) {
                    return fixedData
                }
            } catch {
                print("Error loading local JSON file: \(error)")
            }
        }
        return nil
    }
}
