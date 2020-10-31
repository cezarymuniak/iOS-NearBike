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

    override func awakeFromNib() {
        super.awakeFromNib()
        dropShadow(view: contentView, shadowOpacity: 10.2, shadowColor: UIColor.yellow.cgColor, shadowRadius: 10)
    }

    @IBOutlet weak var avaliblePlacesNumberLabel: UILabel!
    @IBOutlet weak var avalibleBikesNumberLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationAddressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!

    //    TODO: spradzwić działanie
    func dropShadow(view: UIView, shadowOpacity: Float = 10.2, shadowColor: CGColor = UIColor.gray.cgColor, shadowRadius: CGFloat = 5) {
        view.layer.shadowColor = shadowColor
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = shadowRadius
    }
}
