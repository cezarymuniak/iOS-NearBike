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

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var addressLabel = ""
   var bikeRacksLabel = ""
    var stationsProperties: [Properties] = []
    var geometry: [Geometry] = []
    var features: [Features] = []
    var base: [BaseModel] = []

    @IBOutlet weak var topBar: TopBar!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.features.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.tableViewCell, for: indexPath)
        let item = features[indexPath.row]

        func convertAddressToCoordinates() {
            for address in item.geometry?.coordinates ?? [Double]() {
                let geocoder = CLGeocoder()
                let lat = item.geometry?.coordinates?.last
                let lon = item.geometry?.coordinates?.first
                let location = CLLocation(latitude: lat!, longitude: lon!)

                geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                    var placemark: CLPlacemark!

                    if error == nil && placemarks!.isEmpty  == false {
                        placemark = placemarks![0] as CLPlacemark
                        var addressString = ""
                        if placemark.subAdministrativeArea != nil && placemark.name != nil {
                            addressString = placemark.name! + ", " +
                                placemark.subAdministrativeArea!
                        }
                        self.addressLabel = addressString

                       cell?.stationAddressLabel.text = self.addressLabel
                    }
                })
            }
        }
        convertAddressToCoordinates()
        cell?.selectionStyle = .none
        bikeRacksLabel = (item.properties?.bikeRacks)!

        cell?.avalibleBikesNumberLabel.text = bikeRacksLabel

        cell?.avaliblePlacesNumberLabel.text = item.properties?.freeRacks
        cell?.stationNameLabel.text = item.properties?.label

        cell?.contentView.layer.masksToBounds = true

        return cell!
    }

    @IBOutlet weak var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTableView.register(UINib(nibName: R.nib.tableViewCell.name, bundle: nil), forCellReuseIdentifier: R.reuseIdentifier.tableViewCell.identifier)
        topBar.backButton.isHidden = true
        self.mainTableView.rowHeight = 186
        getData()
    }

    func getData() {
        let url = "https://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe"

        AF.request(url).validate().responseDecodable(of: BaseModel.self) { (response) in
            guard let data = response.value else { return }
            self.features = data.features!
          self.mainTableView.reloadData()
        }
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: R.segue.mainViewController.detailView.identifier, sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == R.segue.mainViewController.detailView.identifier {
//            if let detailsViewController =  segue.destination as? DetailsViewController {
//                if let row = mainTableView.indexPathForSelectedRow {
//                    detailsViewController.avalibleBikesNumber =  bikeRacksLabel
//                   // detailsViewController.avaliblePlacesNumber = stationsProperties[row].freeRacks!
//                    detailsViewController.distance = "station.256"
//                    detailsViewController.stationAddress = "address"
//                  //  detailsViewController.stationName = stationsProperties[row].label!
//                }
//            }
//        }
//    }
}
