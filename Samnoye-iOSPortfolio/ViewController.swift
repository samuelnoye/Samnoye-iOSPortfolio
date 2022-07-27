//
//  ViewController.swift
//  samnoye.com
//
//  Created by Samuel Noye on 21/02/2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(webView)
        guard let url = URL(string: "https://t.co/tQ7xPhz9G7") else{
            return
        }
        webView.load(URLRequest(url: url))
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.webView.evaluateJavaScript("document.body.innerHTML"){
                result, error in
                guard let html = result as? String, error == nil else{
                    return
                }
                print(html)
            }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Do any additional setup after loading the view.
        webView.frame = view.bounds
        
    }
}

