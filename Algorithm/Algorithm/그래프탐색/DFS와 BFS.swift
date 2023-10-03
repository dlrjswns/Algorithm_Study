//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/10/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // 정점의 개수 N
let M = input[1] // 간선의 개수 K
let V = input[2] // 탐색 시작할 정점 번호 K

var graph: [Int: [Int]] = [:]

for _ in 0..<M {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let first = input[0]
  let second = input[1]
  graph[first, default: []].append(second)
  graph[second, default: []].append(first)
  graph[first]!.sort()
  graph[second]!.sort()
}

func bfs(start: Int) {
  var visitedNode = [start]
  var needVisitedNode = [start]
  
  while !needVisitedNode.isEmpty {
    let visitingNode = needVisitedNode.removeLast()
    for node in graph[visitingNode]! {
      if !visitedNode.contains(node) {
        visitedNode.append(node)
        needVisitedNode.append(node)
      }
    }
  }
  
  visitedNode.forEach { print($0, terminator: " ") }
}

var dfsNode: [Int] = []

func dfs(start: Int, visitedNode: [Int] = []) {
  var visitedNode = visitedNode
  dfsNode.append(start)
  
  print(start, terminator: " ")
  
  for node in graph[start]! {
    if !dfsNode.contains(node) {
      dfs(start: node, visitedNode: visitedNode)
    }
  }
}

print("그래프 \(graph)")
dfs(start: V)
//bfs(start: V)
