import UIKit
import Foundation

//1. Решить квадратное уравнение вида: ax2 + bx + c = 0
// Уравнение x2 - 6x + 9 = 0
let a:Float = 1
let b:Float = -6
let c:Float = 9
var x1:Float
var x2:Float
var d:Float = pow(b,2) - (4 * a * c)
if (d == 0) {
    x1 = (-b + sqrt(d)) / (2 * a)
    print(x1)
} else if(d > 0){
    x1 = (-b + sqrt(d)) / (2 * a)
    x2 = (-b - sqrt(d)) / (2 * a)
    print(x1, x2)
} else if(d < 0){
    print("There's no roots")
}

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
var sideA:Double = 6
var sideB:Double = 8
var hypotenuse:Double = sqrt(pow(sideA,2) + pow(sideB,2))
var perimeter:Double = sideA + sideB + hypotenuse
var square:Double = (sideA * sideB) / 2
print("Гипотенуза равна \(hypotenuse)")
print("Периметр равен \(perimeter)")
print("Площадь равна \(square)")


//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
var userSum = 1000
var percent = 15
var maxYears = 5

for number in 1...maxYears {
    userSum = userSum + ((userSum / 100) * percent)
    print("Сумма за \(number)-й год составит: \(userSum)")
}
