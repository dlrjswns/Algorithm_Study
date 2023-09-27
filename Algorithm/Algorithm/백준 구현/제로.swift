//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/24.
//

import Foundation

let K = Int(readLine()!)!
var list: [Int] = []

for _ in 0..<K {
  let num = Int(readLine()!)!
  if num == 0 {
    _ = list.popLast()
  } else {
    list.append(num)
  }
}

var answer = 0

for li in list {
  answer += li
}

print(answer)


