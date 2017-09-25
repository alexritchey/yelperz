//
//  ViewController.swift
//  Yelperz
//
//  Created by Alex Ritchey on 9/21/17.
//  Copyright © 2017 Alex Ritchey. All rights reserved.
//

import UIKit

class YelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, YelpFiltersViewControllerDelegate {

    var businesses: [Business]!
    
    @IBOutlet weak var tableView: UITableView!
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        searchBar.delegate = self
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Search Bar Configuration
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Business.searchWithTerm(term: searchText, completion: { (businesses: [Business]?, error: Error?) -> Void in
            if (searchText.count > 3) {
                self.businesses = businesses
                self.tableView.reloadData()
            }
        })
    }
    
    // Table View Configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "YelpCell", for: indexPath) as! YelpTableViewCell
        
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses?.count ?? 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let filtersViewController = navigationController.topViewController as! YelpFiltersViewController
        
        filtersViewController.delegate = self
    }
    
    func yelpFiltersViewController(yelpFiltersViewController: YelpFiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        let categories = filters["categories"] as? [String]
        let sortBy = filters["sort"] as? YelpSortMode
        let distance = filters["distance"] as? Int
        let deals = filters["deals"] as? Bool
        
        Business.searchWithTerm(term: "Restaurants", sort: sortBy, categories: categories, deals: deals, distance: distance) { (businesses: [Business]?, error: Error?) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
            }
    }


}

