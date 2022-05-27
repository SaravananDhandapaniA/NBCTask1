//
//  ApiService.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import Foundation

class ApiService {
    
    func getArticleData(completion: @escaping (Result<Context, Error>) -> Void) {
        let urlString = "https://stage.nbcnewyork.com/apps/mobile/v5/homepage?os=ios"

        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }

            guard let data = data else {
                return
            }
            do {
               let jsonData = try JSONDecoder().decode(Context.self, from: data)
                completion(.success(jsonData))
            } catch let error {
                completion(.failure(error))
            }

        }.resume()

    }
}
