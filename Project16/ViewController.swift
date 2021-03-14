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
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }
    
    // Método chamado sempre que clicar em um pin para ver info
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Queremos mostrar info apenas das capitais
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        // Tenta dar dequeue de uma annotation view
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            // Se não achar uma annotationView reusavel,, cria uma nova
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            // Aparece o callout quando clicado em cima
            annotationView?.canShowCallout = true
            
            // Botão de info
            let detailBtn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = detailBtn
        } else {
            // Se pode reusar a view, atualiza ela para usar a annotation diferente
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    // Função chamada quando clicar no callouAccessory (nesse caso, o detailBtn acima)
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        let placeInfo = capital.info
        
        let alertController = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }


}

