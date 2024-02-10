//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/28/24.
//

import Foundation

/*
 1 -> 스위치 켜짐
 0 -> 스위치 꺼짐
 
 남학생일때 스위치번호가 자기가 받은 수의 배수이면 스위치의 상태 바꿈
 여학생일때 자기가 받은 수와 같은 번호의 스위치를 중심으로 좌우가 대칭이면서 가장 많은 스위치를 포함하는 구간을 찾아 스위치 상태 바꿈
 여학생일때 대칭인 경우가 없다면 자기 번호의 스위치 상태만 바꿈
 */

let switchCount = Int(readLine()!)! // 스위치 개수
var switchStatus = [-1] + readLine()!.split(separator: " ").map { Int(String($0))! } // 스위치 상태

let studentCount = Int(readLine()!)! // 학생 수
for _ in 0..<studentCount {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let sex = input[0], studentNum = input[1] // 학생 성별, 학생이 받은 수
  
  if sex == 1 { // 남학생일 때
    for i in stride(from: studentNum, through: switchCount, by: studentNum) {
      if switchStatus[i] == 1 {
        // 스위치가 켜져있으면 끄기
        switchStatus[i] = 0
      } else {
        // 스위치가 꺼져있으면 켜기
        switchStatus[i] = 1
      }
    }
  } else { // 여학생일 때
//    if switchStatus[studentNum-i] != switchStatus[studentNum+i] {
      if switchStatus[studentNum] == 1 {
        // 스위치가 켜져있으면 끄기
        switchStatus[studentNum] = 0
      } else {
        // 스위치가 꺼져있으면 켜기
        switchStatus[studentNum] = 1
      }
//    }
    
    for i in 1...switchCount / 2 {
      
      if 1...switchCount ~= studentNum-i && 1...switchCount ~= studentNum + i {
        if switchStatus[studentNum-i] == switchStatus[studentNum+i] { // 대칭 상태가 같으면
          if switchStatus[studentNum+i] == 1 && switchStatus[studentNum-i] == 1 {
            // 스위치가 켜져있으면 끄기
            switchStatus[studentNum+i] = 0
            switchStatus[studentNum-i] = 0
          } else {
            // 스위치가 꺼져있으면 켜기
            switchStatus[studentNum+i] = 1
            switchStatus[studentNum-i] = 1
          }
        } else {
          break
        }
      }
    }
  }
}
//print("상태 \(switchStatus)")
for i in 1..<switchStatus.count {
  print(switchStatus[i], terminator: " ")
  
  if i % 20 == 0 {
    print()
  }
}
