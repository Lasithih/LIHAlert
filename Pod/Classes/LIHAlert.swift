//
//  File.swift
//  LIHAlert
//
//  Created by Lasith Hettiarachchi on 7/7/15.
//  Copyright (c) 2015 Lasith Hettiarachchi. All rights reserved.
//

import Foundation
import UIKit

@objc public enum LIHAlertType: Int {
    case custom, text, textWithLoading, textWithIcon, textWithButton, textWithTwoButtons, textWithTitle
}

@objc public protocol LIHAlertDelegate {
    
    @objc optional func buttonPressed(_ button: UIButton)
    @objc optional func buttonOnePressed(_ button: UIButton)
    @objc optional func buttonTwoPressed(_ button: UIButton)
    
}

@objc open class LIHAlert: NSObject {
    
    //delegates
    @objc open var delegate: LIHAlertDelegate?
    

    
    //Title
    open var titleLabel: UILabel?
    open var titleText: String = "Sample Title" {
        didSet {
            self.titleLabel?.text = self.titleText
        }
    }
    open var titleTextColor: UIColor = UIColor.black {
        didSet {
            self.titleLabel?.textColor = self.titleTextColor
        }
    }
    open var titleTextFont: UIFont?{
        didSet {
            self.titleLabel?.font = self.titleTextFont
        }
    }
    open var titleTextFontSize: CGFloat? {
        didSet {
            if let fontName = self.titleLabel?.font.fontName, let size = self.titleTextFontSize {
                self.titleLabel?.font = UIFont(name: fontName, size: size)
            }
        }
    }
    open var titleTextNumberOfLines: Int = 1 {
        didSet {
            self.titleLabel?.numberOfLines = self.titleTextNumberOfLines
        }
    }
    
    
    //Content Text
    open var contentLabel: UILabel?
    open var contentText: String = "Sample Content"{
        didSet {
            self.contentLabel?.text = self.contentText
        }
    }
    open var contentTextColor: UIColor = UIColor.black{
        didSet {
            self.contentLabel?.textColor = self.contentTextColor
        }
    }
    open var contentTextFont: UIFont?{
        didSet {
            self.contentLabel?.font = self.contentTextFont
        }
    }
    open var contentTextNumberOfLines: Int = 2 {
        didSet {
            self.contentLabel?.numberOfLines = self.contentTextNumberOfLines
        }
    }
    
    //TextWithLoading
    open var activityIndicatorStyle: UIActivityIndicatorView.Style = UIActivityIndicatorView.Style.white {
        didSet {
            self.activityIndicatorLoading?.style = self.activityIndicatorStyle
        }
    }
    
    //Icon
    open var  iconImageView: UIImageView?
    open var  icon: UIImage? {
        didSet{
            self.iconImageView?.image = self.icon
        }
    }
    
    //OneButton
    open var  button_textWithButton: UIButton?
    open var  buttonText: String = "Dismiss" {
        didSet {
            self.button_textWithButton?.setTitle(self.buttonText, for: UIControl.State())
        }
    }
    open var  buttonColor: UIColor = UIColor.blue {
        didSet {
            self.button_textWithButton?.backgroundColor = self.buttonColor
        }
    }
    open var  buttonTextColor: UIColor = UIColor.white {
        didSet {
            self.button_textWithButton?.setTitleColor(self.buttonTextColor, for: UIControl.State())
        }
    }
    open var  buttonFont: UIFont? {
        didSet {
            if let font = self.buttonFont {
                self.button_textWithButton?.titleLabel?.font = font
            }
        }
    }
    open var  buttonBordercolor: UIColor = UIColor.white {
        didSet {
            self.button_textWithButton?.layer.borderColor = self.buttonBordercolor.cgColor
        }
    }
    open var  buttonBorderWidth: CGFloat = 1.0 {
        didSet {
            self.button_textWithButton?.layer.borderWidth = self.buttonBorderWidth
        }
    }
    open var  buttonCornerRadius: CGFloat = 3.0 {
        didSet {
            self.button_textWithButton?.layer.cornerRadius = self.buttonCornerRadius
        }
    }
    open var  buttonWidth: CGFloat? {
        didSet {
            if let width = self.buttonWidth {
                self.button_textWithButton?.frame.size.width = width
            }
        }
    }
    
