//
//  File.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation
import UIKit

extension UICollectionViewCell {

    static var nib: UINib {
        return UINib(nibName: Self.identifier, bundle: nil)
    }

    static var identifier : String {
        return String(describing: self)
    }

}
