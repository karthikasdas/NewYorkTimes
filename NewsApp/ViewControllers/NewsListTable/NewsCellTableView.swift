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
    var nameFld: String = "" {
        didSet {
            self.author.text = nameFld
        }
    }
    var dateFld: String = "" {
        didSet {
            self.date_published.text = dateFld
        }
    }
    var titleText:String = ""{
        didSet{
            self.title.text = titleText
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        profile.layer.cornerRadius = profile.frame.height / 2
        profile.clipsToBounds = true
    }

}
