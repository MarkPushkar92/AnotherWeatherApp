//
//  ViewController.swift
//  AnotherTestWeatherApp
//
//  Created by Марк Пушкарь on 08.07.2022.
//

import UIKit
import SwiftSVG

class ViewController: UIViewController {
    
    
    var weatherModel: Weather?
    
    func refreshLabels() {
        
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weatherModel!.conditionCode).svg")
        let weatherImage = UIView(SVGURL: url!) { image in
            image.resizeToFit(self.image.bounds)
        }

        self.image.addSubviews(weatherImage)

        cityLabel.text = weatherModel?.name
        statusLabel.text = weatherModel?.conditionString
        degreesLabel.text = "\(weatherModel?.temp ?? 0)"
        minDayTempValueLabel.text = "\(weatherModel?.tempMin ?? 0)"
        maxDayTempValueLabel.text = "\(weatherModel?.tempMax ?? 0)"
        windSpeedValueLabel.text = "\(weatherModel?.windSpeed ?? 0)"
        pressureValueLabel.text = "\(weatherModel?.pressureMm ?? 0)"
    }
    
    //MARK: Labels
    
   private var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Vladivostok"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    
    private var image: UIView = {
        let image = UIView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Status"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private var degreesLabel: UILabel = {
        let label = UILabel()
        label.text = "11"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    
    // All labels below go to stackViews
    
    private var pressureLabel: UILabel = {
        let label = UILabel()
        label.text = "Давление"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private var pressureValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1000 мм.рт.ст"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "Скорость ветра"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private var windSpeedValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1000 м/с"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private var minDayTempLabel: UILabel = {
        let label = UILabel()
        label.text = "Мин. дневная температура"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private var minDayTempValueLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private var maxDayTempLabel: UILabel = {
        let label = UILabel()
        label.text = "Макс. дневная температура"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private var maxDayTempValueLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: Stacks
    
    private let statusAndTempStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    private let weatherLabelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()

    private let weatherValueLabelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .trailing
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
        view.addSubviews(weatherLabelsStackView, weatherValueLabelsStackView, statusAndTempStackView, cityLabel, image)
     
        let constraints = [
            cityLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            image.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 30),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            image.heightAnchor.constraint(equalToConstant: view.frame.size.width/2),
       
            statusAndTempStackView.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            statusAndTempStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusAndTempStackView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            statusAndTempStackView.heightAnchor.constraint(equalToConstant: 100),
     
            
            weatherLabelsStackView.topAnchor.constraint(equalTo: statusAndTempStackView.bottomAnchor, constant: 30),
            weatherLabelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            weatherLabelsStackView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2 + 40),

            weatherValueLabelsStackView.topAnchor.constraint(equalTo: weatherLabelsStackView.topAnchor),
            weatherValueLabelsStackView.leadingAnchor.constraint(equalTo: weatherLabelsStackView.trailingAnchor),
            weatherValueLabelsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
          
            
        ]
        NSLayoutConstraint.activate(constraints)
    }

    //MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        setUpViews()
        refreshLabels()
    }
    
    


}

