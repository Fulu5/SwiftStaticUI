//
//  ViewController.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 19/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

enum DeviceOrientation : Int {
    case unknown
    case portrait
    case portraitUpsideDown
    case landscapeLeft
    case landscapeRight
    case faceUp
    case faceDown
}

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var mapView = MKMapView()
    
    var currentDeviceOrientation: UIDeviceOrientation = .unknown
    
    let mainScrollView = UIScrollView()
    let headeImageView = UIImageView()
    let descriptionView = UIView()
    let titleLabel = UILabel()
    let addressLabel = UILabel()
    let availabelLabel = UILabel()
    let viewButton = UIButton(type: UIButtonType.system)
    
    fileprivate var regularConstraints = [NSLayoutConstraint]()
    fileprivate var compactConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configMainScrollView()
    }
    
    func configMainScrollView() {
        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainScrollView)
        // scrollView的contentSize由内部元素的高度决定
        // 相当于frame
        mainScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        headeImageView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(headeImageView)
        // header
        headeImageView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        headeImageView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        headeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headeImageView.heightAnchor.constraint(equalTo: headeImageView.widthAnchor, multiplier: 0.5).isActive = true
        headeImageView.image = UIImage.init(named: "head")
        
        // descrip
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(descriptionView)
        
        descriptionView.topAnchor.constraint(equalTo: headeImageView.bottomAnchor, constant: 20).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        descriptionView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, multiplier: 0.5).isActive = true
        descriptionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // label_1
        titleLabel.text = "h and I"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: descriptionView.heightAnchor, multiplier: 0.5).isActive = true
        
        // label_2
        addressLabel.text = "17,MITCHAM, VIC, 3132, AU"
        addressLabel.font = UIFont.systemFont(ofSize: 12)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionView.addSubview(addressLabel)
        addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: descriptionView.heightAnchor, multiplier: 0.25).isActive = true
        
        // label_3
        availabelLabel.text = "Properties Available: 1/1"
        availabelLabel.font = UIFont.systemFont(ofSize: 12)
        availabelLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionView.addSubview(availabelLabel)
        availabelLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor).isActive = true
        availabelLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        availabelLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        availabelLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
        
        // button
        viewButton.addTarget(self, action: #selector(NextPageAction), for: UIControlEvents.touchUpInside)
        viewButton.setTitle("View Pricelist", for: UIControlState.normal)
        viewButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        viewButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        viewButton.layer.borderColor = UIColor.blue.cgColor
        viewButton.layer.borderWidth = 1.0
        viewButton.layer.cornerRadius = 2.0
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(viewButton)

        // 根据不同的屏幕添加两套约束方案到约束数组中
        compactConstraints.append(viewButton.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor))
        compactConstraints.append(viewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
        regularConstraints.append(viewButton.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 20))
        regularConstraints.append(viewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        
        
        
        
        
        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(mapView)

        mapView.topAnchor.constraint(equalTo: viewButton.bottomAnchor, constant: 20).isActive = true
        mapView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        mapView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -20).isActive = true
        
        // 地图类型为标准
        mapView.mapType = MKMapType.standard
        // 精度
        let latitudeDelta = 0.05
        let longitudDelda = 0.05
        let currentLocationSpan = MKCoordinateSpanMake(latitudeDelta, longitudDelda)
        // 定义地图中心坐标
        let center = locationManager.location?.coordinate
        // 定义地图当前位置
        let currentReigon = MKCoordinateRegion(center: center!, span: currentLocationSpan)
        // 显示区域
        mapView.setRegion(currentReigon, animated: true)
    }
    
    // 监测屏幕旋转的方法
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        // 1.regular情形
        if traitCollection.horizontalSizeClass == .regular {
            // 使compact下的约束失效
            NSLayoutConstraint.deactivate(compactConstraints)
            // 使regular下的约束生效
            NSLayoutConstraint.activate(regularConstraints)
        } else {
            // 2.compact情形
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        }
    }
    
    func NextPageAction() {
        let nextPage = StoryBoardVC(nibName: "StoryBoardVC", bundle: Bundle.main)
        show(nextPage, sender: nil)
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0,
                                                                  regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view: MKPinAnnotationView
        if let dequeView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? MKPinAnnotationView {
            dequeView.annotation = annotation
            view = dequeView
        } else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: -5)
            view.rightCalloutAccessoryView = UIButton(type: UIButtonType.detailDisclosure)
        }
        return view
    }
}

