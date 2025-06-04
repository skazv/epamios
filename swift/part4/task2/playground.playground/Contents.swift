import Foundation

protocol Shape {
    func area() -> Double
    func perimeter() -> Double
}

class Circle: Shape {
    var radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func area() -> Double {
        return 3.14 * radius * radius
    }

    func perimeter() -> Double {
        return 3.14 * radius * 2
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func area() -> Double {
        return width * height
    }

    func perimeter() -> Double {
        return 2 * (width + height)
    }
}

func generateShape() -> Shape {
    return Circle(radius: 5)
}

func calculateShapeDetails(shape: Shape) -> (Double, Double) {
    return (shape.area(), shape.perimeter())
}

//let s = generateShape()
//let a = calculateShapeDetails(shape: s)
//print("\(a.0)")
//print("\(a.1)")
