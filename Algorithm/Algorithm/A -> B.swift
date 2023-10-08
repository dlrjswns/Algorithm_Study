//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/10/09.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = input[0]
var B = input[1]
var count = 1

while A < B {
  if B % 2 == 0 {
    B /= 2
  } else if B % 10 == 1 {
    B /= 10
  } else {
    break
  }
  count += 1
}

A == B ? print(count) : print(-1)
