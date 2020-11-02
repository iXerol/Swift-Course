//: [Previous](@previous)

//:for-in 遍历一个集合里面的所有元素，例如由数字表示的区间、数组中的元素、字符串中的字符
let animals = ["spider": 8, "car": 4, "ant": 6]
for (animal, count) in animals {
    print("\(animal)s have \(count) legs")
}

//:stride(from:to:by:)可以跳过不想要的标记
let minutes = 60
let interval = 5
for tick in stride(from: 0, to:minutes, by:interval) {
    print(tick)
}

//: [Next](@next)
