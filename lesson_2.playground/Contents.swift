import Foundation

//MARK:- Task 1, 2
func isDivisible(number: Int, divider: Int) -> Bool {
   return number % divider == 0
}
isDivisible(number: 30, divider: 2)
isDivisible(number: 30, divider: 3)

//MARK:- Task 3
var numbersArray = Array(0...99)

//MARK:- Task 4
//Альтернативный вариант:
//func arrayCleaner(array: [Int], filter: Int) -> Array<Int>{
//    return array.filter{$0 % filter != 0}
//}
//numbersArray = arrayCleaner(array: numbersArray, filter: 2)
//numbersArray = arrayCleaner(array: numbersArray, filter: 3)

numbersArray = numbersArray.filter{!isDivisible(number: $0, divider: 2)}
numbersArray = numbersArray.filter{!isDivisible(number: $0, divider: 3)}
print(numbersArray)
//Можно ли использовать несколько условий в фильтре?

//MARK:- Task 5
func fibonacci(prePreviousIndex: Decimal, previousIndex: Decimal) -> Decimal{
    return prePreviousIndex + previousIndex
}

var fibonacciArray: [Decimal] = [0, 1]
for i in 2...99{
    fibonacciArray.append(fibonacci(prePreviousIndex: fibonacciArray[i-1], previousIndex: fibonacciArray[i-2]))
}
print(fibonacciArray)

//MARK:- Task 6
func isPrimeNumber (number: UInt64) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
var primeNumbersArray = [UInt64]()
var number: UInt64 = 2
while primeNumbersArray.count < 100 {
    if isPrimeNumber(number: number){
        primeNumbersArray.append(number)
    }
    number += 1
}
print(primeNumbersArray)
