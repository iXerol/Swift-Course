# Swift 培训大纲

## 面向群体及目的

面向主要使用 Objective-C 进行开发的 iOS 一线开发人员，对 iOS 和 Cocoa 的设计模式有一定了解但对 Swift 不够熟悉。

## Why Swift?

Swift 的优势：[现代化、安全性、快速](https://developer.apple.com/swift/)

背景：Apple 大力推广，越来越多 Swift-only API。在 iOS 12.2, Xcode 10.2, Swift 5.0 之后，Swift ABI 稳定。

工具：REPL、Playground 等环境易于学习、实验

## Session 1 [Swift Language Guide](https://docs.swift.org/swift-book/)

### 课时一 基础

对应章节：The Basic 大半、Basic Operators、Control Flow、Enumerations

#### 类型、常量、变量

1. 常量变量声明、类型安全
    - 类型检查 (type checking)
    - 类型推断 (type inference)
    - 类型注解 (type annotation) 显式声明类型
2. 带过数字、布尔、字符串、元组、容器类型 (暂时跳过可空类型)
3. print、字符串插值 (Hello World)

#### 运算符

1. 赋值、基本数字运算 (含溢出) 、复合运算符 (+= 等)
2. 比较运算符、逻辑运算符
3. 三元运算符
4. `...` `..<` 创建 range，`~=` 判断 range 是否包含特定值
5. 自定义运算符、优先级

#### 控制流

##### 条件

1. if-else
2. switch
    - 基本匹配，default
    - 多值匹配，range 匹配
    - 元组、值绑定
    - where 模式匹配
    - break, fallthrough (不建议)
    - guard
    - 意义：语义清晰、提早退出避免 if 多层嵌套

##### 循环

1. for-in
2. while
3. repeat-while
4. where 模式匹配
5. continue, break
6. 标签声明

#### 可空类型

1. 声明并 print (Optional(1))
2. 判断空值、强制解包
3. 可空实例绑定 (if let, guard let)
4. 隐式解包 ([Swift 4.2 起不再是 ImplicitlyUnwrappedOptional 类型](https://swift.org/blog/iuo/))
5. 可空链式调用
6. ?? 运算符
7. 多重 optional

#### 函数

1. 基本定义
2. 参数
    - 参数名
    - 默认参数值
    - 参数标签
    - 变长参数
    - inout
3. 返回值
    - 无返回值
    - 多返回值
    - 忽略返回值
4. 嵌套、作用域
5. 函数类型
6. 提前退出
7. Void

### 课时二 枚举、字符串、容器、闭包

#### 枚举

1. 基本定义
2. 关联值
3. 原始值、默认原始值
4. 配合 switch 的用法
    - 遍历
    - 值绑定
5. 方法
6. 递归 (indirect)
7. Optional 也是枚举，some 与 none

#### 字符串

1. 字面量声明 (单行 "、多行 """)
2. 转义字符、特殊字符、Unicode 标量，避免转义的字面量扩展声明方式 #"
3. var 声明，+=、赋值、append、removeLast 等方法修改字符串内容
4. 字符与遍历
    - for-in
    - count 非字节数（为了保证 Unicode 安全）
    - index 非数字（为了保证 Unicode 安全）
    - 下标语法（index 与 range）
5. Unicode
    - Unicode 码位与字符平面
    - UTF-8， UTF-16， UTF-32等编码。根据编码与字符的码位，单个字符所占空间非定值
    - 标准等价，如 é é，ビ ビ
6. 字符串比较与判空
7. Substring
8. 其他常用方法

#### 数组

1. 创建数组，不同声明方式（建议使用方括号语法）
2. 访问与修改
    - for-in，enumerated 带 index，reversed 逆序
    - 下标访问
    - append、remove(at:)、修改特定元素
3. 判等、判空
4. 不可变数组
5. ArraySlice
6. 其他常用方法

#### 字典

1. 创建字典，不同声明方式（建议使用方括号语法）
2. 要求 key hashable（不描述协议，目前所介绍的类型皆为 hashable）
3. 访问和修改
    - 访问返回 Optional
    - 添加值
    - 修改值
    - 删除值
    - 使用 key value 元组遍历，遍历 keys，遍历 values
4. 不可变字典
5. 其他常用方法

#### 集合

1. 创建集合，使用数组声明
2. 元素要求 hashable
3. 添加元素、判断是否存在元素、遍历元素
4. 并集 union、交集 intersection，去交集 subtracting、并集减交集 symmetricDifference
5. 两集合判等、判子集、判超集、判重复元素

#### 闭包

1. 以 sort 函数为例描述闭包标准写法、利用类型推断的省略写法、利用参数的快捷语法
2. 尾随闭包、多重尾随闭包。*勿滥用，仅在语义清晰时使用*
3. 使用函数作为闭包、闭包的声明
4. 以闭包作为返回值与参数声明函数
5. 尾随闭包及多重尾随闭包
6. 捕获变量
7. 自动闭包

#### 高阶函数与函数式编程

1. 容器类型的 map, compactMap, flatMap
2. optional 的 map
3. map 与 forEach 的使用场景与误用样例
4. filter
5. reduce
6. 与 split、joined 等方法共用
7. 函数式编程
    - 一等公民函数：函数可以作为返回值从别的函数返回，也可以作为参数传递给别的函数， 可以存储在变量中。
    - 纯函数：函数没有副作用；给定同样的输入，函数永远返回同样的输出，而且不会修改程序中其他地方的状态。
    - 不可变性：不鼓励可变性，因为值可变的数据更难分析。
    - 强类型：强类型系统能增加代码的运行时安全性，因为语言的类型系统的合法性会在编译时得到检查。

### 课时三 结构体、类、值类型与引用类型

#### 结构体

1. 声明结构体，添加属性，创建实例
2. 实例方法
3. mutating 方法
4. self

#### 类

1. 基本语法（同结构体）
2. 继承、重写 override、禁止重写 final
3. static、class 声明类方法、类属性，以及二者区别

#### 值类型与引用类型

1. 值语义
2. 引用语义
3. 复制、相等与同一
4. 哪些是值类型、哪些是引用类型
5. 值类型与引用类型配合使用

#### 属性

1. 存储属性（默认值、读写或只读）
2. 嵌套类型
3. lazy、使用场景、配合闭包
4. 计算属性
    - get set 方法
    - set 方法参数名、默认参数名 newValue
    - get 方法单句省略 return
    - 只读省略 get
5. 属性观察者
    - willSet 参数名、默认参数名 newValue
    - didSet 参数名、默认参数名 oldValue
6. 属性包装（property wrapper）

#### 初始化 init

1. 结构体默认初始化方法和自定义初始化方法
2. 类的初始化方法和继承
3. 类的指定 (designated) 初始化方法、便捷 (convenience) 初始化方法、必需 (required) 初始化方法
4. 可失败初始化方法 (init?)
5. 反初始化 (销毁，deinit)

#### 内存管理

1. 值类型与引用类型内存管理策略不同
2. ARC
3. strong weak unowned
4. 逃逸闭包
5. COW (Copy on Write，写时复制)

### 课时四 协议、扩展、泛型

#### 协议

1. 协议声明
2. 符合协议
3. 协议继承
4. 协议组合
5. Equatable、Comparable、Hashable
6. 容器类型协议
7. 与 OC 协议的异同

#### 扩展

1. 扩展的语法
2. 使用扩展添加方法、计算属性
3. 使用扩展添加初始化方法
4. 使用扩展符合协议
5. 使用扩展添加嵌套类型
6. 与 OC 扩展、Category 的异同

#### 泛型

1. 已经接触过的泛型（容器类型、Optional）
2. 泛型数据结构（编写栈作为样例）
3. 泛型函数、方法（编写 swap 作为样例）
4. 协议作为类型约束
5. 协议的关联类型与透明类型
6. 使用 where 子句进行类型约束

#### 协议扩展

1. 为协议中声明的方法提供默认实现
2. 添加协议中未声明的统一内部方法
3. 带 where 子句的协议扩展
4. 在符合协议的类中重写协议扩展方法时不同的表现

### 课时五 工程实践 & Objective-C to Swift

#### 命名风格

[官方指南](https://swift.org/documentation/api-design-guidelines/#naming)

#### typealias

#### 访问控制

#### CustomStringConvertible, CustomDebugStringConvertible

#### Codable

#### CaseIterable, RawRepresentable

#### OptionSet

#### assert fatalError

#### 异常处理

#### defer 与作用域

#### subscript

#### 修饰符

1. @objc、dynamic
2. @available
3. @discardableResult
4. @frozen

#### 条件编译

1. 常用样例
2. 与编译宏的区别

---

#### 与 Objective-C 互操作

1. Swift 依赖 Objective-C
2. Objective-C 依赖 Swift
3. Swift 限制
4. 优化 Objective-C API 设计
[WWDC20 10680 - Refine Objective-C frameworks for Swift](https://developer.apple.com/videos/play/wwdc2020/10680/)

#### 与 Objective-C 桥接规则

1. Array & NSArray, Dictionary & NSDictionary
2. String & NSString
3. Int, Double & NSNumber
4. enum

#### 命名空间

1. 不同包内同名类型的使用
2. NSClassFromString 等 runtime 方法的改变

#### selector

#### GCD 与单例

#### KVO

#### 指针

#### CVarArg

#### Mirror

#### MemoryLayout
