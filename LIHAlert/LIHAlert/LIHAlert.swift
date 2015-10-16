//
//  File.swift
//  LIHAlert
//
//  Created by Lasith Hettiarachchi on 7/7/15.
//  Copyright (c) 2015 Lasith Hettiarachchi. All rights reserved.
//

import Foundation
import UIKit

enum LIHAlertType {
    case Custom, Text, TextWithLoading, TextWithIcon, TextWithButton, TextWithTwoButtons
}

@objc protocol LIHAlertDelegate {
    
    optional func buttonPressed(button: UIButton)
    optional func buttonOnePressed(button: UIButton)
    optional func buttonTwoPressed(button: UIButton)
    
}

class LIHAlert: NSObject {
    
    //delegates
    var delegate: LIHAlertDelegate?
    
    private var overlayView: UIView?
    
    //Title
    var titleLabel: UILabel?
    var titleText: String = "Sample Title" {
        didSet {
            self.titleLabel?.text = self.titleText
        }
    }
    var titleTextColor: UIColor = UIColor.blackColor(){
        didSet {
            self.titleLabel?.textColor = self.titleTextColor
        }
    }
    var titleTextFont: UIFont?{
        didSet {
            self.titleLabel?.font = self.titleTextFont
        }
    }
    var titleTextFontSize: CGFloat? {
        didSet {
            if let fontName = self.titleLabel?.font.fontName, size = self.titleTextFontSize {
                self.titleLabel?.font = UIFont(name: fontName, size: size)
            }
        }
    }
    
    
    //Content Text
    var contentLabel: UILabel?
    var contentText: String = "Sample Content"{
        didSet {
            self.contentLabel?.text = self.contentText
        }
    }
    var contentTextColor: UIColor = UIColor.blackColor(){
        didSet {
            self.contentLabel?.textColor = self.contentTextColor
        }
    }
    var contentTextFont: UIFont?{
        didSet {
            self.contentLabel?.font = self.contentTextFont
        }
    }
    
    //TextWithLoading
    var activityIndicatorStyle: UIActivityIndicatorViewStyle = UIActivityIndicatorViewStyle.White {
        didSet {
            self.activityIndicatorLoading?.activityIndicatorViewStyle = self.activityIndicatorStyle
        }
    }
    private var activityIndicatorLoading: UIActivityIndicatorView?
    
    //Icon
    var iconImageView: UIImageView?
    var icon: UIImage? {
        didSet{
            self.iconImageView?.image = self.icon
        }
    }
    
