//
//  MainVC.swift
//  Side Menu
//
//  Created by Kyle Lee on 8/6/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import UIKit
import SwiftSpinner
//import WebKit

class MainVC: UIViewController{
    
  
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
             SwiftSpinner.show("Loading...")
        
        let myURL = URL(string: "https://greentowing-losangeles.com")
        let myRequest = URLRequest(url: myURL!)
        self.webview.loadRequest(myRequest)
        SwiftSpinner.hide()
        
        
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showProfile),
                                               name: NSNotification.Name("ShowProfile"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showSettings),
                                               name: NSNotification.Name("ShowSettings"),
                                               object: nil)
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(showSignIn),
//                                               name: NSNotification.Name("ShowSignIn"),
//                                               object: nil)

        
        //  webv.loadRequest(URLRequest(url: URL(string: "https://greentowing-losangeles.com")!))
//
//        let myURL = NSURL(string: "https://greentowing-losangeles.com/")
//
//        let myRequest = NSURLRequest(url: myURL as! URL)
//        print(myRequest)
//        webv.load(myRequest as URLRequest)
    }
    
//    func webViewDidStartLoad(webView: UIWebView) {
//        print("Strat Loading")
//    }
//    func webViewDidFinishLoad(webView: UIWebView) {
//        print("Finish Loading")
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(error?.localizedDescription)
        let alert = UIAlertController(title: "Error", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
//    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        return true
//    }
    
    @objc func showProfile() {
       // performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    
    @objc func showSettings() {
     //   performSegue(withIdentifier: "callnumber", sender: nil)
        
        if let url = URL(string: "tel://\(+13237989142)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
//    @objc func showSignIn() {
//        performSegue(withIdentifier: "ShowSignIn", sender: nil)
//    }
    
    
    @IBAction func onMoreTapped() {
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    

}
