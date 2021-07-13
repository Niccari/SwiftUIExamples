//
//  GeoPoint.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/13.
//

import Foundation

struct GeoPoint: Hashable {
    var latitude: Float
    var longitude: Float
    
    static func == (lhs: GeoPoint, rhs: GeoPoint) -> Bool {
        return
            lhs.latitude == rhs.latitude
            && lhs.longitude == rhs.longitude
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
