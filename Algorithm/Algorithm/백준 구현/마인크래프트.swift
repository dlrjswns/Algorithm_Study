//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 4/30/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
/*
 N
 */
var N = input[0], M = input[1], B = input[2]
var heightInfo: [Int] = []

for _ in 0..<N {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  heightInfo += input
}

var maxTime = Int.max
var maxHeight = Int.min


var max = heightInfo.max()!
var min = heightInfo.min()!

for floor in min...max {
  
  var inventoryBlockCount = B
  var time = 0
  
//  if isValid(height: height) {
    for blockHeight in heightInfo {
      if floor > blockHeight { // 블록을 추가해야하는 경우
        /*if floor - blockHeight <= inventoryBlockCount {*/ // 추가해야할 블록의 개수가 인벤토리에 충분히 있다면
          time += floor - blockHeight
          inventoryBlockCount -= floor - blockHeight
//        }
      } else if floor < blockHeight { // 블록을 제거해야하는 경우
        inventoryBlockCount += blockHeight - floor
        time += 2 * (blockHeight - floor)
      }
    }
    
    if maxTime >= time && inventoryBlockCount >= 0 {
      maxHeight = floor
      maxTime = time
    }
//  }
}
print(maxTime, maxHeight)
