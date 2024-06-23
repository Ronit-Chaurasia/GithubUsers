//
//  GithubButton.swift
//  GithubUsers
//
//  Created by Ronit Chaurasia on 07/01/24.
//

import UIKit

class GithubButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: Property Variables
        
    var btnBackgroundColor: UIColor?{
        get{
            return self.backgroundColor
        }set(setColor){
            self.backgroundColor = setColor
        }
    }
    
    var btnTitle: String?{
        get{
            return titleLabel?.text
        }set(newTitle){
            setTitle(newTitle, for: .normal)
        }
    }
}
