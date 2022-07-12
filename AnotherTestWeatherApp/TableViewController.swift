//
//  TableViewController.swift
//  AnotherTestWeatherApp
//
//  Created by Марк Пушкарь on 08.07.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    let networkService = NetworkService()
    
    private let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        self.tableView.dataSource = self
        
        
        //networkService.fetchWeather()

    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }

}


