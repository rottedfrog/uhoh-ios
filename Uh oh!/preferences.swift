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
    var friends:[String: String] = ["name1": "Benno", "name2": "Liudas", "name3": "Joseph", "phone1": "+447477973182", "phone2": "+4428254224400", "phone3": "+447967965870"]
    var location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0,longitude: 0)
    
    
    
}
