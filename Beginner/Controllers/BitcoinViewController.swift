//
//  BitcoinViewController.swift
//  Beginner
//
//  Created by David Oliver Doswell on 12/31/17.
//  Copyright © 2017 David Oliver Doswell. All rights reserved.
//

import UIKit

struct BitcoinData : Decodable {
    let price_usd : String
}

private let navigationTitle = "Bitcoin"
private let appColor = UIColor(red:0.95, green:0.79, blue:0.30, alpha:1.0)

class BitcoinViewController: UIViewController {
    
    // Create an array for our Bitcoin Data struct; coinmarketcap API returns an `array` object
    var bitcoinData = [BitcoinData]()
    
    let currentDateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceUSDLabel : UILabel = {
        let label = UILabel()
        label.textColor = appColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        
        // Customize nav bar items
        self.title = navigationTitle
        
        let left = UIButton(type: .custom)
        left.setImage(UIImage(named: "Home"), for: .normal)
        left.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        left.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        left.layer.cornerRadius = 15
        left.layer.masksToBounds = true
        left.addTarget(self, action: #selector(leftBarButtonTap(sender:)), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: left)
        
        // Current date and formatter
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.string(from: date)
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        
        // Get data when view appears
        let jsonURLString = "https://api.coinmarketcap.com/v1/ticker/bitcoin/"
        
        guard let url = URL(string: jsonURLString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Return data if there are no errors
            guard let data = data else { return }
            
            do {
                // create for loop and set data to objects array
                self.bitcoinData = try JSONDecoder().decode([BitcoinData].self, from: data)
                for datum in self.bitcoinData {
                    DispatchQueue.main.async {
                        self.currentDateLabel.text = "\(dateFormatter.string(from: date))"
                        self.priceUSDLabel.text = "$"+datum.price_usd
                    }
                }
            } catch let error {
                print("ERROR:", error)
            }
            }.resume()
    }
    
    
    // Tap left bar button item and go back to settings
    @objc func leftBarButtonTap(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUpViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(currentDateLabel)
        view.addSubview(priceUSDLabel)
        
        let margin  = view.layoutMarginsGuide
        
        // Current date label constraints
        view.addConstraints([NSLayoutConstraint(item: currentDateLabel, attribute: .centerX, relatedBy: .equal, toItem: margin, attribute: .centerX, multiplier: 1, constant: 0)])
        
        view.addConstraints([NSLayoutConstraint(item: currentDateLabel, attribute: .top, relatedBy: .equal, toItem: margin, attribute: .topMargin, multiplier: 1, constant: 100)])
        
        view.addConstraints([NSLayoutConstraint(item: currentDateLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)])
        
        view.addConstraints([NSLayoutConstraint(item: currentDateLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)])
        
        // Price USD label constraints
        view.addConstraints([NSLayoutConstraint(item: priceUSDLabel, attribute: .centerX, relatedBy: .equal, toItem: margin, attribute: .centerX, multiplier: 1, constant: 0)])
        
        view.addConstraints([NSLayoutConstraint(item: priceUSDLabel, attribute: .bottom, relatedBy: .equal, toItem: currentDateLabel, attribute: .bottom, multiplier: 1, constant: 100)])
        
        view.addConstraints([NSLayoutConstraint(item: priceUSDLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)])
        
        view.addConstraints([NSLayoutConstraint(item: priceUSDLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)])
    }
}
