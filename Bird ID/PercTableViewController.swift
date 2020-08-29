//
//  PercTableViewController.swift
//  Bird ID
//
//  Created by Samvid Konchada on 8/29/20.
//  Copyright © 2020 Samvid. All rights reserved.
//

import UIKit

class PercTableViewController: UITableViewController {
    
    var percentages: [String: Double] = [:]
    var percArray : [String] = []
    var smallDecimal: Double = 0
    var currentPercentage: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (bird, perc) in percentages{
            print("\(bird) : \(perc)")
            smallDecimal = round(1000.0 * perc) / 1000.0
            currentPercentage = smallDecimal * 100
            if currentPercentage != 0.0 {
                percArray.append("\(bird) : \(currentPercentage)%")
            }
            
        }
        print("PercArray:")
        print(percArray)

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(percArray.count)
        return percArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("entering")
        let cell = UITableViewCell()

        cell.textLabel?.text = percArray[indexPath.row]
        print("percarray object:\(percArray[indexPath.row])")

        return cell
    }

}
