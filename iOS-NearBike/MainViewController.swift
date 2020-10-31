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

class MainViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var addressLabel = ""
    var stationsProperties: [Properties] = []
    var stationsCoordinates: [Coordinates] = []
    
    @IBOutlet weak var topBar: TopBar!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.stationsProperties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.tableViewCell, for: indexPath)
        
        
        let station: Properties
        station = self.stationsProperties[indexPath.row]
     //   let  address =    self.addressLabel
        
       let testX: Coordinates
       testX  = self.stationsCoordinates[indexPath.row]
        
        
        cell?.selectionStyle = .none
        
        cell?.avalibleBikesNumberLabel.text = station.bikeRacks
        
        cell?.avaliblePlacesNumberLabel.text = station.freeRacks
        
        
       cell?.stationAddressLabel.text = testX.coordinates?.description
        
        cell?.stationNameLabel.text = station.label
        
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
        self.mainTableView.reloadData()
        
    }
    
    
    
    func getData() {
        
        let url = "https://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe"
        
        AF.request(url, method: .get).responseJSON(completionHandler: { (response) in

            switch response.result {
            
            case .success(let value):
                let json = JSON(value)
                
                json["features"].array?.forEach({(feature) in
                    
                    
                    let cityLabel =    feature["properties"]["label"].stringValue
                    let bikes =    feature["properties"]["bikes"].stringValue
                    
                    let bikeRacks =    feature["properties"]["bike_racks"].stringValue
                    
                    let updated =    feature["properties"]["updated"].stringValue
                    
                    let freeRacks =    feature["properties"]["free_racks"].stringValue
                    
                    
                    
                    let properties = Properties(bikeRacks: bikeRacks, bikes: bikes  , label: cityLabel , updated: updated , freeRacks: freeRacks )
                    
                    
                    let coordinates = feature["geometry"]["coordinates"].arrayObject
                    
                  //  let longitude = coordinates.
                 //   let latitude = coordinates.doubleValue
//
                    
                    let test1 = Coordinates(coordinates: coordinates)
                    
                    self.stationsCoordinates.append(test1)
                    
                    self.stationsProperties.append(properties)
                    
                 //   self.convertLatLongToAddress(latitude: latitude!, longitude: longitude!)
                })
     
                self.mainTableView.reloadData()
                
            case .failure(let error):
                print(error)
            }

        })

    }

//    func convertLatLongToAddress(latitude:Double, longitude:Double) {
//        let geoCoder = CLGeocoder()
//        let location = CLLocation(latitude: latitude, longitude: longitude)
//
//        geoCoder.reverseGeocodeLocation(location, completionHandler: { [self] (placemarks, error) -> Void in
//
//            var placeMark: CLPlacemark!
//            placeMark = placemarks?[0]
//
//            if placeMark != nil {
//                let name = placeMark.name
//
//                let city = placeMark.subAdministrativeArea
//
//                let x     = name! + ", " + city!
//
//                let y  = Coordinates(coordinates: x)
//
//                self.stationsCoordinates.append(y)
//
//                print(" nizej stationsCoordinates " )
//
//                print(self.stationsCoordinates)
//
//                print(" nizej stationsCoordinates " )
//
//                self.mainTableView.reloadData()
//
//            }
//
//        })
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "DetailView", sender: self)
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailView" {
            
            if let detailsViewController =  segue.destination as? DetailsViewController {
                
                if let row = mainTableView.indexPathForSelectedRow?.row {
                    
                    detailsViewController.avalibleBikesNumber = stationsProperties[row].bikeRacks!
                    
                    
                    detailsViewController.avaliblePlacesNumber = stationsProperties[row].freeRacks!
                    
                    detailsViewController.distance = "station.256"
                    
                   detailsViewController.stationAddress = "address"
                    
                    detailsViewController.stationName = stationsProperties[row].label!
                    
                    
                    
                    
                    // tutaj pobrane dane stad polaczyc z kolejnym widokiem
                    
                    
                    
                }
                
                
            }
            
            
        }
        
    }
    
    
    
    
    
    
    
    
}

