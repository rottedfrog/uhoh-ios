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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MakeCall(sender: AnyObject) {
        var speaker = AVSpeechSynthesizer()
        //var utterance = AVSpeechUtterance(string: "I'm sorry Dave, I can't let you do that.")
        //speaker.speakUtterance(utterance)
      
        callQueue.callQueue = ["00447477973182", "00447477973182", ""]
        callQueue.makeCalls()
    }
    
    
    @IBAction func Worry(sender: AnyObject) {
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error)->Void in
            
            if error != nil {
                println("Reverse geocoder failed with error" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                let pm = placemarks[0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                println("Problem with the data received from geocoder")
            }
        })

    }
    
    
    
    func displayLocationInfo(placemark: CLPlacemark) {
        
        //stop updating location to save battery life
        //locationManager.stopUpdatingLocation()
        var res = " "
        if placemark.thoroughfare != nil {res += placemark.thoroughfare + ", "}
        if placemark.subThoroughfare != nil {res += placemark.subThoroughfare + ", "}
        if placemark.locality != nil {res += placemark.locality + ", "}
        if placemark.postalCode != nil {res += placemark.postalCode + ", "}
        if placemark.country != nil {res += placemark.country + ", "}
        
        println(placemark.thoroughfare)
        println(placemark.subThoroughfare)
        println(placemark.locality)
        println(placemark.postalCode)
        println(placemark.administrativeArea)
        println(placemark.country)
        
        self.curLocation.text = res
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }
}

