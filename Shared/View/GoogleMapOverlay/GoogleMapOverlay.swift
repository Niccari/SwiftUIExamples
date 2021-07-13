//
//  GoogleMapOverlay.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/13.
//
import SwiftUI
import GoogleMaps

struct GoogleMapOverlay: UIViewRepresentable {
    
    private let zoom: Float = 15.0
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 35, longitude: 135, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        
    }
}

struct GoogleMapOverlay_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapOverlay()
    }
}
