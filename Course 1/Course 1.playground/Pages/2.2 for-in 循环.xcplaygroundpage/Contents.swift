//: [Previous](@previous)
//: ### 2.2 `for-in` 循环

//: `for-in` 遍历一个集合里面的所有元素
//: 例如由数字表示的区间、数组中的元素、字符串中的字符
for index in 1 ... 5 {
    print("\(index) 乘 5 等于 \(index * 5)")
}

let characters = ["a", "b", "c", "d"]
for character in characters {
    print("character \(character)")
}

let animals = ["spider": 8, "car": 4, "ant": 6]
for (animal, count) in animals {
    print("\(animal)s have \(count) legs")
}

//: 没有 C 风格的 `for` 循环
//: 如果需要步长不为 1 的数字循环，可使用 `stride(from:to:by:)`
let minutes = 60
let interval = 5
for tick in stride(from: 0, to: minutes, by: interval) {
    print(tick)
}

//: 使用 `where` 子句可以更好地控制循环代码何时执行
//: 建议使用循环 + `where` 语法取代在循环内嵌一层 `if` 的写法
for num in 1 ... 10 where num % 2 == 0 {
    print("\(num) 是偶数")
}

//: [Next](@next)
