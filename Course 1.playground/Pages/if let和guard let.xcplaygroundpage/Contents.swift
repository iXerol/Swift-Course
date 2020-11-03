//: [Previous](@previous)

//:如果常量是可选项（Optional），if判断后仍然需要解包（!）, 如果常量是可选项（Optional）
let name: String? = "老王"
let age: Int? = 10

if name != nil && age != nil {
    print(name! + String(age!))
}

//:if let判断后不需要解包（!），{ }内一定有值
if let nameNew = name,
    let ageNew = age {
    print(nameNew + String(ageNew))
}

//:if var的用法，和if let的区别就是可以在{}内修改变量的值
if var nameNew = name,
    let ageNew = age {
    nameNew = "老李"
    print(nameNew + String(ageNew))
}

//:guard let和if let刚好相反，guard let守护一定有值。如果没有，直接返回， else分句里的代码会在条件不为真的时候执行
//:guard let是降低分支层次的办法
guard let nameNew = name, let ageNew = age else {
    print("姓名 或 年龄 为nil")
    fatalError()
}
print(nameNew + String(ageNew))


//: [Next](@next)
