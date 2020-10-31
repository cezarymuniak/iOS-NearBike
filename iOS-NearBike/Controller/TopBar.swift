//
//  TopBar.swift
//  iOS-NearBike
//
//  Created by CM on 29/10/2020.
//

import Foundation
import UIKit

class TopBar: UIView {

    @IBOutlet var topBar: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButtonTapped(_ sender: Any) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            (appDelegate.window?.rootViewController as? UINavigationController)?.popToRootViewController(animated: true)
        }
    }

    override func awakeFromNib() {
        Bundle.main.loadNibNamed(R.nib.topBar.name, owner: self, options: nil)
        addSubview(topBar)
    }
}
