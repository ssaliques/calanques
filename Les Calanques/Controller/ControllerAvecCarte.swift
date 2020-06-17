//
//  ControllerAvecCarte.swift
//  Les Calanques
//
//  Created by Sébastien SALIQUES on 02/06/2020.
//  Copyright © 2020 MassiveDynamic Ltd. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var calanques: [Calanque] =  CalanquesCollection().all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addAnnotation()
        

       
    }
    
    func addAnnotation() {
        
        for calanque in calanques {
            
            // Annotations de base
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = calanque.coordonnees
//            annotation.title = calanque.nom
//            mapView.addAnnotation(annotation)
            
            // Annotation custom
            
            let annotation = MonAnnotation(calanque)
            mapView.addAnnotation(annotation)
            
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "reuseID"
        
        // Vérifier que ce n'est pas la position de l'utilisateur
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        if let anno = annotation as? MonAnnotation {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
            annotationView?.image = UIImage(named: "placeholder")
            annotationView?.canShowCallout = true
            if annotationView == nil {
                annotationView = MonAnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
                
                // annotationView = MKAnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
                // annotationView?.image = UIImage(named: "placeholder")
                // annotationView?.canShowCallout = true
                return annotationView
            } else {
                return annotationView
            }
        }
        return nil
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
