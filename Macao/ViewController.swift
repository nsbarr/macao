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
        self.navigationController!.navigationBarHidden = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var imageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        let theImage = UIImage(named: "keaton2.png")
        imageView.image = theImage
        imageView.clipsToBounds = true
        self.view.addSubview(imageView)
        
        var darkenView = UIView(frame: UIScreen.mainScreen().bounds)
        darkenView.backgroundColor = UIColor.blackColor()
        darkenView.alpha = 0.5
        self.view.addSubview(darkenView)
        
        
        var aboutButton = MenuButton(frame: CGRect(x:(self.view.frame.width-200)/2,y:self.view.frame.height/2+40,width:200,height:40))
        aboutButton.addTarget(self, action: Selector("aboutButtonPressed:"), forControlEvents: .TouchUpInside)
        aboutButton.setTitle("About", forState: .Normal)
        self.view.addSubview(aboutButton)
        
        
        
        var instructionsButton = MenuButton(frame: CGRect(x:(self.view.frame.width-200)/2,y:self.view.frame.height/2+100,width:200,height:40))
        instructionsButton.addTarget(self, action: Selector("instructionsButtonPressed:"), forControlEvents: .TouchUpInside)
        instructionsButton.setTitle("How to Install", forState: .Normal)
        self.view.addSubview(instructionsButton)
        
        var submitButton = MenuButton(frame: CGRect(x:(self.view.frame.width-200)/2,y:self.view.frame.height/2+160,width:200,height:40))
        submitButton.addTarget(self, action: Selector("submitButtonPressed:"), forControlEvents: .TouchUpInside)
        submitButton.setTitle("Submit Your Work", forState: .Normal)
        self.view.addSubview(submitButton)
        
        
        
    }
    

    
    func instructionsButtonPressed(sender: UIButton) {
        println("instructions tapped")
        let vc = storyboard!.instantiateViewControllerWithIdentifier("vcInstructions") as UINavigationController
        self.presentViewController(vc, animated: true, completion: nil)
  //  self.presentViewController(viewControllerToPresent: InstructionsViewController, animated: false, completion: nil)
    }
    
    func aboutButtonPressed(sender: UIButton) {
        println("about tapped")
        let vc2 = storyboard!.instantiateViewControllerWithIdentifier("vcAbout") as UINavigationController
        self.presentViewController(vc2, animated: true, completion: nil)
        //  self.presentViewController(viewControllerToPresent: InstructionsViewController, animated: false, completion: nil)
    }
    
    func submitButtonPressed(sender: UIButton) {
        println("submit tapped")
        let vc3 = storyboard!.instantiateViewControllerWithIdentifier("vcSubmit") as UINavigationController
        self.presentViewController(vc3, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

