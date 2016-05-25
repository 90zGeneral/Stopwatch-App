//
//  ViewController.swift
//  Stopwatch
//
//  Created by Roydon Jeffrey on 5/24/16.
//  Copyright © 2016 Italyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()  //make timer global so it can be controlled by all necessary IBActions
    
    var time = 0   //initial value for the timer
    
    func updateTimer() {
        time += 1   //increment time value by 1
        
        if time < 10 {
            timerResult.text = "0\(time)" //convert time to a string in order to update the label as a double digit number
        }else {
            timerResult.text = String(time)  //another way to convert time into a string
        }
    }
    
    @IBOutlet var timerResult: UILabel!
    
    @IBAction func play(sender: AnyObject) {
        
        if !timer.valid {      //this prevents the time interval from speeding up/freaking out when the play button is tapped consecutively. Do not call NSTimer object if timer is currently running.
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
            //run the result function every second once play button is tapped
        }
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        timer.invalidate()   //to stop the timer
        
    }
    
    @IBAction func rewind(sender: AnyObject) {

        if time <= 10 {
            time = 0
            timerResult.text = "0\(time)"
        }else {
            if time < 20 {
                time -= 10
                timerResult.text = "0\(time)"
            }else {
                time -= 10
                timerResult.text = String(time)
            }
        }
        //to reduce the timer by 10 or reset to 0 if its value is less than 10 while remaining a double digit number
        
    }
    
    @IBAction func refresh(sender: AnyObject) {
        
        time = 0
        timerResult.text = "0\(time)"
        
        //reset the timer and label to 0
        
    }
    
    @IBAction func fastforward(sender: AnyObject) {
        
        time += 10
        timerResult.text = "\(time)"
        
        //to increse the time by 10
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

