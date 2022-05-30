//
//  ViewModel.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import Foundation

class ArticleViewModel {
    //var apiService = ApiService()
    var apiManager = APIManager()
    var articleData = Context()
    
    let contentOrder: [ContextCardType] = [.xlCard, .mCard ,.mCard, .lCard , .sCard]
    
    func getCellType(_ indexPath: IndexPath) -> ContextCardType {
        let contentCount = contentOrder.count
        return contentOrder[indexPath.row % contentCount]
    }
    func getCellIdentifier(_ cardType: ContextCardType) -> String {
        switch cardType {
        case .xlCard:
            return ArticleCardXLCell.cellIdentifier
        case .lCard:
            return ArticleCardLCell.cellIdentifier
        case .mCard:
            return ArticleCardMCell.cellIdentifier
        case .sCard:
            return ArticleCardSCell.cellIdentifier
        default: return ArticleCardMCell.cellIdentifier
        }
    }
    
//    func fetchArticleData(completion: @escaping () -> Void) {
//        apiService.getArticleData { result in
//            switch result {
//            case .success(let listOfData):
//                self.articleData = listOfData
//                print("Json data:\(self.articleData)")
//                completion()
//            case .failure(let error):
//                print("Error in parsing JsonData:\(error)")
//            }
//        }
//    }
    func fetchDataFromApi(completion: @escaping () -> Void){
        apiManager.getDataFromApi{ result in
            switch result {
            case .success(let listOfData):
                self.articleData = listOfData
                print("Json data:\(self.articleData)")
                completion()
            case .failure(let error):
                print("Error in parsing JsonData:\(error)")
            }
        }
    }
    
    func numberOfRowsInSection( section: Int) -> Int {
        return (articleData.data?.items.count)!
    }  
    
}
