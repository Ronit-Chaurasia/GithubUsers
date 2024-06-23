//
//  ErrorMessage.swift
//  GithubUsers
//
//  Created by Ronit Chaurasia on 15/01/24.
//

import Foundation

enum ErrorMessage: String, Error{
    case invalidUsername = "This username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request.Please try again."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from server is invalid. Please try again."
}
