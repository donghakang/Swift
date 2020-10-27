//
//  TextViewController.swift
//  User Default
//
//  Created by Dongha Kang on 2020/10/27.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var textView2: UITextView!
    
    let path = NSHomeDirectory()+"/Documents/myTextfile.txt"        // 홈디렉토리 까지의 경로 + 문서 + txt
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 파일매니저를 이용하여 파일이 존재하는지 확인한다.
        /// 특정 파일이 없으면 중단한다.
        let fileManager = FileManager.default
        
        guard (fileManager.fileExists(atPath: path) == true) else {
            return
        }
        
        print(NSHomeDirectory())
        print(path)
    }
    
    
    // 지정된 파일에 저장한다.
    @IBAction func saveButton(_ sender: Any) {
        view.endEditing(true)       // 키보드를 내린다.
        
        let textData = textView1.text
        
        do {
            // text file 저장
            
            try textData?.write(toFile: path,
                                atomically: true,
                                encoding: .utf8)
            
        } catch let error as NSError {
            print("저장에 실패했습니다 \n\(error)")
        }
    }
    
    // 파일로 부터 읽는다.
    @IBAction func loadButton(_ sender: Any) {
        // 텍스트 데이터 읽기를 시도한다.
        do {
            let textData = try String(contentsOfFile: path, encoding: .utf8)
            textView2.text = textData
        } catch let error as NSError {
            print("불러오기에 실패했습니다. \n\(error)")
            textView2.text = "\(error)"
        }
    }
    
}
