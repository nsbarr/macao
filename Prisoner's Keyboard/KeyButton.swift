//
//  KeyButton.swift
//  CustomKeyboard
//
//  Created by Nicholas Barr on 6/12/14.
//  Copyright (c) 2014 Nicholas Barr. All rights reserved.
//

import Foundation
import UIKit

class KeyButton: UIButton {
    override init(frame: CGRect)  {
        super.init(frame: frame)
        var buttonLabel = self.titleLabel!
        buttonLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 26.0)
        buttonLabel.textAlignment = .Center
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal | .Highlighted)
        self.setTitleColor(UIColor.blackColor(), forState: .Selected)
        self.setTitleColor(UIColor.blackColor(), forState: .Selected | .Highlighted)
        buttonLabel.sizeToFit()
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.cornerRadius = 3
        
        self.backgroundColor = UIColor.blackColor()
        self.contentVerticalAlignment = .Center
        self.contentHorizontalAlignment = .Center
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}