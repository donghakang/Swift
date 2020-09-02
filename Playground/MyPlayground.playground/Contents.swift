import UIKit

var str = "Hello, playground"

// 연산
1 + 1
10 - 100
100 * 100
10000 / 3
100 % 3


// 변수
var score = 100
score = 200
score = 100 + 200
score = score * 2

// 상수
let myAge1 = 20         // constant
let taxRate = 0.1       // 1. 상수 값 변경 불가
                        // 2. 변수 값 변경 무조건
                        // 3. 무조건 사용
                        
// 자료형 변수/상수
var itemCount:Int = 10
var height:Double = 1.71
var isOk:Bool     = true

var helloString   = "안녕"
var helloString2  = helloString + "하세요"
var fruit = "바나나"
var opinion = "저는 \(fruit)가 좋아요"

// 자료형 변환
let a = "100"
let b = Int(a)! * 5

let c = Int(123.45)             // 123

let gum:Int = 100
let pay = Double(gum) * 1.08    // 108  --> 사용자가 입력한 문자로 환산 (부동 소수)

let apple = 5
let message:String = "바나나 \(String(apple))개 ~"


// 조건문
var scoreNumber = 80
if scoreNumber > 50 {
    print("GOOD")
} else {
    print("BADD!")
}

var dice = 1
switch dice{
case 1:
    print("1입니다")
case 2, 5:
    print("1이 아닙니다")
default:
    print("모르겠습니다")
}

// 반복문
var d = 0
while (d < 100) {
    d += 7;
}

for i in 0...5 {         // 5 포함
    print(i)
}

for i in 0..<5 {         // 5 제외
    print(i)
}

for _ in 0...10{         // 반복만 하고 싶을 때
    print("clap")
}


// 배열
var intArr:[Int] = [1, 2, 3]
var strArr:[String] = ["A", "B"]

var intArr2:[Int] = Array(repeating: 0, count: 10)     // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  반복 배열
var strArr2:[String] = Array(repeating: "A", count: 2) // ["A", "A"]

var emptyArr:[String] = []                             // empty array
var emptyArr2 = [String]()

print(intArr2.count)
print(strArr[1])

for val in strArr {
    print("요소 \(val)")
}


strArr.append("C")              // ["A", "B", "C"]
strArr.insert("X", at: 1)       // ["A", "X", "B", "C"]
strArr.remove(at: 1)            // ["A", "B", "C"]
strArr.removeAll()              // []


var intArr3:[Int] = [4, 3, 1, 5, 2]
var sortedArr1 = intArr3.sorted(by: <)
var sortedArr2 = intArr3.sorted(by: >)


// 딕셔너리
var intdict1 = ["a": 1, "b":2, "c":3]       // key : value
var strDict1 = ["a": "가", "b": "나", "c": "다"]

var emptyDict1:[String:Int] = [:]
var emptyDict2 = [String:Int]()

intdict1.count

strDict1["c"]

for (key, value) in strDict1 {
    print("strDict[\(key), \(value)]")
}

strDict1["x"] = "타"
strDict1.removeValue(forKey: "b")


// 튜플
var tuple1 = ( 1, 2, 3 )
let tuple2 = ( 100, "서울 특별시")

print(tuple1.0)                   // 값 부르기
var (one, two, three) = tuple1

let tuple3 = (postcode: 100000, address: "서울시 광진구")
print(tuple3.postcode)


// 함수
func calcBMI (name: String, height:Double, weight:Double) {     // 매개 함수
    let heightM = height / 100.0
    let BMI:Double = weight / (heightM * heightM)
    print("\(name)의 BMI는 \(BMI)입니다")
}

calcBMI(name: "강동하", height: 176, weight: 87.7)

func hello(name: String) -> String {
    return "Hi \(name)"                                         // 반환 함수
}
let hi = hello(name: "강동하")

func calcTax(price: Double) -> (Double, Double) {
    let tax = price * 0.1
    let excludingTax = price * 0.9
    return (tax, excludingTax)
}
let (tax, excludingTax) = calcTax(price: 300)


// Optional
var testInt2:Int? = nil                                         // nil이 들어갈 수 있지는 않을까?

var testInt3:Int? = 10
var testInt4:Int? = testInt3                                    // Optional은 Optional끼리만

var testInt5:Int? = 10
var answer = testInt5! + 20                                     // unwrap optional!
var testInt6:Int? = 10
var testInt7:Int! = testInt6                                    // 암묵적인 언랩 자료형의 변수 값
var answer2 = testInt7 + 20

var testInt8:Int? = 10
if let temp = testInt8 {                                        // Optional 바인딩 (반강제적 언랩)
    print(temp)                                                 // nil 이 아니라면 실행
}

func testGuard(_ testInt:Int?) {
    guard let temp = testInt else {
        return
    }
    print(temp)
}

let testInt9:Int? = 20
testGuard(testInt9)


let testString = "100"
let testInt10:Int? = Int(testString)
if let temp = testInt10 {
    print(temp)
}


var test1:Int? = 10
var temp:Int!  = test1
var test2:Int  = temp
