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
    //var contextItem : ContextItemType?
    
//    let contentOrder: [ContextCardType] = [.xlCard, .mCard , .lCard , .sCard]
   // var contentOrder = [ContextItemType]()
////
//    func getCellType(_ indexPath: IndexPath) -> ContextCardType {
//        let contentCount = contentOrder.count
//        return contentOrder[indexPath.row % contentCount]
//    }
//    func getKindType(_ kindData:ContextItemType ) -> ContextItemType{
//       
//         let data = kindData
//        print("data\(data)")
//        if data == .post(.postXL){
//            return .post(.postXL)
//        }else if data == .post(.postL) {
//            return .post(.postL)
//        }else if data == .post(.postM) {
//            return .post(.postM)
//        }else if data == .post(.postS) {
//            return .post(.postS)
//        }else {
//            return .unknown
//        }
//    }
    
//    func getCellType(_ kindType:ContextItemType,_ indexPath:IndexPath) -> ContextCardType {
//        switch kindType {
//        case .post(.postXL):
//            return .xlCard
//        case .videocarousel:
//            return .sCard
//        case .module:
//            return .sCard
//        case .video:
//            return .sCard
//        case .advertisement:
//            return .sCard
//        case .unknown:
//            return .none
//        case .post(.postL):
//            return .lCard
//        case .post(.postM):
//            return .mCard
//        case .post(.postS):
//            return .sCard
//        }
//    }
//
    
//    func getCellIdentifier(_ cardType: ContextCardType) -> String {
//        switch cardType {
//        case .xlCard:
//            return ArticleCardXLCell.cellIdentifier
//        case .lCard:
//            return ArticleCardLCell.cellIdentifier
//        case .mCard:
//            return ArticleCardMCell.cellIdentifier
//        case .sCard:
//            return ArticleCardSCell.cellIdentifier
//        default: return ArticleCardMCell.cellIdentifier
//        }
//    }
    
//    func getKindData(_ indexPath:IndexPath,_ kindType:ContextItemType) -> ContextCardType {
//
//        if contentType == .post {
//            let cards = getCellType(indexPath)
//            return cards
//        } else {
//            return ContextCardType.sCard
//        }
//    }
//    var contentType:ContextItemType {
//        //print("contextItem:\(contextItem)")
//        guard let contextItem = contextItem else {
//            return .unknown
//        }
//        return getKindType(contextItem)
//    }
//
//     func getKindType(_ item: ContextItem) -> ContextItemType {
//         guard let  kind = item.kind, let itemType = ContextItemType(rawValue: kind, ContextKindState.postXL) else{
//             return .unknown
//         }
//        // print("itemtype:\(itemType)")
//         return itemType
//    }
    
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
