//
//  DataManager.swift
//  Green Cities
//
//  Created by Marko Rankovic on 11/27/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import Foundation

class DataManager {
    
    //MARK: - Properties
    lazy var citiesArray = [City]()
    
    //MARK: - Singleton
    
    static let sharedInstance = DataManager()
}
