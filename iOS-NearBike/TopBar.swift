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


    override func awakeFromNib() {
        Bundle.main.loadNibNamed(R.nib.topBar.name, owner:self, options: nil)
        
        addSubview(topBar)
    }


}
