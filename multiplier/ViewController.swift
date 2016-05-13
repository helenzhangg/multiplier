//
//  ViewController.swift
//  multiplier
//
//  Created by H on 5/11/16.
//  Copyright © 2016 H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties

    var currentMultiple = 0
    var maxTaps = 12
    var currentTaps = 0
    var multipleInput = 0
    
    //Outlets

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var multiple: UITextField!
    
    @IBOutlet weak var initialInstruc: UILabel!
    @IBOutlet weak var addition: UILabel!
    @IBOutlet weak var add: UIButton!


    //Starting the game
    
    @IBAction func onPlay(sender: UIButton!) {
        if multiple.text != nil && multiple.text != "" {
            logoImg.hidden = true
            playButton.hidden = true
            multiple.hidden = true
            addition.hidden = true
            
            add.hidden = false
            initialInstruc.hidden = false
            
            currentMultiple = 0
            currentTaps = 0
            multipleInput = Int(multiple.text!)!
            
        }
    }
    
    func updateMultipleLabel(oldSum: Int, mul: Int, newSum: Int) {
        addition.text = " \(oldSum) + \(mul) = \(newSum)"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps{
            return true
        } else {
            return false
        }
    }
    
    @IBAction func addTap(sender: AnyObject!) {
        if isGameOver() {
            restart()
        }
        currentTaps++
        let newSum = currentMultiple + multipleInput
        updateMultipleLabel(currentMultiple, mul: multipleInput, newSum: newSum)
        
        if currentTaps == 1{
            initialInstruc.hidden = true
            addition.hidden = false
    }
        if currentTaps >= 1{
            currentMultiple += multipleInput
        }
    }
    
    @IBAction func restart() {
        
        
        currentTaps = -1
        currentMultiple = 0
        
        logoImg.hidden = false
        playButton.hidden = false
        multiple.hidden = false
        multiple.text = nil
        
        addition.hidden = true
        add.hidden = true
        
    }

}
