//
//  DetailsViewController.swift
//  iOS-NearBike
//
//  Created by CM on 29/10/2020.
//

import Foundation
import  UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var avaliblePlacesNumberLabel: UILabel!
    @IBOutlet weak var avalibleBikesNumberLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationAddressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!

    var avaliblePlacesNumber = ""
    var avalibleBikesNumber = ""
    var stationName = ""
    var stationAddress = ""
    var distance = ""

    override func viewDidLoad() {
        avaliblePlacesNumberLabel.text = avaliblePlacesNumber
        avalibleBikesNumberLabel.text = avalibleBikesNumber
        stationNameLabel.text = stationName
        stationAddressLabel.text = stationAddress
        distanceLabel.text = distance
    }
}
