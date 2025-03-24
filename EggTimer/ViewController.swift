//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let boilTimes = ["Soft": 3, "Medium": 5, "Hard": 7];
    var timeElapsed = 0
    var totalTime = 0
    var timer = Timer()
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let selectedHardness = sender.currentTitle!
        totalTime = boilTimes[selectedHardness]!
        
        progressBar.progress = 0.0
        timeElapsed = 0
        titleLabel.text = "Boiling \(selectedHardness) Egg"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
        

        
    }
    
    @objc func updateCounter() {
        if (timeElapsed < totalTime) {
            timeElapsed += 1
            let percentageProgress = Float(timeElapsed) / Float(totalTime)
            progressBar.progress = percentageProgress
        } else {
            titleLabel.text = "DONE"
        }

    }
    

}
