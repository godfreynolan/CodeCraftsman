//
//  RouteTableViewController.swift
//  ETAMock
//
//  Created by Donald Freeman on 3/23/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import UIKit
import Foundation

class RouteTableViewController: UITableViewController {
    
    var routes:[Route] = []
    var companyIndex = -1
    var urlString:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fetch
        urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex)/routes"
        let jsonFetcher = JSONfetcher()
        let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
        
        //Call the api asynchronously
        jsonFetcher.callApi(url: url) { data in
            
            //Parse the data
            let parser = customJSONparser(companyIndex: self.companyIndex)
            self.routes = parser.getRoutes(fromJSONString: data)
            
            //Reload the tableview
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.routes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routeCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.routes[indexPath.row].name

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStopsSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! StopsViewController
                controller.companyIndex = self.companyIndex
                controller.configureWithRoute(route: routes[indexPath.row])
            }
        }
    }
}
