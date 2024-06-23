//
//  ViewController.swift
//  GithubUsers
//
//  Created by Ronit Chaurasia on 07/01/24.
//

import UIKit

class SearchVC: UIViewController {
    
    // Initilizers
    let logoImageView = UIImageView()
    let usernameTextField = GithubTextField()
    let searchUserButton = GithubButton()
    var isUsernameEntered: Bool{
        return !usernameTextField.text!.isEmpty
    }
    
    // Default functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view .backgroundColor = .systemBackground
        self.searchUserButton.btnTitle = "Get Followers"
        self.searchUserButton.btnBackgroundColor = .systemGreen
        usernameTextField.delegate = self
        configureLogoImageView()
        configureTextField()
        configureSearchUserButton()
        setDismissKeyboardTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // Configure ImageView
    func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        setImageViewConstraints()
    }
    
    func setImageViewConstraints(){
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80), logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), logoImageView.heightAnchor.constraint(equalToConstant: 200), logoImageView.widthAnchor.constraint(equalToConstant: 200)])
    }
    
    //Configure Textfield
    func configureTextField(){
        view.addSubview(usernameTextField)
        setTextFieldConstraints()
    }
    
    func setTextFieldConstraints(){
        NSLayoutConstraint.activate([usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50), usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), usernameTextField.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    //Configure search button
    func configureSearchUserButton(){
        view.addSubview(searchUserButton)
        searchUserButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        setSearchUserButtonConstraints()
    }
    
    func setSearchUserButtonConstraints(){
        NSLayoutConstraint.activate([searchUserButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50), searchUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30), searchUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30), searchUserButton.heightAnchor.constraint(equalToConstant: 55)])
    }
}

// MARK: Extra functions
extension SearchVC{
    
    func setDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC(){
        
        guard isUsernameEntered else{
            showAlertOnMainThread(title: "Empty username", message: "Please enter a valid username. We need to know who to look for 😀.", btnTitle: "Okay")
            return
        }
        
        let followersListVC = FollowersListVC()
        followersListVC.title = usernameTextField.text
        followersListVC.username = usernameTextField.text
        navigationController?.pushViewController(followersListVC, animated: true)
    }
}

extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        pushFollowerListVC()
        return true
    }
}
