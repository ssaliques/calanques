//
//  ControllerAvecCarte.swift
//  Les Calanques
//
//  Created by Sébastien SALIQUES on 02/06/2020.
//  Copyright © 2020 MassiveDynamic Ltd. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var calanques: [Calanque] =  CalanquesCollection().all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnnotation()
        

       
    }
    
    func addAnnotation() {
        for calanque in calanques {
            let annotation = MKPointAnnotation()
            annotation.coordinate = calanque.coordonnees
            annotation.title = calanque.nom
            mapView.addAnnotation(annotation)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = MKMapType.standard
        case 1: mapView.mapType = MKMapType.satellite
        case 2: mapView.mapType = MKMapType.hybrid
        default:
            break
        }
        
    }
    
    @IBAction func getPosition(_ sender: Any) {
    }
    
}
