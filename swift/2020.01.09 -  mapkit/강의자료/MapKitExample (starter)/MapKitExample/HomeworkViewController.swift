//
//  HomeworkViewController.swift
//  MapKitExample
//
//  Created by 황정덕 on 2020/01/09.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import MapKit

class HomeworkViewController: UIViewController {
  private var mapView = MKMapView()
  
  var count = 1
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchBar.delegate = self
    
    navigationItem.searchController = searchController
    
    
    baseUI()
    autoLayOut()
  }
  func baseUI(){
    view.addSubview(mapView)
  }
  func autoLayOut(){
    mapView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  //위경도 -> 주소
  func reverseGeocode(location: CLLocation, complation: @escaping (String) -> ()) {
    let geocoder = CLGeocoder()
    
    geocoder.reverseGeocodeLocation(location) { placeMark, error  in
      if error != nil {
        return
      }
      guard let address = placeMark?.first,
        let country = address.country,
        let administrativeArea = address.administrativeArea,
        let locality = address.locality,
        let name = address.name
        else { return }
      
      let addr = "\(country) \(administrativeArea) \(locality) \(name)"
      
      complation(addr)
      
      print(addr)
    }
    
  }
  
  func geocodeAddressString(_ addressString: String) {
    print("\n---------- [ 주소 -> 위경도 ] ----------")
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(addressString) { (placeMark, error) in
      if error != nil {
        return print(error!.localizedDescription)
      }
      guard let place = placeMark?.first else { return }
      //      print(place)
      
      // 위경도값 가져오기
      print(place.location?.coordinate)
      
      guard let coordinate = place.location?.coordinate, let location = place.location else { return }
      self.setRegion(coordinate: coordinate)
      self.addAnnotation(coordinate: coordinate)
      self.makeSquare(coordinate: coordinate)
      
      self.reverseGeocode(location: location) { (address) in
        print(address)
      }
      
    }
  }
  func addAnnotation(coordinate: CLLocationCoordinate2D){
    let getLat: CLLocationDegrees = coordinate.latitude
    let getLon: CLLocationDegrees = coordinate.longitude
    
    let location = CLLocation(latitude: getLat, longitude: getLon)
    let myHome = MKPointAnnotation()
    myHome.title = "\(count)번쨰 여행"
    count += 1
    
//    myHome.subtitle = "d"
    self.reverseGeocode(location: location) { (address) in
      myHome.subtitle = address
    }
    myHome.coordinate = coordinate
    self.mapView.addAnnotation(myHome)
  }
  
  func makeSquare(coordinate: CLLocationCoordinate2D){
    var point1 = coordinate; point1.longitude -= 0.01;   point1.latitude -= 0.01
    var point2 = coordinate; point2.longitude += 0.01;   point2.latitude -= 0.01
    var point3 = coordinate; point3.longitude += 0.01;   point3.latitude += 0.01
    var point4 = coordinate; point4.longitude -= 0.01;   point4.latitude += 0.01
    let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
    let polyline = MKPolyline(coordinates: points, count: points.count)
    self.mapView.addOverlay(polyline)
  }
  
  func setRegion(coordinate: CLLocationCoordinate2D) {
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    let region = MKCoordinateRegion(center: coordinate, span: span )
    mapView.setRegion(region, animated: true)
  }
}


extension HomeworkViewController: UISearchBarDelegate{
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let searchText = searchBar.text else { return }
    geocodeAddressString(searchText)
  }
}

extension HomeworkViewController: MKMapViewDelegate {
  //
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let polyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyline)
      renderer.strokeColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
      renderer.lineWidth = 2
      return renderer
    }
    return MKOverlayRenderer(overlay: overlay)
  }
}
