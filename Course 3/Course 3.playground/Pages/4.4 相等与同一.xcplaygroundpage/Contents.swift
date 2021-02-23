//: [Previous](@previous)

//: ### 4.4 相等与同一

//#-hidden-code
import Foundation

class ReferenceInt: CustomStringConvertible {
    var value: Int

    var description: String { "\(value)" }

    init(_ value: Int) {
        self.value = value
    }
}
//#-end-hidden-code

//#-editable-code
//: `===`同一运算符用于判断两个引用类型是否指向同一实例，相对应的`!==`不同运算符判断是否指向不同实例。

//: 引用类型均可通过`===`或`!==`运算符判断指向，即使运算符两端类型不同。
let refA = ReferenceInt(1)
let refB = refA
let str = "哔哩哔哩" as NSString
refA === refB
refA !== str
refB === str
//: 没有实现`==`方法的引用类型不能使用`==`运算符判等
// refA == refB

//: 值类型不能使用`===`与`!==`运算符判断同一，因为值类型一定是不同实例。
struct IntWrapper {
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        return lhs.value == rhs.value
//    }
}
let a = IntWrapper(1)
let b = IntWrapper(1)
//a === b
//: 值类型也需要实现`==`方法才能使用`==`运算符判等
//a == b

//: 继承自NSObject的对象，会自动将`==`运算符转发到`isEqual(_:)`
class Obj: NSObject {
    override func isEqual(_ object: Any?) -> Bool {
        print("2233")
        return true
    }
}

let obj1 = Obj()
let obj2 = Obj()
obj1 == obj2

//#-end-editable-code

//: [Next](@next)
