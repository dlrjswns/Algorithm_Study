//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/22.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
  let result = readLine()!
  var count = 0
  var sum = 0
  result.forEach({ element in
    if element == "O" {
      count += 1
      sum += count
    }
    else {
      count = 0
    }
  })
  
  print(sum)
}

