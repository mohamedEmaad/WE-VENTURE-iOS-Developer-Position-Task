//
//  PremierLeagueTeamsViewController.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import UIKit

class PremierLeagueTeamsViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!

    private var viewModel: PremierLeagueTeamsViewModeling

    init(viewModel: PremierLeagueTeamsViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.listenViewModelResponse()
    }

    private func listenViewModelResponse() {
        self.viewModel.onDataRecieved = { [weak self] in
            self?.loadingIndicator.stopAnimating()
            self?.collectionView.reloadData()
        }
        self.viewModel.onError = { [weak self] error in
            // todo show error here
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getPremierLeagueTeams()
        self.setupViews()
    }

    private func getPremierLeagueTeams() {
        self.loadingIndicator.startAnimating()
        self.viewModel.getPremierLeagueTeams()
    }

    private func setupViews() {
        self.title = "PremierLeagueTeams:Title".localized
        self.setupCollectionView()
    }

    private func setupCollectionView() {
        self.collectionView.register(PremierLeagueTeamCollectionViewCell.nib, forCellWithReuseIdentifier: PremierLeagueTeamCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

}

extension PremierLeagueTeamsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.teams.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewCell: PremierLeagueTeamCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PremierLeagueTeamCollectionViewCell.identifier, for: indexPath) as? PremierLeagueTeamCollectionViewCell else {
            fatalError()
        }
        let team: Team = self.viewModel.getTeam(at: indexPath.row)
        collectionViewCell.configure(team: team)
        return collectionViewCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let team: Team = self.viewModel.getTeam(at: indexPath.row)
        let requestHandler: RequestHandler = RequestFetcher(headers: ["X-Auth-Token": .token])
        let premierLeagueRepository: PremierLeagueRepository = PremierLeagueRepository(fetcher: requestHandler, decoder: Decoder())
        let leagueTeamInfoViewModel: LeagueTeamInfoViewModeling = LeagueTeamInfoViewModel(team: team, repository: premierLeagueRepository)
        let teamInfoViewController: UIViewController = LeagueTeamInfoViewController(viewModel: leagueTeamInfoViewModel)
        self.navigationController?.pushViewController(teamInfoViewController, animated: true)
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = (self.view.frame.width / 2) - 12
        return CGSize(width: cellWidth, height: 152)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    
}
