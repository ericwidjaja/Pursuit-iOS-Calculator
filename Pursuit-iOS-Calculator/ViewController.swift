//
//  ViewController.swift
//  Pursuit-iOS-Calculator
//
//  Created by Eric Widjaja on 4/7/20.
//  Copyright © 2020 Eric Widjaja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        let selectedTag = sender.tag
        resultLabel.text = String(selectedTag - 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    }


}

