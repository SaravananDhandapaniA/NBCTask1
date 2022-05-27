//
//  ViewModel.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import Foundation

class ArticleViewModel {
    var apiService = ApiService()
    var articleData = Context()
    func fetchArticleData(completion: @escaping () -> Void) {
        apiService.getArticleData { result in
            switch result {
            case .success(let listOfData):
                self.articleData = listOfData
                completion()
            case .failure(let error):
                print("Error in parsing JsonData:\(error)")
            }
        }
    }
}
