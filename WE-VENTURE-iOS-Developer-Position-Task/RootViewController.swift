//
//
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//
import Foundation
import UIKit

final class RootViewController {

    class func initialized() -> UIViewController {
        let requestHandler: RequestHandler = RequestFetcher(headers: ["X-Auth-Token": .token])
        let premierLeagueRepository: PremierLeagueRepository = PremierLeagueRepository(fetcher: requestHandler, decoder: Decoder())
        let premierLeagueTeamsViewModel: PremierLeagueTeamsViewModeling = PremierLeagueTeamsViewModel(repository: premierLeagueRepository)
        let premierLeagueTeamsViewController: PremierLeagueTeamsViewController = PremierLeagueTeamsViewController(viewModel: premierLeagueTeamsViewModel)
        let rootViewController: UINavigationController = UINavigationController(rootViewController: premierLeagueTeamsViewController)
        return rootViewController
    }

}
