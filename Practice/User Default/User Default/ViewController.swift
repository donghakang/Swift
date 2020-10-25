//
//  ViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/25
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public static let identifier = "ViewController"

    // web list
    let webList = [
        "Bool",
        "Float"
    ]
    
    // table view
    var myTableView = UITableView()
    
    var webData:(name:String, url:String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "User Default"
        
        myTableView = UITableView(frame: view.frame)
        myTableView.dataSource = self
        myTableView.delegate = self
        view.addSubview(myTableView)
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let webData = webList[indexPath.row]
        cell.textLabel?.text = webData
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "toFirst", sender: self)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "toSecond", sender: self)
        }
    }
}
