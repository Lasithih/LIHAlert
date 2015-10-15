//
//  ViewController.swift
//  LIHAlert
//
//  Created by Lasith Hettiarachchi on 9/4/15.
//  Copyright (c) 2015 Lasith Hettiarachchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var errorAlert: LIHAlert?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAlerts()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Private Methods
    func initAlerts() {
        print(self.navigationController?.navigationBar.frame.height)
//        self.errorAlert = LIHAlert()
//        if let alert = self.errorAlert {
//            alert.alertType = LIHAlertType.Custom
//            alert.hasNavigationBar = true
//            var vw = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 70.0))
//            vw.backgroundColor = UIColor.blueColor()
//            alert.alertView = vw
//        }
//        self.errorAlert?.initAlert(self.view)

        self.errorAlert = LIHAlert()
        if let alert = self.errorAlert {
            alert.alertType = LIHAlertType.TextWithLoading
            alert.hasNavigationBar = true
            alert.contentText = "Sample message"
            alert.contentTextColor = UIColor.whiteColor()
            alert.alertColor = UIColor.grayColor()
            alert.contentTextFont = UIFont(name: "Bradley Hand", size: 20)
        }
        self.errorAlert?.initAlert(self.view)
    
    }

    //MARK: - Events
    @IBAction func showTapped(sender: AnyObject) {
        
        self.errorAlert?.show(nil, hidden: nil)
    }

}

