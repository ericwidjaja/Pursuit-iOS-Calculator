//
//  CalculatorModel.swift
//  Pursuit-iOS-Calculator
//
//  Created by Eric Widjaja on 4/12/20.
//  Copyright © 2020 Eric Widjaja. All rights reserved.
//

import Foundation

class Calculator {
    
    let addition: (_ previousNumbers: Double, _ numbersOnDisplay: Double) -> (Double) = { ($0 + $1) }
    
    let subtraction: (_ previousNumbers: Double, _ numbersOnDisplay: Double) -> (Double) = {($0 - $1)}
    
    let multiplication: (_ previousNumbers: Double, _ numbersOnDisplay: Double) -> (Double) = {($0 * $1)}
    
    let division: (_ previousNumbers: Double, _ numbersOnDisplay: Double) -> (Double) = {($0 / $1)}
}
