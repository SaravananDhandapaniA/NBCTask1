//
//  ViewController.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticleData()
    }

    func loadArticleData(){
        viewModel.fetchDataFromApi {
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.regitserCellXib()
                self.tableView.reloadData()
               
            }
        }
    }
    func regitserCellXib(){
        self.tableView.register(UINib.init(nibName: "ArticleCardXLCell", bundle: .main), forCellReuseIdentifier: "ArticleCardXLCell")
        self.tableView.register(UINib.init(nibName: "ArticleCardMCell", bundle: .main), forCellReuseIdentifier: "ArticleCardMCell")
        self.tableView.register(UINib.init(nibName: "ArticleCardLCell", bundle: .main), forCellReuseIdentifier: "ArticleCardLCell")
        self.tableView.register(UINib.init(nibName: "ArticleCardSCell", bundle: .main), forCellReuseIdentifier: "ArticleCardSCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if viewModel.articleData.data?.items[indexPath.row].kind == "post" {
            let imageUrl = URL(string: (viewModel.articleData.data?.items[indexPath.row].featuredImage?.large)!)
            let contextData = viewModel.articleData.data?.items[indexPath.row]
            if viewModel.articleData.data?.items[indexPath.row].attributes?.size == "XL" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardXLCell.cellIdentifier, for: indexPath) as? ArticleCardXLCell else { return UITableViewCell()}
                cell.configureDataForXL(contextData, imageUrl)
                return cell
            } else if viewModel.articleData.data?.items[indexPath.row].attributes?.size == "L" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardLCell.cellIdentifier, for: indexPath) as? ArticleCardLCell else { return UITableViewCell()}
                cell.configureDataForL(contextData, imageUrl)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardMCell.cellIdentifier, for: indexPath) as? ArticleCardMCell else { return UITableViewCell()}
                cell.configureDataForM(contextData, imageUrl)
                return cell
            }
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardSCell.cellIdentifier, for: indexPath) as? ArticleCardSCell else { return UITableViewCell()}
            cell.configureDataForS(viewModel.articleData.data?.items[indexPath.row])
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
