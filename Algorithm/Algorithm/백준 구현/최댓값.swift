//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/22.
//

import Foundation

let num = 9
var numList: [Int] = []

for _ in 0..<9 {
  let input = Int(readLine()!)!
  numList.append(input)
}

var maxNum = numList[0]
var maxNumIdx = 1

for i in 0..<numList.count {
  if numList[i] > maxNum {
    maxNum = numList[i]
    maxNumIdx = i + 1
  }
}

print(maxNum)
print(maxNumIdx)
        
