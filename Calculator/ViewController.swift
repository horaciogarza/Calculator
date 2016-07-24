//
//  ViewController.swift
//  Calculator
//
//  Created by 程鑫 on 7/24/16.
//  Copyright © 2016 Carlisle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        let textCurrentlyInDigit = display.text!
        
        if userIsInTheMiddleOfTyping {
            display.text! = textCurrentlyInDigit + digit
        } else {
            display.text! = digit
        }
        
        userIsInTheMiddleOfTyping = true
        
    }
    
    @IBAction func performOperation(sender: UIButton) {
        
        userIsInTheMiddleOfTyping = false
        
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                display.text! = String(M_PI)
            }
        }
        
    }
    

}

