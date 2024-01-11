//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/11/24.
//

import Foundation

/*
 X가 3으로 나누어 떨어지면, 3으로 나눈다.
 X가 2로 나누어 떨어지면, 2로 나눈다.
 1을 뺀다.
 
 1을 만들 수 있는 최소
 */

let N = Int(readLine()!)!

var visited = Array(repeating: false, count: Int(1e6) + 1)

func bfs() {
  
  var queue: [(Int, Int)] = []
  var index = 0
  
  queue.append((N, 0))
  visited[N] = true
  
  while queue.count > index {
    
    let (currentNum, count) = queue[index]
    
    if currentNum == 1 {
      print(count)
      return
    }
    
    if currentNum % 3 == 0 && !visited[currentNum / 3] {
      queue.append((currentNum / 3, count + 1))
      visited[currentNum / 3] = true
      continue
    }
    
    if currentNum % 2 == 0 && !visited[currentNum / 2] {
      queue.append((currentNum / 2, count + 1))
      visited[currentNum / 2] = true
      continue
    }
    
    queue.append((currentNum - 1, count + 1))
    visited[currentNum - 1] = true
    
    
    index += 1
  }
  
}

bfs()
