//: [Previous](@previous)

//: ### 1.4 递归枚举
//: 如果枚举的关联值类型中包含自身的话，需要在 `enum` 前或对应 `case` 前加上 `indirect` 把枚举标记为间接

//: 不加 `indirect` 会报错，因为编译器无法计算枚举会占用多少内存空间

//: 加了 `indirect` 后，编译器会把对应枚举作为指针存在其他内存区域，占用的内存就可以计算了。
indirect enum BinaryTreeInt {
    case leaf
    case node(value: Int, left: BinaryTreeInt, right: BinaryTreeInt)
}
print(MemoryLayout<BinaryTreeInt>.size) // 8，即64位指针所占用内存

enum BinaryTreeDouble {
    case leaf
    indirect case node(value: Double, left: BinaryTreeDouble, right: BinaryTreeDouble)
}
print(MemoryLayout<BinaryTreeDouble>.size) // 8，即64位指针所占用内存

//: [Next](@next)
