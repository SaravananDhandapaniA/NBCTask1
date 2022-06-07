//
//  ArticleCardMCell.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import UIKit

class ArticleCardMCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageM: UIImageView!
    @IBOutlet weak var summaryView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var timeStampLabel: UILabel!

    static var cellIdentifier = "ArticleCardMCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureDataForM(_ data:ContextItem? , _ image:URL)
    {
        imageM.af_setImage(withURL: image)
        nameLabel.text = data?.eyebrow?.label?.uppercased()
        titleLabel.text = data?.title
        timeStampLabel.text = data?.dateString
    }
}
