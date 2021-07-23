//
//  Extensions.swift
//  
//
//  Created by Mohamed Emad on 12/3/20.
//  Copyright © 2020 Mohamed Emad. All rights reserved.
//

import Foundation

extension String {

    @inlinable static var baseUrl: Self {
        "https://api.github.com/"
    }

    var toDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return dateFormatter.date(from: self)
    }

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}

extension Error {

    func getErrorMessage() -> String {
        switch self {
        case let self as MainError:
            return self.getErrorMessage()
        default:
            return self.localizedDescription
        }
    }

}
