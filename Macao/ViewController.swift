//
//  ViewController.swift
//  Macao
//
//  Created by nick barr on 7/12/14.
//  Copyright (c) 2014 poemsio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var instructionsButton = UIButton(frame: CGRect(x:100,y:100,width:100,height:100))
        instructionsButton.addTarget(self, action: Selector("instructionsButtonPressed:"), forControlEvents: .TouchUpInside)
        instructionsButton.setTitle("Instructions", forState: .Normal)
        self.view.addSubview(instructionsButton)
        
        
        
    }
    
    func instructionsButtonPressed(sender: UIButton) {
        let vc = InstructionsViewController()
    self.presentViewController(viewControllerToPresent: InstructionsViewController?, animated: <#Bool#>, completion: <#(() -> Void)?#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

