//: [Previous](@previous)

//:可选类型 Optional 是一个含有两种情况的枚举，None 和 Some(T)，用来表示可能有或可能没有值
var optionalInteger: Int?
var optionalInteger2: Optional<Int>

//:如果一个可选类型的实例包含一个值，你可以用后缀操作符 ！来访问这个值
optionalInteger = 42
optionalInteger!

//:⚠️慎用！  使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前，一定要确定可选包含一个非nil的值。
//optionalInteger2!


//:自动解析 你可以在声明可选变量时使用感叹号（!）替换问号（?）。这样可选变量在使用时就不需要再加一个感叹号（!）来获取值，它会自动解析
var myString: String!
myString = "Hello, Swift!"
print(myString)


//；可选绑定
var myString2: String?
myString2 = "Hello, Swift!"
if let yourString = myString2 {
   print("你的字符串值为 - \(yourString)")
}else{
   print("你的字符串没有值")
}

//: [Next](@next)
