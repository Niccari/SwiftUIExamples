//
//  GoogleMapOverlay.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/13.
//
import SwiftUI
import GoogleMaps

struct GoogleMapOverlay: View {
    @State private var geoLines = GeoLinesDatastore.load()
    var body: some View {
        GoogleMapArea(geoLines: $geoLines)
    }
}

struct GoogleMapOverlay_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapOverlay()
    }
}
