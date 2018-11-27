//
//  StringExtension.swift
//  Green Cities
//
//  Created by Marko Rankovic on 11/27/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import Foundation

extension String {
    
    func checkIfCityContains(_ string: String) -> Bool {
        
        var result = false
        
        for i in self.indices {
            let j = i
            result = true
            for k in string.indices {
                if j == self.endIndex || self[j] != string[k] {
                    result = false
                }
            }
        }
        
        return result
    }
}
