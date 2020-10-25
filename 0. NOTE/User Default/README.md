# User Default

UserDefaults 클래스의 standard property로 얻을 수 있는 오브젝트로 앱마다 있는 샌드박스 영역에 데이터를 읽고 쓸 수 있습니다.

읽기 전용
|type|
|-|
|```object(froKey:) -> Any?```|
|```string(froKey:) -> String?```|
|```array(froKey:) -> [Any]?```|
|```dictionary(froKey:) -> [String: Any]?```|
|```data(froKey:) -> Data?```|
|```stringArray(froKey:) -> [String]?```|
|```integer(froKey:) -> Integer?```|
|```float(froKey:) -> Float?```|
|```double(forKey:) -> Double?```|
|```bool(forKey:) -> Bool?```|
|```url(forKey:) -> URL?```

삭제 전용
|type|
|-|
|```removeObject(forKey:)```|

### 스위치 값을 유저 디폴트에 저장해 읽는다

```swift
class ViewController: UIViewController {

    @IBOutlet weak var mySwitch1: UISwitch!
    @IBOutlet weak var mySwitch2: UISwitch!

    @IBAction func saveStatus(sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(mySwitch1.isOn, forKey: "switchOn")        // switchOn 키로 지정해 저장.
    }

    @IBAction func readStatus(_ sender: Any) {
        let defaults = UserDefaults.standard                    // 유저 디폴트 참조
        mySwitch2.isOn = defaults.bool(forKey: "switchOn")      // Bool 형의 값을 읽는다
    }
}
```

### Float 값을 유저 디폴트에 저장해 Progress Bar 에 표시한다
```swift
import UIKit

class FloatViewController: UIViewController {
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var sliderLabel1: UILabel!

    @IBOutlet weak var progress2: UIProgressView!
    @IBOutlet weak var sliderLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func saveStatus(_ sender: Any) {
        let defaults = UserDefaults.standard            // User Default
        let value = slider1.value
        sliderLabel1.text = String(value)
        defaults.set(value, forKey: "sliderValue")      // slider1의 float 형 값을 'sliderValue'라는 키로 저장
    }
    @IBAction func readStatus(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let value = defaults.float(forKey: "sliderValue") // "sliderValue"키를 찾아 지정한다.
        sliderLabel2.text = String(value)
        progress2.progress = value
    }
}
```

### Array 값을 유저 디폴트에 저장해 print 한다
```swift
import UIKit

class ArrayViewController: UIViewController {

    @IBAction func getList(_ sender: Any) {
        let defaults = UserDefaults.standard
        if let theList = defaults.array(forKey: "myList") {
            print(theList)
        }
    }
    
    func saveStatus() {
        let list = [1,2,3]
        
        let defaults = UserDefaults.standard
        defaults.set(list, forKey: "myList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveStatus()
    }
}
```