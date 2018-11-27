//
//  CityDetailsTableViewCell.swift
//  Green Cities
//
//  Created by Marko Rankovic on 11/26/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import UIKit

class CityDetailsTableViewCell: UITableViewCell {

    //MARK: - Public API
    
    func configureCell(with city: City, row: Int) {
        
        switch row {
        case 0:
            textLabel?.text = "City ASCII Code:"
            detailTextLabel?.text = city.nameAscii
        case 1:
            textLabel?.text = "Latitude:"
            detailTextLabel?.text = city.latitude
        case 2:
            textLabel?.text = "Longitude:"
            detailTextLabel?.text = city.longitude
        case 3:
            textLabel?.text = "Population:"
            detailTextLabel?.text = city.population
        case 4:
            textLabel?.text = "Country:"
            detailTextLabel?.text = city.country
        case 5:
            textLabel?.text = "ISO2 Code:"
            detailTextLabel?.text = city.iso2
        case 6:
            textLabel?.text = "ISO3 Code"
            detailTextLabel?.text = city.iso3
        case 7:
            textLabel?.text = "Province:"
            detailTextLabel?.text = city.province
        case 8:
            textLabel?.text = "Status"
            detailTextLabel?.text = city.isGreen ? "Green" : "Undefined"
            detailTextLabel?.textColor = city.isGreen ? GREEN_COLOR : UIColor.gray
        default:
            break
        }
    }
}
