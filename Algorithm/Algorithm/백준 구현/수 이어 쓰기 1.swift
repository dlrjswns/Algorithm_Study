//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/28/24.
//

import Foundation

let N = Int(readLine()!)!

var answer = 0
var i = 1


while 0 <= N - i {
  answer += N - i + 1
  i *= 10
}


print(answer)
