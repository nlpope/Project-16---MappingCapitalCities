//
//  DetailsWebVC.swift
//  Project 16 - MappingCapitalCities
//
//  Created by Noah Pope on 10/10/24.
//

import UIKit
import WebKit

class DetailsWebVC: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var selectedCity: Capital!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view    = webView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
    }
    
    
    func configureWebView() {
        print(selectedCity.siteUrl)
        guard let url = URL(string: selectedCity.siteUrl) else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title   = webView.title
    }
}
