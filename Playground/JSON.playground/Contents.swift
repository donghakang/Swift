import UIKit

// 테스트 전용 JSON 데이터 준비
var jsonString1 = "[100, 200]"
var jsonData1   = jsonString1.data(using: String.Encoding.utf8)

// JSON 데이터 파싱
do {
    let array = try JSONSerialization.jsonObject(with: jsonData1!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
    //파싱되면...
    print(array)
} catch {
    print("error")
}



var jsonString2 = "{\"A\":100, \"B\":200}"
var jsonData2   = jsonString2.data(using: String.Encoding.utf8)

do {
    let dictionary = try JSONSerialization.jsonObject(with: jsonData2!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
    print(dictionary)
} catch {
    print("error")
}

