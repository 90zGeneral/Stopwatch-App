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
    
    func result() {
        time += 1   //increment time value by 1
        
        timerResult.text = String(time) //convert time to a string in order to update the label
    }
    
    @IBOutlet var timerResult: UILabel!
    
    @IBAction func play(sender: AnyObject) {
        
        if !timer.valid {      //this prevents the time interval from speeding up when the play button is tapped consecutively
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.result), userInfo: nil, repeats: true)
            //run the result function every second once play button is tapped
        }
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        timer.invalidate()   //to stop the timer
        
    }
    
    @IBAction func rewind(sender: AnyObject) {

        if time <= 10 {
            time = 0
            timerResult.text = String(time)
        }else {
            time -= 10
            timerResult.text = "\(time)"
        }
        //to reduce the timer by 10 or to 0 if its value is less than 10
        
    }
    
    @IBAction func refresh(sender: AnyObject) {
        
        time = 0
        timerResult.text = String(time)
        
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

