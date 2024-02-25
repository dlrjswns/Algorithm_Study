//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0] // N, M은 문자열의 개수
let M = input[1]

var nList: [String] = []

for _ in 0..<N {
  nList.append(readLine()!)
}
nList.sort()
var count = 0

for _ in 0..<M {
  let m = readLine()!
  
  if binary_search(arr: nList, target: m) {
    count += 1
  }
}

func binary_search(arr: [String], target: String) -> Bool {
  var start = 0
  var end = nList.count - 1
  
  while start <= end {
    let mid = (start + end) / 2
    
    if arr[mid] == target {
      return true
    } else if arr[mid] < target {
      start = mid + 1
    } else {
      end = mid - 1
    }
  }
  return false
}

print(count)




