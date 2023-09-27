//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/24.
//

import Foundation

// (x, y) x는 몸무게, y는 키
// 키와 몸무게 둘 다 높아야만 덩치가 더 크다라고 표현

let N = Int(readLine()!)! // N은 전체 사람의 수
var sizeList: [[Int]] = []

for _ in 0..<N {
  let size = readLine()!.split(separator: " ").map { Int(String($0))! }
  sizeList.append([size[0], size[1]])
}

for i in 0..<sizeList.count {
  var count = 0
  for k in 0..<sizeList.count {
    if i != k {
      let first = sizeList[i]
      let second = sizeList[k]
      
      if first[0] < second[0] && first[1] < second[1] {
        count += 1
      }
    }
  }
  print(count + 1)
}
