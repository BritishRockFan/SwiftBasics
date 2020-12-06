import Foundation

/*
1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
*/

enum SpaceShipJumpError: Error {
    case lowFuel (fuel: Int)
    case tankIsEmpty
    case tankIsFull
}

struct jump {
    var fuel: Int
}

class SpaceJump {
    var tankMax: Int = 20000
    var tank: Int = 20000
    var tankEmpty = false
    
    func jumpToAnotherSystem(jump: jump) throws {
        guard tankEmpty == false else{
            throw SpaceShipJumpError.tankIsEmpty
        }
        
        guard jump.fuel <= self.tank else {
            throw SpaceShipJumpError.lowFuel(fuel: jump.fuel)
        }
        
        tank = self.tank - jump.fuel
        
        if tank == 0 {
            self.tankEmpty = true
        }
    }
    
    func fillTheTank (fuel: Int) throws {
        tank = self.tank + fuel
        guard tank < tankMax else {
            self.tank = self.tankMax
            throw SpaceShipJumpError.tankIsFull
        }
    }
}

let makeAJump = SpaceJump()
do {
    try makeAJump.jumpToAnotherSystem(jump: .init(fuel: 1500))
    print("Successfull Jump. Fuel is left: \(makeAJump.tank)")
} catch is SpaceShipJumpError {
    print("Tank is empty")
}

do {
    try makeAJump.jumpToAnotherSystem(jump: .init(fuel: 18500))
    print("Successfull Jump. Fuel is left: \(makeAJump.tank)")
} catch is SpaceShipJumpError {
    print("Tank is empty")
}

do {
    try makeAJump.jumpToAnotherSystem(jump: .init(fuel: 1000))
    print("Successfull Jump. Fuel is left: \(makeAJump.tank)")
} catch is SpaceShipJumpError {
    print("Tank is empty")
}

do {
    try makeAJump.fillTheTank(fuel: 21000)
    print("Successfull. Fuel is left: \(makeAJump.tank)")
} catch is SpaceShipJumpError {
    print("Tank is filled to maximum. Fuel is left: \(makeAJump.tank)")
}

do {
    try makeAJump.jumpToAnotherSystem(jump: .init(fuel: 21000))
    print("Successfull Jump. Fuel is left: \(makeAJump.tank)")
} catch is SpaceShipJumpError {
    print("Low fuel")
}


