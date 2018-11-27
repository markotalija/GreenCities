//
//  City.swift
//  Green Cities
//
//  Created by Marko Rankovic on 11/26/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import Foundation

class City {
    
    //MARK: - Properties
    let name: String
    let nameAscii: String
    let latitude: String
    let longitude: String
    let population: String
    let country: String
    let iso2: String
    let iso3: String
    let province: String
    var isGreen: Bool
    
    //MARK: - Initializers
    
    init(name: String, nameAscii: String, latitude: String, longitude: String, population: String, country: String, iso2: String, iso3: String, province: String) {
        
        self.name = name
        self.nameAscii = nameAscii
        self.latitude = latitude
        self.longitude = longitude
        self.population = population
        self.country = country
        self.iso2 = iso2
        self.iso3 = iso3
        self.province = province
        self.isGreen = false
    }
    
    init(array: [String]) {
        
        self.name = array[0]
        self.nameAscii = array[1]
        self.latitude = array[2]
        self.longitude = array[3]
        self.population = array[4]
        self.country = array[5]
        self.iso2 = array[6]
        self.iso3 = array[7]
        self.province = array[8]
        self.isGreen = false
    }
}
