//
//  ViewController.swift
//  Uh oh!
//
//  Created by Richard Matheson on 30/08/2014.
//  Copyright (c) 2014 Richard Matheson. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var panicButton: UIButton!
    @IBOutlet var worryButton: UIButton!
    
    @IBOutlet weak var curLocation: UILabel!
    var locationManager:CLLocationManager!
    var callQueue = CallQueue()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MakeCall(sender: AnyObject) {
        var speaker = AVSpeechSynthesizer()
        var utterance = AVSpeechUtterance(string: "I'm sorry Dave, I can't let you do that.")
        speaker.speakUtterance(utterance)
      
        callQueue.callQueue = ["00447477973182", "00447477973182", "00447477973182"]
        callQueue.makeCalls()
    }
    
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        println("locations = \(locations)")
        curLocation.text = "success"
        
    }
}

