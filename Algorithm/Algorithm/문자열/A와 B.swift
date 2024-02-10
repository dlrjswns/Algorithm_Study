//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/21/24.
//

import Foundation

let S = String(readLine()!)
var T = readLine()!.map { String($0) }

/*
 S -> T로 변환해야하는 문제
 1. 문자열 뒤에 A를 추가
 2. 문자열 뒤집고 뒤에 B를 추가
 */

while S.count != T.count {
  if T.last! == "A" {
    T.removeLast()
  } else {
    T.removeLast()
    T = T.reversed()
  }
}

if T.joined() == S {
  print(1)
} else {
  print(0)
}
