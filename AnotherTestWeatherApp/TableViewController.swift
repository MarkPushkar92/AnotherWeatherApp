//
//  TableViewController.swift
//  AnotherTestWeatherApp
//
//  Created by Марк Пушкарь on 08.07.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: Properties
    
    private let emtyCity = Weather()
    
    private var citiesArray = [Weather]()
    
    private var nameCitiesArray = ["Владивосток", "Москва", "Санкт-Петербург", "Екататеринбург", "Южно-Сахалинск"]
    
    private let networkService = NetworkService()
    
    private let cellID = "cellID"
    
    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        self.tableView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewCity))
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emtyCity, count: nameCitiesArray.count)
        }
        addCities()
    }
    
    // MARK: Methods
    
    @objc private func addNewCity() {
        let alert = UIAlertController(title: "Введите название города", message: "Добавить город", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите название города"
        }
        let alertActionCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let alertActionOk = UIAlertAction(title: "ОК", style: .default) { [self, weak alert] _ in
            if let city = alert?.textFields![0] {
                nameCitiesArray.append(city.text!)
                citiesArray.append(emtyCity)
                addCities()
            }
        }
        alert.addAction(alertActionOk)
        alert.addAction(alertActionCancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func applyData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("RELOADING!!!!!!!!!!!!!!!!!!")
        }
    }
    
    private func addCities() {
        getCityWeather(citiesArray: nameCitiesArray) { [self] index, weather in
            citiesArray[index] = weather
            citiesArray[index].name = nameCitiesArray[index]
            applyData()
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameCitiesArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        var weather = Weather()
        weather = citiesArray[indexPath.row]
        cell.city = weather.name
        cell.temperature = "\(weather.temp)"
        cell.status = weather.conditionString
        return cell
    }
    
    // MARK: Navigating
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let cityWeather = citiesArray[indexPath.row]
        let vc = ViewController()
        vc.weatherModel = cityWeather
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: Removing Cells
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, completionHandler in
            let editinRow = self.nameCitiesArray[indexPath.row]
            if let index = self.nameCitiesArray.firstIndex(of: editinRow) {
                self.citiesArray.remove(at: index)
                self.nameCitiesArray.remove(at: index)
                
            }
            tableView.reloadData()
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}



