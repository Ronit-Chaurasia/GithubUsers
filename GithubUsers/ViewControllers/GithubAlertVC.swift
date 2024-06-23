//
//  GithubAlertVC.swift
//  GithubUsers
//
//  Created by Ronit Chaurasia on 11/01/24.
//

import UIKit

class GithubAlertVC: UIViewController {

    var containerView = UIView()
    var titleLabel = GithubTitleLabel(fontSize: 20, alignment: .center)
    var messageLabel = GithubBodyLabel(alignment: .center)
    var dismissBtn = GithubButton(backgroundColor: .systemPink, title: "Okay")
    
    var alertTitle: String?
    var alertMessage: String?
    var btnTitle: String?
    
    init(title: String?, message: String?, btnTitle: String?){
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.alertMessage = message
        self.btnTitle = btnTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureDismissBtn()
        configureMessageLabel()
    }

    private func configureContainerView(){
        view.addSubview(containerView)
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor), containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor), containerView.heightAnchor.constraint(equalToConstant: 220), containerView.widthAnchor.constraint(equalToConstant: 280)])
    }
    
    private func configureTitleLabel(){
        containerView.addSubview(titleLabel)
        titleLabel.text = self.alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20), titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20), titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)])
    }
    
    private func configureDismissBtn(){
        containerView.addSubview(dismissBtn)
        dismissBtn.setTitle(self.btnTitle, for: .normal)
        dismissBtn.addTarget(self, action: #selector(dismissAlertView), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            dismissBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20), dismissBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20), dismissBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20), dismissBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func dismissAlertView(){
        self.dismiss(animated: true)
    }
    
    private func configureMessageLabel(){
        containerView.addSubview(messageLabel)
        messageLabel.text = self.alertMessage
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20), messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20), messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8), messageLabel.bottomAnchor.constraint(equalTo: dismissBtn.topAnchor, constant: -12)])
    }
}
