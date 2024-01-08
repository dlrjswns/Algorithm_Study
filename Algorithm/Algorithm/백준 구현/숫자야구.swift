//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 1/6/24.
//

import Foundation

// 숫자가 같아도 다른 위치에 있으면 1볼, 같은 위치에 있으면 1스트라이크
// 만약에 민혁이의 숫자가 영수 숫자에 대해 3스트라이크인 경우 게임 끝

let N = Int(readLine()!)! // N은 민혁이가 영수에게 몇번이나 질문했는지 수

var numberList: [Int] = []
var infoList: [(Int, Int)] = []

for _ in 0..<N {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let number = input[0] // 민혁이가 질문한 세자리 수
  let strikeCount = input[1] // 답한 스트라이크 개수
  let ballCount = input[2] // 답한 볼 개수
  
  numberList.append(number)
  infoList.append((strikeCount, ballCount))
}

func isValid(n: Int) -> Bool {
  let strNum = String(n)
  return Array(Set(strNum)).count == Array(strNum).count && !strNum.contains("0")
}

func getStrikeAndBall(n: Int, compareNum: Int) -> (Int, Int) {
  var strike = 0
  var ball = 0
  
  let listNum = Array(String(n))
  let compareNumList = Array(String(compareNum))
  
  for i in 0..<3 {
    if listNum.contains(compareNumList[i]) { // 하나라도 같은게 있다면
      if i == listNum.firstIndex(where: { $0 == compareNumList[i] }) {
        strike += 1
      } else {
        ball += 1
      }
    }
  }
  return (strike, ball)
}

func checkResult(num: Int) -> Bool {
  for n in 0..<N {
    let getInfo = getStrikeAndBall(n: num, compareNum: numberList[n])
    if getInfo != infoList[n] {
      return false
    }
  }
  return true
}

var count = 0

for num in 123...987 {
  guard isValid(n: num) else { continue }
  
  if checkResult(num: num) {
    count += 1
  }
}

print(count)

