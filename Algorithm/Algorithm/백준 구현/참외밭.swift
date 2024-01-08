//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/5/24.
//

import Foundation

let K = Int(readLine()!)! // K는 1m제곱의 넓이에 자라는 참외의 개수
var list: [(Int, Int)] = []
var dict: [Int: Int] = [:]

for _ in 0..<6 {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let direction = input[0] // 변의 방향(1 -> 동쪽, 2 -> 서쪽, 3 -> 남쪽, 4 -> 북쪽)
  let length = input[1] // 변의 길이
  list.append((direction, length))
  dict[direction, default: 0] += 1
}

var entireSize = 1
var smallSize = 1

for i in 0..<list.count {
  if dict[list[i].0]! == 1 {
    entireSize *= list[i].1
    continue
  }
  if list[i].0 == list[(i + 2) % 6].0 {
    smallSize *= list[(i + 1) % 6].1
  }
  
}

print((entireSize - smallSize) * K)


