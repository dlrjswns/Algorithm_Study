//
//  main.swift
//  Algorithm
//
//  Created by 이건준 on 5/4/24.
//

import Foundation

struct PriorityQueue<T: Comparable> {
  var heap: Heap<T>
  
  init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
    heap = Heap(elements: elements, sortFunction: sort)
  }
  
  var count : Int {
    return heap.count
  }
  var isEmpty : Bool {
    return heap.isEmpty
  }
  
  func top () -> T? {
    return heap.peek
  }
  mutating func clear () {
    while !heap.isEmpty {
      _ = heap.remove()
    }
  }
  mutating func pop() -> T? {
    return heap.remove()
  }
  mutating func push(_ element: T) {
    heap.insert(node: element)
  }
}

struct Heap<T: Comparable> {
  private var elements: [T]
  private let sortFunction: (T, T) -> Bool
  
  var isEmpty: Bool {
    return self.elements.isEmpty
  }
  var peek: T? {
    return self.elements.first
  }
  var count: Int {
    return self.elements.count
  }
  
  init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
    self.elements = elements
    self.sortFunction = sortFunction
    if !elements.isEmpty {
      self.buildHeap()
    }
  }
  
  func leftChild(of index: Int) -> Int {
    return index * 2
  }
  func rightChild(of index: Int) -> Int {
    return index * 2 + 1
  }
  func parent(of index: Int) -> Int {
    return index / 2
  }
  mutating func add(element: T) {
    self.elements.append(element)
  }
  mutating func diveDown(from index: Int) { // 힙에서 요소를 삭제하기위해 루트랑 변경 후 다시 힙으로 재조정하는 함수
    var higherPriority = index
    let leftIndex = self.leftChild(of: index)
    let rightIndex = self.rightChild(of: index)
    
    if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
      higherPriority = leftIndex
    }
    if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
      higherPriority = rightIndex
    }
    if higherPriority != index {
      self.elements.swapAt(higherPriority, index)
      self.diveDown(from: higherPriority)
    }
  }
  mutating func swimUp(from index: Int) { // 힙에 요소를 삽입하고 최대힙 혹은 최소힙으로 다시
    var index = index
    while index >= 0 && self.sortFunction(self.elements[index], self.elements[index/2]) {
      self.elements.swapAt(index/2, index)
      index /= 2
    }
  }
  mutating func buildHeap() { // 생성자로 요소를 받았을때 이를 다시 힙으로 리턴하는 함수
    for index in (0...(self.elements.count / 2)).reversed() {
      self.diveDown(from: index)
    }
  }
  mutating func insert(node: T) {
    self.elements.append(node)
    self.swimUp(from: self.elements.endIndex - 1)
  }
  mutating func remove() -> T? {
    if self.elements.isEmpty { return nil }
    self.elements.swapAt(0, elements.endIndex - 1)
    let deleted = elements.removeLast()
    self.diveDown(from: 0)
    
    return deleted
  }
}


let n = Int(readLine()!)! // 후보의 수
var votedInfo: [Int: Int] = [:] // [후보 번호: 찍은 횟수]

var queue = PriorityQueue<Int> () {
  votedInfo[$0]! > votedInfo[$1]!
}

var dasomCount = Int(readLine()!)!

for num in 0..<n-1 {
  let votedCount = Int(readLine()!)!
  votedInfo[num] = votedCount
  queue.push(num)
}

var count = 0

if !queue.isEmpty {
  while dasomCount <= votedInfo[queue.top()!]! { // 다솜이가 가장 많은 투표수를 받기전까지 반복문 반복
    let mostVoted = queue.pop()!
    count += 1
    dasomCount += 1
    votedInfo[mostVoted]! -= 1
    queue.push(mostVoted)
  }
}

print(count)

