//
//  TableViewController.swift
//  LIHAlert
//
//  Created by Lasith Hettiarachchi on 2/23/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

protocol TableDelegate {
    func optionSelected(text: String)
}

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: TableDelegate?
    
    fileprivate var options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = self.options[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.delegate?.optionSelected(text: self.options[indexPath.row])
    }
}
