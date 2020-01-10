//
//  MyHomeAnnotationViewController.swift
//  MapKitExample
//
//  Created by 황정덕 on 2020/01/09.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import MapKit
//대한민국 서울특별시 광진구 화양동 20-25
//(latitude: 37.5467355, longitude: 127.0676171)

class MyHomeAnnotationViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
  }
 
  
  @IBAction func searchMyHome(_ sender: Any) {
    let myHome = MKPointAnnotation()
    myHome.title = "마이홈"
    myHome.subtitle = "서울특별시"
    myHome.coordinate = CLLocationCoordinate2DMake(37.5467355, 127.0676171)
    mapView.addAnnotation(myHome)
    
    let center = myHome.coordinate
    var point1 = center; point1.latitude += 0.25
    var point2 = center; point2.longitude += 0.3;   point2.latitude -= 0.15
    var point3 = center; point3.longitude -= 0.3;   point3.latitude -= 0.15
    let points: [CLLocationCoordinate2D] = [point1, point2, point3, point1]
    let polyline = MKPolyline(coordinates: points, count: points.count)
    mapView.addOverlay(polyline)
  }
  @IBAction func mskeTriangle(_ sender: Any) {
    mapView.removeAnnotations(mapView.annotations)
  }
  @IBAction func removeTriangle(_ sender: Any) {
    mapView.removeOverlays(mapView.overlays)
  }
  
}

extension MyHomeAnnotationViewController: MKMapViewDelegate {
  //
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let polyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyline)
      renderer.strokeColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
      renderer.lineWidth = 3
      return renderer
    }
    return MKOverlayRenderer(overlay: overlay)
  }
  
  
}
