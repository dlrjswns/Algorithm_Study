//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/22.
//

import Foundation

let input = Int(readLine()!)!
let inputNum = readLine()!
// Char형을 바로 Int형으로 변경못하기때문에 String으로 변환 이후 Int로 래핑
let num = inputNum.map { Int(String($0))! }
var value = 0

let answer = num.reduce(0) { result, element in
  result + element
}
print(answer)
