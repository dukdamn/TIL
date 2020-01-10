//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit
// 1 권환 주기
final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    // 권한주기
    checkAuthorizationStatus()
    
    // 자신의 위치보기
//    mapView.showsUserLocation = true
    
    // 위성에서 보는것 보이기
//    mapView.mapType = .satellite
  }
  
  
  func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
//      locationManager.requestAlwaysAuthorization()
    case .restricted, .denied: break
    case .authorizedWhenInUse:
      fallthrough
    case .authorizedAlways:
      startUpdatingLocation()
    @unknown default: break
    }
  }
  
  func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    guard status == .authorizedWhenInUse || status == .authorizedAlways else { return }
    guard CLLocationManager.locationServicesEnabled() else { return }
//    위치정확도
//    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//     10미터마다 뭐 하겠다
//    locationManager.distanceFilter = 10.0
//    실제로 동작을 시킴
    locationManager.startUpdatingLocation()
  }
  
  @IBAction func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else {
      return
    }
    locationManager.startUpdatingHeading()
  }
  
  @IBAction func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
  
  private var setup = false
}

extension MyLocationViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
      print("\n----------[Authorized]----------\n")
    default:
      print("\n----------[Unauthorized]----------\n")
    }
  }
  
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    // 반드시 하나를 가져오므로 !처리
    let current = locations.last!
    let coorinate = current.coordinate
    
    // 캐쉬된 정보가 오래된건 무시하고 10초 이내인것만 처리~굿
    if (abs(current.timestamp.timeIntervalSinceNow) < 10 ){
      //    span 단위는 1도 (경도 1도는 약 111키로미터)
      let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
      let region = MKCoordinateRegion(center: coorinate, span: span)
      mapView.setRegion(region, animated: true)
      addAnnotation(location: current)
    }

  }
  
//  자신의 이동정보 찍기
  func addAnnotation(location: CLLocation) {
    let annotation = MKPointAnnotation()
    annotation.title = "MyLocation"
    annotation.coordinate = location.coordinate
    mapView.addAnnotation(annotation)
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print("trueHeading :", newHeading.trueHeading)  // 진북
    print("megneticHeading :", newHeading.magneticHeading)  // 지북
    print("values \(newHeading.x),\(newHeading.y), \(newHeading.z)")
  }
}
