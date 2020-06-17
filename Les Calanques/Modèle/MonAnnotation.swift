//
//  MonAnnotation.swift
//  Les Calanques
//
//  Created by Sébastien SALIQUES on 16/06/2020.
//  Copyright © 2020 MassiveDynamic Ltd. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var calanque: Calanque
    var title: String?
    
    init(_ calanque: Calanque) {
        self.calanque = calanque
        coordinate = self.calanque.coordonnees
        title = self.calanque.nom
    }
}
