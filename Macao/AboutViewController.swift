//
//  AboutViewController.swift
//  Macao
//
//  Created by nick barr on 9/28/14.
//  Copyright (c) 2014 poemsio. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var webview = UIWebView(frame: CGRect(x:0.0, y:0.0, width:self.view.frame.width, height:self.view.frame.height-0.0))
        let url = "http://www.nsbarr.com/"
        let nsurl = NSURL.URLWithString(url)
        let nsrequest = NSURLRequest(URL: nsurl)
        webview.loadRequest(nsrequest)
        self.view.addSubview(webview)
        
        
    }
    
    
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}