    //TWO BUTTONS
        //ButtonOne
    open var  buttonOne_textWithButton: UIButton?
    open var  buttonOneText: String = "Dismiss" {
        didSet {
            self.buttonOne_textWithButton?.setTitle(self.buttonOneText, for: UIControl.State())
        }
    }
    open var  buttonOneColor: UIColor = UIColor.blue {
        didSet {
            self.buttonOne_textWithButton?.backgroundColor = self.buttonOneColor
        }
    }
    open var  buttonOneTextColor: UIColor = UIColor.white {
        didSet {
            self.buttonOne_textWithButton?.setTitleColor(self.buttonOneTextColor, for: UIControl.State())
        }
    }
    open var  buttonOneFont: UIFont? {
        didSet {
            if let font = self.buttonOneFont {
                self.buttonOne_textWithButton?.titleLabel?.font = font
            }
        }
    }
    open var  buttonOneBordercolor: UIColor = UIColor.white {
        didSet {
            self.buttonOne_textWithButton?.layer.borderColor = self.buttonOneBordercolor.cgColor
        }
    }
    open var  buttonOneBorderWidth: CGFloat = 1.0 {
        didSet {
            self.buttonOne_textWithButton?.layer.borderWidth = self.buttonOneBorderWidth
        }
    }
    open var  buttonOneCornerRadius: CGFloat = 3.0 {
        didSet {
            self.buttonOne_textWithButton?.layer.cornerRadius = self.buttonOneCornerRadius
        }
    }
    
        //ButtonTwo
    open var  buttonTwo_textWithButton: UIButton?
    open var  buttonTwoText: String = "Dismiss" {
        didSet {
            self.buttonTwo_textWithButton?.setTitle(self.buttonTwoText, for: UIControl.State())
        }
    }
    open var  buttonTwoColor: UIColor = UIColor.blue {
        didSet {
            self.buttonTwo_textWithButton?.backgroundColor = self.buttonTwoColor
        }
    }
    open var  buttonTwoTextColor: UIColor = UIColor.white {
        didSet {
            self.buttonTwo_textWithButton?.setTitleColor(self.buttonTwoTextColor, for: UIControl.State())
        }
    }
    open var  buttonTwoFont: UIFont? {
        didSet {
            if let font = self.buttonTwoFont {
                self.buttonTwo_textWithButton?.titleLabel?.font = font
            }
        }
    }
    open var  buttonTwoBordercolor: UIColor = UIColor.white {
        didSet {
            self.buttonTwo_textWithButton?.layer.borderColor = self.buttonTwoBordercolor.cgColor
        }
    }
    open var  buttonTwoBorderWidth: CGFloat = 1.0 {
        didSet {
            self.buttonTwo_textWithButton?.layer.borderWidth = self.buttonTwoBorderWidth
        }
    }
    open var  buttonTwoCornerRadius: CGFloat = 3.0 {
        didSet {
            self.buttonTwo_textWithButton?.layer.cornerRadius = self.buttonTwoCornerRadius
        }
    }
    
    
    
    //AlertView
    open var  alertView: UIView? {
        didSet {
            if let alv = self.alertView {
                self.viewMain = alv
            }
        }
    }
    open var  alertColor: UIColor = UIColor.gray {
        didSet {
            if let mainView = self.viewMain {
                mainView.backgroundColor = self.alertColor
            }
        }
    }
    open var  alertAlpha: CGFloat = 1.0 {
        didSet {
            if let mainView = self.viewMain {
                mainView.alpha = self.alertAlpha
            }
        }
    }
    open var  alertHeight:CGFloat = 75.0 {
        didSet {
            self.overlayView?.frame.size.height = self.alertHeight
        }
    }
    
