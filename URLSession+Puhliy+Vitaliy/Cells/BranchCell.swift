//
//  BranchesCell.swift
//  home_work_12
//
//  Created by Pavel Bondar on 19.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class BrancheCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    func setBranch(branch: Branch) {
        nameLabel.text = branch.name
        cityLabel.text = "Місто \(branch.city)"
        emailLabel.text = "Email: \(branch.email)"
        addressLabel.text = "Адреса: \(branch.address)"
    }
}
