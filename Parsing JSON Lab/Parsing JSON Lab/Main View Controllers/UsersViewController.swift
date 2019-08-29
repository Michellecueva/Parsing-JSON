//
//  UsersViewController.swift
//  Parsing JSON Lab
//
//  Created by Michelle Cueva on 8/27/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    
    var users = [ResultsWrapper]() {
        didSet {
            usersTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfigurations()
        loadData()

    }
    
    private func tableViewConfigurations() {
        usersTableView.dataSource = self
        usersTableView.delegate = self
    }
    
    private func loadData() {
        guard let pathToUsersFile = Bundle.main.path(forResource: "randomUsers", ofType: "json") else { fatalError("Couldn't find file")}
        
        let url = URL(fileURLWithPath: pathToUsersFile)
        
        do {
            let data = try
            Data(contentsOf: url)
            
            let usersFromJSON = try
            ResultsWrapper.getResults(data: data)
            
            users = usersFromJSON
        } catch {
            fatalError("Couldn't get users from JSON \(error)")
        }
    }

  
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let currentUser = users[indexPath.row]
        cell.textLabel?.text = currentUser.getFullName()
        cell.detailTextLabel?.text = currentUser.email
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {fatalError("No identifier in segue")}
        
        switch segueIdentifier {
        case "usersSegue":
            guard let DetailVC = segue.destination as? DetailUsersViewController else {fatalError("Unexpected segueVC")}
            guard let selectedIndexPath = usersTableView.indexPathForSelectedRow else {fatalError("No row selected")}
            
            let currentUser = users[selectedIndexPath.row]
            
            DetailVC.user = currentUser
            
        default:
            fatalError("unexpected segue identified")
        }
    }
    
    
}

extension UsersViewController: UITableViewDelegate{
    
}
