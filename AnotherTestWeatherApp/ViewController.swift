//
//  ViewController.swift
//  AnotherTestWeatherApp
//
//  Created by Марк Пушкарь on 08.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var weatherModel: Weather?
    
    func refreshLabels() {
        cityLabel.text = weatherModel?.name
        statusLabel.text = weatherModel?.conditionString
        degreesLabel.text = "\(weatherModel?.temp ?? 0)"
        minDayTempValueLabel.text = "\(weatherModel?.tempMin ?? 0)"
        maxDayTempValueLabel.text = "\(weatherModel?.tempMax ?? 0)"
        windSpeedValueLabel.text = "\(weatherModel?.windSpeed ?? 0)"
        pressureValueLabel.text = "\(weatherModel?.pressureMm ?? 0)"
    }
    
    //MARK: Labels
    
    var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Vladivostok"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.sizeToFit()
        return image
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Status"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var degreesLabel: UILabel = {
        let label = UILabel()
        label.text = "11"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    // All labels below go to stackViews
    
    var pressureLabel: UILabel = {
        let label = UILabel()
        label.text = "Давление"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var pressureValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1000 мм.рт.ст"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "Скорость ветра"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var windSpeedValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1000 м/с"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var minDayTempLabel: UILabel = {
        let label = UILabel()
        label.text = "Мин. дневная температура"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var minDayTempValueLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var maxDayTempLabel: UILabel = {
        let label = UILabel()
        label.text = "Макс. дневная температура"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var maxDayTempValueLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Stacks
    
    let statusAndTempStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    let weatherLabelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()

    let weatherValueLabelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    //MARK: LayOutSetUp
    
    private func setUpViews() {
        
        [pressureLabel, windSpeedLabel, minDayTempLabel, maxDayTempLabel].forEach {
            weatherLabelsStackView.addArrangedSubview($0)
        }
        
        [pressureValueLabel, windSpeedValueLabel, minDayTempValueLabel, maxDayTempValueLabel].forEach {
            weatherValueLabelsStackView.addArrangedSubview($0)
        }

        statusAndTempStackView.addArrangedSubview(statusLabel)
        statusAndTempStackView.addArrangedSubview(degreesLabel)
        statusAndTempStackView.addArrangedSubview(image)
        view.addSubviews(weatherLabelsStackView, weatherValueLabelsStackView, statusAndTempStackView, cityLabel)
     
        let constraints = [
            cityLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statusAndTempStackView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 30),
            statusAndTempStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusAndTempStackView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            statusAndTempStackView.heightAnchor.constraint(equalToConstant: 100),
     
            
            weatherLabelsStackView.topAnchor.constraint(equalTo: statusAndTempStackView.bottomAnchor, constant: 30),
            weatherLabelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            weatherLabelsStackView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),

            weatherValueLabelsStackView.topAnchor.constraint(equalTo: weatherLabelsStackView.topAnchor),
            weatherValueLabelsStackView.leadingAnchor.constraint(equalTo: weatherLabelsStackView.trailingAnchor),
            weatherValueLabelsStackView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }

    //MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        setUpViews()
    }


}

