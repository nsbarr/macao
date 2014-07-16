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
    init(frame: CGRect)  {
        super.init(frame: frame)
        
        self.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 26.0)
        self.titleLabel.textAlignment = .Center
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal | .Highlighted)
        self.setTitleColor(UIColor.blackColor(), forState: .Selected)
        self.setTitleColor(UIColor.blackColor(), forState: .Selected | .Highlighted)
        self.titleLabel.sizeToFit()
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.cornerRadius = 3
        
        self.backgroundColor = UIColor.blackColor()
        self.contentVerticalAlignment = .Center
        self.contentHorizontalAlignment = .Center
    }
}