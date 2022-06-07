//
//  ViewModel.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import Foundation

class ArticleViewModel {
    var apiManager = APIManager()
    var articleData = Context()

    func fetchDataFromApi(completion: @escaping (Result<Context ,Error>) -> Void){
        apiManager.getDataFromApi{ result in
            switch result {
            case .success(let listOfData):
                self.articleData = listOfData
                completion(.success(self.articleData))
            case .failure(let error):
                print("Error in parsing JsonData:\(error)")
                completion(.failure(error))
            }
        }
    }
    
    func numberOfRowsInSection( section: Int) -> Int {
        return (articleData.data?.items.count)!
    }
    
    func cellForRowAt(indexPath:IndexPath) -> ContextItem? {
        return articleData.data?.items[indexPath.row]
    }
    
}
