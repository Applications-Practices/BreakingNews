//
//  HomeViewController.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private var viewModel = HomeViewModel()
    
    private var headlines: [HeadlineEntity] = []
    private var lastSearch: String = ""
    
    private let refreshControl = UIRefreshControl()
    
    private let defaultCountry = "gb"
    
    override func viewDidLoad() {
        self.setup()
    }
    
    func setup() {
        self.setDefaultConfiguration()
        self.setDefaultElements()
        self.getCountryHeadlines(countryISO: self.defaultCountry)
    }
    
    func setDefaultConfiguration() {
        self.enableActivityIndicatorView(enable: true)
        self.setTableView()
    }
    
    func setDefaultElements() {
        self.setBackgroundColor()
        self.setSearchBar()
        self.setRefreshControl()
    }
    
    func setBackgroundColor() {
        self.view.backgroundColor = self.viewModel.getBackgroundColor()
    }
    
    func setSearchBar() {
        self.searchBar.delegate = self
        self.enableSearchBar(enable: false)
        self.searchBar.showsCancelButton = true
        
        self.searchBar.backgroundColor = self.viewModel.getSearchBarBackgroundColor()
        self.searchBar.layer.borderWidth = self.viewModel.getSearchBarBoderWidth()
        self.searchBar.layer.borderColor = self.viewModel.getSearchBarBorderColor().cgColor
        self.searchBar.backgroundImage = UIImage()
    }
    
    func setRefreshControl() {
        self.refreshControl.addTarget(self, action: #selector(self.refreshInformation), for: .valueChanged)
        self.tableView.addSubview(self.refreshControl)
    }
    
    @objc func refreshInformation() {
        self.enableSearchBar(enable: false)
        if self.lastSearch != "" {
            self.getSearchHeadlines(search: self.lastSearch)
        }
        else {
            self.getCountryHeadlines(countryISO: self.defaultCountry)
        }
    }
    
    func enableSearchBar(enable: Bool) {
        self.searchBar.isUserInteractionEnabled = enable
        if enable {
            self.searchBar.alpha = self.viewModel.getSearchBarEnableAlpha()
        }
        else {
            self.searchBar.alpha = self.viewModel.getSearchBarDisableAlpha()
        }
    }
    
    func enableActivityIndicatorView(enable: Bool) {
        self.activityIndicatorView.isHidden = !enable
        if enable {
            self.activityIndicatorView.startAnimating()
        }
        else {
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    func setTableView() {
        self.tableView.backgroundColor = self.viewModel.getTableViewBackgroundColor()
        self.tableView.estimatedRowHeight = self.viewModel.getTableViewCellHeight()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorStyle = .none
        
        R.TableViews.registerTable(tableView: self.tableView, nibName: self.viewModel.getTableViewCell(), cellIdentifier: self.viewModel.getTableViewCellIdentifier())
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func reloadTableView() {
        self.enableActivityIndicatorView(enable: false)
        self.refreshControl.endRefreshing()
        self.tableView.setContentOffset(.zero, animated: true)
        self.tableView.reloadData()
    }
    
    func getCountryHeadlines(countryISO: String) {
        HeadlinesProvider().getHeadlines(countryISO: countryISO, completion: { result in
            DispatchQueue.main.async {
                self.enableSearchBar(enable: true)
                guard let result = result else { return }
                self.headlines = result
                self.reloadTableView()
            }
        })
    }
    
    func getSearchHeadlines(search: String) {
        HeadlinesProvider().getSearchHeadlines(search: search, completion: { result in
            DispatchQueue.main.async {
                self.enableSearchBar(enable: true)
                guard let result = result else { return }
                self.headlines = result
                self.reloadTableView()
            }
        })
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.headlines.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.getTableViewCellHeight()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = R.TableViews.getTableViewCell(HomeTableViewCell.self, tableView: self.tableView, cellIdentifier: self.viewModel.getTableViewCellIdentifier())!
            
        cell.selectionStyle = .none
        cell.headline = self.headlines[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let headline = self.headlines[indexPath.row]
        R.URLs.openURL(url: R.URLs.canOpenURL(url: R.URLs.createURL(string: headline.url!)!)!)
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard var text = searchBar.text else { return }
        text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if text != "" {
            if text != self.lastSearch {
                self.enableSearchBar(enable: false)
                self.lastSearch = text
                self.getSearchHeadlines(search: text)
            }
        }
        else {
            self.getCountryHeadlines(countryISO: self.defaultCountry)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.lastSearch = ""
    }
}
