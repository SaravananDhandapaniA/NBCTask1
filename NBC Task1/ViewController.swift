//
//  ViewController.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticleData()
    }

    func loadArticleData(){
        viewModel.fetchArticleData {
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
                self.tableView.register(UINib.init(nibName: "ArticleCardXLCell", bundle: .main), forCellReuseIdentifier: "ArticleCardXLCell")
                self.tableView.register(UINib.init(nibName: "ArticleCardMCell", bundle: .main), forCellReuseIdentifier: "ArticleCardMCell")
                self.tableView.register(UINib.init(nibName: "ArticleCardLCell", bundle: .main), forCellReuseIdentifier: "ArticleCardLCell")
                self.tableView.register(UINib.init(nibName: "ArticleCardSCell", bundle: .main), forCellReuseIdentifier: "ArticleCardSCell")
            }
        }
    }
//    func getArticleData() {
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
//                print("Json data:\(jsonData)")
//            } catch let error {
//                print("Error in decode:\(error)")
//            }
//
//        }.resume()
//
//    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCardXLCell", for: indexPath) as! ArticleCardXLCell
            return cell
        }
        else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 7){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCardMCell", for: indexPath) as! ArticleCardMCell
            return cell
        }
        else if(indexPath.row == 4 || indexPath.row == 9) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCardLCell", for: indexPath) as! ArticleCardLCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCardSCell", for: indexPath) as! ArticleCardSCell
            return cell
        }
    }
    
    

}

extension NSLayoutConstraint {

    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
}
