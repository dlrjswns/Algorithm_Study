//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 2/10/24.
//

import Foundation

struct PriorityQueue<T: Comparable> {
  fileprivate var heap: Heap<T>
  
  public init(sort: @escaping (T, T) -> Bool) {
    heap = Heap(sort: sort)
  }
  
  var isEmpty: Bool {
    return heap.nodes.isEmpty
  }
  
  var count: Int {
    return heap.nodes.count
  }
  
  func peek() -> T? {
    return heap.peek()
  }
  
  func contains(element: T) -> Bool {
    return heap.nodes.contains(element)
  }
  
  mutating func remove(index: Int) -> T? {
    return heap.remove(at: index)
  }
  
  mutating func remove(element: T) -> T? {
    return heap.remove(element: element)
  }
  
  mutating func push(_ element: T) {
    heap.insert(element)
  }
  
  mutating func pop() -> T? {
    return heap.remove()
  }
}

struct Heap<T: Comparable> {
  var nodes: [T] = []
  private let sort: (T, T) -> Bool
  
  init(sort: @escaping (T, T) -> Bool) {
    self.sort = sort
  }
  
  mutating func insert(_ data: T) {
    nodes.append(data)
    let lastIndex = nodes.count - 1
    shiftUp(child: lastIndex)
  }
  
  mutating func remove() -> T? {
    guard !nodes.isEmpty else { return nil }
    
    nodes.swapAt(0, nodes.count - 1)
    
    defer { shiftDown(parent: 0) }
    
    return nodes.removeLast()
  }
  
  mutating func remove(at index: Int) -> T? {
    guard index < nodes.count else { return nil }
    
    if index == nodes.count - 1 {
      return nodes.removeLast()
    } else {
      nodes.swapAt(index, nodes.count - 1)
      
      defer {
        shiftUp(child: index)
        shiftDown(parent: index)
      }
      
      return nodes.removeLast()
    }
  }
  
  mutating func remove(element: T) -> T? {
    // 우선순위 큐에서 해당 요소를 찾아 제거
    guard let index = nodes.firstIndex(of: element) else {
      return nil
    }
    
    let removedElement = nodes.remove(at: index)
    shiftDown(parent: index)
    
    return removedElement
  }
  
  public func peek() -> T? {
    return nodes.first
  }
  
  // MARK: Private Methods
  
  private func parentIndex(of child: Int) -> Int {
    return (child - 1) / 2
  }
  
  private func leftChildIndex(of parent: Int) -> Int {
    return (parent * 2) + 1
  }
  
  private func rightChildIndex(of parent: Int) -> Int {
    return (parent * 2) + 2
  }
  
  mutating private func shiftUp(child: Int) {
    var child = child
    var parent = parentIndex(of: child)
    
    // 노드의 제일 위까지 올라가거나, 부모의 노드 값과 비교했을 때 자기 자리일 때
    while child > 0 && sort(nodes[child], nodes[parent]) {
      nodes.swapAt(child, parent)
      child = parent
      parent = parentIndex(of: child)
    }
  }
  
  mutating private func shiftDown(parent: Int) {
    var parent = parent
    
    while true {
      let left = leftChildIndex(of: parent)
      let right = rightChildIndex(of: parent)
      var candidate = parent
      if left < nodes.count && sort(nodes[left], nodes[candidate]) {
        candidate = left
      }
      
      if right < nodes.count && sort(nodes[right], nodes[candidate]) {
        candidate = right
      }
      
      if candidate == parent {
        return
      }
      nodes.swapAt(parent, candidate)
      parent = candidate
    }
  }
}

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
var recommendedCountInfo: [Int: (Int, Int)] = [:] // 시간, 추천 수

// 추천받은 횟수가 낮거나 같다면 가장 오래된 사진이 큐의 앞으로 게시, 최소힙
var priorityQueue = PriorityQueue<Int> { f, s in
  if recommendedCountInfo[f]!.1 == recommendedCountInfo[s]!.1 {
    return recommendedCountInfo[f]!.0 > recommendedCountInfo[s]!.0
  } else {
    return recommendedCountInfo[f]!.1 < recommendedCountInfo[s]!.1
  }
}

var time = allStudentRecommendationCount

for num in 0..<recommendedStudentNumList.count {
  
  if !priorityQueue.contains(element: recommendedStudentNumList[num]) {
    // 사진틀에 올라가있지않으면
    
    if priorityQueue.count >= N { // 게시된 사진이 삭제된다면 추천수 0으로 초기화
      let popNum = priorityQueue.pop()!
      recommendedCountInfo[popNum] = nil
      
      recommendedCountInfo[recommendedStudentNumList[num]] = (time, 1)
      priorityQueue.push(recommendedStudentNumList[num])
    } else {
      recommendedCountInfo[recommendedStudentNumList[num]] = (time, 1)
      priorityQueue.push(recommendedStudentNumList[num])
    }
    
  } else {
    // 사진틀에 올라가있으면
    // 여기서 정렬을 위해 삭제했다가 새로 삽입해야함
    let(t, r) = recommendedCountInfo[recommendedStudentNumList[num]]!
    _ = priorityQueue.remove(element: recommendedStudentNumList[num])
    recommendedCountInfo[recommendedStudentNumList[num]] = (t, r+1)
    priorityQueue.push(recommendedStudentNumList[num])
  }
  
  
  time -= 1
  
}

var result: [Int] = []

while !priorityQueue.isEmpty {
    result.append(priorityQueue.pop()!)
}

result.sort()

print(result.map { String($0) }.joined(separator: " "))









