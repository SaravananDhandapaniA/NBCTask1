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
    //var apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticleData()
    }

    func loadArticleData(){
        viewModel.fetchDataFromApi {
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
        //return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if viewModel.articleData.data?.items[indexPath.row].kind == "post" {
            if viewModel.articleData.data?.items[indexPath.row].attributes?.size == "XL" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardXLCell.cellIdentifier, for: indexPath) as? ArticleCardXLCell else { return UITableViewCell()}
                return cell
            } else if viewModel.articleData.data?.items[indexPath.row].attributes?.size == "L" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardLCell.cellIdentifier, for: indexPath) as? ArticleCardLCell else { return UITableViewCell()}
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardMCell.cellIdentifier, for: indexPath) as? ArticleCardMCell else { return UITableViewCell()}
                return cell
            }
            
        } else if viewModel.articleData.data?.items[indexPath.row].kind == "video" {
             if viewModel.articleData.data?.items[indexPath.row].attributes?.size == "XL" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardXLCell.cellIdentifier, for: indexPath) as? ArticleCardXLCell else { return UITableViewCell()}
                return cell
             } else if viewModel.articleData.data?.items[indexPath.row].attributes?.size == "L" {
                 guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardLCell.cellIdentifier, for: indexPath) as? ArticleCardLCell else { return UITableViewCell()}
                 return cell
             } else {
                 guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardMCell.cellIdentifier, for: indexPath) as? ArticleCardMCell else { return UITableViewCell()}
                 return cell
             }
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardSCell.cellIdentifier, for: indexPath) as? ArticleCardSCell else { return UITableViewCell()}
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
