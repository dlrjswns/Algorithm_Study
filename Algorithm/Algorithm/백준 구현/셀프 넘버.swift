//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/22.
//

import Foundation

let num = 10000

func constructor(_ number: Int) -> Int {
  var n = number
  var sum = n
  while n != 0 {
    sum += n % 10
    n /= 10
  }
  return sum
}

var list = Array(repeating: false, count: 10001)

for num in 1..<10001 {
  let sum = constructor(num)
  if sum <= 10000 {
    list[sum] = true
  }
}

for li in 1..<list.count {
  if list[li] == false {
    print(li)
  }
}
