//
//  HomeCell.swift
//  Beginner
//
//  Created by David Oliver Doswell on 12/31/17.
//  Copyright © 2017 David Oliver Doswell. All rights reserved.
//

import UIKit

private let reuseIdentifier = "reuseIdentifier"
private let appColor = UIColor(red:0.95, green:0.79, blue:0.30, alpha:1.0)

class HomeCell : UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

