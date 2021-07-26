//
//  FPRecordViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-25.
//

import UIKit
import MapKit

class FPRecordViewController: UIViewController {
    
    var map: MKMapView?
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupLocationService()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        let titleLabel = UILabel()
        titleLabel.text = "Run"
        titleLabel.textColor = DefaultBlack
        titleLabel.font = FontMainTitle
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        titleLabel.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight())
            make?.width.equalTo()(self.view.frame.width)
            make?.height.equalTo()(50)
        }
        
        //Init map view
        map = MKMapView()
        map?.isZoomEnabled = true
        map?.isScrollEnabled = true
        map?.mapType = .standard
        map?.delegate = self
        self.view.addSubview(map!)
        map?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(titleLabel.mas_bottom)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(self.view.frame.height * 0.6)
        })
        
        //set up location manager
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func setupLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            self.checkAuthorizationStatus()
        } else {
            
        }
    }
    
    func checkAuthorizationStatus() {
        switch self.locationManager.authorizationStatus {
        case .authorizedAlways:
            map?.showsUserLocation = true
            break
        case .authorizedWhenInUse:
            map?.showsUserLocation = true
            break
        case .denied:
            break
        case .notDetermined:
            self.locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        @unknown default:
            fatalError("Unknown error")
        }
    }

}
