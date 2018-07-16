//
//  HomeViewController.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-12.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    private var bookmarkedCities:[BookmarkedCity] = []
    
    @IBOutlet weak var citiesTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        citiesTableView.register(CityTableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bookmarkedCities = DataManager.shared.bookmaredCities
        citiesTableView.reloadData()
    }
    
    @IBAction func addLocationTapped(_ sender: Any) {
        navigationController?.pushViewController(AddLocationViewController(), animated: true)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarkedCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CityTableViewCell
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
