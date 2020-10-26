import Foundation

//MARK:- Task 1
let a = 4.0
let b = -4.0
let c = 1.0

var disc = b * b - 4 * a * c

print ("x1:  \(( -b + sqrt(disc)) / (2 * a))")
print ("x2:  \(( -b - sqrt(disc)) / (2 * a))")

//MARK:- Task 2
let cathA = 3.0
let cathB = 4.0

let area = cathA * cathB / 2
let hypot = sqrt ( cathA*cathA + cathB*cathB )
var perimeter = cathA + cathB + hypot

//MARK:- Task 3
let percent = 10
let depositTerm = 5
var summ = 1_000_000

for _ in 1...depositTerm {
    summ += summ*percent/100
}
print ("Total deposit amount in \(depositTerm) years = \(summ)")
