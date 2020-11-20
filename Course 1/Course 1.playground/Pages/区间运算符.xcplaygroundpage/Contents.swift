//: [Previous](@previous)

//: `...` 表示包含首尾元素闭区间，首尾元素类型必须相同、首元素不可大于尾元素
for index in 1 ... 5 {
    print("\(index) 乘 5 等于 \(index * 5)")
}

1 ... 1
// 1 ... 0
// (1 as Int) ... 4.2

//: `..<` 表示含首不含尾的半开区间，同样要求类型相同
//: 首元素不可大于尾元素，当首元素等于尾元素时为空区间
for index in 1 ..< 2 {
    print(index)
}

1 ..< 1
// 1 ..< 0

//: 单侧区间
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[2...] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

//: 单侧区间可以在其他上下文中使用，不仅仅是下标。例如遍历根本不知道该从哪里开始，你可以遍历省略了最终值的单侧区间。
//: 由于区间无限连续，你要确保给循环添加一个显式的条件。你同样可以检测单侧区间是否包含特定的值
let range = ...5
range ~= 5
range ~= 0
range ~= 6
//: ~=运算符与 contains 等价，即判断区间是否包含特定元素
range.contains(-1)

//: [Next](@next)
