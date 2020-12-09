//: [Previous](@previous)

//: 无返回值
func greet1() {
    print("Hello World")
}
greet1()


//: 有参数
func greet2(name: String) {
    print("Hello \(name)")
}
greet2(name: "yamaki")

//: 参数标签
func greet3(to name: String) {
    print("Hello \(name)")
}
greet3(to: "yamaki")

//: 缺省参数
func greet4(to name: String = "yamaki") {
    print("Hello \(name)")
}
greet4()
greet4(to: "xianglaxia")

//: 省略参数名
func greet5(_ name: String) {
    //    name = "World"
    print("Hello \(name)")
}
greet5("yamaki")

//: 多参数，有返回值，提前退出
func greet6(name: String, to toName: String) -> Bool {
//    if (name.isEmpty || toName.isEmpty) {
//        return false
//    }
    guard !name.isEmpty, !toName.isEmpty else {
        return false
    }
    print("\(name): Hello \(toName)")
    return true
}
var result = greet6(name: "yamaki", to: "")
result = greet6(name: "yamaki", to: "xianglaxia")

//: 无返回值实际是省略了 `-> ()` 或 `-> Void`
func greet7(_ fromName: String = "yamaki", to toName: String) -> () {
    print("\(fromName): Hello \(toName)")
}
greet7(to: "xianglaxia")
greet7("yamaki", to: "xianglaxia")

//: 变长参数
func greet8(from fromName: String, to toNames: String ...) -> (total: Int, success: Int) {
    guard !fromName.isEmpty, !toNames.isEmpty else {
        return (toNames.count, 0)
    }
    var count = 0
    for name in toNames {
        guard !name.isEmpty else { continue }
        print("\(fromName): Hello \(name)")
        count += 1
    }
    return (toNames.count, count)
}
var (total, success) = greet8(from: "yamaki", to: "xianglaxia", "", "Snorlax", "", "Swift")
print("\(total) \(success)")

//： `inout` 参数
func mySwap(_ a: inout Int, _ b: inout Int) {
    let c = a
    a = b
    b = c
}
mySwap(&total, &success)
print("\(total) \(success)")
