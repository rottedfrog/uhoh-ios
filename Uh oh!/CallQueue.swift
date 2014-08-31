//
//  CallQueue.swift
//  Uh oh!
//
//  Created by Richard Matheson on 30/08/2014.
//  Copyright (c) 2014 Richard Matheson. All rights reserved.
//

import Foundation
import CoreTelephony
import UIKit
import AVFoundation

class CallQueue
{
  var callQueue: [String] = []
  var _current = 0
  
  func makeCalls() {
    if (isPlaying())
    {
      _handler.player.stop();
      return;
    }
    if (callQueue[_current] != "")
    {
      var number = NSMutableString(string: callQueue[_current])
      let regex = NSRegularExpression(pattern: "[^0-9]", options: .IgnoreMetacharacters, error: nil)
      regex.replaceMatchesInString(number, options: .allZeros, range: NSMakeRange(0, number.length), withTemplate: "")
      UIApplication.sharedApplication().openURL(NSURL.URLWithString("telprompt://" + number))
    }
    _current = (_current + 1) % callQueue.count
  }
  
  
  var _handler = AudioHandler()
  var _session = AVAudioSession.sharedInstance()
  
  func isPlaying() -> Bool
  {
    return _handler.player != nil && _handler.player.playing
  }
 
  class AudioHandler : NSObject, AVAudioPlayerDelegate {
    var player: AVAudioPlayer! = nil
    var soundUrl = NSURL(fileURLWithPath: "\(NSBundle.mainBundle().resourcePath!)/Pre-recording1.mp3")
    var repeatSoundUrl = NSURL(fileURLWithPath: "\(NSBundle.mainBundle().resourcePath!)/Pre-recording2 - loop.mp3")
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
      if (flag)
      {
        self.player = AVAudioPlayer(contentsOfURL: repeatSoundUrl, error: nil)
        self.player.numberOfLoops = -1;
        self.player.play()
      }
    }
  }
  
  func playMP3() {
    _session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
    var err: NSError?
    _handler.player = AVAudioPlayer(contentsOfURL: _handler.soundUrl, error: &err)
    _handler.player.delegate = _handler
    _handler.player.play()
  }
}