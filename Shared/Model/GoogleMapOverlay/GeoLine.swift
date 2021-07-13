//
//  GeoLine.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/13.
//

import Foundation

struct GeoLine: Hashable {
    var start: GeoPoint
    var end: GeoPoint
    
    static func == (lhs: GeoLine, rhs: GeoLine) -> Bool {
        return
            lhs.start == rhs.start
            && lhs.end == rhs.end
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(start)
        hasher.combine(end)
    }
}
