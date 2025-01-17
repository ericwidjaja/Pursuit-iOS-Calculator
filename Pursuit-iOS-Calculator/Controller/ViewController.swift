//  ViewController.swift
//  Pursuit-iOS-Calculator
//  Created by Eric Widjaja on 4/7/20.
//  Copyright © 2020 Eric Widjaja. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties:
    var numbersOnDisplay: Double = 0
    var previousNumbers: Double = 0
    var operation = 0
    var isPerformingOperation = false
    var decimalWasUsed = false
    var calculatorOperator = Calculator()
    
    
    //MARK: - Outlets / Actions
    @IBOutlet weak var resultLabel: UILabel!
    

    @IBAction func backSpace(_ sender: UIButton) {
        if let numbersOnDisplay = resultLabel.text { resultLabel.text = String(numbersOnDisplay.dropLast())}
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        let numbersTag = sender.tag
        
        if isPerformingOperation == true {
            isPerformingOperation = false

            resultLabel.text = String(numbersTag - 1)
            numbersOnDisplay = Double(resultLabel.text!)!
            
        } else {
            resultLabel.text = resultLabel.text! + String(numbersTag - 1)
            numbersOnDisplay = Double(resultLabel.text!)!
        }
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        
        let operatorsTag = sender.tag
        
        //AC = All Clear button pressed (tag=11)
        if operatorsTag == 11 {
            resultLabel.text = ""
            numbersOnDisplay = 0
            previousNumbers = 0
            operation = 0
            return
        }
        
        if operatorsTag == 13 {
            isPerformingOperation = true
            previousNumbers = Double(resultLabel.text!)!
            operation = operatorsTag
            let percent = calculatorOperator.percentage
            resultLabel.text = String(format: "%.2f" , percent(previousNumbers))
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
            
            if operation == 17 { // addition
                
                let add = calculatorOperator.addition
                resultLabel.text = String(add(previousNumbers, numbersOnDisplay))
                
            } else if operation == 16 { // subtraction
                let subtract = calculatorOperator.subtraction
                resultLabel.text = String(format: "%.2f", subtract(previousNumbers, numbersOnDisplay))
                
            } else if operation == 15 { //multiplication
                let multiply = calculatorOperator.multiplication
                resultLabel.text = String(format: "%.2f", multiply(previousNumbers,numbersOnDisplay))
                
            } else if operation == 14 { //division
                let divide = calculatorOperator.division
                resultLabel.text = String(format: "%.2f", divide(previousNumbers, numbersOnDisplay))
            }
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        resultLabel.text = ""
        resultLabel.layer.cornerRadius = 8
        
    }
}

