//
//  NetworkManager.swift
//  GithubUsers
//
//  Created by Ronit Chaurasia on 12/01/24.
//

import Foundation

class NetworkManager {
    static var shared =  NetworkManager()
    var baseUrl = "https://api.github.com/users/"
    
    private init(){}
    
    func fetchUsersData(for username: String, page: Int, handler: @escaping(Result<[Follower], ErrorMessage>) -> Void){
        
        let endpoint: String = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else{
            handler(.failure(ErrorMessage.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error{
                handler(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                handler(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                handler(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let followers = try decoder.decode([Follower].self, from: data)
                handler(.success(followers))
                
            }catch{
                handler(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
