//
//  WeatherViewController.swift
//  Parsing JSON Lab
//
//  Created by Michelle Cueva on 8/27/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    
    var weather = [listWrapper]() {
        didSet {
            weatherTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfigurations()
        loadData()

    }
    
    private func tableViewConfigurations() {
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
    }
    
    private func loadData() {
        guard let pathToWeatherFile = Bundle.main.path(forResource: "Weather", ofType:"json") else {fatalError("Couldn't find file")}
        
        let url = URL(fileURLWithPath: pathToWeatherFile)
        
        do {
            let data = try
                Data(contentsOf: url)
            let weatherFromJSON = try
                listWrapper.getListInfo(data: data)
            weather = weatherFromJSON
        } catch {
            fatalError("Couldn't get weather from JSON\(error)")
        }
        
    }
    
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        let currentWeather = weather[indexPath.row]
        cell.textLabel?.text = currentWeather.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {fatalError("No identifier in segue")}
        
        switch segueIdentifier {
        case "weatherSegue":
            guard let DetailVC = segue.destination as? DetailWeatherViewController else {fatalError("unexpected segueVC")}
            guard let selectedIndexPath = weatherTableView.indexPathForSelectedRow else{fatalError("no row selected")}
            
            let currentCity = weather[selectedIndexPath.row]
            
            DetailVC.city = currentCity
        default:
            fatalError("unexpected segue identifies")
        }
        
    }
    
    
}

extension WeatherViewController: UITableViewDelegate {
    
}
