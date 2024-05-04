let N = Int(readLine()!)! // 사진틀 개수
let _ = readLine()! // 추천 횟수 (사용하지 않음)
let recommendedStudents = readLine()!.split(separator: " ").map { Int($0)! } // 추천 학생 목록

var frames = [(id: Int, recommend: Int, time: Int)]() // (학생 번호, 추천 횟수, 게시된 시간) 튜플을 담을 배열

for (index, student) in recommendedStudents.enumerated() {
    if let idx = frames.firstIndex(where: { $0.id == student }) { // 이미 게시된 학생인 경우
        frames[idx].recommend += 1 // 추천 횟수 증가
    } else { // 새로운 학생인 경우
        if frames.count < N { // 사진틀이 다 차지 않은 경우
            frames.append((id: student, recommend: 1, time: index))
        } else { // 사진틀이 다 찬 경우
            frames.sort { // 추천 횟수가 낮은 순서, 추천 횟수가 같으면 게시된 시간이 오래된 순서로 정렬
                if $0.recommend == $1.recommend {
                    return $0.time < $1.time
                } else {
                    return $0.recommend < $1.recommend
                }
            }
            frames.removeFirst() // 추천 횟수가 가장 적은 학생 제거
            frames.append((id: student, recommend: 1, time: index)) // 새로운 학생 추가
        }
    }
}

let result = frames.map { $0.id }.sorted() // 사진틀에 게시된 학생들을 학생 번호 오름차순으로 정렬

print(result.map { String($0) }.joined(separator: " "))
