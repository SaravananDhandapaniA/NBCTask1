//
//  ArticleCardLCell.swift
//  NBC Task1
//
//  Created by Tringapps on 27/05/22.
//

import UIKit

class ArticleCardLCell: UITableViewCell {
    
    @IBOutlet weak var imageBanner: UIImageView!
    
    @IBOutlet weak var lTitleSummary: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    static var cellIdentifier = "ArticleCardLCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureDataForL(_ data:ContextItem? , _ image:URL?){
        imageBanner.af_setImage(withURL: image!)
        nameLabel.text = data?.eyebrow?.label
        titleLabel.text = data?.title
        descriptionLabel.text = data?.subtitle
        timeStampLabel.text = data?.dateString
    }
}
