//
//  ViewController.swift
//  iOS-NearBike
//
//  Created by CM on 26/10/2020.
//

import UIKit
import Rswift

class MainViewController: UIViewController

, UITableViewDelegate,UITableViewDataSource

{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.tableViewCell, for: indexPath)
        cell?.avalibleBikesNumberLabel.text = "123"
        return cell!
    }

    


    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
       // super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mainTableView.register(UINib(nibName: R.nib.tableViewCell.name, bundle: nil), forCellReuseIdentifier: R.reuseIdentifier.tableViewCell.identifier)
        self.mainTableView.rowHeight = 186
        self.mainTableView.reloadData()
    }


    
}

