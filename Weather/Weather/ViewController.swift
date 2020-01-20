//
//  ViewController.swift
//  Weather
//
//  Created by Pedro Henrique  on 20/01/20.
//  Copyright © 2020 Pedro Henrique . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    
    @IBOutlet weak var conditionalImageView: UIImageView!
    @IBOutlet weak var conditionalLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    let gradientLayer = CAGradientLayer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.addSublayer(gradientLayer)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGrayGradientBackground()
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
