//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/11/24.
//

import Foundation

/*
 D[i] = 1, 2, 3의 합으로 i를 만들어내는 방법 수
 */

var dpTable = Array(repeating: -1, count: 11)

func dp() {
  /*
   dp[4] = dp[3] + dp[2] + dp[1]
   */
  dpTable[1] = 1
  dpTable[2] = 2
  dpTable[3] = 4
  
  for n in 4...10 {
    dpTable[n] = dpTable[n - 1] + dpTable[n - 2] + dpTable[n - 3]
  }
}

dp()

let T = Int(readLine()!)!

for _ in 0..<T {
  let num = Int(readLine()!)!
  print(dpTable[num])
}

