//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/15/24.
//

import Foundation

/*
 n가지 종류의 동전이 있음
 동전을 사용해 가치의 합이 k원이 되도록 그 경우의 수?
 D[i]: i라는 가치를 만들 수 있는 경우의 수
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1] // n가지 종류 동전, 가치의 합이 k원이 되도록 하고싶음

let max = Int(1e4) + 1
var dpTable = Array(repeating: 0, count: max) // 1<= k <= 10000
var valueList: [Int] = []

for _ in 0..<n {
  valueList.append(Int(readLine()!)!)
}

let minValue = valueList.min()!
dpTable[minValue] = 1

for i in 2..<max {
  for j in 0..<valueList.count {
    if k - dpTable[i - 1] >= j {
      dpTable[i] = dpTable[i - 1] + dpTable[k - dpTable[i - 1]]
      continue
    }
//    dpTable[i] = dpTable[i - 1]
  }
}
print(dpTable)
//print(dpTable[k])
