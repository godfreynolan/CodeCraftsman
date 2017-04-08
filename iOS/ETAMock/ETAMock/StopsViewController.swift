//
//  StopsViewController.swift
//  ETAMock
//
//  Created by Brian Marshall on 3/27/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import UIKit

class StopsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentButton: UISegmentedControl!

    var companyIndex:Int!
    var route: Route!
    var selectedDirection: String!
    var stopNames:[String] = []
    var urlString:String = ""
    let urlStringSouth:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentButton.setTitle(route.direction1, forSegmentAt: 0)
        segmentButton.setTitle(route.direction2, forSegmentAt: 1)
        selectDirection(direction: route.direction1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.stopNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopsCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.stopNames[indexPath.row]

        return cell
    }

    @IBAction func directionButtonClick(_ sender: UISegmentedControl) {
        //When the button is pressed reload the view
        switch segmentButton.selectedSegmentIndex {
            case 0:
                selectDirection(direction: route.direction1)
            case 1:
                selectDirection(direction: route.direction2)
            default:
                break
        }
    }

    func configureWithRoute(route: Route) {
        self.route = route
    }
    
    func selectDirection(direction: String) {
        selectedDirection = direction
        
        urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex!)/routes/\(route.id)/\(direction)/weekday/1/stops"
        let jsonFetcher = JSONfetcher()
        let url = jsonFetcher.getSourceUrl(apiUrl: urlString)

        //Call the api asynchronously
        jsonFetcher.callApi(url: url) { data in

            //Parse the data
            let parser = customJSONparser(companyIndex: self.companyIndex)
            self.stopNames = parser.getDirectionOneStops(data)
            self.tableView.reloadData()
            
            //If weekday doesn't work do everyday
            if(self.stopNames == []) {
                self.everydaySelectDirection(direction: direction)
            }
        }
    }

    func everydaySelectDirection(direction: String) {
        selectedDirection = direction

        urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex!)/routes/\(route.id)/\(direction)/everyday/1/stops"
        let jsonFetcher = JSONfetcher()
        let url = jsonFetcher.getSourceUrl(apiUrl: urlString)

        //Call the api asynchronously
        jsonFetcher.callApi(url: url) { data in

            //Parse the data
            let parser = customJSONparser(companyIndex: self.companyIndex)
            self.stopNames = parser.getDirectionOneStops(data)
            self.tableView.reloadData()
        }
    }
}
