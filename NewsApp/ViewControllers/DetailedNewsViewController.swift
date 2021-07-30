//
//  DetailedNewsViewController.swift
//  NewsApp
//
//  Created by Karthika on 7/29/21.
//

import Foundation
import UIKit

class DetailedNewsViewController : UIViewController {
    @IBOutlet weak var news: UITextView!
    var newsData : Results!
    
    override func viewDidLoad() {
        self.news.text = "Title ---\t \(newsData.title)\n\n"
        self.news.text += "Author ---\t \(newsData.byline)\n\n"
        self.news.text += "Published Date ---\t \(newsData.publishedDate)\n"
    }
}
