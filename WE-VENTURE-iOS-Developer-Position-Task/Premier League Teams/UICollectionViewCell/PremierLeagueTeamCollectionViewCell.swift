//
//  PremierLeagueTeamCollectionViewCell.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import UIKit

class PremierLeagueTeamCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var cellBackgroundView: UIView!
    @IBOutlet private weak var teamFlagImage: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!

    private let backgroundViewBackgroudShadowOpacity: Float = 0.18
    private let backgroundViewBackgroudShadowRadius: CGFloat = 8
    private let backgroundViewBackgroudShadowOffset = CGSize(width: 0, height: 2)


    override func awakeFromNib() {
        self.cellBackgroundView.clipsToBounds = true
        self.cellBackgroundView.layer.cornerRadius = 10
        self.cellBackgroundView.backgroundColor = .white
        self.cellBackgroundView.layer.shadowOpacity = backgroundViewBackgroudShadowOpacity
        self.cellBackgroundView.layer.shadowOffset = backgroundViewBackgroudShadowOffset
        self.cellBackgroundView.layer.shadowRadius = backgroundViewBackgroudShadowRadius
        self.cellBackgroundView.layer.shadowColor = UIColor.black.cgColor
        self.cellBackgroundView.layer.masksToBounds = false
    }

    func configure(team: Team) {
        self.teamNameLabel.text = team.shortName
    }

}
