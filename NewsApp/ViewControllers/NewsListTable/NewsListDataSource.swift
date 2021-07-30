//
//  NewsListDataSource.swift
//  NewsApp
//
//  Created by Karthika on 7/30/21.
//

import Foundation
import UIKit
 
class NewsListDataSource: NSObject, UITableViewDataSource {
    private let results: [Results]
        init(results: [Results]) {
            self.results = results
            super.init()
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! NewsCellTableView
        if(results.count > 0){
            cell.cellData = results[indexPath.row]
        }
        return cell
    }
    
}
