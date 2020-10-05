//
//  TableViewController.swift
//  View and Image
//
//  Created by Dongha Kang on 2020/10/05.
//

import UIKit

struct View {
    var name: String
    var code: String
}



class TableViewController: UITableViewController {

    let controller: [View] = [View(name: "View and Labels", code: FirstViewController.identifier),
                              View(name: "Images", code: SecondViewController.identifier),
                              View(name: "Position & Boundary", code: ThirdViewController.identifier),
                              View(name: "Frames", code: FourthViewController.identifier),
                              View(name: "Stack View", code: FifthViewController.identifier),
                              View(name: "Stack View (programmatically)", code: SixthViewController.identifier),
                              View(name: "UI Table View", code: SeventhViewController.identifier),]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        cell.textLabel?.text = controller[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: controller[indexPath.row].code, sender: self)
        let nextVC = self.storyboard?.instantiateViewController(identifier: controller[indexPath.row].code)
        nextVC?.modalTransitionStyle = .flipHorizontal
        present(nextVC!, animated: true, completion: nil)
    }
  
}
