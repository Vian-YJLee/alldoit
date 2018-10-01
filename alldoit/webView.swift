//
//  webView.swift
//  alldoit
//
//  Created by LeeYongJin on 29/09/2018.
//  Copyright © 2018 vian. All rights reserved.
//

import UIKit
import SafariServices

class webView: UIViewController, UIWebViewDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: UIWebView!
    @IBOutlet var myActivityIndicater: UIActivityIndicatorView!
    
    func loadwebPage(_ url: String) {
        
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        
        myWebView.loadRequest(myRequest)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.delegate = self
        loadwebPage("http://www.naver.com")

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicater.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicater.stopAnimating()
    }
    
    func check(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        
        return strUrl
    }
    
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        
        let myUrl = check(txtUrl.text!)
        txtUrl.text = ""
        loadwebPage(myUrl)
        
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadwebPage("http://www.apple.com/kr")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadwebPage("http://www.daum.net")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        
        let htmlString = "<h1> HTML String </h1><p> 팟캐스트 </p> <p><a href=\"http://www.podbbang.com\">팟빵</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
        
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        
        let myHtmlBundle = Bundle.main
        let filepath = myHtmlBundle.path(forResource: "htmlView", ofType: "html")
        loadwebPage(filepath!)
    }
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnGotoSafariThisUrl(_ sender: UIBarButtonItem) {
        
        guard let curruntUrl = URL(string: "http://www.naver.com"), UIApplication.shared.canOpenURL(curruntUrl) else {return}
        UIApplication.shared.open(curruntUrl, options: [:], completionHandler: nil)
        
    }
}