    open var  paddingLeft: CGFloat = 0.0
    open var  paddingTop: CGFloat = 0.0
    open var  animationDuration: TimeInterval = 0.5
    open var  alertType: LIHAlertType = LIHAlertType.text
    open var  autoCloseEnabled: Bool = true
    open var  autoCloseTimeInterval: Double = 3.0
    open var  hasNavigationBar: Bool = false
    open var  touchBackgroundToDismiss: Bool = false
    open var  dimsBackground: Bool = false
    open var backgroundDimOpacity: CGFloat = 0.4 {
        didSet {
            self.overlayView?.alpha = self.backgroundDimOpacity
        }
    }
    
    
    //private variables
    fileprivate var navBarHeight: CGFloat = 44.0 + 20.0
    fileprivate var viewMain: UIView?
    fileprivate var imgViewIcon: UIImageView?
    fileprivate var lblContentText: UILabel?
    fileprivate var lblTitle: UILabel?
    fileprivate var buttonHighlightAlpha: CGFloat = 0.5
    fileprivate var overlayView: UIView?
    fileprivate var activityIndicatorLoading: UIActivityIndicatorView?
    fileprivate var containerView: UIView?
    
    //validation
    fileprivate var scheduledAutoClose: dispatch_cancelable_closure?
    fileprivate var topConstraintToOverlayView: NSLayoutConstraint?
    
    
    open func initAlert(_ container: UIView) {
        
        self.containerView = container
        
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
        /*NotificationCenter.default.addObserver(self, selector: #selector(LIHAlert.orientationChanged(_:)), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)*/
        
        NotificationCenter.default.addObserver(self, selector: #selector(LIHAlert.orientationChanged(_:)), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        
        
        //Create OverlayView and add to Container(self.view)
        self.overlayView = UIView()
        self.overlayView?.clipsToBounds = true
        self.overlayView?.isHidden = true
        var overlayHeight = self.alertHeight
        
        if self.touchBackgroundToDismiss {
            let tapBg = UITapGestureRecognizer(target: self, action: #selector(LIHAlert.backgroundTapped(gesture:)))
            overlayHeight = UIScreen.main.bounds.height
            self.overlayView?.addGestureRecognizer(tapBg)
        }
        if self.dimsBackground {
            let dimV = UIView(frame: UIScreen.main.bounds)
            dimV.backgroundColor = UIColor.black
            dimV.alpha = self.backgroundDimOpacity
            self.overlayView?.addSubview(dimV)
        }
        var topMargin: CGFloat = 0.0
        
//        if let customView = self.alertView {
//            overlayHeight = customView.frame.size.height
//            self.alertHeight = customView.frame.size.height
//        }
        
        if self.hasNavigationBar {
            topMargin = self.navBarHeight
        }
        
        if let overlay = self.overlayView {
            container.addSubview(overlay)
            container.bringSubviewToFront(overlay)
            overlay.translatesAutoresizingMaskIntoConstraints = false
            let heightToContainer = NSLayoutConstraint(item: overlay, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: overlayHeight)
            let topToContainer = NSLayoutConstraint(item: overlay, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: container, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: topMargin)
            self.topConstraintToOverlayView = topToContainer
            let leftToContainer = NSLayoutConstraint(item: overlay, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: container, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0.0)
            let rightToContainer = NSLayoutConstraint(item: overlay, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: container, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0.0)
            
            container.addConstraints([heightToContainer,topToContainer,leftToContainer,rightToContainer])
        }
        
        
        if self.alertType == LIHAlertType.custom {
            self.configTypeCustom()
            
        } else if self.alertType == LIHAlertType.text {
            self.mainViewConfig()
            self.configTypeText()
            
        } else if self.alertType == LIHAlertType.textWithLoading {
            self.mainViewConfig()
            self.configTypeTextWithLoading()
            
        } else if self.alertType == LIHAlertType.textWithIcon {
            self.mainViewConfig()
            self.configTypeTextWithIcon()
            
        } else if self.alertType == LIHAlertType.textWithButton {
            self.mainViewConfig()
            self.configTypeTextWithButton()
            
        } else if self.alertType == LIHAlertType.textWithTwoButtons {
            self.mainViewConfig()
            self.configTypeTextWithTwoButtons()
            
        } else if self.alertType == LIHAlertType.textWithTitle {
            self.mainViewConfig()
            self.configTypeTextWithTitle()
        }

    }
    
    fileprivate func mainViewConfig() {
        
        self.viewMain = UIView()
        
        if let mainView = self.viewMain {
            
            self.overlayView?.addSubview(mainView)
            
            let heightCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.alertHeight)
            let bottomCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.overlayView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0.0)
            let leftCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.overlayView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0.0)
            let rightCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.overlayView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0.0)
            
