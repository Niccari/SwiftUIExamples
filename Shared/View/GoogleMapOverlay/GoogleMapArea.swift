//
//  GoogleMapArea.swift
//  SwiftUIExamples (iOS)
//
//  Created by niccari on 2021/07/13.
//
import SwiftUI
import GoogleMaps

struct GoogleMapArea: UIViewRepresentable {
    @Binding private var geoLines: [GeoLine]
        
    init(geoLines: Binding<[GeoLine]>) {
        self._geoLines = geoLines
    }

    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 35, longitude: 135, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.clear()
        geoLines.forEach({ line in
            let path = GMSMutablePath()
//            path.add(CLLocationCoordinate2D(
//                        latitude: (Double)(line.start.latitude),
//                        longitude: (Double)(line.start.longitude)))
//            path.add(CLLocationCoordinate2D(
//                        latitude: (Double)(line.end.latitude),
//                        longitude: (Double)(line.end.longitude)))
            path.add(CLLocationCoordinate2D(
                        latitude: (Double)(line.start.latitude),
                        longitude: (Double)(line.start.longitude)))
            path.add(CLLocationCoordinate2D(
                        latitude: (Double)(line.end.latitude),
                        longitude: (Double)(line.end.longitude)))
            let polyline = GMSPolyline(path: path)
            polyline.strokeColor = UIColor.red
            polyline.strokeWidth = 2
            polyline.map = mapView
        })
    }
}
