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
    @IBOutlet private weak var squadTableViewHeight: NSLayoutConstraint!

    private var viewModel: LeagueTeamInfoViewModeling
    init(viewModel: LeagueTeamInfoViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.listenViewModelResponse()
    }

    private func listenViewModelResponse() {
        self.viewModel.onDataRecieved = { [weak self] in
            self?.loadingIndicator.stopAnimating()
            self?.squadTableViewHeight.constant = CGFloat((self?.viewModel.team.squad?.count ?? 1) * 60)
            self?.view.layoutIfNeeded()
            self?.squadTableView.reloadData()
        }
        self.viewModel.onError = { [weak self] error in
            print("here is the error \(error.getErrorMessage())")
            // todo show error here
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }

    private func setupView() {
        let team: Team = self.viewModel.team
        self.title = team.shortName
        self.teamNameLabel.text = team.shortName
        self.teamLinkButton.setTitle(team.website, for: .normal)
        guard let url: URL = URL(string: team.crestUrl ?? "") else {
            return
        }
        self.teamFlagImageView.loadImage(url: url)
        self.setupTableView()
    }

    private func setupTableView() {
        self.squadTableView.register(SquadTableViewCell.nib, forCellReuseIdentifier: SquadTableViewCell.identifier)
        self.squadTableView.tableFooterView = UIView()
        self.squadTableView.dataSource = self
    }


    override func viewDidAppear(_ animated: Bool) {
        self.getLeagueTeamInfoDetails()
    }

    private func getLeagueTeamInfoDetails() {
        self.loadingIndicator.startAnimating()
        self.viewModel.getLeagueTeamInfo()
    }

}

extension LeagueTeamInfoViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.team.squad?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let squadTableViewCell: SquadTableViewCell = tableView.dequeueReusableCell(withIdentifier: SquadTableViewCell.identifier) as? SquadTableViewCell else {
            fatalError()
        }
        let squad: Squad = self.viewModel.getSquad(at: indexPath.row)
        squadTableViewCell.configur(squadName: squad.name ?? "")
        return squadTableViewCell
    }

}

