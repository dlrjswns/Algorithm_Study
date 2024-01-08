//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/6/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // 정점의 개수
let M = input[1] // 간선의 개수

var dict: [Int: [Int]] = [:]

for _ in 0..<M {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  dict[input[0], default: []].append(input[1])
  dict[input[1], default: []].append(input[0])
}

var count = 0
var visitedNode = Array(repeating: false, count: N + 1)

func dfs(start: Int) {
  visitedNode[start] = true
  if let nodes = dict[start] {
    for node in nodes {
      if !visitedNode[node] {
  //      visitedNode[node] = true
        dfs(start: node)
      }
    }
  }
}

for i in 1...N {
  if !visitedNode[i] {
    count += 1
    dfs(start: i)
  }
}

print(count)
