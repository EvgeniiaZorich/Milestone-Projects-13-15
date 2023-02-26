//
//  DetailViewController.swift
//  Projects-13-15
//
//  Created by Евгения Зорич on 26.02.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var webView: WKWebView!
    var detailItem: Country?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        
       
        guard let detailItem = detailItem else { return }
        let html = """
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style>
                body {
                    font-size: 150%;
                }
            </style>
        </head>
        <body>
            <div><h1>\(detailItem.country)</h1></div>
            <div><img style="width: 100%;"
            <div><b>Capital:</b> \(detailItem.city ?? "no capital")</div>
            <div><b>Currency name:</b> \(detailItem.currency_name ?? "no currency")</div>
            <div><b>Gogernment:</b> \(detailItem.government ?? "no government")</div>
            <div><b>Population:</b> \(detailItem.population ?? 0)</div>
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    
    
    @objc func share() {

        let vc = UIActivityViewController(activityItems: [detailItem?.country ?? ":)", detailItem?.city ?? ":)"], applicationActivities: nil)
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
   
