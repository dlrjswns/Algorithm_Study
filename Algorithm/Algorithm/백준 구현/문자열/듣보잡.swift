//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2023/09/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0)) }
let N = input[0]! // N은 듣도 못한 사람
let M = input[1]! // M은 보도 못한 사람
var nList: [String] = []
var mList: [String] = []

for _ in 0..<N {
  nList.append(readLine()!)
}
nList.sort()
var count = 0
var peopleList: [String] = []

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

for _ in 0..<M {
 let m = readLine()!
  if binary_search(arr: nList, target: m) {
    count += 1
    peopleList.append(m)
  }
}

print(count)
peopleList.sort()
peopleList.forEach { print($0) }
