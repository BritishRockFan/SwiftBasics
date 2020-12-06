import Foundation

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/

protocol CountSpeed {
    var speed: Int {get set}
}

struct SpaceShip: CountSpeed {
    var name: String
    var value: Int
    var speed: Int
}

extension SpaceShip: CustomStringConvertible {
    var description : String {
        return "Name: \(name), Value: \(value), Speed: \(speed)"
    }
}

struct QueueAtCustoms <T: CountSpeed> {
    private var elements: [T] = []
        
    public var lastElement: T? {
        if elements.count == 0 {
            print("The ships aren't found. Hangar is empty.")
            return nil
        } else {
            print("Last ship is \(elements.last!)")
            return elements.last
        }
    }
    
    public var firstElement: T? {
        if elements.count == 0 {
            print("The ships aren't found. Hangar is empty.")
            return nil
        } else {
            print("First ship is \(elements.first!)")
            return elements.first
        }
    }
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    
    mutating func dequeue()->T {
        return elements.removeLast()
    }
    
    func printMyQueue() {
        print(elements)
    }
    
    subscript(indices: Int ...) -> Int {
        var speed = 0
        for index in indices where index < self.elements.count {
            speed += self.elements[Int(index)].speed
        }
        return speed
    }

}

extension QueueAtCustoms {
    func myFilter(argument:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if argument(i) {
                result.append(i)
            }
        }
        return result
    }
}

var queue = QueueAtCustoms<SpaceShip>()
queue.enqueue(element: .init(name: "Lightning", value: 10000, speed: 350))
queue.enqueue(element: .init(name: "Cargo ship", value: 35000, speed: 50))
queue.enqueue(element: .init(name: "Figher Hunter", value: 50000, speed: 400))
queue.enqueue(element: .init(name: "Maintenance ship", value: 20000, speed: 100))
queue.enqueue(element: .init(name: "Alien ship", value: 999000, speed: 300))
queue.enqueue(element: .init(name: "Cobra Mk. III", value: 350000, speed: 390))

queue.printMyQueue()
queue.lastElement
queue.firstElement

let valuableShips = queue.myFilter(argument: {$0.value >= 50000})
print(valuableShips)

queue[0,2,4]

