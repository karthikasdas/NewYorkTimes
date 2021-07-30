//
//  AlertController.swift
//  NewsApp
//
//  Created by Karthika on 7/30/21.
//

import Foundation
import UIKit

class AlertController:UIViewController {
    public func showAlert(view:UIViewController,msg:String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.view.frame = CGRect(x:view.view.frame.minX+100, y: view.view.frame.midY-300, width: 500, height: 500)
        view.present(alert, animated: false, completion: nil)
    }
}
