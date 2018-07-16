//
//  HomeViewController.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-12.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var citiesTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        citiesTableView.registerNib(of: CityTableViewCell.self)
        citiesTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        citiesTableView.reloadData()
    }
    
    // MARK: - IBActions
    @IBAction func addLocationTapped(_ sender: Any) {
        navigationController?.pushViewController(AddLocationViewController(), animated: true)
    }
    
    @IBAction func helpTapped(_ sender: Any) {
        navigationController?.pushViewController(HelpViewController(), animated: true)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.bookmaredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier) as! CityTableViewCell
        cell.configure(with: DataManager.shared.bookmaredCities[indexPath.row])
        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityViewController = CityViewController()
        cityViewController.city = DataManager.shared.bookmaredCities[indexPath.row]
        navigationController?.pushViewController(cityViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { [unowned self] action, indexPath in
            self.citiesTableView.beginUpdates()
            DataManager.shared.removeBookmarkedCity(at: indexPath.row)
            self.citiesTableView.deleteRows(at: [indexPath], with: .automatic)
            self.citiesTableView.endUpdates()
        }
        
        return [deleteAction]
    }
}
