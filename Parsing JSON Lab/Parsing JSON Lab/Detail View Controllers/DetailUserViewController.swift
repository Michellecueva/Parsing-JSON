//
//  DetailUsersViewController.swift
//  Parsing JSON Lab
//
//  Created by Michelle Cueva on 8/27/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class DetailUsersViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var addressField: UITextView!
    
    var user: ResultsWrapper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.getFullName()
        phoneNumLabel.text = user.phone
        dobLabel.text = user.getDOB()
        addressField.text = user.getFullAddress()
        addressField.isEditable = false

    }

}
