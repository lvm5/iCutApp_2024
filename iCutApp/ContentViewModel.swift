//
//  ContentViewModel.swift
//  iCutApp
//
//  Created by Leandro Morais on 04/11/23.
//

import Foundation
import MapKit



enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: -22.2208, longitude: -49.9486)
    static let startingSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate  {
    
        @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation,
                                                   span: MapDetails.startingSpan)
    
    var locationManager: CLLocationManager?

    
    //MARK: SOLICITAR LOCALIZAÇÃO
    func checkIfLocationServicesIsEnable() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Show an alert letting them know this is off and to go turn it on.")
        }
    }
    
    
    //MARK: STATUS LOCALIZAÇÃO
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is retricted likely due parental controls.")
        case .denied:
            print("Your have location is denied this app location permission. Go into settings to chage it.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MapDetails.startingSpan)
        @unknown default:
            break
        }
    }

        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            checkLocationAuthorization()
        }
    }
