import UIKit

enum BrandName {
    case honda, bmw, avtovaz, nissan, tesla
}
enum Transmission {
    case manual, auto
}
enum Action {
    case engineSwitch
    case windowsSwitch
    case trunkLoadingOrUnloading(loadValue: Int)
    case maxSpeedLimitEdit(maxSpeedValue: UInt)
}

class Car {
    let brand: BrandName
    let manufactureYear: UInt
    let trunkVolume: UInt
    var trunkVolumeFilled: UInt
    var isEngineRun: Bool
    var isWindowOpen: Bool
    
    init(brand: BrandName, manufactureYear: UInt, trunkVolume: UInt, trunkVolumeFilled: UInt, isEngineRun: Bool, isWindowOpen: Bool) {
        self.brand = brand
        self.manufactureYear = manufactureYear
        self.trunkVolume = trunkVolume
        self.trunkVolumeFilled = trunkVolumeFilled
        self.isEngineRun = isEngineRun
        self.isWindowOpen = isWindowOpen
    }
    
    func doSomething() {
        
    }
}
class SportCar: Car {
    
    
    var maxSpeedLimit: UInt
    
    init(brand: BrandName, manufactureYear: UInt, trunkVolume: UInt, trunkVolumeFilled: UInt, isEngineRun: Bool, isWindowOpen: Bool, maxSpeedLimit: UInt) {
        self.maxSpeedLimit = maxSpeedLimit
        super.init(brand: brand,
                   manufactureYear: manufactureYear,
                   trunkVolume: trunkVolume,
                   trunkVolumeFilled: trunkVolumeFilled,
                   isEngineRun: isEngineRun,
                   isWindowOpen: isWindowOpen)
    }
    
    
    func doSomething(action: Action) {
        switch action {
        case .engineSwitch:
            if (self.isEngineRun == true){
                self.isEngineRun = false
            }
            else {
                self.isEngineRun = true
            }
        case .windowsSwitch:
            if (self.isWindowOpen == true){
                self.isWindowOpen = false
            }
            else {
                self.isWindowOpen = true
            }
        case .maxSpeedLimitEdit(let maxSpeedValue):
            self.maxSpeedLimit = maxSpeedValue
            print("Прошили на новую максимальную скорость: \(self.maxSpeedLimit)!")
        default: break
        }
    }
}
class TrunkCar: Car {

    let swingOutDistance: UInt
    
    init(brand: BrandName, manufactureYear: UInt, trunkVolume: UInt, trunkVolumeFilled: UInt, isEngineRun: Bool, isWindowOpen: Bool, swingOutDistance: UInt) {
        self.swingOutDistance = swingOutDistance
        super.init(brand: brand,
                   manufactureYear: manufactureYear,
                   trunkVolume: trunkVolume,
                   trunkVolumeFilled: trunkVolumeFilled,
                   isEngineRun: isEngineRun,
                   isWindowOpen: isWindowOpen)
    }
    
    func doSomething(action: Action) {
        switch action {
        case .engineSwitch:
            if (self.isEngineRun == true){
                self.isEngineRun = false
            }
            else {
                self.isEngineRun = true
            }
        case .windowsSwitch:
            if (self.isWindowOpen == true){
                self.isWindowOpen = false
            }
            else {
                self.isWindowOpen = true
            }
        case .trunkLoadingOrUnloading(let loadValue):
            if (Int(self.trunkVolumeFilled) + loadValue > self.trunkVolume) {
                print("Загрузите оставшийся груз (\(Int(self.trunkVolumeFilled) + loadValue - Int(self.trunkVolume)) ед.) в следующий грузовик!")
                self.trunkVolumeFilled = self.trunkVolume
            }
            else if (Int(self.trunkVolumeFilled) + loadValue < 0) {
                print("Выгрузили все, что получилось: \(self.trunkVolumeFilled)")
                self.trunkVolumeFilled = 0
            }
            else {
                self.trunkVolumeFilled = UInt(Int(self.trunkVolumeFilled) + loadValue)
                print("Все загрузили/выгрузили, осталось еще места на \(self.trunkVolume - self.trunkVolumeFilled) ед.")
            }
        default: break
    }
}
}

var modelX = SportCar(brand: .tesla, manufactureYear: 2020, trunkVolume: 40, trunkVolumeFilled: 35, isEngineRun: false, isWindowOpen: false, maxSpeedLimit: 200)
var kamaz = TrunkCar(brand: .avtovaz, manufactureYear: 2010, trunkVolume: 200, trunkVolumeFilled: 150, isEngineRun: false, isWindowOpen: false, swingOutDistance: 2)

modelX.doSomething(action: .engineSwitch)
print(modelX.maxSpeedLimit)
modelX.doSomething(action: .maxSpeedLimitEdit(maxSpeedValue: 250))

kamaz.doSomething(action: .engineSwitch)
print(kamaz.trunkVolumeFilled)
kamaz.doSomething(action: .trunkLoadingOrUnloading(loadValue: 60))
print(kamaz.trunkVolumeFilled)
kamaz.doSomething(action: .trunkLoadingOrUnloading(loadValue: -230))
print(kamaz.trunkVolumeFilled)
