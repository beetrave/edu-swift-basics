import UIKit

var defaultLoadingUnit: UInt = 25

enum BrandName {
    case honda, bmw, avtovaz, nissan, tesla
}
enum Transmission {
    case manual, auto
}
enum Action {
    case engineSwitch
    case windowsSwitch
    case trunkLoading, trunkUnloading
}
struct SportCar {
    let brand: BrandName
    let manufactureYear: UInt
    let trunkVolume: UInt
    var trunkVolumeFilled: UInt
    var isEngineRun: Bool
    var isWindowOpen: Bool
    
    var maxSpeedLimit: UInt
    
    mutating func doSomething(action: Action) {
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
        case .trunkLoading:
            if (self.trunkVolumeFilled + defaultLoadingUnit > self.trunkVolume) {
                self.trunkVolumeFilled = self.trunkVolume
            }
            else {
                self.trunkVolumeFilled += defaultLoadingUnit
            }
        case .trunkUnloading:
            if (self.trunkVolumeFilled - defaultLoadingUnit <= 0) {
                self.trunkVolumeFilled = 0
            }
            else {
                self.trunkVolumeFilled -= defaultLoadingUnit
            }
        }
    
    }
}
struct TrunkCar {
    let brand: BrandName
    let manufactureYear: UInt
    let trunkVolume: UInt
    var trunkVolumeFilled: UInt
    var isEngineRun: Bool
    var isWindowOpen: Bool
    
    let swingOutDistance: UInt //боковой вынос - не знаю, как правильно перевести
    
    mutating func doSomething(action: Action) {
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
        case .trunkLoading:
            if (self.trunkVolumeFilled + defaultLoadingUnit > self.trunkVolume) {
                self.trunkVolumeFilled = self.trunkVolume
            }
            else {
                self.trunkVolumeFilled += defaultLoadingUnit
            }
        case .trunkUnloading:
            if (self.trunkVolumeFilled - defaultLoadingUnit <= 0) {
                self.trunkVolumeFilled = 0
            }
            else {
                self.trunkVolumeFilled -= defaultLoadingUnit
            }
        }
    
    }
}


var modelX = SportCar(brand: .tesla, manufactureYear: 2019, trunkVolume: 30, trunkVolumeFilled: 2, isEngineRun: false, isWindowOpen: true, maxSpeedLimit: 300)
var kamaz = TrunkCar(brand: .avtovaz, manufactureYear: 2010, trunkVolume: 400, trunkVolumeFilled: 200, isEngineRun: true, isWindowOpen: false, swingOutDistance: 150)

modelX.doSomething(action: .engineSwitch)
modelX.doSomething(action: .windowsSwitch)

kamaz.doSomething(action: .engineSwitch)
kamaz.doSomething(action: .trunkUnloading)

print(modelX)
print(kamaz)
