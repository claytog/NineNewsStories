//
//  ArticleDetailsViewController.swift
//  NineNewsStories
//
//  Created by Clayton Gilbert on 22/10/2022.
//

import WebKit
import Foundation


class ArticleDetailsViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    var urlString: String!
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    override func loadView() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let url = URL(string: urlString)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
    }
}
extension ArticleDetailsViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.stopAnimating()
    }
}
