//
//  GithubTextField.swift
//  GithubUsers
//
//  Created by Ronit Chaurasia on 08/01/24.
//

import UIKit

class GithubTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        // Disable automatic resizing(stop interference to autolayout)
        translatesAutoresizingMaskIntoConstraints = false
        
        // Set UI
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 10
        font = UIFont.preferredFont(forTextStyle: .title2)
        textColor = .label
        tintColor = .label
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .tertiarySystemBackground
        placeholder = "Enter a username"
        
        // Disable autocorrect
        autocorrectionType = .no
    }
}
