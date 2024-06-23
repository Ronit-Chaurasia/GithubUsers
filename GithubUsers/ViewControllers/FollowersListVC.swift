//
//  FollowersListVC.swift
//  GithubUsers
//
//  Created by Ronit Chaurasia on 10/01/24.
//

import UIKit

class FollowersListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.fetchUsersData(for: username, page: 1) { result in
            switch result{
                
                case .success(let followers):
                    print(followers)
                    
                case .failure(let error):
                    self.showAlertOnMainThread(title: "Something went wrong", message: error.rawValue, btnTitle: "Okay")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
