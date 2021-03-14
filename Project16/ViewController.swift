//
//  ViewController.swift
//  Project16
//
//  Created by Joao Gabriel Dourado Cervo on 13/03/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
    }


}

