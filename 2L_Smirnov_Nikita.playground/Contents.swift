import UIKit
import Foundation

//1. Написать функцию, которая определяет, четное число или нет.
func isEven(_ number:Int) -> Bool {
    return number % 2 == 0
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isDevidedOnThree(_ number:Int) -> Bool {
    return number % 3 == 0
}

//3. Создать возрастающий массив из 100 чисел.
func createNewArray() -> [Int] {
    var newArray = [Int]()
    for number in 1...100 {
        newArray.append(number)
    }
    return newArray
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var modifiedArray = createNewArray().filter{!isEven($0) && isDevidedOnThree($0)}

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func createFibonachiArray(_ count:Int) -> [Int] {
    var fibonachiArray = [0, 1]
    for number in 1...count {
        fibonachiArray.append(fibonachiArray[number - 1] + fibonachiArray[number])
    }
    return fibonachiArray
}

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

func primeNumbers(_ number:Int) -> [Int] {
    var primeArray: [Int] = []
    var intArr = [Int](2...number)
    while let p:Int = intArr.first {
        primeArray.append(p)
        intArr = intArr.filter { $0 % p != 0}
    }
    return primeArray
}

