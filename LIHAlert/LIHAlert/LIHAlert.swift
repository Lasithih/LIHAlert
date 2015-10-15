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
    case Custom, Text, TextWithLoading
}

class LIHAlert {
    
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
    var activityIndicatorStyle: UIActivityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
    private var activityIndicatorLoading: UIActivityIndicatorView?
    
    //Icon
    private var iconImageView: UIImageView?
    var icon: UIImage?
    
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
            ///////////
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
    
    var isAlertVisible: Bool = false
    
    
    func initAlert(container: UIView) {
        
        
        self.overlayView = UIView()
        self.overlayView?.userInteractionEnabled = false
        self.overlayView?.clipsToBounds = true
        self.overlayView?.backgroundColor = UIColor.blackColor()//ATTENTION
        
        if let overlay = self.overlayView {
            container.addSubview(overlay)
            container.bringSubviewToFront(overlay)
            
            
        }
        
        if self.hasNavigationBar {
            self.overlayView?.frame.origin.y = self.navBarHeight
            if let customView = self.alertView {
                
                self.overlayView?.frame.size.height = customView.frame.size.height
            } else {
                self.overlayView?.frame.size.height = self.alertHeight
            }
        }
        
        
        
        
        if self.alertType == LIHAlertType.Custom {
            self.configTypeCustom()
            
            
        } else if self.alertType == LIHAlertType.Text {
            self.mainViewConfig()
            
            self.configTypeText()
        } else if self.alertType == LIHAlertType.TextWithLoading {
            self.mainViewConfig()
            
            self.configTypeTextWithLoading()
        }
        
        if let mainview = self.viewMain {
            if let overlay = self.overlayView {
                overlay.addSubview(mainview)
            }
        }
    }
    
    func mainViewConfig() {
        
        //var width = UIScreen.mainScreen().bounds.width
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
    
    func configTypeCustom() {
        
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
    
    func configTypeText() {
        
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
    
    func configTypeTextWithLoading() {
        
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
    
    func configTypeTextWithIcon() {
        
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
    
    private func showAlert(completionHandler:()->()){
        
        if let mainView = self.viewMain {
            
            mainView.hidden = false
            self.activityIndicatorLoading?.startAnimating()
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
            completionHandler?()
        }
        
    }
    
    func show(showed:(()->())?, hidden:(()->())?) {
        
        self.viewMain?.hidden = false
        
        self.showAlert(){
            () -> () in
            showed?()
        }
        
        if self.autoCloseEnabled {
            let delay = self.autoCloseTimeInterval * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), {
                
                self.hideAlert() {
                    () -> Void in
                    hidden?()
                }
            })
        }
    }
    
    
    
}