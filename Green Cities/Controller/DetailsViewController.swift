//
//  DetailsViewController.swift
//  Green Cities
//
//  Created by Marko Rankovic on 11/26/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var selectedCity: City!

    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
    }
    
    //MARK: - Private API
    
    private func configureNavigationBar() {
        
        title = selectedCity.name
        navigationController?.navigationBar.tintColor = GREEN_COLOR
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 9
        case 1:
            return 1
        case 2:
            return 1
        default:
            break
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            let cell = CityDetailsTableViewCell(style: .value1, reuseIdentifier: DETAILS_CELL)
            cell.configureCell(with: selectedCity, row: indexPath.row)
            return cell
        case 1:
            let cell = UITableViewCell(style: .default, reuseIdentifier: STATUS_CELL)
            cell.textLabel?.text = "Change Status"
            return cell
        case 2:
            let cell = UITableViewCell(style: .default, reuseIdentifier: MAP_CELL)
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = "View city on map"
            
            return cell
        default:
            break
        }
        
        let string = "Marko"
        
        return UITableViewCell()
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        //Remove selection for the first section
        if indexPath.section == 0 {
            return nil
        }
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 {
            selectedCity.isGreen = !selectedCity.isGreen
            tableView.reloadData()
        } else {
            let mapVC = storyboard?.instantiateViewController(withIdentifier: MAP_VC) as! MapViewController
            mapVC.city = selectedCity
            
            //Set back button title for the MapViewController
            let item = UIBarButtonItem()
            item.title = "Details"
            navigationItem.backBarButtonItem = item
            navigationController?.pushViewController(mapVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "City Details"
        case 1:
            return "Status"
        case 2:
            return "Map View"
        default:
            break
        }
        
        return ""
    }
}
