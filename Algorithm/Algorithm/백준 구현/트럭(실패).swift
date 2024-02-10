//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/1/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], w = input[1], L = input[2]
var truckWeightList: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var overDariList: [Int] = [] // 다리위에 올라가있는 트럭리스트

/*
 n은 다리를 건너는 트럭의 수
 w는 다리의 길이
 L은 다리의 최대하중
 */

var sumDariWeight = 0

func isLessThanMaxWeight(truckWeight: Int) -> Bool { // 다리위에 올라가있는 트럭들의 무게 합이 다리 최대하중보다 이하인지
  
  let truckWeightOverDari = overDariList.reduce(0, +) // 다리위에 올라가있는 모든 트럭의 무게
  return sumDariWeight + truckWeight <= L // 추가하고자하는 트럭무게와 기존 다리위에 올라가있는 트럭의 무게가 다리의 최대하중인 L보다 이하면 올라가도됨
  
}

func isOverDari() -> Bool { // 다리 길이에 올라간 트럭이 허용할 수 있는 수를 채웠는지
  
  return overDariList.count < w // 다리위에 올라가있는 트럭의 수가 다리길이보다 작다면 올라가도됨
}

var index = 0
var time = 0

while truckWeightList.count > index || !overDariList.isEmpty {
  
//  if index < truckWeightList.count && truckWeightList[index] > L {
//          index += 1
//          continue
//      }
//  print("다리위리스트 \(overDariList)")
  if !overDariList.isEmpty {
//    _ = overDariList.removeFirst()
    sumDariWeight -= overDariList.removeFirst()
  }
  
  if index < truckWeightList.count {
    let truckWeight = truckWeightList[index]
    
    if isOverDari() && isLessThanMaxWeight(truckWeight: truckWeight) { // 다리위에 올라갈 수 있고 최대하중 이하일때
      overDariList.append(truckWeight)
      index += 1
      sumDariWeight += truckWeight
    }
  }
  
  time += 1
}

print(time)
