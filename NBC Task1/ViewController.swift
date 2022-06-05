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
    
//    override func viewDidAppear(_ animated: Bool) {
//        let vc = WartopViewControlleriPad()
//        self.present(vc, animated: true, completion: nil)
//    }

    func loadArticleData(){
        viewModel.fetchDataFromApi { result in
            switch result {
            case .success(true):
                DispatchQueue.main.async {
                    self.tableView.dataSource = self
                    self.tableView.delegate = self
                    self.regitserCellXib()
                    self.tableView.reloadData()
                }
            case .success(false):
                print("Error in fetchDataFromApi")
            case .failure(let error):
                print("Error:\(error)")
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
        let viewData = viewModel.cellForRowAt(indexPath: indexPath)
        if viewData?.kind == "post" {
            guard let imageUrl = URL(string: (viewData?.featuredImage?.large)!) else {return UITableViewCell() }
            if viewData?.attributes?.size == "XL" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardXLCell.cellIdentifier, for: indexPath) as? ArticleCardXLCell else { return UITableViewCell()}
                cell.configureDataForXL(viewData, imageUrl)
                return cell
            } else if viewData?.attributes?.size == "L" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardLCell.cellIdentifier, for: indexPath) as? ArticleCardLCell else { return UITableViewCell()}
                cell.configureDataForL(viewData, imageUrl)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardMCell.cellIdentifier, for: indexPath) as? ArticleCardMCell else { return UITableViewCell()}
                cell.configureDataForM(viewData, imageUrl)
                return cell
            }
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCardSCell.cellIdentifier, for: indexPath) as? ArticleCardSCell else { return UITableViewCell()}
            cell.configureDataForS(viewData)
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
