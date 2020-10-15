//
//  ViewController.swift
//  Core Graphic
//
//  Created by Dongha Kang on 2020/10/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public static let identifier = "ViewController"

    // web list
    let webList = [
        "사각형 도형 이미지",
        "테두리 둥근 사각형 도형 이미지",
        "타원형 도형 이미지",
        "원호 그리기",
        "부채꼴 그리기",
        "핵분율 그래프"
    ]
    
    // table view
    var myTableView = UITableView()
    
    var webData:(name:String, url:String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "도형 모음집"
        
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
        } else if indexPath.row == 2 {
            performSegue(withIdentifier: "toThird", sender: self)
        } else if indexPath.row == 3 {
            performSegue(withIdentifier: "toFourth", sender: self)
        } else if indexPath.row == 4 {
            performSegue(withIdentifier: "toFifth", sender: self)
        } else if indexPath.row == 5 {
            performSegue(withIdentifier: "toSixth", sender: self)
        }
    }
}
