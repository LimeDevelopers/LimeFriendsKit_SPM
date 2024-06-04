//
//  File.swift
//  
//
//  Created by Limefriends on 6/4/24.
//

import UIKit

protocol ReuseableIdentifier {
    static var identifier: String { get }
}

extension UITableViewCell: ReuseableIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReuseableIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
