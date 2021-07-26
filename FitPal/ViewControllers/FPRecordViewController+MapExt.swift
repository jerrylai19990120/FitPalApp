//
//  FPRecordViewController+MapExt.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-26.
//

import Foundation
import UIKit
import MapKit

extension FPRecordViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        var region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        region.center = (map?.userLocation.coordinate)!
        map?.setRegion(region, animated: true)
    }
}
