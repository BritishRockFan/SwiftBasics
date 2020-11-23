import UIKit
import Foundation

/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
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
    case isOn, isOff
}

struct spaceShip {
    var color:String
    let shipBrand: String
    let model: String
    let releaseYear: Int
    var maxHullCapacity: Int
    var hullGate: hullGateState
    var engine: engineState
    var warpDrive: warpDriveState
    
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
    
    mutating func changeWarpDriveState(state: warpDriveState) {
        switch state {
        case .isOff:
            self.warpDrive = warpDriveState.isOff
            print("Warp drive disabled")
        case .isOn:
            self.warpDrive = warpDriveState.isOn
            print("WarpDrive is enabled. Jump to light Speed")
        }
    }
 }

struct cargoSpaceShip {
    var color:String
    let shipBrand: String
    let model: String
    let releaseYear: Int
    var maxHullCapacity: Int
    var currentHullCapacity: Int
    var hullGate: hullGateState
    var cargoBay: cargoBayState
    var engine: engineState
    var warpDrive: warpDriveState
    
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
    
    mutating func changeWarpDriveState(state: warpDriveState) {
        switch state {
        case .isOff:
            self.warpDrive = warpDriveState.isOff
            print("Warp drive disabled")
        case .isOn:
            self.warpDrive = warpDriveState.isOn
            print("WarpDrive is enabled. Jump to light Speed")
        }
    }
    
    mutating func addCargo(cargo: Int) {
        currentHullCapacity = currentHullCapacity + cargo
        if currentHullCapacity > maxHullCapacity {
            print("Can't place that much in the cargo")
        } else if currentHullCapacity == maxHullCapacity {
            self.cargoBay = cargoBayState.full
        } else if currentHullCapacity < maxHullCapacity {
            print("Current cargo value is \(currentHullCapacity)")
        }
    }
    
    mutating func removeCargo(cargo: Int) {
        currentHullCapacity = currentHullCapacity - cargo
        if currentHullCapacity < maxHullCapacity && currentHullCapacity > 0 {
            print("Current cargo value is \(currentHullCapacity)")
            self.cargoBay = cargoBayState.somethingIsIn
        } else if currentHullCapacity == 0 {
            self.cargoBay = cargoBayState.empty
            print("Cargo bay is empty")
        } else if currentHullCapacity < 0 {
            print("Error. Can't remove that value")
        }
    }
    
    mutating func getCargoBayState() -> cargoBayState {
        return self.cargoBay
    }
    
}

var smallSpaceShip = spaceShip.init(color: "Red", shipBrand: "Argon", model: "Hunter M5", releaseYear: 4077, maxHullCapacity: 100, hullGate: .close, engine: .isOn, warpDrive: .isOff)

var bigCargoSpaceShip = cargoSpaceShip.init(color: "Gray", shipBrand: "Earth", model: "Mamonth L", releaseYear: 4088, maxHullCapacity: 50000, currentHullCapacity: 1000, hullGate: .close, cargoBay: .empty, engine: .isOn, warpDrive: .isOff)

smallSpaceShip.changeColor(color: "White")
print(smallSpaceShip.color)
smallSpaceShip.changeEngineState(state: "Stop")
print(smallSpaceShip.engine)
smallSpaceShip.changeHullGateState(state: .open)
print(smallSpaceShip.hullGate)
smallSpaceShip.changeWarpDriveState(state: .isOn)
print(smallSpaceShip.warpDrive)

bigCargoSpaceShip.changeColor(color: "Orange")
bigCargoSpaceShip.color
print(bigCargoSpaceShip.getCargoBayState())
bigCargoSpaceShip.addCargo(cargo: 49000)
print(bigCargoSpaceShip.getCargoBayState())
bigCargoSpaceShip.removeCargo(cargo: 10000)
print(bigCargoSpaceShip.getCargoBayState())
bigCargoSpaceShip.changeWarpDriveState(state: .isOn)
print(bigCargoSpaceShip.warpDrive)
