
import Foundation

struct Team: Codable {

    let id: Int?
	let name: String?
	let shortName: String?
	let tla: String?
	let crestUrl: String?
	let address: String?
	let phone: String?
	let website: String?
	let email: String?
	let founded: Int?
	let clubColors: String?
	let venue: String?
	let lastUpdated: String?
    let squad: [Squad]?

}
