//
//  NetworkManager.swift
//  TechNews App
//
//  Created by Chris Min on 02/01/2024.
//

import Foundation

class NetworkManager {
    
    var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let decodedData = try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = decodedData.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }
    }
}