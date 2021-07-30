//
//  NewsCellTableView.swift
//  NewsApp
//
//  Created by Karthika on 7/29/21.
//

import UIKit

class NewsCellTableView:UITableViewCell {
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date_published: UILabel!
    var cellData: Results! {
        didSet {
            self.author.text = cellData.byline
            self.date_published.text = cellData.publishedDate
            self.title.text = cellData.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        profile.layer.cornerRadius = profile.frame.height / 2
        profile.clipsToBounds = true
    }

}
