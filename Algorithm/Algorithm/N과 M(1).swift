//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 3/2/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

//var numList: [Int] = []
var visited = Array(repeating: false, count: N + 1)

func dfs(numList: [Int]) {
  
  if numList.count == M {
    print(numList.map { String($0) }.joined(separator: " "))
    return
  }
  
  for i in 1...N {
    if !visited[i] {
      visited[i] = true
      dfs(numList: numList + [i])
      visited[i] = false
    }
  }
}

dfs(numList: [])
