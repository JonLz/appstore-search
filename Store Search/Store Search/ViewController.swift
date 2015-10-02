//
//  ViewController.swift
//  Store Search
//
//  Created by Jon on 10/1/15.
//  Copyright © 2015 Second Wind, LLC. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0,
            right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        for i in 0...2 {
            searchResults.append(String(format: "Fake Result %d for '%@'", i,searchBar.text!))
        }
        tableView.reloadData()
    }
        
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {
        let cellIdentifier = "SearchResultCell"
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
    if cell == nil {
        cell = UITableViewCell(style: .Default,reuseIdentifier: cellIdentifier)
    }
    cell.textLabel!.text = searchResults[indexPath.row]
    return cell
    }
}