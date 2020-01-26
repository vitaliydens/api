//
//  BranchesController.swift
//  home_work_12
//
//  Created by Pavel Bondar on 17.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class BranchesViewController: UIViewController {
    
    @IBOutlet private weak var branchesTableView: UITableView!
    
    private let apiService = APIService()
    private let cities = ["Одесса",
                        "Днепр",
                        "Чернигов",
                        "Харьков",
                        "Киев",
                        "Днепропетровск"]
    private var branches = [Branch]()
    
    override func viewDidLoad() {
        getBranches(searchValue: cities[0])
    }
    
    @IBAction private func searchButton(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
    private func getBranches(searchValue: String) {
        apiService.loadBranches(searchString: searchValue) { [weak self] (branches, error) in
            DispatchQueue.main.async {
                self?.branches = branches ?? []
                self?.branchesTableView.reloadData()
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Chosse city", message: "\n\n\n\n\n\n\n", preferredStyle: .alert)
        let pickerFrame = UIPickerView(frame: CGRect(x: 20, y: 20, width: 250, height: 140))
        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = self
        pickerFrame.delegate = self
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(alert,animated: true, completion: nil )
    }
}

extension BranchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return branches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BranchCell", for: indexPath) as! BrancheCell
        cell.setBranch(branch: branches[indexPath.row])
        return cell
    }
    
}

extension BranchesViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getBranches(searchValue: cities[row])
    }
}
