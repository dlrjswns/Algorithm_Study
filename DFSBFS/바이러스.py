from collections import defaultdict

computerCount = int(input()) # 100이하인 양의 정수, 컴퓨터의 수
computerPerCount = int(input()) # 네트워크 상 연결되어있는 컴퓨터 쌍의 수

result = [] # 바이러스 걸리게 되는 컴퓨터의 수

network = defaultdict(list)

for _ in range(computerPerCount):
    first, second = map(int, input().split())
    network[first].append(second)
    network[second].append(first)

def dfs(network, start, visited = []):
    visited.append(start)

    for computer in network[start]:
        if computer not in visited:
            result.append(computer)
            dfs(network, computer)

dfs(network, 1)
print(len(result))