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

protocol Car: AnyObject {
    var brand: BrandName { get }
    var manufactureYear: UInt { get }
    var isEngineRun: Bool { get set }
    var isWindowsOpen: Bool { get set }
    func engineSwitch()
    func windowsSwitch()
}

extension Car {
    func engineSwitch(){
        self.isEngineRun.toggle()
    }
    func windowSwitch(){
        self.isWindowsOpen.toggle()
    }
}

class SportCar: Car {
    var maxSpeedLimit: UInt
    var brand: BrandName
    var manufactureYear: UInt
    var isEngineRun: Bool = false
    var isWindowsOpen: Bool = false
    
    func engineSwitch() {
        self.isEngineRun.toggle()
    }
    func windowsSwitch() {
        self.isWindowsOpen.toggle()
    }
    
    init(brand: BrandName, manufactureYear: UInt, maxSpeedLimit: UInt) {
        self.brand = brand
        self.manufactureYear = manufactureYear
        self.maxSpeedLimit = maxSpeedLimit
    }
    
    func action(action: Action){
        switch action {
        case .maxSpeedLimitEdit(let maxSpeedValue):
            self.maxSpeedLimit = maxSpeedValue
            print("Теперь максимальная скорость ограничена \(self.maxSpeedLimit) км/ч")
        case .engineSwitch:
            self.isEngineRun.toggle()
        default:
            break
        }
    }
}

var modelX = SportCar(brand: .tesla, manufactureYear: 2020, maxSpeedLimit: 250)
modelX.action(action: .engineSwitch)
print(modelX.isEngineRun)
modelX.engineSwitch()
print(modelX.isEngineRun)
modelX.action(action: .maxSpeedLimitEdit(maxSpeedValue: 300))
