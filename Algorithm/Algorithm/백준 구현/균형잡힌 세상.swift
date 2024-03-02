//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/27/24.
//

import Foundation

while true {
  let input = String(readLine()!)
  
  if input == "." {
    break
  }
  
  var openStack: [Character] = []
  var isValid = true
  
  for ch in input {
    if ch == "(" || ch == "[" {
      openStack.append(ch)
    } else if ch == ")" {
      if openStack.isEmpty || openStack.removeLast() != "(" {
        isValid = false
        break
      }
    } else if ch == "]" {
      if openStack.isEmpty || openStack.removeLast() != "[" {
        isValid = false
        break
      }
    }
  }
  
  if !openStack.isEmpty {
    isValid = false
  }
  
  if isValid {
    print("yes")
  } else {
    print("no")
  }
}
