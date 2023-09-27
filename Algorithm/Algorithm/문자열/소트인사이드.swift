//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/27.
//

import Foundation

let letter = readLine()!
var numList: [Int] = []
for ch in letter {
  numList.append(Int(String(ch))!)
}

numList.sort(by: >)
numList.forEach { print($0, terminator: "") }

