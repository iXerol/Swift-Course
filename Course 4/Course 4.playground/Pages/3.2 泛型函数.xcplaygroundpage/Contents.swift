//: [Previous](@previous)

//: ### 3.2 泛型函数与方法

//: 函数/方法也可以声明为泛型，声明在函数名后参数前。
extension Array {
//: 比如可以扩展数组，自己实现与`map(_:)`方法
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        for element in self {
            result.append(transform(element))
        }
        return result
    }
}

let arr = [1, 2, 3, 22, 33, 0]
let mapped = arr.myMap { Int($0) }
mapped


//: [Next](@next)
