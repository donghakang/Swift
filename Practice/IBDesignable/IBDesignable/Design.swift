//
//  Design.swift
//  IBDesignable
//
//  Created by Dongha Kang on 2020/10/05.
//

import UIKit

// 버튼에 테두리 선을 설정하는 커스텀 Attributes 패널
@IBDesignable class BorderButton: UIButton {
    // 테두리 색
    @IBInspectable var borderColor: UIColor? {
//        get { return UIColor(cgColor: layer.borderColor!) }
//        set { layer.borderColor = newValue?.cgColor ?? nil }
        return .red
    }
    
    // 테두리 두께
    @IBInspectable var borderWidth: CGFloat = 3.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    // 테두리 둥글기
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0.0
        }
    }
    

}


// 라벨에 테두리 선을 설정하는 커스텀 Attributes 패널
@IBDesignable class BorderedLabel: UILabel {
    // 테두리 색
    @IBInspectable var borderColor: UIColor? {
        get { return UIColor(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue?.cgColor ?? nil }
    }
    
    // 테두리 두께
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    // 테두리 둥글기
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0.0
        }
    }
}
