//
//  ViewController.swift
//  FontList
//
//  Created by Dongha Kang on 2020/09/02.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var fontNameArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 폰트 패밀리 이름 탐색
        for fontFamilyName in UIFont.familyNames {
            // 폰트패밀리 기반으로 폰트 탐색
            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName as String) {
                // 폰트를 어레이 안에 삽입
                fontNameArray.append(fontName as String)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 만들기
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        // 해당 셀에 폰트 이름 추출
        let fontName = fontNameArray[indexPath.row]
        
        // 텍스트 레이블에 지정한 폰트로 샘플 문자 출력
        cell.textLabel?.font = UIFont(name: fontName, size: 18)
        cell.textLabel?.text = "ABCDE abcde 012345 가나다라마"
        
        // 서브텍스트에 폰트 이름을 출력
        cell.detailTextLabel?.text = fontName
        cell.detailTextLabel?.textColor = .brown
        
        return cell
    }
    

}

