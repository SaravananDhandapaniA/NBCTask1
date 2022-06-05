//
//  ApiService.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import Foundation
import Alamofire

//class ApiService {
//
//    func getArticleData(completion: @escaping (Result<Context, Error>) -> Void) {
//        let urlString = "https://stage.nbcnewyork.com/apps/mobile/v5/homepage?os=ios"
//
//        guard let url = URL(string: urlString) else {return}
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            guard let data = data else {
//                return
//            }
//            do {
//               let jsonData = try JSONDecoder().decode(Context.self, from: data)
//                completion(.success(jsonData))
//            } catch let error {
//                completion(.failure(error))
//            }
//
//        }.resume()
//
//    }
//}

class APIManager {
     let apiUrl = "https://stage.nbcdfw.com/apps/mobile/v5/homepage?os=ios"
    static let shared = APIManager()
    
    func getDataFromApi(completion: @escaping (Result<Context, Error>) -> Void){
        AF.request(apiUrl).responseString { response in
                guard let data = response.data else{return}
                do{
                let jsonData = try JSONDecoder().decode(Context.self, from: data)
                    completion(.success(jsonData))
                }catch let error {
                    completion(.failure(error))
                    print(error)
                }
        }
    }
}

//}
