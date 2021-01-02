//: [Previous](@previous)

//: ### 4.2 修改及遍历字典

//: 只有`var`声明的可变字典可以修改，`let`声明的字典不可修改。
var airports = ["PVG":"上海浦东国际机场",
                "SHA":"上海虹桥国际机场"]

//: #### 添加或更新值（推荐使用下标方式）
airports.updateValue("香港国际机场", forKey: "HKG")
airports["NRT"] = "成田国际机场"
print(airports)
//: #### 移除值（推荐使用下标方式）
airports.removeValue(forKey: "HKG")
airports["NRT"] = nil
print(airports)
//: #### 不可变数组
let immutableAirports = airports
//immutableNumbers["HKG"] = "香港国际机场"

//: #### 访问值
//: 通过下标访问字典返回可空值，因为对应key可能不存在
if let sha = airports["SHA"] {
    print("\(sha)'s code is SHA'")
} else {
    print("code SHA not found")
}
//: 也可设置无对应key时的默认值，此时不会返回可空类型
let nrt = airports["NRT", default: "unknown"]
print(nrt)

//: #### 使用`for-in`循环遍历字典
for (airportCode, airportName) in airports {
    print("\(airportName)'s code is \(airportCode)")
}

//: #### 将字典转换为数组
let airportCodes = Array(airports.keys)
print(airportCodes)
let airportNames = Array(airports.values)
print(airportNames)

//: [Next](@next)
