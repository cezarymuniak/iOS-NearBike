//
//  TableViewCell.swift
//  iOS-NearBike
//
//  Created by CM on 27/10/2020.
//

import Foundation
import UIKit
class TableViewCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    @IBOutlet weak var avaliblePlacesNumberLabel: UILabel!
    
    @IBOutlet weak var avalibleBikesNumberLabel: UILabel!
    
    @IBOutlet weak var stationNameLabel: UILabel!
    
    @IBOutlet weak var stationAddressLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
}
