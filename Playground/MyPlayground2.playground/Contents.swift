import UIKit

class calcPrice {
    var price:Double = 0
    
    func getTax() -> Double {
        return price * 0.1
    }
    
    func getExcludingTax() -> Double {
        return price - getTax()
    }
}


let apple = calcPrice()
apple.price = 3000

print("부가가치세는 \(apple.getTax()) 원")
print("부가가치세를 제외한 가격은 \(apple.getExcludingTax())원")


// 이미 만들어져 있는 class
let switch1 = UISwitch()

switch1.isOn = true


// 상속 과 오버라이드
class MySwitch : UISwitch {             // UISwitch 클래스를 상속, 새로운 스위치 클래스 제작
    required init?(coder aDecoder : NSCoder) {
        fatalError()                    // UIKit 을 상속할 때 필요한 처리를 합니다.
    }
    
    override init(frame: CGRect) {      // 초기화 할 때에 호출 되는 init을 수정 (오버라이드)
        super.init(frame: frame)        // 스위치를 초기화하는 때에 부모가 관련 처리를 함 (super는 부모)
        self.onTintColor = UIColor.red  // 부모의 초기화가 끝나면, 스위치를 붉은색으로 변경
    }
}


let switch2 = MySwitch()
switch2.isOn = true
