public struct Rect {
    private var width: Double
    private var height: Double
}

extension Rect {
    public init() {
        width = 100
        height = 100
    }
}

extension Rect {
    enum Kind {
        case invalid // width <= 0 || height <= 0
        case square // width = height
        case tall // width < height
        case flat // width > height
    }

    var kind: Kind {
        if width <= 0 || height <= 0 {
            return .invalid
        } else if width == height {
            return .square
        } else if width > height {
            return .flat
        } else {
            return .tall
        }
    }
}

public extension Rect {
    var area: Double { width * height }
    var perimeter: Double { width * height }
}
