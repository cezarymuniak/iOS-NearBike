//
//  DetailsViewController.swift
//  iOS-NearBike
//
//  Created by CM on 29/10/2020.
//
import MapKit
import CoreLocation
import Foundation
import  UIKit

class DetailsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var avaliblePlacesNumberLabel: UILabel!
    @IBOutlet weak var avalibleBikesNumberLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationAddressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var avaliblePlacesNumber = ""
    var avalibleBikesNumber = ""
    var stationName = ""
    var stationAddress = ""
    var distance = ""
    let locationManager = CLLocationManager()
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    override func viewDidLoad() {
        avaliblePlacesNumberLabel.text = avaliblePlacesNumber
        avalibleBikesNumberLabel.text = avalibleBikesNumber
        stationNameLabel.text = stationName
        stationAddressLabel.text = stationAddress
        distanceLabel.text = distance
        self.locationManager.requestAlwaysAuthorization()
            self.locationManager.requestWhenInUseAuthorization()
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }

            mapView.delegate = self
            mapView.mapType = .standard
            mapView.isZoomEnabled = true
            mapView.isScrollEnabled = true

            if let coor = mapView.userLocation.location?.coordinate {
                mapView.setCenter(coor, animated: true)
            }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mapView.mapType = MKMapType.standard
        let coordinate  =  CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate =  coordinate
        annotation.title = stationName
        annotation.subtitle = "Station location"
        mapView.addAnnotation(annotation)
    }
}
