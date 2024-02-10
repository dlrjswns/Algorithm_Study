//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/26/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]
let minValue = min(N, M)

var square: [[Int]] = []

for _ in 0..<N {
  square.append(readLine()!.map { Int(String($0))! })
}

/*
 최대 정사각형의 길이가 M부터 최소 길이인 1까지 확인
 */

var maxSize = 1

for i in 0..<N {
  for j in 0..<M {
    for z in 1..<minValue {
      if i + z < N && j + z < M {
        if square[i][j] == square[i + z][j] &&
            square[i][j] == square[i][j + z] &&
            square[i][j] == square[i + z][j + z] {
          maxSize = max(maxSize, (z + 1) * (z + 1))
        }
      }
    }
  }
}



print(maxSize)
