//
//  ArticleCardXLCell.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import UIKit

class ArticleCardXLCell: UITableViewCell {
    
  
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var summaryView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    
    static var cellIdentifier = "ArticleCardXLCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureDataForXL(_ data:ContextItem? , _ image: URL){
        bgImageView.af_setImage(withURL: image)
        nameLabel.text = data?.eyebrow?.label?.uppercased()
        titleLabel.text = data?.title
        timeStampLabel.text = data?.dateString
        
    }

}
