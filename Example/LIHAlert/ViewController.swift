//
//  ViewController.swift
//  LIHAlert
//
//  Created by Lasith Hettiarachchi on 9/4/15.
//  Copyright (c) 2015 Lasith Hettiarachchi. All rights reserved.
//

import UIKit
import LIHAlert

class ViewController: UIViewController {
    
    var textAlert: LIHAlert?
    var processingAlert: LIHAlert?
    var customViewAlert: LIHAlert?
    var successAlert: LIHAlert?
    var errorAlert: LIHAlert?
    var textWithButtonAlert: LIHAlert?
    var textWithTwoButtonsAlert: LIHAlert?
    var textWithTitleAlert: LIHAlert?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAlerts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Private Methods
    func initAlerts() {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomViewVc")
        self.customViewAlert = LIHAlertManager.getCustomViewAlert(vc!.view.viewWithTag(5)!)
        self.customViewAlert?.initAlert(self.view)
        
        self.textWithButtonAlert = LIHAlertManager.getTextWithButtonAlert("You have successfully subscribed for the monthly newsletter", buttonText: "Dismiss")
        self.textWithButtonAlert?.initAlert(self.view)
        
        self.textWithTwoButtonsAlert = LIHAlertManager.getTextWithTwoButtonsAlert("Do you want to subscribe for the monthly newsletter?", buttonOneText: "Subscribe", buttonTwoText: "Cancel")
        self.textWithTwoButtonsAlert?.initAlert(self.view)
        
        self.processingAlert = LIHAlertManager.getProcessingAlert("Fetching data...")
        self.processingAlert?.initAlert(self.view)
        
        self.successAlert = LIHAlertManager.getSuccessAlert("Successfully subscribed")
        self.successAlert?.initAlert(self.view)
        
        self.errorAlert = LIHAlertManager.getErrorAlert("Failed. Please try again")
        self.errorAlert?.initAlert(self.view)
        
        self.textAlert = LIHAlertManager.getTextAlert("Sample Message Sample Message")
        self.textAlert?.initAlert(self.view)
        
        self.textWithTitleAlert = LIHAlertManager.getTextWithTitleAlert("This is The Title", message: "This is a sample message. This is a sample message. This is a sample message. This is a sample message. This is a sample message.")
        self.textWithTitleAlert?.initAlert(self.view)
    }

    //MARK: - Events
    @IBAction func showTapped(_ sender: AnyObject) {
        
        self.textAlert?.show(nil, hidden: nil)
    }

    @IBAction func showProcessingAlert(_ sender: AnyObject) {
        
        self.processingAlert?.show(nil, hidden: nil)
    }
    
    @IBAction func hideProcessiongAlert(_ sender: AnyObject) {
        
        self.processingAlert?.hideAlert({ () -> () in
            //
        })
    }
    
    @IBAction func showCustomView(_ sender: AnyObject) {
        
        self.customViewAlert?.show(nil, hidden: nil)
        
    }
    
    @IBAction func showSuccessAlert(_ sender: AnyObject) {
        
        self.successAlert?.show(nil, hidden: nil)
    }
    
    @IBAction func showErrorAlert(_ sender: AnyObject) {
        
        self.errorAlert?.show(nil, hidden: nil)
    }
    
    @IBAction func shoeTextWithButton(_ sender: AnyObject) {
        
        self.textWithButtonAlert?.show(nil, hidden: nil)
        self.textWithButtonAlert?.delegate = self
    }
    
    @IBAction func showTextWithTwoButtons(_ sender: AnyObject) {
        
        self.textWithTwoButtonsAlert?.show(nil, hidden: nil)
        self.textWithTwoButtonsAlert?.delegate = self
    }
    
    @IBAction func showTextWithTitle(_ sender: AnyObject) {
        
        self.textWithTitleAlert?.show(nil, hidden: nil)
    }
    
    
}

extension ViewController: LIHAlertDelegate {
    
    func buttonPressed(_ button: UIButton) {
        
        self.textWithButtonAlert?.hideAlert(nil)
    }
    
    func buttonOnePressed(_ button: UIButton) {
        
        self.textWithTwoButtonsAlert?.hideAlert({ () -> () in
            
            self.successAlert?.show(nil, hidden: nil)
        })
        
    }
    
    func buttonTwoPressed(_ button: UIButton) {
        
        self.textWithTwoButtonsAlert?.hideAlert(nil)
    }
}

