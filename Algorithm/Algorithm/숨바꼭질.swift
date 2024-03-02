//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/27/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let subinPosition = input[0], littlePosition = input[1] // 수빈이 위치, 동생 위치

var queue: [(Int, Int)] = [(subinPosition, 0)]
var index = 0
var visited = Array(repeating: false, count: Int(1e5) + 1)

func bfs() {
  while queue.count > index {
    var (currentPosition, time) = queue[index]
    if currentPosition == littlePosition {
      print(time)
      break
    }
    
    if 0...Int(1e5) ~= currentPosition + 1 && !visited[currentPosition + 1] {
      queue.append((currentPosition + 1, time + 1))
      visited[currentPosition + 1] = true
    }
    
    if 0...Int(1e5) ~= currentPosition - 1 && !visited[currentPosition - 1] {
      queue.append((currentPosition - 1, time + 1))
      visited[currentPosition - 1] = true
    }
    
    if 0...Int(1e5) ~= currentPosition * 2 && !visited[currentPosition * 2] {
      queue.append((currentPosition * 2, time + 1))
      visited[currentPosition * 2] = true
    }
    
    
    index += 1
  }
}

bfs()
