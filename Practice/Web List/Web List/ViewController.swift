//
//  ViewController.swift
//  Web List
//
//  Created by Dongha Kang on 2020/10/09.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public static let identifier = "ViewController"

    let webList = [
        (name:"애플", url:"http://www.apple.com/kr/"),
        (name:"구글", url:"http://www.google.com"),
        (name:"네이버", url:"http://www.naver.com"),
        (name:"위키북스", url:"http://wikibook.co.kr/"),
    ]
    
    var myTableView = UITableView()
    
    var webData:(name:String, url:String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView = UITableView(frame: view.frame)
        myTableView.dataSource = self
        myTableView.delegate = self
        view.addSubview(myTableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext" {
            (segue.destination as! WebViewController).data = webData
        }
    }
    
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let webData = webList[indexPath.row]
        cell.textLabel?.text = webData.name
        cell.detailTextLabel?.text = webData.url
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        webData = webList[indexPath.row]
        performSegue(withIdentifier: "toNext", sender: self)
    }
}

