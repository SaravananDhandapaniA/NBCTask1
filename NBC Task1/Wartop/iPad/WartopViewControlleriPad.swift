//
//  WartopViewControlleriPad.swift
//  NBC Task1
//
//  Created by Tringapps on 03/06/22.
//

import UIKit
import AlamofireImage

class WartopViewControlleriPad: UIViewController {
    
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var wartopImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var summaryView: UIView!
    @IBOutlet weak var seeFullStoryButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    var viewModel = WartopViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataForWartop()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override public var traitCollection: UITraitCollection {
        return updatedTraitCollection()
    }
 
    private func updatedTraitCollection() -> UITraitCollection {
        if  !Constant.ISLANDSCAPE {
            let current = super.traitCollection
            let compact = UITraitCollection(horizontalSizeClass: .compact)
            let regular = UITraitCollection(verticalSizeClass: .regular)
                   
            if Constant.CURRENTSYSTEMVERSION >= "13.0" {
                    return UITraitCollection(traitsFrom: [current, compact])
                }
                    return UITraitCollection(traitsFrom: [regular, compact])
            }
            return super.traitCollection
    }
    
    func configureDataForWartop(){
        nameLabel.text = viewModel.eyebrow
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        timeStampLabel.text = viewModel.timeStamp
        wartopImageView.af_setImage(withURL: viewModel.imageUrl)
    }
    
    @IBAction func closeWartop(_ sender: Any) {
        self.dismiss(animated: true , completion: nil)
    }
    
   static func warTopViewController() -> WartopViewControlleriPad {
        let storyBoard = UIStoryboard(name: String(describing: "WartopViewControlleriPad"), bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: String(describing: "WartopViewControlleriPad")) as! WartopViewControlleriPad
    }
    
}

