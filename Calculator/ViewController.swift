//
//  ViewController.swift
//  Calculator
//
//  Created by 程鑫 on 7/24/16.
//  Copyright © 2016 Carlisle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        let textCurrentlyInDigit = display.text!
        
        if userIsInTheMiddleOfTyping {
            display.text! = textCurrentlyInDigit + digit
        } else {
            display.text! = digit
        }
        
        userIsInTheMiddleOfTyping = true
        
    }
    
    private var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(displayValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
            display.text = String(brain.result)
        }
        
    }
    
    
}

