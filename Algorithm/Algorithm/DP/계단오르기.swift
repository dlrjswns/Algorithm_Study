//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/11/24.
//

import Foundation

let n = Int(readLine()!)! // 계단의 개수

var dpTable = Array(repeating: Array(repeating: -1, count: 3), count: n + 1)
var score = Array(repeating: -1, count: n + 1)

func dp() {
  if n > 1 {
    dpTable[1][1] = score[1]
    dpTable[1][2] = 0
    dpTable[2][1] = score[2]
    dpTable[2][2] = score[1] + score[2]
    
    for i in 3..<n + 1 {
      dpTable[i][1] = max(dpTable[i - 2][1], dpTable[i - 2][2]) + score[i]
      dpTable[i][2] = dpTable[i - 1][1] + score[i]
    }
  } else if n == 1 {
    print(score[1])
  }
}

for i in 1..<n + 1 {
  
  let num = Int(readLine()!)!
  score[i] = num
}

dp()

if n != 1 {
  print(max(dpTable[n][1], dpTable[n][2]))
}
