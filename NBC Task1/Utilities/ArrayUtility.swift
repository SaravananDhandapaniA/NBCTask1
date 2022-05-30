//
//  ArrayUtility.swift
//  NBC Task1
//
//  Created by Tringapps on 30/05/22.
//

import Foundation

extension Array {
    
    mutating func appendSafely(_ newElement: Element?) {
        guard let element = newElement else {
            return
        }
        self.append(element)
    }
}
