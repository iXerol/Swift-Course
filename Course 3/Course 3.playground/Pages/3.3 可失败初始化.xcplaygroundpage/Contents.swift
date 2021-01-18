//: [Previous](@previous)

//: ### 3.3 可失败初始化

//: 可失败的初始化方法会返回可空实例。在`init`关键字后添加`?`表示初始化方法可能失败。

class Student {
    var name: String
    var grade: String

    init?(name: String, grade: String) {
        guard !name.isEmpty,
              !grade.isEmpty else {
            return nil
        }
        self.name = name
        self.grade = grade
    }

    convenience init?(name: String) {
        self.init(name: name, grade: "小学二年级")
    }

    func introduce() {
        print("我是\(grade)学生\(name)")
    }
}

//: 可使用可空链式调用
let 张三 = Student(name: "张三", grade: "初中三年级")
let 李四 = Student(name: "李四")
let 无名氏 = Student(name: "")
张三?.introduce()
李四?.introduce()
无名氏?.introduce()

//: [Next](@next)
