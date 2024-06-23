//
//  User.swift
//  GithubUsers
//
//  Created by Ronit Chaurasia on 12/01/24.
//

import Foundation

struct User: Codable{
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: String
    var publicGists: String
    var following: String
    var followers: String
    var createdAt: String
}
