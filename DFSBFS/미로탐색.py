from collections import deque

N, M = map(int, input().split())
graph = []

for _ in range(N):
    graph.append(list(map(int, input())))


def bfs(x, y, visited = []):
    queue = deque([(x, y)])

    dx = [-1, 1, 0, 0] # 상 하 좌 우
    dy = [0, 0, -1, 1]

    while queue:
        x, y = queue.popleft()
        visited.append((x, y))

        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            if 0 <= nx < N and 0 <= ny < M and graph[nx][ny] == 1:
                if (nx, ny) not in visited:
                    graph[nx][ny] = graph[x][y] + 1
                    queue.append((nx, ny))

    return graph[N - 1][M - 1]

print(bfs(0, 0))