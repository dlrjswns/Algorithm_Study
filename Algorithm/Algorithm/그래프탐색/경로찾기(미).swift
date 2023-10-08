//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/10/07.
//

import Foundation

let N = Int(String(readLine()!))! // N은 정점의 개수

var graph: [[Int]] = []

for _ in 0..<N {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var visited = Array(repeating: Array(repeating: false, count: N), count: N)

func dfs(x: Int, y: Int) {
  if !visited[x][y] && graph[x][y] == 1 {
    visited[x][y] = true
    dfs(x: <#T##Int#>, y: <#T##Int#>)
  }
}
