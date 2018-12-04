//
//  StringExtension.swift
//  Green Cities
//
//  Created by Marko Rankovic on 11/27/18.
//  Copyright © 2018 Marko Rankovic. All rights reserved.
//

import Foundation

extension String {
    
    func contains(string: String, substring: String, stringIndex: Int, substringIndex: Int) -> Bool {

        let stringArray = Array(self.lowercased())
        let substringArray = Array(substring.lowercased())

        if substringArray.count > stringArray.count {
            return false
        }

        if substringArray.count != 0 {
            if stringArray[stringIndex] == substringArray[substringIndex] {
                if substringIndex == substringArray.count - 1 {
                    return true
                }
                if (stringIndex + 1 == stringArray.count) && substringIndex < substringArray.count {
                    return false
                }
                let bool = contains(string: self, substring: substring, stringIndex: stringIndex + 1, substringIndex: substringIndex + 1)
                return bool
            } else {
                if stringIndex == stringArray.count - 1 || substringIndex == substringArray.count - 1 {
                    return false
                } else {
                    let boolean = contains(string: self, substring: substring, stringIndex: stringIndex + 1, substringIndex: 0)
                    return boolean
                }
            }
        }

        return false
    }
}
