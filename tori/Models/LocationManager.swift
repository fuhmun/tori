//
//  LocationDataManager.swift
//  DreamTeam
//
//  Created by Alexander Washington on 5/11/24.
//

import Foundation
import CoreLocation

class LocationDataManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        requestLocationUpdate()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            print("Authorized always")
            authorizationStatus = .authorizedAlways
        case .authorizedWhenInUse:
            print("Authorized when in use")
            authorizationStatus = .authorizedWhenInUse
            locationManager?.requestAlwaysAuthorization()
            locationManager?.requestLocation()
            break
        case .restricted:
            print("Restricted")
            authorizationStatus = .restricted
            break
        case .denied:
            print("Denied")
            authorizationStatus = .denied
            break
        case .notDetermined:
            print("Not determined")
            break
        default:
            print("Default")
            break
        }
    }
    
    func requestLocationUpdate() {
        locationManager?.startUpdatingLocation()
    }
    
    func stopLocationUpdate() {
        locationManager?.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        print("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        stopLocationUpdate()
        
        if let clError = error as? CLError {
            switch clError.code {
            case .locationUnknown, .denied, .network:
                print("Location request error: \(clError.localizedDescription)")
            case .headingFailure:
                print("Heading request error: \(clError.localizedDescription)")
            case .rangingUnavailable, .rangingFailure:
                print("Ranging request error: \(clError.localizedDescription)")
            case .regionMonitoringDenied, .regionMonitoringFailure, .regionMonitoringSetupDelayed, .regionMonitoringResponseDelayed:
                print("Region monitoring request error: \(clError.localizedDescription)")
            default:
                print("Unkown manager request error: \(clError.localizedDescription)")
            }
        } else {
            print("Unknown error: \(error.localizedDescription)")
        }
    }
}
