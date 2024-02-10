//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/27/24.
//

import Foundation

let N = Int(readLine()!)! // 보드의 크기

var candyList: [[String]] = []

for _ in 0..<N {
  candyList.append(readLine()!.map { String($0) })
}

var maxCandy = 1

func colCount() { // 모든 열을 확인하여 사탕의 최댓값을 갱신
  for i in 0..<N {
    var count = 0
    if candyList[i].count != Set(candyList[i]).count {
      maxCandy = max(maxCandy, candyList[i].count - Set(candyList[i]).count + 1)
    }
  }
}

func rowCount() { // 모든 행을 확인하여 사탕의 최댓값을 갱신
  for i in 0..<N {
    var count = 0
    for j in 0..<N-1 {
      if candyList[i][j] == candyList[i+1][j] {
        count += 1
      } else {
        count = 0
      }
    }
    
    maxCandy = max(maxCandy, count)
  }
}

for i in 0..<N {
  
  var candyList = candyList
  
  for j in 0..<N {
    
    // 특정 행에서 하나씩 스왑
    candyList[i].swapAt(j, j+1)
    
    // 스왑 이후 행과 열에 요소가 같은지 확인하여 최댓값을 갱신
    rowCount()
    colCount()
    
    candyList[i].swapAt(j, j+1)
    
    // 특정 열에서 하나씩 스왑
    for i in 0..<N {
      for j in 0..<N {
        candyList[i][j]
      }
    }
    
  }
}
