//
//  File.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import UIKit

class CircleAvatarImageView: UIImageView {

    override func layoutSubviews() {
        self.clipsToBounds = true
        let cornerRaduies: CGFloat = self.frame.size.height / 2
        self.layer.cornerRadius = cornerRaduies
    }

}
