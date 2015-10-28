//
//  LIHAlertManager.swift
//  LIHAlert
//
//  Created by Lasith Hettiarachchi on 10/15/15.
//  Copyright © 2015 Lasith Hettiarachchi. All rights reserved.
//

import Foundation
import UIKit

class LIHAlertManager {
    
    
    static func getTextAlert(message: String) -> LIHAlert {
        
        let alertTextAlert: LIHAlert = LIHAlert()
        alertTextAlert.alertType = LIHAlertType.Text
        alertTextAlert.contentText = message
        alertTextAlert.alertColor = UIColor(red: 102.0/255.0, green: 197.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        alertTextAlert.alertHeight = 50.0
        alertTextAlert.alertAlpha = 1.0
        alertTextAlert.autoCloseEnabled=true
        alertTextAlert.contentTextColor = UIColor.whiteColor()
        alertTextAlert.hasNavigationBar = true
        alertTextAlert.paddingTop = 0.0
        alertTextAlert.animationDuration = 0.35
        alertTextAlert.autoCloseTimeInterval = 1.5
        return alertTextAlert
    }
    
    
    static func getProcessingAlert(message: String) -> LIHAlert {
        
        let processingAlert: LIHAlert = LIHAlert()
        processingAlert.alertType = LIHAlertType.TextWithLoading
        processingAlert.contentText = message
        processingAlert.alertColor = UIColor.grayColor()
        processingAlert.alertHeight = 70.0
        processingAlert.alertAlpha = 1.0
        processingAlert.autoCloseEnabled=false
        processingAlert.contentTextColor = UIColor.whiteColor()
        processingAlert.hasNavigationBar = true
        processingAlert.paddingTop = 0.0
        processingAlert.animationDuration = 0.35
        processingAlert.autoCloseTimeInterval = 2.5
        
        return processingAlert
    }
    
    
    static func getCustomViewAlert(customView: UIView) -> LIHAlert {
        
        let customViewAlert: LIHAlert = LIHAlert()
        customViewAlert.alertType = LIHAlertType.Custom
        customViewAlert.alertView = customView
        customViewAlert.autoCloseEnabled=true
        customViewAlert.hasNavigationBar = true
        customViewAlert.animationDuration = 0.35
        customViewAlert.autoCloseTimeInterval = 2.5
        
        return customViewAlert
    }
    
    
    static func getSuccessAlert(message: String) -> LIHAlert {
        
        let successAlert: LIHAlert = LIHAlert()
        successAlert.alertType = LIHAlertType.TextWithIcon
        successAlert.icon = UIImage(named: "SuccessIcon")
        successAlert.contentText = message
        successAlert.alertColor = UIColor(red: 17.0/255.0, green: 201.0/255.0, blue: 3.0/255.0, alpha: 1.0)
        successAlert.alertHeight = 70.0
        successAlert.alertAlpha = 1.0
        successAlert.autoCloseEnabled=true
        successAlert.contentTextColor = UIColor.whiteColor()
        successAlert.hasNavigationBar = true
        successAlert.paddingTop = 0.0
        successAlert.animationDuration = 0.35
        successAlert.autoCloseTimeInterval = 2.5
        
        return successAlert
    }
    
    
    static func getErrorAlert(message: String) -> LIHAlert {
        
        let errorAlert: LIHAlert = LIHAlert()
        errorAlert.alertType = LIHAlertType.TextWithIcon
        errorAlert.icon = UIImage(named: "ErrorIcon")
        errorAlert.contentText = message
        errorAlert.alertColor = UIColor(red: 201.0/255.0, green: 3.0/255.0, blue: 3.0/255.0, alpha: 1.0)
        errorAlert.alertHeight = 70.0
        errorAlert.alertAlpha = 1.0
        errorAlert.autoCloseEnabled=true
        errorAlert.contentTextColor = UIColor.whiteColor()
        errorAlert.hasNavigationBar = true
        errorAlert.paddingTop = 0.0
        errorAlert.animationDuration = 0.35
        errorAlert.autoCloseTimeInterval = 2.5
        
        return errorAlert
    }
    
    
    static func getTextWithButtonAlert(message: String, buttonText: String) -> LIHAlert {
        
        let textWithButtonAlert: LIHAlert = LIHAlert()
        textWithButtonAlert.alertType = LIHAlertType.TextWithButton
        textWithButtonAlert.contentText = message
        textWithButtonAlert.buttonText = buttonText
        textWithButtonAlert.buttonColor = UIColor(red: 22.0/255.0, green: 40.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        textWithButtonAlert.buttonWidth = 620.0
        textWithButtonAlert.alertColor = UIColor(red: 22.0/255.0, green: 40.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        textWithButtonAlert.alertHeight = 130.0
        textWithButtonAlert.alertAlpha = 1.0
        textWithButtonAlert.autoCloseEnabled=false
        textWithButtonAlert.contentTextColor = UIColor.whiteColor()
        textWithButtonAlert.hasNavigationBar = true
        textWithButtonAlert.paddingTop = 0.0
        textWithButtonAlert.animationDuration = 0.35
        textWithButtonAlert.autoCloseTimeInterval = 2.5
        
        return textWithButtonAlert
    }
    
    
    static func getTextWithTwoButtonsAlert(message: String, buttonOneText: String, buttonTwoText: String) -> LIHAlert {
        
        let textWithButtonsAlert: LIHAlert = LIHAlert()
        textWithButtonsAlert.alertType = LIHAlertType.TextWithTwoButtons
        textWithButtonsAlert.contentText = message
        textWithButtonsAlert.alertColor = UIColor(red: 22.0/255.0, green: 40.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        
        textWithButtonsAlert.buttonOneText = buttonOneText
        textWithButtonsAlert.buttonOneColor = UIColor(red: 22.0/255.0, green: 40.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        textWithButtonsAlert.buttonTwoText = buttonTwoText
        textWithButtonsAlert.buttonTwoColor = UIColor(red: 22.0/255.0, green: 40.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        
        textWithButtonsAlert.alertHeight = 130.0
        textWithButtonsAlert.alertAlpha = 1.0
        textWithButtonsAlert.autoCloseEnabled=false
        textWithButtonsAlert.contentTextColor = UIColor.whiteColor()
        textWithButtonsAlert.hasNavigationBar = true
        textWithButtonsAlert.paddingTop = 0.0
        textWithButtonsAlert.animationDuration = 0.35
        textWithButtonsAlert.autoCloseTimeInterval = 2.5
        
        return textWithButtonsAlert
    }
}