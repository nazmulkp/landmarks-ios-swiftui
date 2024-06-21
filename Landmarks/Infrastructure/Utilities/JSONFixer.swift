//
//  JSONFixer.swift
//  Landmarks
//
//  Created by MacBook Air M1 on 21/6/24.
//

import Foundation

class JSONFixer {
    static func fix(jsonString: String) -> String {
        let lines = jsonString.split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }
        var fixedLines: [String] = []

        for i in 0..<lines.count {
            let line = lines[i].trimmingCharacters(in: .whitespaces)

            // Check if the line does not end with "," or "}" and the next line starts with "{"
            if !line.hasSuffix(",") && !line.hasSuffix("{") && !line.hasSuffix("}") && i + 1 < lines.count {
                let nextLine = lines[i + 1].trimmingCharacters(in: .whitespaces)
                if nextLine.hasPrefix("\"") {
                    // Add a comma to the current line
                    fixedLines.append(line + ",")
                    continue
                }
            }

            fixedLines.append(line)
        }

        return fixedLines.joined(separator: "\n")
    }
}
