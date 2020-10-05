//
//  FourthViewController.swift
//  View and Image
//
//  Created by Dongha Kang on 2020/10/05.
//

/*
 Frame 은 뷰 영역을 나타내는 Property 입니다.
 Frame은 x, y, width, height로 구성됩니다.
 Frame은 origin, size를 가진 CGRect 형이며, origin은 CGPoint 형 값이고, size는 width, height을 나타내는 CGSize 형 값입니다.
 */

import UIKit

class FourthViewController: UIViewController {

    static let identifier = "View4"
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var img: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        img.contentMode = .scaleAspectFill
        
    }
    
    @IBAction func changedFrame(_ sender:  Any) {
        let index = segmentControl.selectedSegmentIndex
        switch index {
        case 0:
            // 크게 표시
            img.backgroundColor = .red
            img.frame = CGRect(x: 20, y: 100, width: 320, height: 240)
        case 1:
            // 작게 표시
            img.backgroundColor = .blue
            img.frame = CGRect(x: 110, y: 160, width: 160, height: 120)
        default:
            img.frame = CGRect(x: 20, y: 100, width: 320, height: 240)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
