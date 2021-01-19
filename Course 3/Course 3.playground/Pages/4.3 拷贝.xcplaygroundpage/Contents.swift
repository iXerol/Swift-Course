//: [Previous](@previous)

//: ### 4.3 拷贝（copy）

class ReferenceInt: CustomStringConvertible {
    var value: Int

    var description: String { "\(value)" }

    init(_ value: Int) {
        self.value = value
    }
}

//: 拷贝数组，所有值都被拷贝了一份。
let integers = [ReferenceInt(22), ReferenceInt(33), ReferenceInt(0)]
var integersCopy = integers
integersCopy.append(ReferenceInt(233))
integers
integersCopy

//: 虽然拷贝了数组，但这是浅拷贝，只复制了内部的引用而没有新建相等的值。数组元素的引用仍指向同一实例，对任意引用对象的修改都会反映到另一数组元素中。
integers.last?.value = 10
integers
integersCopy

//: Swift 没有提供深拷贝，如果需要深拷贝需要自行实现。

//: [Next](@next)
