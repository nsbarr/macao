
//  KeyboardViewController.swift
//  CustomKeyboardTarget
//
//  Created by Nicholas Barr on 6/5/14.
//  Copyright (c) 2014 Nicholas Barr. All rights reserved.
//

import UIKit
import QuartzCore

class KeyboardViewController: UIInputViewController {
    let rows = [["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
        ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
        ["z", "x", "c", "v", "b", "n", "m"]]
    
    
    let topPadding: CGFloat = 12
    let bottomPadding: CGFloat = 8
    let keyHeight: CGFloat = 40
    let keyWidth: CGFloat = 30
    let keySpacing: CGFloat = 2
    let rowSpacing: CGFloat = 15
    let editKeyWidth: CGFloat = 45
    let editKeyHeight: CGFloat = 35
    let specialKeyBackGroundColorLight: UIColor = UIColor(red: 200, green: 200, blue: 240, alpha: 1)
    let specialKeyBackGroundColorMedium = UIColor(red: 160, green: 160, blue: 220, alpha: 1)
    let specialKeyBackGroundColorDark = UIColor(red: 40, green: 40, blue: 80, alpha: 1)


    
    var editKey: UIButton?
    var spaceKey: UIButton?
    var nextKeyboardKey: UIButton?
    var backspaceKey: UIButton?
    var returnKey: UIButton?
    
    
    
    
    var buttons: Array<UIButton> = []
    
    
    
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var width = self.view.frame.size.width
        
        
        editKey = KeyButton(frame: CGRect(x: 2.0, y: CGFloat(topPadding + (keyHeight + rowSpacing) * 3), width:editKeyWidth, height:editKeyHeight))
        editKey!.addTarget(self, action: Selector("editKeyPressed:"), forControlEvents: .TouchUpInside)
        editKey!.selected = false
        editKey!.setTitle("🔒", forState: .Normal)
        editKey!.setTitle("🔓 Tap letters to lock & unlock them", forState: .Selected)
        editKey!.titleLabel.font = UIFont(name: "Avenir", size: 20.0)
        editKey!.backgroundColor = specialKeyBackGroundColorLight
        self.view.addSubview(editKey)
        //[myButton setBackgroundImage:[self imageWithColor:[UIColor greenColor]] forState:UIControlStateHighlighted];

        
        
        nextKeyboardKey = KeyButton(frame: CGRect(x: CGFloat(2.0 + (editKeyWidth + keySpacing)), y: CGFloat(topPadding + (keyHeight + rowSpacing) * 3), width:editKeyWidth, height:editKeyHeight))
        nextKeyboardKey!.addTarget(self, action: Selector("advanceToNextInputMode"), forControlEvents: .TouchUpInside)
        nextKeyboardKey!.selected = false
        //nextKeyboardKey!.setImage(UIImage(named:"nextKeyboard.png"), forState: .Normal)
        nextKeyboardKey!.setTitle("🌐", forState: .Normal)
        nextKeyboardKey!.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        nextKeyboardKey!.titleLabel.font = UIFont(name: "AppleColorEmoji", size: 20)
        nextKeyboardKey!.backgroundColor = specialKeyBackGroundColorMedium
        self.view.addSubview(nextKeyboardKey)
        
        
        spaceKey = KeyButton(frame: CGRect(x: CGFloat(10.0 + ((editKeyWidth + keySpacing) * 2)), y: CGFloat(topPadding + (keyHeight + rowSpacing) * 3), width:editKeyWidth * 2.5, height:editKeyHeight))
        spaceKey!.addTarget(self, action: Selector("spaceKeyPressed:"), forControlEvents: .TouchUpInside)
        spaceKey!.selected = false
        spaceKey!.setTitle("", forState: .Normal)
        spaceKey!.backgroundColor = specialKeyBackGroundColorDark
        
        self.view.addSubview(spaceKey)
        
        
        
        backspaceKey = KeyButton(frame: CGRect(x: CGFloat(width - (editKeyWidth + keySpacing) * 2), y: CGFloat(topPadding + (keyHeight + rowSpacing) * 3), width:editKeyWidth, height:editKeyHeight))
        backspaceKey!.addTarget(self, action: Selector("backspaceKeyPressed:"), forControlEvents: .TouchUpInside)
        backspaceKey!.selected = false
        backspaceKey!.setImage(UIImage(named:"backspace.png"), forState: .Normal)
        backspaceKey!.backgroundColor = specialKeyBackGroundColorMedium
        backspaceKey!.setTitleColor(UIColor.blackColor(), forState: .Normal)
        backspaceKey!.titleLabel.font = UIFont(name: "Apple Symbols", size: 20.0)
        self.view.addSubview(backspaceKey)
        
        returnKey = KeyButton(frame: CGRect(x: CGFloat(width - (editKeyWidth + keySpacing)), y: CGFloat(topPadding + (keyHeight + rowSpacing) * 3), width:editKeyWidth, height:editKeyHeight))
        returnKey!.addTarget(self, action: Selector("returnKeyPressed:"), forControlEvents: .TouchUpInside)
        returnKey!.selected = false
        returnKey!.setTitle("⏎", forState: .Normal)
        returnKey!.setTitleColor(UIColor.blackColor(), forState: .Normal)
        returnKey!.backgroundColor = specialKeyBackGroundColorLight
        //returnKey!.setImage(UIImage(named:"return.png"), forState: .Normal)
        returnKey!.titleLabel.font = UIFont(name: "Avenir", size: 20.0)
        self.view.addSubview(returnKey)
        
        
        
        
        self.view.backgroundColor = UIColor.blackColor()
        
        //        let border = UIView(frame: CGRect(x:CGFloat(0.0), y:CGFloat(0.0), width:self.view.frame.size.width, height:CGFloat(0.5)))
        //        border.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        //        border.backgroundColor = UIColor(red: 210.0/255, green: 205.0/255, blue: 193.0/255, alpha: 1)
        //        self.view.addSubview(border)
        
        var y: CGFloat = topPadding
        
        for row in rows {
            var width = self.view.frame.size.width
            var x: CGFloat = (width - (CGFloat(row.count) - 1.0) * (keySpacing + keyWidth) - keyWidth) / 2.0
            
            for label in row {
                let button = KeyButton(frame: CGRect(x: x, y: y, width: keyWidth, height: keyHeight))
                button.setTitle(label.uppercaseString, forState: .Normal)
                button.setTitle(label.uppercaseString, forState: .Highlighted)
                button.addTarget(self, action: Selector("keyPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
                button.autoresizingMask = .FlexibleWidth | .FlexibleLeftMargin | .FlexibleRightMargin
                button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 0)
                
                self.view.addSubview(button)
                buttons.append(button)
                x += keyWidth + keySpacing
            }
            y += keyHeight + rowSpacing
        }
        
    }
    
    func keyPressed(sender: UIButton) {
        if (!editKey!.selected) {
            if (!sender.selected) {
                sender.frame.origin.y = sender.frame.origin.y-40
                sender.transform = CGAffineTransformMakeScale(3,3);
                sender.alpha = 0.2
                self.view.bringSubviewToFront(sender)
                UIView.beginAnimations("button", context: nil)
                UIView.setAnimationDuration(0.4)
                sender.alpha = 1
                sender.frame.origin.y = sender.frame.origin.y+40
                sender.transform = CGAffineTransformMakeScale(1,1)
                UIView.commitAnimations()
                
                var proxy = self.textDocumentProxy as UITextDocumentProxy
                proxy.insertText(sender.titleLabel.text.lowercaseString)
            }
        }
        else {
            sender.selected = !sender.selected
        }
        
    }
    
    func editKeyPressed(sender: UIButton) {
        editKey!.selected = !editKey!.selected
        if (editKey!.selected) {
            self.view.bringSubviewToFront(editKey)
            editKey!.titleLabel.font = UIFont(name: "Avenir", size: 14.0)
            editKey!.frame.size.width = self.view.frame.size.width - 2
            for button in buttons {
                button.setTitleColor(UIColor.grayColor(), forState: .Selected)
                button.setTitleColor(UIColor.grayColor(), forState: .Selected | .Highlighted)

            }
        }

        else {
            editKey!.frame.size.width = editKeyWidth
            editKey!.titleLabel.font = UIFont(name: "Avenir", size: 20.0)
            for button in buttons {
                button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                button.setTitleColor(UIColor.whiteColor(), forState: .Normal | .Highlighted)
                button.setTitleColor(UIColor.blackColor(), forState: .Selected)
                button.setTitleColor(UIColor.blackColor(), forState: .Selected | .Highlighted)
            }
        }
    }
    
    func spaceKeyPressed(sender: UIButton) {
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(" ")
    }
    
    func backspaceKeyPressed(sender: UIButton) {
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    func returnKeyPressed(sender: UIButton) {
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("\n")
    }
    
}

