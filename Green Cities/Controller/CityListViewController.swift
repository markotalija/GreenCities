//
//  CityListViewController.swift
//  Green Cities
//
//  Created by Marko Rankovic on 11/26/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import UIKit
import CSVImporter
import MBProgressHUD

class CityListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: - Properties
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        importCities()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    //MARK: - Private API
    
    private func importCities() {
        
        //Loader
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .indeterminate
        hud.label.text = "Loading cities..."
        
        //Import cities from the CSV file
        guard let path = Bundle.main.path(forResource: "world_cities", ofType: "csv") else { return }
        let importer = CSVImporter<[String]>(path: path, delimiter: ";")
        importer.startImportingRecords { $0 }.onFinish { importedCities in
            for index in 1..<importedCities.count {
                let city = City(array: importedCities[index])
                DataManager.sharedInstance.citiesArray.append(city)
            }
            
            hud.hide(animated: true)
            self.tableView.reloadData()
        }
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataManager.sharedInstance.citiesArray.isEmpty ? 0 : DataManager.sharedInstance.citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: CELL_IDENTIFIER)
        let city = DataManager.sharedInstance.citiesArray[indexPath.row]
        cell.textLabel?.text = "\(city.name), \(city.country)"
        cell.detailTextLabel?.text = city.isGreen ? "Green" : "Undefined"
        cell.detailTextLabel?.textColor = city.isGreen ? GREEN_COLOR : UIColor.black
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let city = DataManager.sharedInstance.citiesArray[indexPath.row]
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: DETAILS_VC) as! DetailsViewController
        detailsVC.selectedCity = city
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