    //OneButton
    var button_textWithButton: UIButton?
    var buttonText: String = "Dismiss" {
        didSet {
            self.button_textWithButton?.setTitle(self.buttonText, forState: UIControlState.Normal)
        }
    }
    var buttonColor: UIColor = UIColor.blueColor() {
        didSet {
            self.button_textWithButton?.backgroundColor = self.buttonColor
        }
    }
    var buttonTextColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.button_textWithButton?.setTitleColor(self.buttonTextColor, forState: UIControlState.Normal)
        }
    }
    var buttonFont: UIFont? {
        didSet {
            if let font = self.buttonFont {
                self.button_textWithButton?.titleLabel?.font = font
            }
        }
    }
    var buttonBordercolor: UIColor = UIColor.whiteColor() {
        didSet {
            self.button_textWithButton?.layer.borderColor = self.buttonBordercolor.CGColor
        }
    }
    var buttonBorderWidth: CGFloat = 1.0 {
        didSet {
            self.button_textWithButton?.layer.borderWidth = self.buttonBorderWidth
        }
    }
    var buttonCornerRadius: CGFloat = 3.0 {
        didSet {
            self.button_textWithButton?.layer.cornerRadius = self.buttonCornerRadius
        }
    }
    var buttonWidth: CGFloat? {
        didSet {
            if let width = self.buttonWidth {
                self.button_textWithButton?.frame.size.width = width
            }
        }
    }
    
    //TWO BUTTONS
        //ButtonOne
    var buttonOne_textWithButton: UIButton?
    var buttonOneText: String = "Dismiss" {
        didSet {
            self.buttonOne_textWithButton?.setTitle(self.buttonOneText, forState: UIControlState.Normal)
        }
    }
    var buttonOneColor: UIColor = UIColor.blueColor() {
        didSet {
            self.buttonOne_textWithButton?.backgroundColor = self.buttonOneColor
        }
    }
    var buttonOneTextColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.buttonOne_textWithButton?.setTitleColor(self.buttonOneTextColor, forState: UIControlState.Normal)
        }
    }
    var buttonOneFont: UIFont? {
        didSet {
            if let font = self.buttonOneFont {
                self.buttonOne_textWithButton?.titleLabel?.font = font
            }
        }
    }
    var buttonOneBordercolor: UIColor = UIColor.whiteColor() {
        didSet {
            self.buttonOne_textWithButton?.layer.borderColor = self.buttonOneBordercolor.CGColor
        }
    }
    var buttonOneBorderWidth: CGFloat = 1.0 {
        didSet {
            self.buttonOne_textWithButton?.layer.borderWidth = self.buttonOneBorderWidth
        }
    }
    var buttonOneCornerRadius: CGFloat = 3.0 {
        didSet {
            self.buttonOne_textWithButton?.layer.cornerRadius = self.buttonOneCornerRadius
        }
    }
    
        //ButtonTwo
    var buttonTwo_textWithButton: UIButton?
    var buttonTwoText: String = "Dismiss" {
        didSet {
            self.buttonTwo_textWithButton?.setTitle(self.buttonTwoText, forState: UIControlState.Normal)
        }
    }
    var buttonTwoColor: UIColor = UIColor.blueColor() {
        didSet {
            self.buttonTwo_textWithButton?.backgroundColor = self.buttonTwoColor
        }
    }
    var buttonTwoTextColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.buttonTwo_textWithButton?.setTitleColor(self.buttonTwoTextColor, forState: UIControlState.Normal)
        }
    }
    var buttonTwoFont: UIFont? {
        didSet {
            if let font = self.buttonTwoFont {
                self.buttonTwo_textWithButton?.titleLabel?.font = font
            }
        }
    }
    var buttonTwoBordercolor: UIColor = UIColor.whiteColor() {
        didSet {
            self.buttonTwo_textWithButton?.layer.borderColor = self.buttonTwoBordercolor.CGColor
        }
    }
    var buttonTwoBorderWidth: CGFloat = 1.0 {
        didSet {
            self.buttonTwo_textWithButton?.layer.borderWidth = self.buttonTwoBorderWidth
        }
    }
    var buttonTwoCornerRadius: CGFloat = 3.0 {
        didSet {
            self.buttonTwo_textWithButton?.layer.cornerRadius = self.buttonTwoCornerRadius
        }
    }
    
    
    
    //AlertView
    var alertView: UIView? {
        didSet {
            if let alv = self.alertView {
                self.viewMain = alv
            }
        }
    }
    var alertColor: UIColor = UIColor.grayColor() {
        didSet {
            if let mainView = self.viewMain {
                mainView.backgroundColor = self.alertColor
            }
            
        }
    }
    var alertAlpha: CGFloat = 1.0 {
        didSet {
            if let mainView = self.viewMain {
                mainView.alpha = self.alertAlpha
            }
        }
    }
    var alertHeight:CGFloat = 75.0 {
        didSet {
            self.overlayView?.frame.size.height = self.alertHeight
        }
    }
    
    var paddingLeft: CGFloat = 0.0
    var paddingTop: CGFloat = 0.0
    
    var animationDuration: NSTimeInterval = 0.5
    
    var alertType: LIHAlertType = LIHAlertType.Text
    
    
    var autoCloseEnabled: Bool = true
    var autoCloseTimeInterval: Double = 3.0
    
    var hasNavigationBar: Bool = false
    
    private var navBarHeight: CGFloat = 44.0 + 20.0
    private var viewMain: UIView?
    private var imgViewIcon: UIImageView?
    private var lblContentText: UILabel?
    private var lblTitle: UILabel?
    private var buttonHighlightAlpha: CGFloat = 0.5
    
    //validation
    private var scheduledAutoClose: dispatch_cancelable_closure?
    private var topConstraintToOverlayView: NSLayoutConstraint?
    
    
    func initAlert(container: UIView) {
        
        UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("orientationChanged:"), name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        //Create OverlayView and add to Container(self.view)
        self.overlayView = UIView()
        //self.overlayView?.userInteractionEnabled = false
        self.overlayView?.clipsToBounds = true
        self.overlayView?.hidden = true
        //self.overlayView?.backgroundColor = UIColor.blackColor()//ATTENTION
        var overlayHeight = self.alertHeight
        var topMargin: CGFloat = 0.0
        
        if let customView = self.alertView {
            overlayHeight = customView.frame.size.height
        }
        if self.hasNavigationBar {
            topMargin = self.navBarHeight
        }
        if let overlay = self.overlayView {
            container.addSubview(overlay)
            container.bringSubviewToFront(overlay)
            overlay.translatesAutoresizingMaskIntoConstraints = false
            let heightToContainer = NSLayoutConstraint(item: overlay, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: overlayHeight)
            let topToContainer = NSLayoutConstraint(item: overlay, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: container, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: topMargin)
            self.topConstraintToOverlayView = topToContainer
            let leftToContainer = NSLayoutConstraint(item: overlay, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: container, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0.0)
            let rightToContainer = NSLayoutConstraint(item: overlay, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: container, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0.0)
            
            container.addConstraints([heightToContainer,topToContainer,leftToContainer,rightToContainer])
        }
        
        
        if self.alertType == LIHAlertType.Custom {
            self.configTypeCustom()
            
            
        } else if self.alertType == LIHAlertType.Text {
            self.mainViewConfig()
            self.configTypeText()
            
        } else if self.alertType == LIHAlertType.TextWithLoading {
            self.mainViewConfig()
            self.configTypeTextWithLoading()
        } else if self.alertType == LIHAlertType.TextWithIcon {
            self.mainViewConfig()
            self.configTypeTextWithIcon()
        } else if self.alertType == LIHAlertType.TextWithButton {
            self.mainViewConfig()
            self.configTypeTextWithButton()
        } else if self.alertType == LIHAlertType.TextWithTwoButtons {
            self.mainViewConfig()
            self.configTypeTextWithTwoButtons()
        }
        
        if let mainview = self.viewMain {
            if let overlay = self.overlayView {
                overlay.addSubview(mainview)
            }
        }
    }
    
    private func mainViewConfig() {
        
        self.viewMain = UIView()
        
        if let mainView = self.viewMain {
            
            self.overlayView?.addSubview(mainView)
            
            let heightCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: self.alertHeight)
            let bottomCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.overlayView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0.0)
            let leftCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.overlayView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0.0)
            let rightCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.overlayView, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0.0)
            
            self.overlayView?.addConstraints([heightCon, bottomCon, leftCon, rightCon])
            
            mainView.translatesAutoresizingMaskIntoConstraints = false
            mainView.backgroundColor = self.alertColor
            mainView.alpha = self.alertAlpha
            mainView.clipsToBounds = true
            
        }
    }
    
    private func configTypeCustom() {
        
        if let alertV = self.alertView {
            
            alertV.frame.origin.y = alertV.frame.size.height * -1
            self.viewMain = alertV
            
        } else {
            let width = UIScreen.mainScreen().bounds.width
            self.viewMain = UIView(frame: CGRectMake(0.0, -50.0, width, 50.0))
            if let mainView = self.viewMain {
                mainView.translatesAutoresizingMaskIntoConstraints = false
                mainView.backgroundColor = self.alertColor
                mainView.alpha = self.alertAlpha
                mainView.clipsToBounds = true
                
            }
        }
    }
    
    private func configTypeText() {
        
        if let _ = self.viewMain {
            
            self.contentLabel = UILabel()
            self.contentLabel?.text = self.contentText
            self.contentLabel?.textColor = self.contentTextColor
            self.contentLabel?.font = self.contentTextFont
            
            if let label = self.contentLabel {
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addSubview(label)
                
                let centerX = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: self.paddingLeft)
                let centerY = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: self.paddingTop)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addConstraints([centerY,centerX])
            }
        }
            
    }
    
    private func configTypeTextWithLoading() {
        
        if let _ = self.viewMain {
            
            self.configTypeText()
            
            self.activityIndicatorLoading = UIActivityIndicatorView(activityIndicatorStyle: self.activityIndicatorStyle)
            if let loading = self.activityIndicatorLoading {
                self.viewMain?.addSubview(loading)
                loading.translatesAutoresizingMaskIntoConstraints = false
                
                let rightCon = NSLayoutConstraint(item: loading, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.contentLabel, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: -10.0)
                let centerYAct = NSLayoutConstraint(item: loading, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.contentLabel, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
                
                self.viewMain?.addConstraints([rightCon, centerYAct])
            }
            
            
        }
    }
    
    private func configTypeTextWithIcon() {
        
        let iconContainer = UIView()
        self.viewMain?.addSubview(iconContainer)
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        self.iconImageView = UIImageView()
        iconImageView?.image = self.icon
        
        if let imgView = self.iconImageView {
            //Imageview
            iconContainer.addSubview(imgView)
            
            let imgLeftCon = NSLayoutConstraint(item: imgView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: iconContainer, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
            let imgTopCon = NSLayoutConstraint(item: imgView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconContainer, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
            let imgBottomCon = NSLayoutConstraint(item: imgView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: iconContainer, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
            
            imgView.translatesAutoresizingMaskIntoConstraints = false
            iconContainer.addConstraints([imgLeftCon,imgTopCon,imgBottomCon])
            
            
            //content
            self.contentLabel = UILabel()
            self.contentLabel?.text = self.contentText
            self.contentLabel?.textColor = self.contentTextColor
            self.contentLabel?.font = self.contentTextFont
            
            if let label = self.contentLabel {
                label.translatesAutoresizingMaskIntoConstraints = false
                iconContainer.addSubview(label)
                
                let centerY = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: iconContainer, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: self.paddingTop)
                let imgTextLeftCon = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: imgView, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 20)
                let imgTextRightCon = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: iconContainer, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                iconContainer.addConstraints([centerY,imgTextLeftCon, imgTextRightCon])
            }

        }
        
        let centerIconContainerX = NSLayoutConstraint(item: iconContainer, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: self.paddingLeft)
        let centerIconContainerY = NSLayoutConstraint(item: iconContainer, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: self.paddingTop)
        
        self.viewMain?.addConstraints([centerIconContainerX,centerIconContainerY])
    }
    
    private func configTypeTextWithButton() {
        
        self.contentLabel = UILabel()
        self.contentLabel?.text = self.contentText
        self.contentLabel?.textColor = self.contentTextColor
        self.contentLabel?.font = self.contentTextFont
        self.contentLabel?.textAlignment = NSTextAlignment.Center
        self.contentLabel?.numberOfLines = 20
        
        if let label = self.contentLabel {
            label.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addSubview(label)
            
            let leftCon = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 20.0)
            let rightCon = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: -20.0)
            let topCon = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 20.0 + self.paddingTop)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addConstraints([topCon, leftCon, rightCon])
        }
        
        self.button_textWithButton = UIButton()
        self.button_textWithButton?.setTitle(self.buttonText, forState: UIControlState.Normal)
        self.button_textWithButton?.backgroundColor = self.buttonColor
        self.button_textWithButton?.setTitleColor(self.buttonTextColor, forState: UIControlState.Normal)
        self.button_textWithButton?.layer.borderColor = self.buttonBordercolor.CGColor
        self.button_textWithButton?.layer.borderWidth = self.buttonBorderWidth
        self.button_textWithButton?.layer.cornerRadius = self.buttonCornerRadius
        if let width = self.buttonWidth {
            self.button_textWithButton?.frame.size.width = width
        }
    
        if let font = self.buttonFont {
            self.button_textWithButton?.titleLabel?.font = font
        }
        self.button_textWithButton?.tag = 10
        self.button_textWithButton?.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.button_textWithButton?.addTarget(self, action: "buttonTouchDown:", forControlEvents: UIControlEvents.TouchDown)
        if let button = self.button_textWithButton {
            
            button.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addSubview(button)
            
            let bottomCon = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -10.0)
            let leftCon = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 20.0)
            let rightCon = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: -20.0)
            
            self.viewMain?.addConstraints([bottomCon,leftCon,rightCon])
        }
    }
    
    private func configTypeTextWithTwoButtons() {
        
        self.contentLabel = UILabel()
        self.contentLabel?.text = self.contentText
        self.contentLabel?.textColor = self.contentTextColor
        self.contentLabel?.font = self.contentTextFont
        self.contentLabel?.textAlignment = NSTextAlignment.Center
        self.contentLabel?.numberOfLines = 20
        
        if let label = self.contentLabel {
            label.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addSubview(label)
            
            let leftCon = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 20.0)
            let rightCon = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: -20.0)
            let topCon = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 20.0 + self.paddingTop)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addConstraints([topCon, leftCon, rightCon])
        }
        
        //Button one
        self.buttonOne_textWithButton = UIButton()
        self.buttonOne_textWithButton?.setTitle(self.buttonOneText, forState: UIControlState.Normal)
        self.buttonOne_textWithButton?.backgroundColor = self.buttonOneColor
        self.buttonOne_textWithButton?.setTitleColor(self.buttonOneTextColor, forState: UIControlState.Normal)
        self.buttonOne_textWithButton?.layer.borderColor = self.buttonOneBordercolor.CGColor
        self.buttonOne_textWithButton?.layer.borderWidth = self.buttonOneBorderWidth
        self.buttonOne_textWithButton?.layer.cornerRadius = self.buttonOneCornerRadius
        if let font = self.buttonOneFont {
            self.buttonOne_textWithButton?.titleLabel?.font = font
        }
        self.buttonOne_textWithButton?.tag = 20
        self.buttonOne_textWithButton?.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.buttonOne_textWithButton?.addTarget(self, action: "buttonTouchDown:", forControlEvents: UIControlEvents.TouchDown)
        
        //Button two
        self.buttonTwo_textWithButton = UIButton()
        self.buttonTwo_textWithButton?.setTitle(self.buttonTwoText, forState: UIControlState.Normal)
        self.buttonTwo_textWithButton?.backgroundColor = self.buttonTwoColor
        self.buttonTwo_textWithButton?.setTitleColor(self.buttonTwoTextColor, forState: UIControlState.Normal)
        self.buttonTwo_textWithButton?.layer.borderColor = self.buttonTwoBordercolor.CGColor
        self.buttonTwo_textWithButton?.layer.borderWidth = self.buttonTwoBorderWidth
        self.buttonTwo_textWithButton?.layer.cornerRadius = self.buttonTwoCornerRadius
        if let font = self.buttonTwoFont {
            self.buttonTwo_textWithButton?.titleLabel?.font = font
        }
        self.buttonTwo_textWithButton?.tag = 30
        self.buttonTwo_textWithButton?.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.buttonTwo_textWithButton?.addTarget(self, action: "buttonTouchDown:", forControlEvents: UIControlEvents.TouchDown)
        
        if let buttonOne = self.buttonOne_textWithButton, buttonTwo = self.buttonTwo_textWithButton {
            
            buttonOne.translatesAutoresizingMaskIntoConstraints = false
            buttonTwo.translatesAutoresizingMaskIntoConstraints = false
            
            self.viewMain?.addSubview(buttonOne)
            self.viewMain?.addSubview(buttonTwo)
            
            let bottomConOne = NSLayoutConstraint(item: buttonOne, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -10.0)
            let leftConOne = NSLayoutConstraint(item: buttonOne, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 20.0)
            let rightConTwo = NSLayoutConstraint(item: buttonTwo, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: -20.0)
            let rightConOne = NSLayoutConstraint(item: buttonOne, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: buttonTwo, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: -20.0)
            let bottomConTwo = NSLayoutConstraint(item: buttonTwo, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.viewMain, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10.0)
            let sameWidth = NSLayoutConstraint(item: buttonOne, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: buttonTwo, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0)
            
            self.viewMain?.addConstraints([bottomConOne,leftConOne,rightConOne, rightConTwo,bottomConTwo,sameWidth])
        }
    }
    
    private func showAlert(completionHandler:()->()){
        if let mainView = self.viewMain {
            
            mainView.hidden = false
            self.activityIndicatorLoading?.startAnimating()
            self.overlayView?.hidden = false
            UIView.animateWithDuration(self.animationDuration, animations: { () -> Void in
                
                if self.hasNavigationBar {
                    mainView.frame.origin.y = 0
                } else {
                    mainView.frame.origin.y = 0
                }
                
            }, completion: { (finished) -> Void in
                completionHandler()
            })
        }
    }
    
    func hideAlert(completionHandler:(()->())?){
        
        UIView.animateWithDuration(self.animationDuration, animations: { () -> Void in
            
            if let mainView = self.viewMain {
                
                if self.hasNavigationBar {
                    
                    mainView.frame.origin.y =  -1 * (mainView.frame.size.height + self.navBarHeight)
                    
                } else {
                    
                    mainView.frame.origin.y =  -1 * mainView.frame.size.height
                }
            }
            
        }) { (finished) -> Void in
            
            self.activityIndicatorLoading?.stopAnimating()
            self.viewMain?.hidden = true
            self.overlayView?.hidden = true
            completionHandler?()
        }
        
    }
    
    func show(showed:(()->())?, hidden:(()->())?) {
        
        cancel_delay(self.scheduledAutoClose)
        
        self.viewMain?.hidden = false
        
        self.showAlert(){
            () -> () in
            showed?()
        }
        
        if self.autoCloseEnabled {
            
            let delay = self.autoCloseTimeInterval
            self.scheduledAutoClose = delayFunc(NSTimeInterval(delay), closure: { () -> () in
                
                self.hideAlert() {
                    () -> Void in
                    hidden?()
                }
            })
        }
    }
    
    
    //dispatch
    typealias dispatch_cancelable_closure = (cancel : Bool) -> ()
    
    func delayFunc(time:NSTimeInterval, closure:()->()) ->  dispatch_cancelable_closure? {
        
        func dispatch_later(clsr:()->()) {
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW,
                    Int64(time * Double(NSEC_PER_SEC))
                ),
                dispatch_get_main_queue(), clsr)
        }
        
        var closure:dispatch_block_t? = closure
        var cancelableClosure:dispatch_cancelable_closure?
        
        let delayedClosure:dispatch_cancelable_closure = { cancel in
            if let clsr = closure {
                if (cancel == false) {
                    dispatch_async(dispatch_get_main_queue(), clsr);
                }
            }
            closure = nil
            cancelableClosure = nil
        }
        
        cancelableClosure = delayedClosure
        
        dispatch_later {
            if let delayedClosure = cancelableClosure {
                delayedClosure(cancel: false)
            }
        }
        
        return cancelableClosure;
    }
    
    func cancel_delay(closure:dispatch_cancelable_closure?) {
        if closure != nil {
            closure!(cancel: true)
        }
    }
    
    
    //Orientation
    func orientationChanged(notification: NSNotification) {
        
        if self.hasNavigationBar {
            
            if UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation) {
                
                self.topConstraintToOverlayView?.constant = 30.0
                
            } else if UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation) {
                
                self.topConstraintToOverlayView?.constant = 20.0 + 44.0
            }
        }
    }
    
    
    //MARK - Events
    
    func buttonPressed(sender: UIButton) {
        
        if sender.tag == 10 {
            
            self.delegate?.buttonPressed?(sender)
            self.button_textWithButton?.alpha = 1.0
            
        } else if sender.tag == 20 {
            
            self.delegate?.buttonOnePressed?(sender)
            self.buttonOne_textWithButton?.alpha = 1.0
            
        } else if sender.tag == 30 {
            
            self.delegate?.buttonTwoPressed?(sender)
            self.buttonTwo_textWithButton?.alpha = 1.0
        }
    }
    
    func buttonTouchDown(sender: UIButton) {
        
        if sender.tag == 10 {
            
            self.button_textWithButton?.alpha = buttonHighlightAlpha
            
        } else if sender.tag == 20 {
        
            self.buttonOne_textWithButton?.alpha = buttonHighlightAlpha
            
        } else if sender.tag == 30 {
            
            self.buttonTwo_textWithButton?.alpha = buttonHighlightAlpha
        }
    }
}