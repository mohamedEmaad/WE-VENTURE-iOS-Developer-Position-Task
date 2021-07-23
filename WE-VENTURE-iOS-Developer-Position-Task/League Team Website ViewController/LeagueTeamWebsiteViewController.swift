//
//  LeagueTeamWebsiteViewController.swift
//  WE-VENTURE-iOS-Developer-Position-Task
//
//  Created by Mohamed Emad on 7/23/21.
//

import UIKit
import WebKit

class LeagueTeamWebsiteViewController: UIViewController, WKUIDelegate {

    private var webView: WKWebView!

    private let url: String

    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: self.url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
