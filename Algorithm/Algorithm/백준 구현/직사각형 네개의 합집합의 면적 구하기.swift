//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 3/3/24.
//

import Foundation

var rectangle = Array(repeating: Array(repeating: 0, count: 101), count: 101)

for _ in 0..<4 {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for x in input[0]..<input[2] {
    for y in input[1]..<input[3] {
      if rectangle[x][y] == 0 {
        rectangle[x][y] = 1
      }
    }
  }
}

var result = 0

for x in 0..<101 {
  for y in 0..<101 {
    if rectangle[x][y] == 1 {
      result += 1
    }
  }
}

print(result)
