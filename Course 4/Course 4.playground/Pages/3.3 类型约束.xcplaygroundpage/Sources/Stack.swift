// Stack.swift

public struct Stack<Element>: CustomStringConvertible {
    private var container: [Element]

    public init(_ elements: [Element] = []) {
        container = elements
    }

    public var top: Element? { container.last }

    public mutating func push(_ newItem: Element) {
        container.append(newItem)
        print("current items: \(container)")
    }

    @discardableResult
    public mutating func pop() -> Element? {
        let last = container.popLast()
        print("current items: \(container)")
        return last
    }

    public var description: String {
        "Stack<\(Element.self)>: \(container)"
    }
}
