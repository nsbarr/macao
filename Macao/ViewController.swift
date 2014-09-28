//
//  ViewController.swift
//  Macao
//
//  Created by nick barr on 7/12/14.
//  Copyright (c) 2014 poemsio. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        println(self)
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.hidesBackButton = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        var aboutButton = UIButton(frame: CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height-80.0))
        aboutButton.addTarget(self, action: Selector("aboutButtonPressed:"), forControlEvents: .TouchUpInside)
        aboutButton.setTitle("About", forState: .Normal)
        aboutButton.titleLabel.font = UIFont(name: "Avenir", size: 20.0)
        aboutButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        self.view.addSubview(aboutButton)
        
        
        
        var instructionsButton = UIButton(frame: CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height))
        instructionsButton.addTarget(self, action: Selector("instructionsButtonPressed:"), forControlEvents: .TouchUpInside)
        instructionsButton.setTitle("Instructions", forState: .Normal)
        instructionsButton.titleLabel.font = UIFont(name: "Avenir", size: 20.0)
        instructionsButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        self.view.addSubview(instructionsButton)
        
        var submitButton = UIButton(frame: CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height+80.0))
        submitButton.addTarget(self, action: Selector("instructionsButtonPressed:"), forControlEvents: .TouchUpInside)
        submitButton.setTitle("Submit Your Work", forState: .Normal)
        submitButton.titleLabel.font = UIFont(name: "Avenir", size: 20.0)
        submitButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        self.view.addSubview(submitButton)
        
        
        
        
    }
    

    
    func instructionsButtonPressed(sender: UIButton) {
        println("instructions tapped")
        let vc = storyboard.instantiateViewControllerWithIdentifier("vcInstructions") as UINavigationController
        self.presentViewController(vc, animated: true, completion: nil)
  //  self.presentViewController(viewControllerToPresent: InstructionsViewController, animated: false, completion: nil)
    }
    
    func aboutButtonPressed(sender: UIButton) {
        println("about tapped")
        let vc2 = storyboard.instantiateViewControllerWithIdentifier("vcAbout") as UINavigationController
        self.presentViewController(vc2, animated: true, completion: nil)
        //  self.presentViewController(viewControllerToPresent: InstructionsViewController, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

