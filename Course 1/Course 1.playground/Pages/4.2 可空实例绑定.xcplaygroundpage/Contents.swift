//: [Previous](@previous)
//: ### 4.2 可空实例绑定

let name: String? = "老王"
let age: Int? = 10

//: `if let` 将可空值绑定到新实例后，不需要强制解包，`if` 作用域内该新实例一定有值
if let nameNew = name,
    let ageNew = age {
    print(nameNew + String(ageNew))
}

//: if var的用法，和if let的区别就是可以在{}内修改变量的值
if var nameNew = name,
    let ageNew = age {
    nameNew = "老李"
    print(nameNew + String(ageNew))
}

//: `guard let` 除了确保非空之外，还使非空值能够在当前作用域访问，能够有效减少分支层级
guard let nameNew = name, let ageNew = age else {
    print("姓名 或 年龄 为nil")
    fatalError()
}
print(nameNew + String(ageNew))

//: [Next](@next)
