//
//  TableViewCell.swift
//  AnotherTestWeatherApp
//
//  Created by Марк Пушкарь on 08.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK: Accessable UI Elements
    
    var temperature : String {
        get {
            return degreesLabel.text ?? ""
        }
        
        set(newValue) {
            degreesLabel.text = newValue
        }
    }
    
    var city: String {
        get {
            return cityLabel.text ?? ""
        }
        set(newValue) {
            cityLabel.text = newValue
        }
    }
    
    var status: String {
        get {
            return statusLabel.text ?? ""
        }
        set(newValue) {
            statusLabel.text = newValue
        }
    }
    
   private var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Vladivostok"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
   private var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Status"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private var degreesLabel: UILabel = {
        let label = UILabel()
        label.text = "11"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubviews(cityLabel, statusLabel, degreesLabel)
        
        let constraints = [
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cityLabel.widthAnchor.constraint(equalToConstant: 150),
            
            statusLabel.widthAnchor.constraint(equalToConstant: 60),
            statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: degreesLabel.leadingAnchor ),
            
            degreesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            degreesLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            degreesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            degreesLabel.widthAnchor.constraint(equalToConstant: 40)
            
            ]
        
        NSLayoutConstraint.activate(constraints)
    }

}

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
