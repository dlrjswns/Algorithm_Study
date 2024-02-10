//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/10/24.
//

import Foundation

/*
 1. 학생회장 후보는 전체 학생의 추천에 의해 정해진 수만큼 선정
 2. 추천받은 학생의 사진을 게시할 수 있는 사진틀을 후보수만큼 만듬
 
 - 추천받은 학생 사진을 게시하고 추천받은 횟수를 표시하는 방법
 1. 특정 학생 추천하면 반드시 사진틀에 게시
 2. 비어있는 사진틀이 없다면 현재 추천횟수가 가장 적은 학생 사진 삭제 -> 새롭게 게시
    2명이상이라면 게시된지 가장 오래된 사진 삭제
 
 3. 이미 사진이 게시된 학생이 추천받으면 추천횟수만 늘어남
 4. 사진틀에 게시된 사진이 삭제된다면 해당 학생이 추천받은 횟수는 0으로 초기화
 */

// 사진틀의 개수 N
let N = Int(readLine()!)!

// 모든 학생의 총 추천 횟수
let allStudentRecommendationCount = Int(readLine()!)!

// 추천받은 학생을 나타내는 번호
let recommendedStudentNumList = readLine()!.split(separator: " ").map { Int(String($0))! }

// 각각 학생들이 추천 수가 몇인지
var studentRecommendedInfo: [Int: Int] = [:]
for num in recommendedStudentNumList {
  studentRecommendedInfo[num, default: 0] += 1
}

// 최종후보들의 학생번호를 증가하는 순서대로 출력 -> 정답
var result: [Int] = []

for recommendedStudentNum in recommendedStudentNumList {
  if result.count < N { // 사진틀에 후보를 올릴 수 있을 때
    result.append(recommendedStudentNum)
  } else {
    
  }
}






