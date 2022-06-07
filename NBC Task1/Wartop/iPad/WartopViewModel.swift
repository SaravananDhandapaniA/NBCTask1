//
//  WartopViewModel.swift
//  NBC Task1
//
//  Created by Tringapps on 07/06/22.
//

import Foundation
import AlamofireImage

class WartopViewModel {
    
    var eyebrow : String? {
        return ViewController.wartopData.data?.items.first?.eyebrow?.label
    }
    
    var title : String? {
        return ViewController.wartopData.data?.items.first?.title
    }
    
    var description: String? {
        return ViewController.wartopData.data?.items.first?.subtitle
    }
    
    var timeStamp: String? {
        return ViewController.wartopData.data?.items.first?.dateString
    }
    
    let imageUrl = URL(string: (ViewController.wartopData.data?.items.first?.featuredImage?.large)!)
    
}
