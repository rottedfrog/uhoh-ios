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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MakeCall(sender: AnyObject) {
        let phone = "tel://00447477973182";
        let url:NSURL = NSURL.URLWithString(phone);
        UIApplication.sharedApplication().openURL(url);
        
        
        var speaker = AVSpeechSynthesizer()
        var utterance = AVSpeechUtterance(string: "Look at you hacker, a p-p-pathetic creature of meat and bone, panting and sweating as you run through my corridors.")
        speaker.speakUtterance(utterance)
    
    }
    
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        println("locations = \(locations)")
        curLocation.text = "success"
        
    }
}

