//
//  ViewController.swift
//  Table Test
//
//  Created by Dongha Kang on 2020/09/02.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

// TableView의 기능을 view controller에게 사용할수 있도록 허락
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let testArray = ["사과", "배", "바나나", "딸기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10;          // 10개의 셀 (행)을 출력
        return testArray.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")           // 셀 설정
//        cell.textLabel?.text = "문자열"                                                    // 셀 정의
        cell.textLabel?.text = String(indexPath.row + 1) + ". " + testArray[indexPath.row]             // test array 에 있는거 출력
        cell.detailTextLabel?.text = "서브타이틀 입니다"                                        // subtitle

        /*
         cell.imageView?.image = UIImage(named: "-.png")             // 이미지 넣기
         cell.textLabel?.textColor = .red
         cell.backgroundColor = .black
         cell.textLabel?.font = UIFont.systemFont(ofSize: 24)
         cell.accessoryType = UITableViewCellAcessroyType.checkmark         // cell의 악세서리 모양
         
         */
        
    
    
        return cell
    }
    
    // 타이틀 문자열 부터, 푸터 문자열을 섹션이라고 하는데 그것의 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    // 헤더 문자열
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "타이틀 문자열"
    }
    
    // 푸터 문자열
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "푸터. 문자열"
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 3.0
//    }     --> 높이
    
    
}

