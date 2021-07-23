//
//  File.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation
import UIKit
import SDWebImageSVGKitPlugin

extension UICollectionViewCell {

    static var nib: UINib {
        return UINib(nibName: Self.identifier, bundle: nil)
    }

    static var identifier : String {
        return String(describing: self)
    }

}

extension UITableViewCell {

    static var nib: UINib {
        return UINib(nibName: Self.identifier, bundle: nil)
    }

    static var identifier : String {
        return String(describing: self)
    }

}

extension UIImageView {

    func loadImage(url: URL) {
        self.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "egypt_flag"))
    }
}
