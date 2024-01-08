//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/8/24.
//

import Foundation

let n = Int(readLine()!)! // n은 전체 사람의 수
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let fstPersonNumber = input[0], sndPersonNumber = input[1]
let m = Int(readLine()!)! // m은 부모 자식들 간의 관계의 개수

var parentOrganization: [Int:[Int]] = [:]

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let parentNumber = input[0], childrenNumber = input[1]

  parentOrganization[parentNumber, default: []].append(childrenNumber)
  parentOrganization[childrenNumber, default: []].append(parentNumber)
}

var queue: [(Int, Int)] = []
var index = 0
var visited = Array(repeating: false, count: n + 1) // 1부터 100
var count = 0

func bfs() {
  
  queue.append((fstPersonNumber, 0))
  
  while queue.count > index {
    let (number, depth) = queue[index]
    
    if number == sndPersonNumber {
      print(depth)
      return
    }
    
    visited[number] = true
    
    if let personNumber = parentOrganization[number] {
      for number in personNumber {
        if !visited[number] {
          queue.append((number, depth + 1))
        }
      }
    }
    index += 1
  }
  print(-1)
}

bfs()
