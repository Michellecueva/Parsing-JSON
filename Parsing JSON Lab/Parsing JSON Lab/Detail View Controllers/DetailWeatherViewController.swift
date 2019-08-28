//
//  DetailWeatherViewController.swift
//  Parsing JSON Lab
//
//  Created by Michelle Cueva on 8/27/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    var city: listWrapper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = city.name
        tempLabel.text = "\(city.main.temp) °C"
        weatherLabel.text = city.weather[0].main
    }
    
}
