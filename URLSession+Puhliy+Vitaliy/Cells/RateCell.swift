//
//  RateCell.swift
//  home_work_12
//
//  Created by Pavel Bondar on 18.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class RateCell: UITableViewCell {
    @IBOutlet private weak var currencyBaseLbl: UILabel!
    @IBOutlet private weak var buyLbl: UILabel!
    @IBOutlet private weak var sellLbl: UILabel!
    
    func setRate(rate: Rate) {
        currencyBaseLbl.text = rate.currency + "/" + rate.baseCurrency
        buyLbl.text = "Купівля: " + String(format: "%.2f", rate.buy)
        sellLbl.text = "Продаж: " + String(format: "%.2f", rate.sell)
    }
}
