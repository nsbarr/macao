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

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var webview = UIWebView(frame: CGRect(x:0.0, y:0.0, width:self.view.frame.width, height:self.view.frame.height-0.0))
        let url = "https://medium.com/@nsbarr/in-2010-while-excavating-along-the-polish-russian-border-archaeologists-dug-up-a-tiny-scrap-of-456e7e8d4b2d"
        let nsurl = NSURL.URLWithString(url)
        let nsrequest = NSURLRequest(URL: nsurl)
        webview.loadRequest(nsrequest)
        self.view.addSubview(webview)
        
        
    }
    
    @IBOutlet var whut: UIBarButtonItem!
    
    
    @IBAction func whut(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("about-popsegue", sender: self)
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}