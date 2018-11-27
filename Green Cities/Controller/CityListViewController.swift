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

class CityListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    lazy var searchResultsArray = [City]()
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        importCities()
        setupSearchController()
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
    
    private func setupSearchController() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search cities"
        searchController.searchBar.tintColor = GREEN_COLOR
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func isSearchBarEmpty() -> Bool {
        
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func getSearchResults(from searchString: String) {
        
        searchResultsArray = DataManager.sharedInstance.citiesArray.filter({ (city: City) -> Bool in
            return city.name.lowercased().contains(searchString.lowercased())
        })
        
        tableView.reloadData()
    }
    
    private func isCurrentlySearching() -> Bool {
        
        return searchController.isActive && !isSearchBarEmpty()
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isCurrentlySearching() {
            return searchResultsArray.count
        }
        
        return DataManager.sharedInstance.citiesArray.isEmpty ? 0 : DataManager.sharedInstance.citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: CELL_IDENTIFIER)
        cell.accessoryType = .disclosureIndicator
        let city: City
        if isCurrentlySearching() {
            city = searchResultsArray[indexPath.row]
        } else {
            city = DataManager.sharedInstance.citiesArray[indexPath.row]
        }
        cell.textLabel?.text = "\(city.name), \(city.country)"
        cell.detailTextLabel?.text = city.isGreen ? "Green" : "Undefined"
        cell.detailTextLabel?.textColor = city.isGreen ? GREEN_COLOR : UIColor.black
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let city: City
        if isCurrentlySearching() {
            city = searchResultsArray[indexPath.row]
        } else {
            city = DataManager.sharedInstance.citiesArray[indexPath.row]
        }
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: DETAILS_VC) as! DetailsViewController
        detailsVC.selectedCity = city
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    //MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        
        getSearchResults(from: searchController.searchBar.text!)
    }
}

