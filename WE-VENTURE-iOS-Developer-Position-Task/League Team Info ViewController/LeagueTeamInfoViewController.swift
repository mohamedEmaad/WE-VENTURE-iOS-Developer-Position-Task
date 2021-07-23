//
//  LeagueTeamInfoViewController.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import UIKit

class LeagueTeamInfoViewController: UIViewController {

    @IBOutlet private weak var teamFlagImageView: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var teamLinkButton: UIButton!
    @IBOutlet private weak var squadTableView: UITableView!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!

    private let team: Team
    init(team: Team) {
        self.team = team
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }

    private func setupView() {
        self.teamNameLabel.text = self.team.shortName
        self.teamLinkButton.setTitle(self.team.website, for: .normal)
        guard let url: URL = URL(string: team.crestUrl ?? "") else {
            return
        }
        self.teamFlagImageView.loadImage(url: url)
    }

}
