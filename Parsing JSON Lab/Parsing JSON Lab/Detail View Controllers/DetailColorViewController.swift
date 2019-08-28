//
//  DetailColorViewController.swift
//  Parsing JSON Lab
//
//  Created by Michelle Cueva on 8/27/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class DetailColorViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var hexLabel: UILabel!
    
    @IBOutlet weak var rLabel: UILabel!
    
    @IBOutlet weak var gLabel: UILabel!
    
    @IBOutlet weak var bLabel: UILabel!
    
    var color: colorResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = color.name.value
        hexLabel.text = color.hex.value
        rLabel.text = color.rgb.fraction.r.description
        gLabel.text = color.rgb.fraction.g.description
        bLabel.text = color.rgb.fraction.b.description

    }


}
