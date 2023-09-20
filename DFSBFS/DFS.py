from collections import defaultdict, deque

pointCount, lineCount, startPoint = map(int, input().split())

myDict = defaultdict(list)

for _ in range(lineCount): # 간선의 개수만큼 입력을 받으면 됨, 그 이유는 입력해야할 정보가 간선의 개수만큼 받기 때문
    firstLine, secondLine = map(int, input().split())
    myDict[firstLine].append(secondLine)
    myDict[secondLine].append(firstLine) # 간선이 양방향이므로 1 -> 2, 2 -> 1일 때  경우를 둘 다 추가

for i in range(1, pointCount + 1):
    myDict[i] = sorted(myDict[i]) # 문제에서 방문할 수 있는 정점이 여러개인 경우 정점 번호가 작은것을 먼저 방문

def dfs(graph, start, visited = []):
    visited.append(start)
    print(start, end = ' ')
    for node in graph[start]:
        if node not in visited:
            dfs(graph, node, visited)

def bfs(graph, start, visited = [startPoint]):
    queue = deque([start])
    while queue:
        visitingNode = queue.popleft()
        
        print(visitingNode, end = ' ')
        for node in graph[visitingNode]:
            if node not in visited:
                queue.append(node)
                visited.append(node)
                
              
dfs(myDict, startPoint)
print()
bfs(myDict, startPoint)