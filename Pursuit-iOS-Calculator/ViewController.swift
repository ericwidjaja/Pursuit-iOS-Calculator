//  ViewController.swift
//  Pursuit-iOS-Calculator
//  Created by Eric Widjaja on 4/7/20.
//  Copyright © 2020 Eric Widjaja. All rights reserved.

/*  12 + 23 = 35?
 previousNumbers
 numbersOnDisplay
 isPerformingOperation
 operation +, -, /, *
 */

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties:
    var numbersOnDisplay: Double = 0
    var previousNumbers: Double = 0
    var operation = 0
    var isPerformingOperation = false
    var decimalWasUsed = false
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        let numbersTag = sender.tag
        
        if isPerformingOperation == true {
            isPerformingOperation = false
            if decimalWasUsed == true {
                resultLabel.text = String(numbersTag - 1)
                numbersOnDisplay = Double(resultLabel.text!)!
            }
            resultLabel.text = String(numbersTag - 1)
            numbersOnDisplay = Double(resultLabel.text!)!
            
        } else {
            print(numbersTag)//to check the value
            resultLabel.text = resultLabel.text! + String(numbersTag - 1)
            numbersOnDisplay = Double(resultLabel.text!)!
        }
        
    }
    
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        
        let operatorsTag = sender.tag
        
        //AC = All Clear button pressed (tag=11)
        if operatorsTag == 11 {
            resultLabel.text = "0"
            numbersOnDisplay = 0
            previousNumbers = 0
            operation = 0
            
            return //no more operation after return inside this block of 'if ... { ... }
        }
        /* division button's tag = 14
         multiplication button's tag = 15
         subtraction button's tag = 16
         addition button's tag = 17
         equal button's tag = 18
         */
        
        if operatorsTag == 13 {
            isPerformingOperation = true
            previousNumbers = Double(resultLabel.text!)!
            operation = operatorsTag
            let percentage: (_ previousNumbers: Double) -> (Double) = {($0 / 100)}
            resultLabel.text = String(percentage(previousNumbers))
        }
        
        if operatorsTag == 14 {
            isPerformingOperation = true
            previousNumbers = Double(resultLabel.text!)!
            resultLabel.text = "/"
            operation = operatorsTag
            
        } else if operatorsTag == 15 {
            isPerformingOperation = true
            previousNumbers = Double(resultLabel.text!)!
            resultLabel.text = "X"
            operation = operatorsTag
            
        } else if operatorsTag == 16 {
            isPerformingOperation = true
            previousNumbers = Double(resultLabel.text!)!
            resultLabel.text = "-"
            operation = operatorsTag
            
        } else if operatorsTag == 17 {
            isPerformingOperation = true
            previousNumbers = Double(resultLabel.text!)!
            resultLabel.text = "+"
            operation = operatorsTag
            
        } else if operatorsTag == 18 {
            isPerformingOperation = true
            //Todo: Calculation Logic for operators buttons
            
            if operation == 17 { // addition
                let adds: (_ previousNumbers: Double, _ numbersOnDisplay: Double) -> (Double) = { ($0 + $1) }
                resultLabel.text = String(adds(previousNumbers, numbersOnDisplay))
        
            } else if operation == 16 { // subtraction
                let subtraction: (_ previousNumbers: Double, _ numbersOnDisplay: Double) -> (Double) = { ($0 - $1) }
                resultLabel.text = String(subtraction(previousNumbers, numbersOnDisplay))
                
            } else if operation == 15 { //multiplication
                let multiplication: (_ previousNumbers: Double,_ numbersOnDisplay: Double) -> (Double) = { ($0 * $1)
                }
                resultLabel.text = String(multiplication(previousNumbers,numbersOnDisplay))
                
            } else if operation == 14 { //division
                let division: (_ previousNumbers: Double,_ numbersOnDisplay: Double) -> (Double) = {$0 / $1}
                resultLabel.text = String(format: "%.2f", division(previousNumbers, numbersOnDisplay))
                
            } else if operation == 13 { //%
                print(previousNumbers)
                
            } else if operation == 12 { // +/-
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        resultLabel.text = ""
    }
}

