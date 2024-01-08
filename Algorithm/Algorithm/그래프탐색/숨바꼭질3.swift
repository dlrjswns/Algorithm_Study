//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/7/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], K = input[1] // N은 수빈이 위치, K는 동생 위치

let max = Int(1e5) + 1

var queue: [(Int, Int)] = [] // 시간, 현재 위치
var index = 0
var visited = Array(repeating: false, count: max)



func bfs() {
  
  queue.append((0, N))
  
  while queue.count > index {

    let (time, currentPosition) = queue[index]
    
    visited[currentPosition] = true
    
    if currentPosition == K {
      print(time)
      break
    }
    
    if currentPosition * 2 < max && !visited[currentPosition * 2] {
      queue.append((time, currentPosition * 2))
    }
    
    if currentPosition - 1 >= 0 && !visited[currentPosition - 1] {
      queue.append((time + 1, currentPosition - 1))
    }
    
    if currentPosition + 1 < max && !visited[currentPosition + 1] {
      queue.append((time + 1, currentPosition + 1))
    }
    
    
    index += 1
  }
}

bfs()
