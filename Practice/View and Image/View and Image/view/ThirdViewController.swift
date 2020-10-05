//
//  ThirdViewController.swift
//  View and Image
//
//  Created by Dongha Kang on 2020/10/05.
//

import UIKit

class ThirdViewController: UIViewController {

    static let identifier = "View3"
    
    
    let myCar = UIImageView(frame: CGRect(x: 100, y: 150, width: 200, height: 100))
    let homePoint = CGPoint(x: 100, y: 150)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCar()
        
    }
    
    func setupCar() {
        myCar.contentMode = .scaleAspectFit
        myCar.image = UIImage(named: "car")
        myCar.center = homePoint
        self.view.addSubview(myCar)
    }
    
    @IBAction func goHome(_ sender: Any) {
        myCar.center = homePoint
    }
    
    @IBAction func move(_ sender: Any) {
        myCar.center.x += 10
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
