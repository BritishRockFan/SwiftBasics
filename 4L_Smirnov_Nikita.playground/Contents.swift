import UIKit
import Foundation

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
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

class SpaceShip {
    var color:String
    let shipBrand: String
    let model: String
    let releaseYear: Int
    var maxHullCapacity: Int
    var hullGate: hullGateState
    var engine: engineState
    var warpDrive: warpDriveState
    
    init(color: String, shipBrand: String, model: String, releaseYear: Int, maxHullCapacity: Int, hullGate: hullGateState,
         engine: engineState, warpDrive: warpDriveState) {
        self.color = color
        self.shipBrand = shipBrand
        self.model = model
        self.releaseYear = releaseYear
        self.maxHullCapacity = maxHullCapacity
        self.hullGate = hullGate
        self.engine = engine
        self.warpDrive = warpDrive
    }
    
    func changeColor(color:String) {
        self.color = color
    }
    
    func changeEngineState(state: String) {
        switch state {
        case "Start":
            self.engine = engineState.isOn
        case "Stop":
            self.engine = engineState.isOff
        default:
            self.engine = engineState.isOff
        }
    }
    
    func changeHullGateState(state: hullGateState) {
        switch state {
        case .close:
            self.hullGate = hullGateState.close
            print("Hull gate is closed")
        case .open:
            self.hullGate = hullGateState.open
            print("Warning. Hull gate is open")
        }
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
 }

class fastSpaceShip: SpaceShip {
    var maxSpeed: Int
    var gunsCount: Int
    
    
    init(color: String, shipBrand: String, model: String, releaseYear: Int, maxHullCapacity: Int, hullGate: hullGateState,
         engine: engineState, warpDrive: warpDriveState, maxSpeed: Int, gunsCount: Int) {
        self.maxSpeed = maxSpeed
        self.gunsCount = gunsCount
        super.init(color: color, shipBrand: shipBrand, model: model, releaseYear: releaseYear, maxHullCapacity: maxHullCapacity, hullGate: hullGate, engine: engine, warpDrive: warpDrive)
    }
    
    override func changeColor(color:String) {
        self.color = color
    }
    
    override func changeWarpDriveState(state: warpDriveState) {
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
}

class trunkSpaceShip: SpaceShip {
    var maxSpeed: Int
    var hasHangar: Bool
    
    init(color: String, shipBrand: String, model: String, releaseYear: Int, maxHullCapacity: Int, hullGate: hullGateState,
         engine: engineState, warpDrive: warpDriveState, maxSpeed: Int, hasHangar: Bool) {
        self.maxSpeed = maxSpeed
        self.hasHangar = hasHangar
        super.init(color: color, shipBrand: shipBrand, model: model, releaseYear: releaseYear, maxHullCapacity: maxHullCapacity, hullGate: hullGate, engine: engine, warpDrive: warpDrive)
    }
    
    override func changeWarpDriveState(state: warpDriveState) {
        switch state {
        case .isOff:
            self.warpDrive = warpDriveState.isOff
            print("Warp drive disabled")
        case .isOn:
            self.warpDrive = warpDriveState.isOn
            print("WarpDrive is enabled. Jump to light Speed")
        case .superWarp:
            self.warpDrive = warpDriveState.isOff
            print("Error! There's no SuperWarp mode. This is a cargo ship")
        }
    }
}

var fastFighter = fastSpaceShip(color: "Gray", shipBrand: "ARGON", model: "M5", releaseYear: 2077, maxHullCapacity: 15, hullGate: .close, engine: .isOn, warpDrive: .isOff, maxSpeed: 500, gunsCount: 4)

var cargoShip = trunkSpaceShip(color: "Black", shipBrand: "SPLIT", model: "L", releaseYear: 2088, maxHullCapacity: 5000, hullGate: .close, engine: .isOff, warpDrive: .isOff, maxSpeed: 50, hasHangar: false)


fastFighter.changeColor(color: "White")
print(fastFighter.color)
fastFighter.changeWarpDriveState(state: .superWarp)
fastFighter.changeEngineState(state: "Stop")
fastFighter.changeHullGateState(state: .open)

cargoShip.changeWarpDriveState(state: .superWarp)
cargoShip.changeColor(color: "Red")
print(cargoShip.color)
cargoShip.changeHullGateState(state: .open)
cargoShip.changeEngineState(state: "Stop")
