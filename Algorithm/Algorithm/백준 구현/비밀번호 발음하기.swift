//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/8/24.
//

import Foundation

/*
 a e i o u 하나를 반드시 포함
 모음이 3개 혹은 자음이 3개 연속으로 오면 안됨
 같은 글자 연속적으로 2번 오면 안됨, ee와 oo는 허용
 */

mainLoop: while true {
  let testcase = String(readLine()!)
  if testcase == "end" {
    break
  }
  
  var isValidFirst = false
  for ch in testcase {
    if ["a", "e", "i", "o", "u"].contains(ch) {
      isValidFirst = true
      break
    }
  }
  
  if !isValidFirst {
    print("<\(testcase)> is not acceptable.")
    continue mainLoop
  }
  
  var jaeumCount = 0 // 자음 몇개인지 카운팅
  var moeumCount = 0 // 모음 몇개인지 카운팅
  
  var beforeJaeum = false // 이전 문자가 자음이였는지
  var beforeMoeum = false // 이전 문자가 모음이였는지
  
  for ch in testcase {
    
    if ["a", "e", "i", "o", "u"].contains(ch) { // 모음이라면
      if beforeMoeum { // 이전 문자가 모음이라면
        moeumCount += 1
      } else {
        moeumCount = 1
      }
      beforeMoeum = true
      beforeJaeum = false
    } else { // 자음이라면
      if beforeJaeum { // 이전 문자가 자음이라면
        jaeumCount += 1
      } else {
        jaeumCount = 1
      }
      beforeJaeum = true
      beforeMoeum = false
    }
    
    if jaeumCount > 2 || moeumCount > 2 {
      // 2번째 조건에 만족하지 못한 경우
      print("<\(testcase)> is not acceptable.")
      continue mainLoop
    }
  }
  
  // 3번째 조건에 만족하지 못한 경우
  
  var beforeCH = ""
  
  for ch in testcase {
    
    if beforeCH == String(ch) && beforeCH != "e" && beforeCH != "o" {
      print("<\(testcase)> is not acceptable.")
      continue mainLoop
    }
    
    beforeCH = String(ch)
  }
  
  print("<\(testcase)> is acceptable.")
}
