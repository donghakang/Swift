//
//  ViewController.swift
//  UIPickerView
//
//  Created by Dongha Kang on 2020/10/04.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
  

    @IBOutlet weak var myPickerView: UIPickerView!
    let compos = [["월", "화", "수", "목", "금"], ["새벽", "오전 중", "오후", "야간"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPickerView.delegate = self
        myPickerView.dataSource = self
    }


    // Component 갯수,
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return compos.count
    }
    
    // Component 항목 수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = compos[component]
        return compo.count
    }
    
    // Component의 너비
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 50
        } else {
            return 100
        }
    }
    
    // 선택한 컴포넌트, 행의 항목을 반환한다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = compos[component][row]
        return item
    }
    
    // 드럼을 회전하여, 항목 선택
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = compos[component][row]
        print("\(item)가/이 선택됐습니다.")

        // 현재 선택된 행 번호
        let row1 = pickerView.selectedRow(inComponent: 0)
        let row2 = pickerView.selectedRow(inComponent: 1)
        print("현재 선택된 행 번호 \(row1), \(row2)")

        // 현재 선택된 항목명
        let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
        let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
        print("현재 선택된 항목명 \(item1), \(item2)")
    }
}

