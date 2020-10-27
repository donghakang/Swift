//
//  AdvTextViewController.swift
//  User Default
//
//  Created by Dongha Kang on 2020/10/27.
//

import UIKit

class AdvTextViewController: UIViewController {
    let path = NSHomeDirectory()+"/Documents/myTextfile.txt"        // 홈디렉토리 까지의 경로 + 문서 + txt
    
    var originalFrame: CGRect?                  // textView의 Frame
    @IBOutlet weak var textView: UITextView!
    
    
    
    @IBAction func cancel(_ sender: Any) {
        view.endEditing(true)       // 키보드를 내린다.
        readFromFile()              // 파일로부터 읽는다.
    }
    
    @IBAction func save(_ sender: Any) {
        view.endEditing(true)       // 키보드를 내린다.
        
        let textData = textView.text
        
        do {
            // text file 저장
            try textData?.write(toFile: path,
                                atomically: true,
                                encoding: .utf8)
        } catch let error as NSError {
            print("저장에 실패했습니다 \n\(error)")
        }
    }
    
    func readFromFile() {
        // 텍스트 데이터 읽기 시도
        do {
            let textData = try String(contentsOfFile: path,
                                      encoding: .utf8)
            textView.text = textData
        } catch let error as NSError {
            print("\(error) \n데이터 읽기 실패")
            textView.text = "ERROR! \(error)"
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        originalFrame = textView.frame      // 텍스트 뷰의 원래 frame을 저장한다.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        readFromFile()
        
        // 키보드 노티피케이션을 셋업한다.
        setupKeyboardNotifications()

    }
    
}



extension AdvTextViewController {
    func setupKeyboardNotifications() {
        // 키보드가 보여질 때
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_ :)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        // 키보드가 없어질때,
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }


    // 키보드가 보여진다.
    @objc func keyboardWillShow(_ notification:NSNotification) {
        let d = notification.userInfo!
        var r = (d[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        r = self.textView.convert(r, from:nil)
        self.textView.contentInset.bottom = r.size.height
        self.textView.verticalScrollIndicatorInsets.bottom = r.size.height

    }

    // 키보드가 없어진다.
    @objc func keyboardWillHide(_ notification:NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.textView.contentInset = contentInsets
        self.textView.verticalScrollIndicatorInsets = contentInsets
    }
    
}


    

