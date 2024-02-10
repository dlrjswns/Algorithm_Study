//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/28/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], K = input[1]

var count = 0
var visited = Array(repeating: true, count: N+1) // 있니 없니


for i in 2..<N+1 {
  for j in stride(from: i, to: N+1, by: i) {
    if visited[j] {
      visited[j] = false
      count += 1
      
      if count == K {
        print(j)
      }
    }
  }
}

//var jeongsuList = Array(repeating: 0, count: N - 1)
//
//var P = Int.max
//
//for i in 0..<N-1 {
//  jeongsuList[i] = i + 2
//  P = min(P, jeongsuList[i])
//}
//
//var maxValue = jeongsuList.max()!
//var count = 0 // 몇번째 지워진건지 카운팅
//var i = 1 // P의 배수를 위한 곱할 값, P * i
//
//while count < K { // K번째가 되기전까지 반복문 계속 돌림, 이 반복문을 나오면 그때 지워진 수를 출력
//  
//  if maxValue < P * i { // 만약 P의 배수가 리스트 요소 최댓값보다 크다면(더이상 지울게 없기에 2번으로 회귀)
//    maxValue = jeongsuList.max()!
//    P = jeongsuList.min()!
//    i = 1 // P의 값을 리스트의 최솟값을 초기화해주면서 i도 1로 초기화
//  }
//  
//  jeongsuList = jeongsuList.filter { $0 != P * i } // 반복문을 돌때마다 P의 배수를 지움
//  
//  count += 1 // 반복문을 한번 반복할때 카운팅 +1
//  i += 1 // 반복문을 한번 반복할때 P의 배수를 위한 값 +1
//}
//
//print(P * (i-1)) // 반복문이 나온 경우는 count == K인 경우이기때문에 정답 출력
//
//
