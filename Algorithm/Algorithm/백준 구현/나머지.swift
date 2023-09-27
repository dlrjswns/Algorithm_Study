//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/22.
//

import Foundation

let input = readLine()!
let splitInput = input.split(separator: " ")

let A = Int(splitInput[0])!
let B = Int(splitInput[1])!
let C = Int(splitInput[2])!
print((A+B)%C)
print(((A%C) + (B%C))%C)
print((A*B)%C)
print(((A%C) * (B%C))%C)
