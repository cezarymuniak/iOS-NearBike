//
//  ViewController.swift
//  iOS-NearBike
//
//  Created by CM on 26/10/2020.
//

import UIKit
import Rswift
import Alamofire
import SwiftyJSON
import MapKit
import CoreLocation

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    var addressLabel = ""
    var addressString = ""
    var bikeRacksLabel = ""
    var stationsProperties: [Properties] = []
    var geometry: [Geometry] = []
    var features: [Features] = []
    var base: [BaseModel] = []
    var dest1 = Double()
    var dest2 = Double()
    var myLatitude: Double = 0.0
    var myLongitude: Double = 0.0
    let locationManager = CLLocationManager()

    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        self.mainTableView.register(UINib(nibName: R.nib.tableViewCell.name, bundle: nil), forCellReuseIdentifier: R.reuseIdentifier.tableViewCell.identifier)
        topBar.backButton.isHidden = true
        self.mainTableView.rowHeight = 186
        getData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.features.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = mainTableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.tableViewCell, for: indexPath)
        let item = features[indexPath.row]
        dest2 =  (item.geometry?.coordinates.first)!
        dest1 =  (item.geometry?.coordinates.last)!
        let properDestination = String(dest1.description + ", " + dest2.description)
        cell?.selectionStyle = .none
        bikeRacksLabel = (item.properties?.bikeRacks)!
        cell?.avalibleBikesNumberLabel.text = bikeRacksLabel
        cell?.stationAddressLabel.text = "address: \(properDestination)"
        cell?.avaliblePlacesNumberLabel.text = item.properties?.freeRacks
        cell?.stationNameLabel.text = item.properties?.label
        cell?.contentView.layer.masksToBounds = true

        return cell!
    }

    func getData() {
        let url = "https://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe"

        AF.request(url).validate().responseDecodable(of: BaseModel.self) { [self] (response) in
            guard let data = response.value else { return }
            self.features = data.features!
            self.mainTableView.reloadData()
        }
    }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: R.segue.mainViewController.detailView.identifier, sender: self)
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == R.segue.mainViewController.detailView.identifier {
            if let detailsViewController =  segue.destination as? DetailsViewController {
                if let row = mainTableView.indexPathForSelectedRow?.row {
                    detailsViewController.avalibleBikesNumber = (features[row].properties?.bikeRacks!)!
                    detailsViewController.avaliblePlacesNumber = (features[row].properties?.freeRacks!)!
                    detailsViewController.distance = "500m"
                    dest2 =  (features[row].geometry?.coordinates.first)!
                    dest1 =  (features[row].geometry?.coordinates.last)!
                    let properDestination = String(dest1.description + ", " + dest2.description)
                    detailsViewController.stationAddress = "address : \(properDestination)"
                    detailsViewController.stationName = (features[row].properties?.label!)!
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.myLatitude = locValue.latitude
        self.myLongitude = locValue.longitude
        print("myLatitude :\(myLatitude)")
        print("myLongitude :\(myLongitude)")
    }
    
    // TODO: converting cordinates to address
    //    func convertCoordinatessToAddresss() {
    //        let geocoder = CLGeocoder()
    //        let lat = dest1
    //        let lon = dest2
    //        let location = CLLocation(latitude: Double(lat), longitude: Double(lon) )
    //
    //        geocoder.reverseGeocodeLocation(location, completionHandler: { [self](placemarks, error) -> Void in
    //            var placemark: CLPlacemark!
    //
    //            if error == nil && placemarks!.isEmpty  == false {
    //                placemark = placemarks![0] as CLPlacemark
    //                if placemark.subAdministrativeArea != nil && placemark.name != nil {
    //                    addressString = placemark.name! + ", " +
    //                        placemark.subAdministrativeArea!
    //                } else {
    //                    print(error ?? "error")
    //                }
    //                self.addressLabel = addressString
    //            }
    //        })
    //    }


    //TODO: Distance between locations.
//
//    func distance(){
//        let request = MKDirections.Request()
//        let sourceP         = CLLocationCoordinate2DMake(myLatitude, myLongitude)
//        let destP           = CLLocationCoordinate2DMake( dest1,  dest2 )
//        print(sourceP)
//        print(destP)
//        let source          = MKPlacemark(coordinate: sourceP)
//        let destination     = MKPlacemark(coordinate: destP)
//        request.source      = MKMapItem(placemark: source)
//        request.destination = MKMapItem(placemark: destination)
//        request.transportType = MKDirectionsTransportType.automobile;
//        request.requestsAlternateRoutes = true
//        let directions = MKDirections(request: request)
//        directions.calculate { (response, error) in
//            if let response = response, let route = response.routes.first {
//                print(route.distance)
//            }
//            else { print(error) }
//        }
//    }
}
