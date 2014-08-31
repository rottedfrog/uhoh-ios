//
//  preferences.swift
//  Uh oh!
//
//  Created by Benno Ommerborn on 31.08.14.
//  Copyright (c) 2014 Richard Matheson. All rights reserved.
//

import Foundation
import CoreLocation

class Preferences {
    var mode:String = "alert"
    var friends:[String: String] = ["name1": "Benno", "name2": "Richard", "name3": "Richard", "phone1": "123", "phone2": "234", "phone3": "456"]
    var location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0,longitude: 0)
    
    
    
}
