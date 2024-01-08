//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/10/09.
//

import Foundation

let N = Int(String(readLine()!))! // 전체 사람의 수
var graph: [Int: [Int]] = [:]

/*
 나, 아버지 -> 1촌
 아버지, 할아버지 -> 1촌
 나, 할아버지 -> 2촌
 나, 아버지 형제 -> 3촌
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = Int(String(readLine()!))!

var visited = Array(repeating: false, count: N)

for _ in 0..<M {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  graph[input[0], default: []].append(input[1])
}

func bfs(start: Int, end: Int) {
  
  var queue: [(Int, Int)] = [(start, end)]
  var index = 0
  
  while queue.count > index {
    let (start, end) = queue[index]
    
    for list in graph[start]! {
      for li in list {
        visited[li] = true
        
      }
    }
  }
  
}

