//
//  ExchangeRateController.swift
//  home_work_12
//
//  Created by Pavel Bondar on 18.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class RatesViewController: UIViewController {
    
    @IBOutlet private weak var rateTableView: UITableView!
    
    private let apiService = APIService()
    private var rates = [Rate]()
    
    @IBAction func btnReloadGatesClicked(_ sender: UIBarButtonItem) {
        self.apiService.loadRate(completionHandler: { [weak self] (rates, error) in
            DispatchQueue.main.async {
                self?.rates = rates ?? []
                self?.rateTableView.reloadData()
            }
        })
    }
}

extension RatesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! RateCell
        cell.setRate(rate: rates[indexPath.row])
        return cell
    }
}
