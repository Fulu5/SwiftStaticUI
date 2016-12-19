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

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configMainScrollView()
        
    }
    
    func configMainScrollView() {
        let mainScrollView = UIScrollView()
        mainScrollView.contentSize = CGSize(width: 0, height: 1000)
        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainScrollView)
        
        mainScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2.0).isActive = true
        
        let headeImageView = UIImageView()
        headeImageView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(headeImageView)
        
        headeImageView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        headeImageView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        headeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headeImageView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor, multiplier: 0.5).isActive = true
        headeImageView.image = UIImage.init(named: "head")
        
        let descriptionView = UIView()
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(descriptionView)
        
        descriptionView.topAnchor.constraint(equalTo: headeImageView.bottomAnchor, constant: 20).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        descriptionView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, multiplier: 0.5).isActive = true
        descriptionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = "h and I"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: descriptionView.heightAnchor, multiplier: 0.5).isActive = true
        
        let addressLabel = UILabel()
        addressLabel.text = "17,MITCHAM, VIC, 3132, AU"
        addressLabel.font = UIFont.systemFont(ofSize: 12)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionView.addSubview(addressLabel)
        addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: descriptionView.heightAnchor, multiplier: 0.25).isActive = true
        
        let availabelLabel = UILabel()
        availabelLabel.text = "Properties Available: 1/1"
        availabelLabel.font = UIFont.systemFont(ofSize: 12)
        availabelLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionView.addSubview(availabelLabel)
        availabelLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor).isActive = true
        availabelLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        availabelLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        availabelLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
        
        let viewButton = UIButton(type: UIButtonType.custom)
        viewButton.setTitle("View Pricelist", for: UIControlState.normal)
        viewButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        viewButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        viewButton.layer.borderColor = UIColor.blue.cgColor
        viewButton.layer.borderWidth = 1.0
        viewButton.layer.cornerRadius = 2.0
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        
        mainScrollView.addSubview(viewButton)
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            viewButton.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
            viewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        } else {
            viewButton.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 20).isActive = true
            viewButton.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        }
        viewButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        viewButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            mapView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 20).isActive = true
        } else {
            mapView.topAnchor.constraint(equalTo: viewButton.bottomAnchor, constant: 20).isActive = true
        }
        mapView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
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
        //
        let objAnnotation = MKPointAnnotation()
        
        objAnnotation.coordinate = CLLocation(latitude: latitudeDelta, longitude: longitudDelda).coordinate
        objAnnotation.title = "目测是在这里"
        objAnnotation.subtitle = "详情请访问高德地图"
        mapView.addAnnotation(objAnnotation)
    }
    
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

