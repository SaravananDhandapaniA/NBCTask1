//
//  ViewController.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getArticleData()
    }

    func getArticleData() {
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
                print("Json data:\(jsonData)")
            } catch let error {
                print("Error in decode:\(error)")
            }

        }.resume()

    }

}

