//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Karthika on 7/29/21.
//

import UIKit
import Foundation

class NewsListViewController:UITableViewController
{
    let api = NewsAPI()
    var selectedNews:Results!
    var newsList : [Results] = [Results]()
    let spinner = SpinnerController()
    var newsDataSource:NewsListDataSource!
    
    override func viewDidLoad() {
        getNews()
        self.title = "NY Times Most Popular"
        addChild(spinner)
        spinner.view.frame = self.view.frame
        self.view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
        let nib = UINib(nibName: "NewsCellTableView", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellId)
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = newsDataSource
        self.tableView.isUserInteractionEnabled = true
    }
    func getNews() {
        api.call(endpoint: ListEndpoint.GetNews()) { [self] result in
            switch result {
            case let .success(NewsList):
                    newsList = NewsList.results
                    DispatchQueue.main.async {
                        spinner.willMove(toParent: nil)
                        spinner.view.removeFromSuperview()
                        spinner.removeFromParent()
                        newsDataSource = NewsListDataSource.init(results: newsList)
                        self.tableView.dataSource = newsDataSource
                        self.tableView.reloadData()
                    }
                
            case .failure:
                DispatchQueue.main.async {
                    spinner.willMove(toParent: nil)
                    spinner.view.removeFromSuperview()
                    spinner.removeFromParent()
                    let alertC = AlertController()
                    alertC.showAlert(view: self, msg: "Error loading Data. Check your connection")
                }
            }
        }
    }
}


extension NewsListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedNews = newsList[indexPath.row]
        self.performSegue(withIdentifier: "newsSelected", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DetailedNewsViewController {
            controller.newsData = self.selectedNews
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150.0
   }
}
