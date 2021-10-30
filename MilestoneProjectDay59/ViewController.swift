//
//  ViewController.swift
//  MilestoneProjectDay59
//
//  Created by Igor Polousov on 26.10.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favouite countries"
        
        if let url = Bundle.main.url(forResource: "Countries", withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let countries1 = countries[indexPath.row]
        cell.textLabel?.text = countries1.countryName
        cell.detailTextLabel?.text = countries1.language
        return cell
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonCountries = try? decoder.decode(Countries.self, from: json) {
            countries = jsonCountries.results
            tableView.reloadData()
        } else if countries.isEmpty {
            let ac = UIAlertController(title: "OOps", message: "There's no info received", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Okay", style: .cancel))
            present(ac, animated: true)
            
            let fault = Country(countryName: "Boo)", capitalName: "Boo)", language: "Boo", size: "Boo)", population: "Boo)", currency: "Boo)", drivingSide: "Boo)")
            countries.append(fault)
            tableView.reloadData()
        }
        
    }
    
}

