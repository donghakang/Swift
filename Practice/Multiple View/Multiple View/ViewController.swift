//
//  ViewController.swift
//  Multiple View
//
//  Created by Dongha Kang on 2020/09/01.
//  Copyright © 2020 Dongha Kang. All rights reserved.
//

import UIKit
import GameplayKit          // random 을 위한

class ViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    
    let randomSource = GKARC4RandomSource()
    var colorR = 0
    var colorG = 0
    var colorB = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        colorR = randomSource.nextInt(upperBound: 256)
        colorG = randomSource.nextInt(upperBound: 256)
        colorB = randomSource.nextInt(upperBound: 256)
        colorLabel.text = "R=\(colorR), G=\(colorG), B=\(colorB)"
    }

    @IBAction func returnTop(segue: UIStoryboardSegue) {
        
    }
    
    // 1 에서 다음 화면으로 넘어갈때, 실행되는 코드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextvc = segue.destination as! ColorViewController
        
        nextvc.colorR = colorR
        nextvc.colorG = colorG
        nextvc.colorB = colorB
    }
    
}

