//
//  Numbers.swift
//  Sorting Algorithms
//
//  Created by Seena Shafai on 06/05/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import Foundation

class Numbers
{
    //MARK: Random Number Generator
    func randNumGenerator() -> [Int]
    {
        var a = [Int]()
        
        for _ in 0...9
        {
            let randNum = Int(arc4random_uniform(21))
            a.append(randNum)
        }
        return a
    }
    
    //MARK: Array Concatenator
    func joinArray(array: [Int]) -> String
    {
        var string: String = ""
        var a = array
        let len = a.count
        
        for i in 0 ..< len
        {
            string = string + String(a[i]) + ", "
        }
        
        return string
    }
    
}
