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

class MainViewController: UIViewController

, UITableViewDelegate,UITableViewDataSource

{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
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
        getData()
    }

    
    
    func getData() {
        
        let url = "https://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe"
        
        AF.request(url, method: .get).responseJSON(completionHandler: { (response) in
            
            
            switch response.result {
            
            case .success(let value):
                let json = JSON(value)

                json["features"].array?.forEach({(feature) in
                    
//                    let properties = 
                    
                    
                  let cityLabel =    feature["properties"]["label"]
                    print(cityLabel)
                })


            case .failure(let error):
                    print(error)
 
            }
            
        })
        
    }

    
}

