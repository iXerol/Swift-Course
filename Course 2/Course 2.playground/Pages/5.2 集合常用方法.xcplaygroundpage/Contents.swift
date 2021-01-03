//: [Previous](@previous)

import Foundation

let vegetables: Set = ["Onions", "Carrots", "Tamatoes"]
let fruits: Set = ["Apples", "Bananas", "Tamatoes"]

//: 是否包含某一元素
vegetables.contains("Onions")
vegetables.contains("Apples")

//: 并集
let vegetablesOrFruits = vegetables.union(fruits)
//: 交集
let vegetablesAndFruits = vegetables.intersection(fruits)
//: 减去（去除交集）
let vegetablesAndNotFruits = vegetables.subtracting(fruits)
//: 不同时在两集合内的元素（并集减交集）
let vegetablesOrFruitsSymmetricDifference = vegetables.symmetricDifference(fruits)

//: 判断集合是否为子集、超集或相等。
vegetablesOrFruits.isSuperset(of: vegetablesAndFruits)
vegetablesAndFruits.isSubset(of: vegetablesOrFruits)
vegetablesOrFruits == vegetablesAndFruits

//: 判断两集合是否相交（有相同元素）
vegetablesAndNotFruits.isDisjoint(with: fruits)
vegetables.isDisjoint(with: fruits)

//: 使用`for-in`循环遍历集合
for vegetable in vegetables {
    print("Eat \(vegetable)")
}

//: 将集合转换为数组
let vegetablesArray = Array(vegetables)

//: [Next](@next)
