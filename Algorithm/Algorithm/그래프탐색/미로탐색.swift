//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/10/03.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0]
let M = input[1]

var graph: [[Int]] = []

for _ in 0..<N {
  graph.append(readLine()!.map { Int(String($0))! })
}

let dx = [0, 0, -1, 1] // 상 하 좌 우
let dy = [-1, 1, 0, 0]

func bfs(x: Int, y: Int) {
  
  var queue: [(Int, Int)] = [(x, y)]
  
  while !queue.isEmpty {
    let (x, y) = queue.removeFirst()
    
    for i in 0..<4 {
      let rx = dx[i] + x
      let ry = dy[i] + y
      if 0 <= rx && rx < N && 0 <= ry && ry < M && graph[rx][ry] == 1 {
        graph[rx][ry] = graph[x][y] + 1
        queue.append((rx, ry))
      }
    }
  }
}

bfs(x: 0, y: 0)
print(graph[N-1][M-1])
