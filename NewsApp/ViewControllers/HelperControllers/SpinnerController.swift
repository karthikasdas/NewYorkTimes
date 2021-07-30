//
//  SpinnerController.swift
//  NewsApp
//
//  Created by Karthika on 7/30/21.
//

import Foundation
import UIKit

class SpinnerController:UIViewController {
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
