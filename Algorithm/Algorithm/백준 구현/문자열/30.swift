//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/19/24.
//

import Foundation

var N = readLine()!.map { Int(String($0))! }

if !N.contains(0) {
  print(-1)
} else {
  if N.reduce(0, +) % 3 == 0 {
    N.sort(by: >)
    print(N.map { String($0) }.joined())
  } else {
    print(-1)
  }
}

var max = 0 // 30배수가 되는 가장 큰 수


