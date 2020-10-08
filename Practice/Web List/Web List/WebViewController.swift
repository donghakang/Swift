//
//  WebViewController.swift
//  Web List
//
//  Created by Dongha Kang on 2020/10/09.
//

import UIKit

class WebViewController: UIViewController {

    public static let identifier = "WebViewController"
    
    @IBOutlet weak var webView: UIWebView!
    var data:(name: String, url:String)?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = data?.name
        openWeb()
    }
    

    func openWeb() {
        if let webData = data {
            if let url = URL(string:webData.url) {
                let urlReq = URLRequest(url: url)
                webView.loadRequest(urlReq)
            }
        }
    }
}
