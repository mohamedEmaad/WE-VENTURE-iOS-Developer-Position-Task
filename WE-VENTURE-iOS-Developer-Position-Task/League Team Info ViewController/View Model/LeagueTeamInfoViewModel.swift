//
//  File.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import Foundation

final class LeagueTeamInfoViewModel: LeagueTeamInfoViewModeling {

    var onDataRecieved: (() -> Void)?

    var onError: ((Error) -> Void)?

    var teamImageUrl: String {
        self.team.crestUrl ?? ""
    }
    var teamName: String {
        self.team.shortName ?? ""
    }
    var teamWebsiteLink: String {
        if self.team.website?.contains("https") ?? true {
            return self.team.website ?? ""
        }
        
        return self.team.website?.replacingOccurrences(of: "http", with: "https") ?? ""
    }
    var teamSquadMembers: [Squad]? {
        self.team.squad
    }

    private var team: Team

    private var keagueTeamInfoUrlExtension: String {
        "teams/\(self.team.id ?? 1)"
    }

    private let repository: PremierLeagueRepository

    init(team: Team, repository: PremierLeagueRepository) {
        self.team = team
        self.repository = repository
    }

    func getLeagueTeamInfo() {
        guard let url: URL = URL(string: .baseUrl + keagueTeamInfoUrlExtension) else {
            self.onError?(MainError.responseError(message: "CallApi:InvalidUrl".localized))

            return
        }
        self.repository.getLeagueTeamInfo(url: url) { (result) in
            switch result {
            case .failure(let error):
                self.onError?(error)
            case .success(let team):
                self.team = team
            }
            self.onDataRecieved?()
        }
    }

    func getSquad(at index: Int) -> Squad {
        (self.team.squad?[index])!
    }

}