            self.overlayView?.addConstraints([heightCon, bottomCon, leftCon, rightCon])
            
            mainView.translatesAutoresizingMaskIntoConstraints = false
            mainView.backgroundColor = self.alertColor
            mainView.alpha = self.alertAlpha
            mainView.clipsToBounds = true
            
        }
    }
    
    fileprivate func configTypeCustom() {
        
        if let alertV = self.alertView {
            
            alertV.frame.origin.y = alertV.frame.size.height * -1
            self.viewMain = alertV
            
            if let mainView = self.viewMain {
                
                self.overlayView?.addSubview(mainView)
                
                let heightCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.alertHeight)
                let bottomCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.overlayView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0.0)
                let leftCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.overlayView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0.0)
                let rightCon = NSLayoutConstraint(item: mainView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.overlayView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0.0)
                
                self.overlayView?.addConstraints([heightCon, bottomCon, leftCon, rightCon])
                
                mainView.translatesAutoresizingMaskIntoConstraints = false
//                mainView.backgroundColor = self.alertColor
                mainView.alpha = self.alertAlpha
                mainView.clipsToBounds = true
                
            }
            
        } else {
            let width = UIScreen.main.bounds.width
            self.viewMain = UIView(frame: CGRect(x: 0.0, y: -50.0, width: width, height: 50.0))
            if let mainView = self.viewMain {
                mainView.translatesAutoresizingMaskIntoConstraints = false
                mainView.backgroundColor = self.alertColor
                mainView.alpha = self.alertAlpha
                mainView.clipsToBounds = true
                
            }
        }
    }
    
    fileprivate func configTypeText() {
        
        if let _ = self.viewMain {
            
            self.contentLabel = UILabel()
            self.contentLabel?.text = self.contentText
            self.contentLabel?.textColor = self.contentTextColor
            self.contentLabel?.font = self.contentTextFont
            self.contentLabel?.numberOfLines = self.contentTextNumberOfLines
            self.contentLabel?.textAlignment = NSTextAlignment.center
            
            if let label = self.contentLabel {
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addSubview(label)
                
                let centerX = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: self.paddingLeft)
                let centerY = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: self.paddingTop)
                let left = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: self.paddingLeft+20)
                let right = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -1*20)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addConstraints([centerY,centerX,left,right])
            }
        }
        
    }
    
    fileprivate func configTypeTextWithTitle() {
        
        if let _ = self.viewMain {
            
            self.contentLabel = UILabel()
            self.contentLabel?.text = self.contentText
            self.contentLabel?.textColor = self.contentTextColor
            self.contentLabel?.font = self.contentTextFont
            self.contentLabel?.numberOfLines = self.contentTextNumberOfLines
            self.contentLabel?.textAlignment = NSTextAlignment.justified
            
            self.titleLabel = UILabel()
            self.titleLabel?.text = self.titleText
            self.titleLabel?.textColor = self.titleTextColor
            self.titleLabel?.font = self.titleTextFont
            self.titleLabel?.numberOfLines = self.titleTextNumberOfLines
            
            if let label = self.titleLabel {
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addSubview(label)
                
                if self.titleTextFont == nil {
                    let fontSize = label.font.pointSize
                    label.font = UIFont.boldSystemFont(ofSize: fontSize)
                }
                
                let left = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: self.paddingLeft+20)
                let right = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -1*20)
                let top = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: self.paddingTop+10)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addConstraints([left,right,top])
            }
            
            if let label = self.contentLabel {
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addSubview(label)
                
                let left = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: self.paddingLeft+20)
                let right = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -1*20)
                let top = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.titleLabel, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addConstraints([left,right,top])
            }
        }
        
    }
    
    fileprivate func configTypeTextWithLoading() {
        
        if let _ = self.viewMain {
            
            self.contentLabel = UILabel()
            self.contentLabel?.text = self.contentText
            self.contentLabel?.textColor = self.contentTextColor
            self.contentLabel?.font = self.contentTextFont
            
            if let label = self.contentLabel {
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addSubview(label)
                
                let centerX = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: self.paddingLeft)
                let centerY = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: self.paddingTop)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                self.viewMain?.addConstraints([centerY,centerX])
            }
            
            self.activityIndicatorLoading = UIActivityIndicatorView(style: self.activityIndicatorStyle)
            if let loading = self.activityIndicatorLoading {
                self.viewMain?.addSubview(loading)
                loading.translatesAutoresizingMaskIntoConstraints = false
                
                let rightCon = NSLayoutConstraint(item: loading, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.contentLabel, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: -10.0)
                let centerYAct = NSLayoutConstraint(item: loading, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.contentLabel, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
                
                self.viewMain?.addConstraints([rightCon, centerYAct])
            }
            
            
        }
    }
    
    fileprivate func configTypeTextWithIcon() {
        
        let iconContainer = UIView()
        self.viewMain?.addSubview(iconContainer)
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        self.iconImageView = UIImageView()
        iconImageView?.image = self.icon
        self.iconImageView?.clipsToBounds = true
        
        if let imgView = self.iconImageView {
            //Imageview
            iconContainer.addSubview(imgView)
            
            let imgLeftCon = NSLayoutConstraint(item: imgView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: iconContainer, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0)
            let imgTopCon = NSLayoutConstraint(item: imgView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: iconContainer, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
            let imgBottomCon = NSLayoutConstraint(item: imgView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: iconContainer, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
            
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
                
                let centerY = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: iconContainer, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: self.paddingTop)
                let imgTextLeftCon = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: imgView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 20)
                let imgTextRightCon = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: iconContainer, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                iconContainer.addConstraints([centerY,imgTextLeftCon, imgTextRightCon])
            }

        }
        
        let centerIconContainerX = NSLayoutConstraint(item: iconContainer, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: self.paddingLeft)
        let centerIconContainerY = NSLayoutConstraint(item: iconContainer, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: self.paddingTop)
        
        self.viewMain?.addConstraints([centerIconContainerX,centerIconContainerY])
    }
    
    fileprivate func configTypeTextWithButton() {
        
        self.contentLabel = UILabel()
        self.contentLabel?.text = self.contentText
        self.contentLabel?.textColor = self.contentTextColor
        self.contentLabel?.font = self.contentTextFont
        self.contentLabel?.textAlignment = NSTextAlignment.center
        self.contentLabel?.numberOfLines = 20
        
        if let label = self.contentLabel {
            label.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addSubview(label)
            
            let leftCon = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 20.0)
            let rightCon = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -20.0)
            let topCon = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 20.0 + self.paddingTop)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addConstraints([topCon, leftCon, rightCon])
        }
        
        self.button_textWithButton = UIButton()
        self.button_textWithButton?.setTitle(self.buttonText, for: UIControl.State())
        self.button_textWithButton?.backgroundColor = self.buttonColor
        self.button_textWithButton?.setTitleColor(self.buttonTextColor, for: UIControl.State())
        self.button_textWithButton?.layer.borderColor = self.buttonBordercolor.cgColor
        self.button_textWithButton?.layer.borderWidth = self.buttonBorderWidth
        self.button_textWithButton?.layer.cornerRadius = self.buttonCornerRadius
        if let width = self.buttonWidth {
            self.button_textWithButton?.frame.size.width = width
        }
    
        if let font = self.buttonFont {
            self.button_textWithButton?.titleLabel?.font = font
        }
        self.button_textWithButton?.tag = 10
        self.button_textWithButton?.addTarget(self, action: #selector(LIHAlertDelegate.buttonPressed(_:)), for: UIControl.Event.touchUpInside)
        self.button_textWithButton?.addTarget(self, action: #selector(LIHAlert.buttonTouchDown(_:)), for: UIControl.Event.touchDown)
        if let button = self.button_textWithButton {
            
            button.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addSubview(button)
            
            let bottomCon = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -10.0)
            let leftCon = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 20.0)
            let rightCon = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -20.0)
            
            self.viewMain?.addConstraints([bottomCon,leftCon,rightCon])
        }
    }
    
    fileprivate func configTypeTextWithTwoButtons() {
        
        self.contentLabel = UILabel()
        self.contentLabel?.text = self.contentText
        self.contentLabel?.textColor = self.contentTextColor
        self.contentLabel?.font = self.contentTextFont
        self.contentLabel?.textAlignment = NSTextAlignment.center
        self.contentLabel?.numberOfLines = 20
        
        if let label = self.contentLabel {
            label.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addSubview(label)
            
            let leftCon = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 20.0)
            let rightCon = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -20.0)
            let topCon = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 20.0 + self.paddingTop)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            self.viewMain?.addConstraints([topCon, leftCon, rightCon])
        }
        
        //Button one
        self.buttonOne_textWithButton = UIButton()
        self.buttonOne_textWithButton?.setTitle(self.buttonOneText, for: UIControl.State())
        self.buttonOne_textWithButton?.backgroundColor = self.buttonOneColor
        self.buttonOne_textWithButton?.setTitleColor(self.buttonOneTextColor, for: UIControl.State())
        self.buttonOne_textWithButton?.layer.borderColor = self.buttonOneBordercolor.cgColor
        self.buttonOne_textWithButton?.layer.borderWidth = self.buttonOneBorderWidth
        self.buttonOne_textWithButton?.layer.cornerRadius = self.buttonOneCornerRadius
        if let font = self.buttonOneFont {
            self.buttonOne_textWithButton?.titleLabel?.font = font
        }
        self.buttonOne_textWithButton?.tag = 20
        self.buttonOne_textWithButton?.addTarget(self, action: #selector(LIHAlertDelegate.buttonPressed(_:)), for: UIControl.Event.touchUpInside)
        self.buttonOne_textWithButton?.addTarget(self, action: #selector(LIHAlert.buttonTouchDown(_:)), for: UIControl.Event.touchDown)
        
        //Button two
        self.buttonTwo_textWithButton = UIButton()
        self.buttonTwo_textWithButton?.setTitle(self.buttonTwoText, for: UIControl.State())
        self.buttonTwo_textWithButton?.backgroundColor = self.buttonTwoColor
        self.buttonTwo_textWithButton?.setTitleColor(self.buttonTwoTextColor, for: UIControl.State())
        self.buttonTwo_textWithButton?.layer.borderColor = self.buttonTwoBordercolor.cgColor
        self.buttonTwo_textWithButton?.layer.borderWidth = self.buttonTwoBorderWidth
        self.buttonTwo_textWithButton?.layer.cornerRadius = self.buttonTwoCornerRadius
        if let font = self.buttonTwoFont {
            self.buttonTwo_textWithButton?.titleLabel?.font = font
        }
        self.buttonTwo_textWithButton?.tag = 30
        self.buttonTwo_textWithButton?.addTarget(self, action: #selector(LIHAlertDelegate.buttonPressed(_:)), for: UIControl.Event.touchUpInside)
        self.buttonTwo_textWithButton?.addTarget(self, action: #selector(LIHAlert.buttonTouchDown(_:)), for: UIControl.Event.touchDown)
        
        if let buttonOne = self.buttonOne_textWithButton, let buttonTwo = self.buttonTwo_textWithButton {
            
            buttonOne.translatesAutoresizingMaskIntoConstraints = false
            buttonTwo.translatesAutoresizingMaskIntoConstraints = false
            
            self.viewMain?.addSubview(buttonOne)
            self.viewMain?.addSubview(buttonTwo)
            
            let bottomConOne = NSLayoutConstraint(item: buttonOne, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -10.0)
            let leftConOne = NSLayoutConstraint(item: buttonOne, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 20.0)
            let rightConTwo = NSLayoutConstraint(item: buttonTwo, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -20.0)
            let rightConOne = NSLayoutConstraint(item: buttonOne, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: buttonTwo, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: -20.0)
            let bottomConTwo = NSLayoutConstraint(item: buttonTwo, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.viewMain, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -10.0)
            let sameWidth = NSLayoutConstraint(item: buttonOne, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: buttonTwo, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 0.0)
            
            self.viewMain?.addConstraints([bottomConOne,leftConOne,rightConOne, rightConTwo,bottomConTwo,sameWidth])
        }
    }
    
    fileprivate func showAlert(_ completionHandler:@escaping ()->()){
        if let mainView = self.viewMain {
            
            mainView.isHidden = false
            self.activityIndicatorLoading?.startAnimating()
            self.overlayView?.isHidden = false
            
            UIView.animate(withDuration: self.animationDuration, animations: { () -> Void in
                
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
    
    open func hideAlert(_ completionHandler:(()->())?){
        
        UIView.animate(withDuration: self.animationDuration, animations: { () -> Void in
            
            if let mainView = self.viewMain {
                
                if self.hasNavigationBar {
                    
                    mainView.frame.origin.y =  -1 * (mainView.frame.size.height + self.navBarHeight)
                    
                } else {
                    
                    mainView.frame.origin.y =  -1 * mainView.frame.size.height
                }
            }
            
        }, completion: { (finished) -> Void in
            
            self.activityIndicatorLoading?.stopAnimating()
            self.viewMain?.isHidden = true
            self.overlayView?.isHidden = true
            completionHandler?()
        })
        
    }
    
    open func show(_ showed:(()->())?, hidden:(()->())?) {
        
        if let overlay = self.overlayView {
            self.containerView?.bringSubviewToFront(overlay)
        }
        
        cancel_delay(self.scheduledAutoClose)
        
        self.viewMain?.isHidden = false
        
        self.showAlert(){
            () -> () in
            showed?()
        }
        
        if self.autoCloseEnabled {
            
            let delay = self.autoCloseTimeInterval
            self.scheduledAutoClose = delayFunc(TimeInterval(delay), closure: { () -> () in
                
                self.hideAlert() {
                    () -> Void in
                    hidden?()
                    
                }
            })
        }
    }
    
    
    //dispatch
    public typealias dispatch_cancelable_closure = (_ cancel : Bool) -> ()
    
    open func delayFunc(_ time:TimeInterval, closure:@escaping ()->()) ->  dispatch_cancelable_closure? {
        
        func dispatch_later(_ clsr:@escaping ()->()) {
            DispatchQueue.main.asyncAfter(
                deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: clsr)
        }

        var closure:(() -> ())? = closure
        var cancelableClosure:dispatch_cancelable_closure?

        let delayedClosure:dispatch_cancelable_closure = { cancel in
            if let clsr = closure {
                if (cancel == false) {
                    DispatchQueue.main.async(execute: clsr);
                }
            }
            closure = nil
            cancelableClosure = nil
        }

        cancelableClosure = delayedClosure
        
        dispatch_later {
            if let delayedClosure = cancelableClosure {
                delayedClosure(false)
            }
        }

        return cancelableClosure;
    }
    
    open func cancel_delay(_ closure:dispatch_cancelable_closure?) {
        if closure != nil {
            closure!(true)
        }
    }
    
    
    //Orientation
    @objc open func orientationChanged(_ notification: Notification) {
        
        if self.hasNavigationBar {
            
            if UIDevice.current.orientation.isLandscape {
                
                self.topConstraintToOverlayView?.constant = 30.0
                
            } else if UIDevice.current.orientation.isPortrait {
                
                self.topConstraintToOverlayView?.constant = 20.0 + 44.0
            }
        }
    }
    
    
    //MARK - Events
    
    open func buttonPressed(_ sender: UIButton) {
        
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
    
    @objc open func buttonTouchDown(_ sender: UIButton) {
        
        if sender.tag == 10 {
            
            self.button_textWithButton?.alpha = buttonHighlightAlpha
            
        } else if sender.tag == 20 {
        
            self.buttonOne_textWithButton?.alpha = buttonHighlightAlpha
            
        } else if sender.tag == 30 {
            
            self.buttonTwo_textWithButton?.alpha = buttonHighlightAlpha
        }
    }
    
    @objc func backgroundTapped(gesture: UITapGestureRecognizer) {
        
        if let ol = self.overlayView {
            
            let point = gesture.location(in: ol)
            if self.alertView?.point(inside: point, with: nil) == true {
                
            } else {
                if self.touchBackgroundToDismiss {
                    self.hideAlert(nil)
                }
            }
        }
        
    }
}

