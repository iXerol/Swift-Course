//: [Previous](@previous)

//: (a...b ）包含a和 b，a的值不能大于b
for index in 1...5 {
    print("\(index) time 5 is \(index * 5)")
}

//:（ a..<b ）包含a不包含b， a的值也不能大于b，如果a与b的值相等，区间为空
let chars  = ["a", "b", "c", "d"]
for index in 0..<chars.count {
    print("char is \(chars[index])")
}

//:单侧区间
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[2...] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

//:单侧区间可以在其他上下文中使用，不仅仅是下标。例如遍历根本不知道该从哪里开始。你可以遍历省略了最终值的单侧区间；总之，由于区间无限连续，你要确保给循环添加一个显式的条件。你同样可以检测单侧区间是否包含特定的值
let range = ...5
range.contains(7)
range.contains(-1)


//: [Next](@next)
