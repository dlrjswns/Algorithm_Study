//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/27/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var arrayList: [[Int]] = []

for _ in 0..<N {
  arrayList.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let K = Int(readLine()!)!

for _ in 0..<K {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let i = input[0], j = input[1], x = input[2], y = input[3]
  
  var result = 0
  
  for xPosition in i-1...x-1 {
    for yPosition in j-1...y-1 {
      result += arrayList[xPosition][yPosition]
    }
  }
  print(result)
}
