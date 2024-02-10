//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/8/24.
//

import Foundation

let X = readLine()!.map { Int(String($0))! }

var sumX = X.reduce(0, +)
var count = 1

if X.count == 1 {
  count = 0
}


while sumX / 10 > 0 { // sumX가 9보다 큰 경우 반복문 동작
  
  var sum = 0
  
  for ch in String(sumX) {
    sum += Int(String(ch))!
  }
  
  sumX = sum
  count += 1
}

print(count)
print(sumX%3 == 0 ? "YES" : "NO")
