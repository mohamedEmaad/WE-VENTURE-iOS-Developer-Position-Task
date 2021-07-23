//
//  SquadTableViewCell.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import UIKit

class SquadTableViewCell: UITableViewCell {

    @IBOutlet private weak var squadNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configur(squadName: String) {
        self.squadNameLabel.text = squadName
    }
    
}
