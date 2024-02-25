//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/25/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

// N은 헛간의 개수
let N = input[0], M = input[1]
var dict: [Int: [Int]] = [:]

for _ in 0..<M {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let a_i = input[0], b_i = input[1]
  dict[a_i, default: []].append(b_i)
  dict[b_i, default: []].append(a_i)
}

func bfs() {
  
  var queue: [(currentNumber: Int, distance: Int, count: Int)] = [(1, 0, 0)]
  var index = 0
  
  while queue.count > index {
    
    let (currentNumber, distance, count) = queue[index]
    
    for num in dict[currentNumber]! {
      
    }
    
  }
  
}
