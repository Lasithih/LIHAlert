//
//  CustomAlertsViewController.swift
//  LIHAlert
//
//  Created by Lasith Hettiarachchi on 2/23/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import LIHAlert

class CustomAlertsViewController: UIViewController {
    
    var mapAlert: LIHAlert?
    var tableAlert: LIHAlert?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initAlerts()
    }
    

    
    fileprivate func initAlerts() {
        
        //Map view controller
        let m_vc = (self.storyboard?.instantiateViewController(withIdentifier: "MapVc"))!
        self.mapAlert = LIHAlertManager.getCustomViewAlert(customView: m_vc.view)
        self.setOptions(forAlert: mapAlert, height: 200, vc: m_vc)
        
        //Table view controller
        let t_vc = (self.storyboard?.instantiateViewController(withIdentifier: "TableVc")) as! TableViewController
        t_vc.delegate = self
        self.tableAlert = LIHAlertManager.getCustomViewAlert(customView: t_vc.view)
        self.tableAlert?.autoCloseEnabled = false
        self.setOptions(forAlert: tableAlert, height: 176, vc: t_vc)
    }
    
    fileprivate func setOptions(forAlert alert: LIHAlert?, height: CGFloat, vc: UIViewController) {
        
        alert?.alertHeight = height
        alert?.initAlert(self.view)
        alert?.autoCloseTimeInterval = 3
        self.addChildViewController(vc)
        vc.didMove(toParentViewController: self)
    }
    
    
    @IBAction func showTablePressed(_ sender: UIButton) {
        
        self.tableAlert?.show(nil, hidden: nil)
    }
    
    
    @IBAction func showMapPressed(_ sender: UIButton) {
        
        self.mapAlert?.show(nil, hidden: nil)
    }
}


//MARK: - Table delegate methods
extension CustomAlertsViewController: TableDelegate {
    
    func optionSelected(text: String) {
        self.tableAlert?.hideAlert(nil)
        NSLog("\(text) selected")
    }
}
