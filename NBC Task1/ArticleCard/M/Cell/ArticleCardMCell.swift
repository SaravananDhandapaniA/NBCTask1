//
//  ArticleCardMCell.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import UIKit

class ArticleCardMCell: UITableViewCell {

    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var mTitleSummary: UIView!
    @IBOutlet weak var imageM: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    static var cellIdentifier = "ArticleCardMCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
