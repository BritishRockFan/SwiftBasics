import Foundation

/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.
*/

enum engineState {
    case isOn, isOff
}

enum hullGateState {
    case open, close
}

enum cargoBayState {
    case full, empty, somethingIsIn
}

enum warpDriveState {
    case isOn, isOff, superWarp
}

protocol SpaceShip {
    var color:String {get set}
    var shipBrand: String {get set}
    var model: String {get set}
    var releaseYear: Int {get set}
    var maxHullCapacity: Int {get set}
    var hullGate: hullGateState {get set}
    var engine: engineState {get set}
    var warpDrive: warpDriveState {get set}
    var maxSpeed: Int {get set}
    var gunsCount: Int {get set}
}

extension SpaceShip {
    mutating func changeColor(color:String) {
        self.color = color
    }
        
    mutating func changeEngineState(state: String) {
        switch state {
        case "Start":
            self.engine = engineState.isOn
        case "Stop":
            self.engine = engineState.isOff
        default:
            self.engine = engineState.isOff
        }
    }
        
    mutating func changeHullGateState(state: hullGateState) {
        switch state {
        case .close:
            self.hullGate = hullGateState.close
            print("Hull gate is closed")
        case .open:
            self.hullGate = hullGateState.open
            print("Warning. Hull gate is open")
        }
    }
}

class FighterShip: SpaceShip {
    var color: String
    var shipBrand: String
    var model: String
    var releaseYear: Int
    var maxHullCapacity: Int
    var hullGate: hullGateState
    var engine: engineState
    var warpDrive: warpDriveState
    var maxSpeed: Int
    var gunsCount: Int
    
    init(color: String, shipBrand: String, model: String, releaseYear: Int, maxHullCapacity: Int, hullGate: hullGateState, engine: engineState, warpDrive: warpDriveState, maxSpeed: Int, gunsCount: Int) {
        self.color = color
        self.shipBrand = shipBrand
        self.model = model
        self.releaseYear = releaseYear
        self.maxHullCapacity = maxHullCapacity
        self.hullGate = hullGate
        self.engine = engine
        self.maxSpeed = maxSpeed
        self.gunsCount = gunsCount
        self.warpDrive = warpDrive
    }
    
    func changeWarpDriveState(state: warpDriveState) {
        switch state {
        case .isOff:
            self.warpDrive = warpDriveState.isOff
            print("Warp drive disabled")
        case .isOn:
            self.warpDrive = warpDriveState.isOn
            print("WarpDrive is enabled. Jump to light Speed")
        case .superWarp:
            self.warpDrive = warpDriveState.superWarp
            print("Super warp!!!")
        }
    }
    
    func shoot() {
        print("Pew Pew Pew Pew Pew!!!")
    }
}

class CargoSpaceShip: SpaceShip {
    var color: String
    var shipBrand: String
    var model: String
    var releaseYear: Int
    var maxHullCapacity: Int
    var hullGate: hullGateState
    var engine: engineState
    var warpDrive: warpDriveState
    var maxSpeed: Int
    var gunsCount: Int
    
    init(color: String, shipBrand: String, model: String, releaseYear: Int, maxHullCapacity: Int, hullGate: hullGateState, engine: engineState, warpDrive: warpDriveState, maxSpeed: Int, gunsCount: Int) {
        self.color = color
        self.shipBrand = shipBrand
        self.model = model
        self.releaseYear = releaseYear
        self.maxHullCapacity = maxHullCapacity
        self.hullGate = hullGate
        self.engine = engine
        self.maxSpeed = maxSpeed
        self.gunsCount = gunsCount
        self.warpDrive = warpDrive
    }
    
    func changeWarpDriveState(state: warpDriveState) {
        switch state {
        case .isOff:
            self.warpDrive = warpDriveState.isOff
            print("Warp drive disabled")
        case .isOn:
            self.warpDrive = warpDriveState.isOn
            print("WarpDrive is enabled. Jump to light Speed")
        case .superWarp:
            self.warpDrive = warpDriveState.superWarp
            print("Error!!! This is Cargo ship. SuperWarp is not available")
        }
    }
}

extension FighterShip: CustomStringConvertible {
    var description: String {
        return "This is \(shipBrand) \(model) Fighter Ship"
    }
}

extension CargoSpaceShip: CustomStringConvertible {
    var description: String {
        return "This is \(shipBrand) \(model) Cargo Ship"
    }
}

var fastFighter = FighterShip(color: "Gray", shipBrand: "ARGON", model: "M5", releaseYear: 2077, maxHullCapacity: 15, hullGate: .close, engine: .isOn, warpDrive: .isOff, maxSpeed: 500, gunsCount: 4)

var cargoShip = CargoSpaceShip(color: "Black", shipBrand: "SPLIT", model: "L", releaseYear: 2088, maxHullCapacity: 5000, hullGate: .close, engine: .isOff, warpDrive: .isOff, maxSpeed: 50, gunsCount: 0)

fastFighter.changeColor(color: "White")
print(fastFighter.color)
fastFighter.changeWarpDriveState(state: .superWarp)
fastFighter.changeEngineState(state: "Stop")
fastFighter.changeHullGateState(state: .open)
fastFighter.shoot()

cargoShip.changeWarpDriveState(state: .superWarp)
cargoShip.changeColor(color: "Red")
print(cargoShip.color)
cargoShip.changeHullGateState(state: .open)
cargoShip.changeEngineState(state: "Stop")
