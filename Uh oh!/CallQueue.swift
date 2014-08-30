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

class CallQueue
{
  var callManager: CTCallCenter!;
  var callQueue: [String]
  var _success: Bool
  
  func onCallEvent(call: CTCall!)
  {
    println("\(call.description): \(call.callState)")
    
    if (callQueue.count == 0)
    {
      callManager.callEventHandler = nil
      return
    }
    if (call.callState == CTCallStateDisconnected) {
      if (call == callQueue[0]) {
        callQueue.removeAtIndex(0)
        makeCalls();
      }
    }
    else if (call.callState == CTCallStateIncoming ||
             call.callState == CTCallStateConnected) {
      callQueue.removeAll(keepCapacity: false)
      _success = true
      callManager.callEventHandler = nil
    }
    else if (call.callState == CTCallStateDialing) {
      
    }
  }
  
  init() {
    callQueue = [];
    callManager = CTCallCenter()
    onComplete = { b in return }
    _success = false
  }
  
  func makeCalls() {
    _success = false;
    callManager.callEventHandler = onCallEvent
    var number = NSMutableString(string: callQueue[0])
    let regex = NSRegularExpression(pattern: "[^0-9]", options: .IgnoreMetacharacters, error: nil)
    regex.replaceMatchesInString(number, options: .allZeros, range: NSMakeRange(0, number.length), withTemplate: "")
    UIApplication.sharedApplication().openURL(NSURL.URLWithString("telprompt://" + number))
  }
  
  var onComplete: (success: Bool) -> ()
}