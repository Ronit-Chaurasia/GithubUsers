//
//  UIViewcontroller + Ext.swift
//  GithubUsers
//
//  Created by Ronit Chaurasia on 12/01/24.
//

import UIKit

extension UIViewController{
    func showAlertOnMainThread(title: String?, message: String?, btnTitle: String?){
        DispatchQueue.main.async {
            let alertVC = GithubAlertVC(title: title, message: message, btnTitle: btnTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
