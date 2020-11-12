import Foundation

protocol TwoNumbers {
    var coordinateX: Int { get }
    var coordinateY: Int { get }
}

class Point2D: TwoNumbers  {
    var coordinateX: Int = 25
    var coordinateY: Int = 50
}


class Queue <T:TwoNumbers> {
    private var element: [T] = []
    
    func pop() -> T? {
        guard !element.isEmpty else {
            return nil
        }
        return element.removeFirst()
    }
    
    func push (element: T){
        self.element.append(element)
    }
    
    func filter (ruleOne: (T) -> Bool, ruleTwo: (T) -> Bool) -> [T]? {
        guard !element.isEmpty else {
            return nil
        }
        self.element.filter(ruleOne)
        return self.element.filter(ruleTwo)
    }
}


let somePoint = Point2D()
somePoint.coordinateX = 2
somePoint.coordinateY = 3
let anotherPoint = Point2D()


let pointsSet = Queue<Point2D>()
pointsSet.push(element: somePoint)
pointsSet.push(element: anotherPoint)

var anotherPointSet = pointsSet.filter(ruleOne: {$0.coordinateX < 5}, ruleTwo: {$0.coordinateY < 5})

print(pointsSet.pop()?.coordinateY)
print(anotherPointSet?.last?.coordinateY)
print(anotherPointSet?.first?.coordinateY)


