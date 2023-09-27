//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/23.
//

import Foundation

let N = Int(readLine()!)! // N은 명령의 수
var commandList: [String] = [] // 주어진 명령 리스트

for _ in 0..<N {
  commandList.append(readLine()!)
}

var stack: [Int] = []

for stackCommand in commandList {
  let seperatorCommand = stackCommand.split(separator: " ")
  let command = seperatorCommand[0]
  if command == "push" {
    let element = Int(seperatorCommand[1])!
    stack.append(element)
  } else if command == "top" {
    if stack.isEmpty {
      print(-1)
    } else {
      print(stack.last!)
    }
  } else if command == "size" {
    print(stack.count)
  } else if command == "empty" {
    print(stack.isEmpty ? 1 : 0)
  } else if command == "pop" {
    if stack.isEmpty {
      print(-1)
    } else {
      print(stack.last!)
      stack.removeLast()
    }
  }
}
