//
//  GeoLinesDatastore.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/13.
//

import Foundation

private struct GeoLineJson: Codable {
    var start: GeoPointJson
    var end: GeoPointJson
    
    func toModel() -> GeoLine {
        return GeoLine(start: start.toModel(), end: end.toModel())
    }
}

private struct GeoPointJson: Codable {
    var latitude: Float
    var longitude: Float
    
    func toModel() -> GeoPoint {
        return GeoPoint(latitude: latitude, longitude: longitude)
    }
}

class GeoLinesDatastore {
    static private func getGeolinesData() throws -> Data? {
        guard let path = Bundle.main.path(forResource: "geolines", ofType: "json") else { return nil }
            let url = URL(fileURLWithPath: path)

            return try Data(contentsOf: url)
    }
    
    static func load() -> [GeoLine]{
        guard let data = try? getGeolinesData() else { return [] }
        guard let geoLines = try? JSONDecoder().decode([GeoLineJson].self, from: data) else { return [] }

        return geoLines.map { $0.toModel() }
    }
}
