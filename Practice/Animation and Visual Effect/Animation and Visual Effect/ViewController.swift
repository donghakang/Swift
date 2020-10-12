//
//  ViewController.swift
//  Animation and Visual Effect
//
//  Created by Dongha Kang on 2020/10/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public static let identifier = "ViewController"
    
    let animationList = [
        "타이머를 사용한 애니메이션",
        "이즈 인 앤 아웃",
        "여러 개의 애니메이션을 합성한다"
    ]
    
    // table view
    var myTableView = UITableView()
    
    var webData:(name:String, url:String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView = UITableView(frame: view.frame)
        myTableView.dataSource = self
        myTableView.delegate = self
        view.addSubview(myTableView)
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let animationData = animationList[indexPath.row]
        cell.textLabel?.text = animationData
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "toFirst", sender: self)
        case 1:
            performSegue(withIdentifier: "toSecond", sender: self)
        case 2:
            performSegue(withIdentifier: "toThird", sender: self)
        default:
            break
        }
    }
}
