//
//  ColorsViewController.swift
//  Parsing JSON Lab
//
//  Created by Michelle Cueva on 8/27/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    var colors = [colorResults]() {
        didSet{
            colorsTableView.reloadData()
        }
    }

    @IBOutlet weak var colorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfigurations()
        loadData()

    }
    
    func tableViewConfigurations() {
        colorsTableView.dataSource = self
        colorsTableView.delegate = self
    }
    
    private func loadData() {
        // pathtoJason is just the string for the name of file
        guard let pathToColorFile = Bundle.main.path(forResource: "ColorsScheme", ofType:"json") else {fatalError("Couldn't find file")}
        
        //URL is the actual location of the file
        
        let url = URL(fileURLWithPath: pathToColorFile)
        
        do {
            let data = try
                Data(contentsOf: url)
            let colorsFromJSON = try
                colorResults.getColorInfo(data: data)
            colors = colorsFromJSON
        } catch {
            fatalError("Couldn't get colors from JSON\(error)")
        }
        
    }


    
}

extension ColorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let currentColor = colors[indexPath.row]
        cell.textLabel?.text = currentColor.name.value
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(currentColor.rgb.fraction.r), green: CGFloat(currentColor.rgb.fraction.g), blue: CGFloat(currentColor.rgb.fraction.b), alpha: 1)
        
        return cell
    }
    
    
}

extension ColorsViewController: UITableViewDelegate {
    
}
