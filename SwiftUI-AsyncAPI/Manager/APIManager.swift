//
//  APIManager.swift
//  SwiftUI-AsyncAPI
//
//  Created by Kaique Magno Dos Santos on 13/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import Foundation

enum APIManager {
    static func getMemes(completion: @escaping(Result<Response,Error>) -> ()) {
        let urlPath = "https://api.imgflip.com/get_memes"
        guard let url = URL(string: urlPath) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                let _ = response {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let value = try decoder.decode(Response.self, from: data)
                    completion(.success(value))
                } catch {
                    completion(.failure(error))
                }
            }else if let error = error {
                completion(.failure(error))
            }else{
                fatalError("API Could not be described")
            }
        }
        task.resume()
    }
}
