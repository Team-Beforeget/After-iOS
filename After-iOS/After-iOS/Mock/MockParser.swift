//
//  MockParser.swift
//  After-iOS
//
//  Created by Thisisme Hi on 2022/01/06.
//

import Foundation

final class MockParser {
    static func load<D: Decodable>(type: D.Type, fileName: String) -> D? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return nil
        }
        let fileURL = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: fileURL) else {
            return nil
        }
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
            return nil
        }
        guard let decodable = try? JSONSerialization.data(withJSONObject: jsonObject) else { return nil }
        return try? JSONDecoder().decode(type, from: decodable)
    }
}
