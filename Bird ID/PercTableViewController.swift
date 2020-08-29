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
    var smallDecimal = ""
    var currentPercentage: Double = 0
    var doubleDecimal : Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var orderedPerc = percentages.sorted(by:{
            $0.value > $1.value
        })
        
        for (bird, perc) in orderedPerc{
            print("\(bird) : \(perc)")
            smallDecimal = String(format: "%.2f", perc)
            doubleDecimal = Double(smallDecimal)!
            currentPercentage = doubleDecimal * 100
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
