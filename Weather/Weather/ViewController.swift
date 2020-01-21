//
//  ViewController.swift
//  Weather
//
//  Created by Pedro Henrique  on 20/01/20.
//  Copyright © 2020 Pedro Henrique . All rights reserved.


import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!


    @IBOutlet weak var conditionalImageView: UIImageView!
    @IBOutlet weak var conditionalLabel: UILabel!

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!

    let gradientLayer = CAGradientLayer();

    let apiKey = "14d18e030221d3dfe160c5213255f555"
    var lat = 11.12563
    var lon = 67.12783
    var activityIndicator: NVActivityIndicatorView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.addSublayer(gradientLayer)

        let indicatorSize: CGFloat = 70
        let indicatorFrame = CGRect(x: (view.frame.width-indicatorSize)/2, y: (view.frame.height-indicatorSize)/2, width: indicatorSize, height: indicatorSize)
        activityIndicator = NVActivityIndicatorView(frame: indicatorFrame, type: .lineScale, color: UIColor.white, padding: 20.0)
        activityIndicator.backgroundColor = UIColor.black
        view.addSubview(activityIndicator)
        
        locationManager.requestWhenInUseAuthorization()
        
        activityIndicator.startAnimating()
        if(CLLocationManager.locationServicesEnabled()){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        setGrayGradientBackground()
        
        func locationManager(_ manager: CLLocationManager , didUpdateLocations locations: [CLLocation]){
            
            let location = locations[0]
            lat = location.coordinate.latitude
            lon = location.coordinate.longitude
            
        }


    }

    func setBlueGradientBackground(){
        let topColor = UIColor(red:  95.0/255.0, green: 165.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red:  72.0/255.0, green: 114.0/255.0, blue: 184.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor,bottomColor]
    }

    func setGrayGradientBackground(){
        let topColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 72.0/255.0, green: 72.0/255.0, blue: 72.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor,bottomColor]
    }
}
