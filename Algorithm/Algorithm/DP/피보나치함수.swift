//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/12/24.
//

import Foundation

let T = Int(readLine()!)! // T는 테스트 케이스의 개수

/*
 D[i] = fibanacci(i)를 했을 때, 0과 1이 몇번 출력되는지
 D[i] = (D[i - 1].0 + D[i - 2].0, D[i - 1].1 + D[i - 2].1)
 */

var dpTable = Array(repeating: (-1, -1), count: 41) // 40보다 작거나 같은 자연수 또는 0, (1이 몇번, 0이 몇번)
dpTable[0] = (0, 1)
dpTable[1] = (1, 0)
dpTable[2] = (1, 1)
dpTable[3] = (2, 1)

for i in 4..<41 {
  dpTable[i] = (dpTable[i - 1].0 + dpTable[i - 2].0, dpTable[i - 1].1 + dpTable[i - 2].1)
}


for _ in 0..<T {
  let N = Int(readLine()!)!
  print("\(dpTable[N].1) \(dpTable[N].0)")
}
