def solution(n, lost, reserve):
    _lost = [l for l in lost if l not in reserve]
    _reserve = [r for r in reserve if r not in lost]
    for r in _reserve:
        pr = r + 1
        mr = r - 1
        if pr in _lost:
            _lost.remove(pr)
        elif mr in _lost:
            _lost.remove(mr)
    return n - len(_lost)

4
5
6
7
8
9
10
11
12
def solution(n, lost, reserve):
    _reserve = [r for r in reserve if r not in lost]
    _lost = [l for l in lost if l not in reserve]
    for r in _reserve:
        f = r - 1
        b = r + 1
        if f in _lost:
            _lost.remove(f)
        elif b in _lost:
            _lost.remove(b)
    return n - len(_lost)
