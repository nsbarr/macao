//
//  InstructionsViewController.swift
//  Macao
//
//  Created by nick barr on 9/26/14.
//  Copyright (c) 2014 poemsio. All rights reserved.
//

import Foundation
import UIKit

class InsructionsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var webview = UIWebView(frame: CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height))
        let url = "http://www.google.com"
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