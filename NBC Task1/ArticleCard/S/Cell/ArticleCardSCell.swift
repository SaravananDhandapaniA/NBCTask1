//
//  ArticleCardSCell.swift
//  NBC Task1
//
//  Created by Tringapps on 27/05/22.
//

import UIKit

class ArticleCardSCell: UITableViewCell {
    
    
    @IBOutlet weak var kindLabel: UILabel!
    
    static var cellIdentifier = "ArticleCardSCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureDataForS(_ data:ContextItem?){
        kindLabel.text = data?.kind
    }
    
}
