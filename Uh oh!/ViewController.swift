//
//  ViewController.swift
//  Uh oh!
//
//  Created by Richard Matheson on 30/08/2014.
//  Copyright (c) 2014 Richard Matheson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  @IBOutlet var panicButton: UIButton!
  @IBOutlet var worryButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func MakeCall(sender: AnyObject) {
    var speaker = AVSpeechSynthesizer()
    var utterance = AVSpeechUtterance(string: "Look at you hacker, a p-p-pathetic creature of meat and bone, panting and sweating as you run through my corridors.")
    speaker.speakUtterance(utterance)
  }
}

