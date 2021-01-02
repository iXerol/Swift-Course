//: [Previous](@previous)

//: ### 3.2 修改及遍历数组

//: 添加、移除元素的方式与字符串类似。
//: 只有`var`声明的可变数组可以修改，`let`声明的数组不可修改。
var numbers = [22, 33]
//: 添加元素
numbers += [2233]
numbers.append(-22)
numbers.append(contentsOf: [-33])
numbers.insert(233, at: 3)
print(numbers)
//: 移除元素
numbers.removeLast()
numbers.removeFirst(2)
numbers.remove(at: 2)
print(numbers)
numbers.removeAll()
print(numbers)
//: 不可变数组
numbers = [22, 33, 2233]
let immutableNumbers = numbers
//immutableNumbers.append(0)

//: 通过数字下标访问元素，也可通过下标修改（字符串不可通过下标修改）。
//: 下标越界会在运行时报错 crash。
print(numbers[0])
numbers[0] = 2222
print(numbers)
//print(numbers[3])

//: 使用`for-in`循环遍历数组
for number in numbers {
    print(number)
}
//: 使用`enumerated()`方法可同时访问元素对应下标
for (index, number) in numbers.enumerated() {
    print("\(number) is at \(index)")
}
//: 使用`reversed()`方法逆序遍历
//: 可与`enumerated()`一起使用，调换两方法顺序后`index`数值会相反
for (index, number) in numbers.enumerated().reversed() {
    print("\(number) is at \(index)")
}
for (index, number) in numbers.reversed().enumerated() {
    print("\(number) is at \(index)")
}

//: [Next](@next)
