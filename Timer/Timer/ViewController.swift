/*
    ViewController.swift
    Timer

    Created by Arun Gupta on 8/22/15.
    Copyright (c) 2015 Potato Inc. All rights reserved.
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    
    var counter = 0
    var timer:NSTimer = NSTimer()
    var running = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number.text = "00:00:00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func reset(sender: AnyObject) {
        counter = 0
        number.text = "00:00:00"
        timer.invalidate()
        running = false
    }

    @IBAction func play(sender: AnyObject) {
        if (running == false ){
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector:Selector("updateTimer"), userInfo:nil, repeats:true)
            running = true
        }
    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
        running = false
    }
    
    func updateTimer() {
        number.text = formatTime(counter++)
    }
    
    func formatTime(counter: Int) -> String{
        var seconds = String(counter % 60)
        var hours = String((counter - (counter % 3600)) / 3600)
        var minutes = String((((counter - (hours.toInt()! * 3600)) - seconds.toInt()!) / 60))
        
        seconds = seconds.toInt() < 10 ? "0\(seconds)" : String(seconds)
        
        minutes = minutes.toInt() < 10 ? "0\(minutes)" : String(minutes)
        
        hours = hours.toInt() < 10 ? "0\(hours)" : String(hours)
        
        return "\(hours):\(minutes):\(seconds)"
    }
    
}

