//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/23.
//

import Foundation

var num = Int(readLine()!)! // 입력받은 순서

var idx = 1
var count = 0 // 어디 대각선에 위치하는지에 대한 정보

while num > 0 {
  count += 1
  num -= idx
  idx += 1
}

let absNum = abs(num) + 1

print("어디대각선에위치해있니 \(count)")
print("몇번째 \(absNum)")

if count % 2 == 0 { // count가 짝수일 때
  print("\(absNum)/\(count + absNum - 3)")
} else { // count가 홀수일 때
  print("\(count + absNum - 3)/\(absNum)")
}

