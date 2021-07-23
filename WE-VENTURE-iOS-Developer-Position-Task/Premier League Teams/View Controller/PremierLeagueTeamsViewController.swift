//
//  PremierLeagueTeamsViewController.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import UIKit

class PremierLeagueTeamsViewController: UIViewController {

    private var viewModel: PremierLeagueTeamsViewModeling

    init(viewModel: PremierLeagueTeamsViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.listenViewModelResponse()
    }

    private func listenViewModelResponse() {
        self.viewModel.onDataRecieved = { [weak self] result in
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.getPremierLeagueTeams()
    }

}
