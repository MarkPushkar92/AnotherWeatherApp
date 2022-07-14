//
//  TableViewController.swift
//  AnotherTestWeatherApp
//
//  Created by Марк Пушкарь on 08.07.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let emtyCity = Weather()
    
    private var citiesArray = [Weather]()
    
    private let nameCitiesArray = ["Владивосток", "Москва", "Санкт-Петербург", "Екататеринбург", "Южно-Сахалинск"]
    
    private let networkService = NetworkService()
    
    private let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        self.tableView.dataSource = self
        
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emtyCity, count: nameCitiesArray.count)
        }
        
        addCities()
    }
    
    func applyData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("RELOADING!!!!!!!!!!!!!!!!!!")
        }
    }
    
    private func addCities() {
        getCityWeather(citiesArray: nameCitiesArray) { [self] index, weather in
            citiesArray[index] = weather
            citiesArray[index].name = nameCitiesArray[index]
            print(citiesArray)
            applyData()
            
        }
        
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return nameCitiesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell

        cell.city = citiesArray[indexPath.row].name
        cell.temperature = String(citiesArray[indexPath.row].temp)
        cell.status = citiesArray[indexPath.row].conditionString
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let cityWeather = citiesArray[indexPath.row]
        let vc = ViewController()
        vc.weatherModel = cityWeather
        
        navigationController?.pushViewController(vc, animated: true)
    }

}


