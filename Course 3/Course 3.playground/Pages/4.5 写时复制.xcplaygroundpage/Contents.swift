//: [Previous](@previous)

//: ### 4.5 写时复制（Copy On Write, COW）

//: Swift 中的容器类型（如上节课中介绍的数组、字典及字符串等）都是值类型。根据前几章节的知识点，这些容器类型每次赋值都会进行一次拷贝。对于元素很多的容器来说，这显然会产生极大的性能消耗，产生大量不必要的的副本。
//: Swift 对于这类容器，实现了写时复制的特性。写时复制是指对值类型的底层存储的隐式共享，让某个值类型的多个实例使用同一份底层存储，每个实例维护对底层存储的引用。当指向同一底层存储的某一实例需要进行修改时才会实际执行复制操作，使其使用另一份底层存储。

//: 可以参考[喵神的样例代码](https://gist.github.com/onevcat/bbad1fcc1e9575ab1c0a8c1e1e659e30)（如下，进行了少量修改），可以观察到不同类型在复制后内存地址的变化。
import Foundation
var a = 123
var cpa = a

class Miao {}
var c = Miao()
var cc = c

struct S {
    let value: Int
}
var s = S(value: 5)
var cps = s

var likes = ["comedy", "animation", "movies"]
var cpLikes = likes

var str = "str"
var cpStr = str

func address<T: AnyObject>(of object: T) -> String {
    let addr = unsafeBitCast(object, to: Int.self)
    return String(format: "%p", addr)
}

func address(of object: UnsafeRawPointer) -> String {
    let addr = Int(bitPattern: object)
    return String(format: "%p", addr)
}

print("Class")
print(address(of: c))
print(address(of: cc))

print("Int")
print(address(of: &a))
print(address(of: &cpa))

print("Struct")
print(address(of: &s))
print(address(of: &cps))

print("Array")
print(address(of: &likes))
print(address(of: &cpLikes))

likes += ["opera"]
cpLikes += ["opera"]
print("Array After Write")
print(address(of: &likes))
print(address(of: &cpLikes))

//: 容器类型并不是一定触发写时复制机制。当容器内元素较少时直接复制效率可能更高，此时Swift内部也会选择直接复制。根据Swift编译器版本、运行时环境的不同，触发写时复制的条件也可能不同。
//: 写时复制不是免费提供给所有结构体的，Swift原生也只为容器类型做了写时复制的支持。如果自己定义的结构体也需要写时复制的特性，就需要开发者自行实现。

//: [Next](@next)
