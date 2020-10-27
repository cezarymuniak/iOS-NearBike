//
//  ViewController.swift
//  iOS-NearBike
//
//  Created by CM on 26/10/2020.
//

import UIKit

class MainViewController: UIViewController {
    
    let tview = UINib(nibName: "TableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil).first as! TableViewCell

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBOutlet weak var testView: TableViewCell!
    
}

