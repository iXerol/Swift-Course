//: [Previous](@previous)

//: ### 4.5 写时复制（Copy On Write, COW）

//: Swift 中的容器类型（如上节课中介绍的数组、字典及字符串等）都是值类型。根据前几章节的知识点，这些容器类型每次赋值都会进行一次拷贝。对于元素很多的容器来说，这显然会产生极大的性能消耗，产生大量不必要的的副本。
//: Swift 对于这类容器，实现了写时复制的特性。写时复制是指对值类型的底层存储的隐式共享，让某个值类型的多个实例使用同一份底层存储，每个实例维护对底层存储的引用。当指向同一底层存储的某一实例需要进行修改时才会实际执行复制操作，使其使用另一份底层存储。

//: 如下图所示，在命令行项目中运行以下代码，在两处空行处打断点，可明显看出`String`的底层存储是引用类型，由`_StringObject`来管理。其中`BuiltIn.BridgeObject`类型的`_object`是真正存储的位置，`UInt64`类型的`_countAndFlagsBits`负责管理对于底层存储的引用计数。
var str = "abcdefghijklmnopqrstuvwxyz"
let strCopy = str
var strCopy2 = strCopy
let strCopy3 = strCopy

strCopy2 = "abc"
str = "abc"

print(str)

//: ![COW-1](COW-1.png)
//: ![COW-2](COW-2.png)

//: 写时复制不是免费提供给所有结构体的，Swift原生也只为容器类型做了写时复制的支持。如果自己定义的结构体也需要写时复制的特性，就需要开发者自行实现。

//: [Next](@next)
