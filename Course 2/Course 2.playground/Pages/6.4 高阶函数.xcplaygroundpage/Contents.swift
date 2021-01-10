//: [Previous](@previous)

//: ### 6.4 高阶函数

//: 近几年的语言大多引入了函数式编程的思想，最典型的特点就是高阶函数的应用。

//: #### `map`将序列中的元素映射为另一个值，输出一个新数组
let numbers = [22, 33, 2233, -2233]
let strings = numbers.map { String($0) }
print(strings) // ["22", "33", "2233", "-2233"]

//: #### `compactMap`去除`map`后序列中的空元素
let possibleNumbers = ["1", "2", "three", "///4///", "5"]
let mapped = possibleNumbers.map { str in Int(str) } // [Int?]
print(mapped) // [1, 2, nil, nil, 5]
let compactMapped = possibleNumbers.compactMap { str in Int(str) } // [Int]
print(compactMapped) // [1, 2, 5]

//: #### `flatMap`展开`map`后的二维数组
let mappedTripleNumbers = numbers.map { [$0, $0, $0] } // [[Int]]
print(mappedTripleNumbers) // [[22, 22, 22], [33, 33, 33], [2233, 2233, 2233], [-2233, -2233, -2233]]
let flatMappedTripleNumbers = numbers.flatMap { [$0, $0, $0] } // [Int]
print(flatMappedTripleNumbers) // [22, 22, 22, 33, 33, 33, 2233, 2233, 2233, -2233, -2233, -2233]

//: #### `filter`筛选出符合条件的元素组成新数组
let smallNumbers = numbers.filter { $0 < 100 }
print(smallNumbers)

//: #### `reduce`将所有元素通过闭包中的运算合并为一个值
let sum = numbers.reduce(0, +)
print(sum)
//: `reduce`可定制化程度很高，也可以使用`reduce`实现类似`map`的操作
let reduceMapped = numbers.reduce([]) {
    let str = String($1)
    return $0 + [str]
}
print(reduceMapped)

//: [Next](@next)
