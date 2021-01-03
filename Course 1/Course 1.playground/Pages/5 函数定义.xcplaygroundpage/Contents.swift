//: [Previous](@previous)

//: #### 无返回值
/// `- (void)greet1`
func greet1() {
    print("Hello World")
}
greet1()


//: #### 有参数
/// `- (void)greet2WithName:(nonnull NSString *)name`
func greet2(name: String) {
    print("Hello \(name)")
}
greet2(name: "山木")

//: #### 参数标签
// `- (void)greet3ToName:(nonnull NSString *)name`
func greet3(to name: String) {
    print("Hello \(name)")
}
greet3(to: "山木")

//: #### 缺省参数
/// `- (void)greet4ToName:(nonnull NSString *)name`
func greet4(to name: String = "山木") {
    print("Hello \(name)")
}
greet4()
greet4(to: "香辣虾")

//: #### 省略参数名
/// `- (void)greet5:(nonnull NSString *)name`
func greet5(_ name: String) {
    print("Hello \(name)")
}
greet5("山木")

//: #### 多参数，有返回值，提前退出
/// `- (void)greet6WithName:(nonnull NSString *)name toName:(nonnull NSString *)toName`
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
var result = greet6(name: "山木", to: "")
result = greet6(name: "山木", to: "香辣虾")

//: #### 无返回值实际是省略了 `-> ()` 或 `-> Void`。
//: `()`是空元组，`Void`是`()`的`typealias`。
/// `- (void)greet7:(nonnull NSString *)fromName toName:(nonnull NSString *)toName`
func greet7(_ fromName: String = "山木", to toName: String) -> () {
    print("\(fromName): Hello \(toName)")
}
greet7(to: "香辣虾")
greet7("山木", to: "香辣虾")

//: #### 变长参数 嵌套函数
func greet8(from fromName: String, to toNames: String ...) -> (total: Int, success: Int) {
    func checkName(_ name: String) ->Bool {
        return !name.isEmpty
    }
//: 函数体内定义的内容仅在函数体内可见，也就是作用域在函数体内
    guard checkName(fromName),
          !toNames.isEmpty else {
        return (toNames.count, 0)
    }
    var count = 0
    for name in toNames {
        guard !checkName(name) else { continue }
        print("\(fromName): Hello \(name)")
        count += 1
    }
    return (toNames.count, count)
}
var (total, success) = greet8(from: "山木", to: "香辣虾", "", "Snorlax", "", "Swift")
print("\(total) \(success)")

//: #### `inout` 参数
//: `inout` 参数必须使用 `var` 声明，不能有默认值。
func mySwap(_ a: inout Int, _ b: inout Int) {
    let c = a
    a = b
    b = c
}
mySwap(&total, &success)
print("\(total) \(success)")
