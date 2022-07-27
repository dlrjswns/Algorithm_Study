# 그리디 알고리즘
* 어떠한 문제를 현재 상황에서 지금 당장 좋은 것만 고르는 방법 
* 거스름돈 구하기 예시에서 그리디알고리즘을 사용할 수 있던 이유는 거스름돈 중 가장 큰 거스름돈이 항상 작은 거스름돈의 배수이기때문에 다른 해가 나올 수 없기때문이다

## 파이썬 기본 문법 
1. print
    ```Python
    print('Print함수란 무엇인가요 ??')
    print('안녕하세요', 1, 2) # 안녕하세요12

    a = '이건준'
    print('안녕하세요', a) # 안녕하세요이건준
    ```
    * 출력시키는 함수

2. input 
    ```Python
    ex_Input = input()
    ```
    * 입력을 받고자하는 함수

3. 변수
    ```Python
    ex_Int = 16
    ex_String = '이건준'
    ex_Float = 3.14
    ex_Boolean = True or False
    ```
    * 다른 부분은 몇몇 언어와 비슷한거 같은데 Boolean 타입은 반드시 대문자로 시작해야한다는 점이 다른점같다

4. 리스트
    ```Python
    my_List = [1, 2, 3]
    students = ['이건준', '문진우', '신범철', '이상베']

    for std in students:
        print(std)

    import random 
    print(random.choice(students)) # 리스트의 요소중 랜덤으로 출력

    students.append('누가바')
    ```
    * 리스트의 기본 사용법은 대괄호를 이용하는데 배열과 비슷
    * foreach문으로 리스트의 요소를 순회가능
    * 요소값을 변경가능하다

    ```Python
    std = ['이건준', '이상준', '문진우']
    std.append('신범철') # 맨 끝에 요소추가
    std.pop() # 맨 마지막 요소 제거
    std.pop(0) # 맨 첫번째 요소 제거
    std.insert(0, '장지환') # 원하는 인덱스에 요소 집어넣기
    del std[2] # 지정한 인덱스요소를 삭제
    std.remove('이건준') # 배열 요소중 지정한 요소를 찾아 삭제, 다수라면 그 중 처음 요소삭제
    std.sort() # 해당 리스트를 가나다순으로 분류해준다 혹은 오름차순으로
    std.count('이건준') # 해당 리스트에 넣어준 인자가 몇개있는지 반환
    len(std) # 해당 리스트의 길이를 반환
    ```

5. 튜플 
```Python
my_tuple = ('요거트', '이에스', '레이')
my_tuple[0] = '변경될까' # X

my_tuple = (1, 2, 3) 
my_tuple = 1, 2, 3 # 소괄호를 사용하지않고도 튜플을 선언할 수 있다, 그리고 이를 패킹이라한다
num1, num2, num3 = my_tuple # 언패킹, num1은 1이 num2는 2가 num3는 3이 삽입
num1, num2 = num2, num1 # 이렇게하면 우항이 패킹되어 좌항에 언패킹되어 마치 값이 스위칭된것과 동일
```
* 튜플은 리스트와 비슷하지만 다른점이 요소값을 변경할 수 없다

6. 딕셔너리 
```Python
my_dict = {'이건준': '남자', '이상준': '여자', '신범철': '게이'}
my_dict['이건준'] # '남자'
```

7. 자료형 변환 
```Python
my_int = 1
type(my_int) # <class 'int'>
float(my_int) # 1.0
str(my_int) # '1'

my_str = 'coding'
list(my_str) # ['c', 'o', 'd', 'i', 'n', 'g']
```

8. 주석 (Comment)
* 파이썬에서 주석은 // 혹은 /* */ 가 아니라 #을 이용한다 

9. 문자열
```Python
my_str = "이건준"
my_str = '이건준'
my_str = """이건준
문진우
이상준
"""
```
* 문자열을 선언할때 작은따옴표, 큰따옴표 둘 다 상관없다
* 큰따옴표 3개를 사용하면 여러개의 줄을 한번에 쓰기가능, 스위프트와 동일하다고 생각하면 된다
* 허나 스위프트에선 멀티라인문자열을 사용할땐 """를 사용하고 한줄 띄고 사용해야하는데 파이썬에서는 안 띄어도 된다는 차이가 있다

10. 문자열 포맷팅
```Python
my_str = 'My name is %s' % 'Young Choi'
print(my_str) # My name is Young Choi

'%d %d' % (1, 2) # '1 2'

'%f' % 3.14 # '3.14000'

'My name is {}'.format('조희진') # My name is 조희진
'{} * {} = {}'.format(2, 3, 2*3) # 2 * 3 = 6
'{1} * {0} = {2}'.format(2, 3, 2*3) # 3 * 2 = 6
```
* %s는 문자열을, %d는 정수를, %f는 실수를 포맷팅해준다
* 파이썬에서는 위 서식문자말고도 format()을 이용하여 포맷팅가능하다
* 중괄호사이에 인덱스값을 넣어서 순서를 바꾸어 포맷팅가능하다

11. 인덱싱 
```Python
my_str = "안녕하세요"
my_str[0] # '안'
my_str[-1] # '요'
my_str[-2] # '세'
```
* 우리가 기본적으로 문자열이나 리스트에서 인덱스를 통해서 접근가능하다는것은 알고있을것이다 
* 파이썬에서는 0부터 시작하는 인덱싱외에 음수로 시작하는 값으로 인덱싱이 가능하다 (끝에서부터 -1)

12. 슬라이싱 
```Python
my_name = '나는 이건준입니다'
my_name[3:6] # '이건준'
my_name[:3] # '나는 '
my_name[2:] # ' 이건준입니다'
```

13. 메서드 
```Python
fruit_str = '거봉 수박 포도 복숭아 망고 딸기 배 참외'
fruit_str.split() # ['거봉', '수박', '포도', '복숭아', '망고', '딸기', '배', '참외']
```
* split 메소드는 넣어준 인자를 기준으로 문자열을 자를 수 있는 메소드

14. end, 이스케이프 
```Python
print('집단지성') # 끝에 엔터가 들어감
print('집단지성', end = '') # 끝에 아무것도 하지않음 
```
* 기본적으로 print함수는 끝에 엔터가 추가되는데 오버로딩된 end인자를 추가하여 끝에 추가되는 부분을 변경가능하다

```Python
print('나는 이건준입니다') # '나는 이건준입니다'
print('나는\n이건준입니다') # '나는'
                          '이건준입니다'
print('나는\t이건준입니다') # '나는 이건준입니다'
```
* 대표적인 이스케이프문자로 \n과 \t가 있는데 각각 엔터와 탭을 의미한다

15. for문
```Python
for animal in animals:
    print(animal)

for my_str in "안녕하세요 이건준입니다":
    print(my_str)

range(3) # [0, 1, 2]

for n in [0, 1, 2]:
    print(n) # 0, 1, 2

for n in range(3):
    print(n) # 0, 1, 2

range(3, 5) # 3, 4

for j in range(2, 10):
    for i in range(1, 10):
        print('{} x {} = {}'.format(j, i, j*i)) # 이중 for문과 format을 이용하여 구구단을 만들 수도 있음
```
* range함수를 이용해서 일일이 숫자를 집어넣지않아도 깔끔하게 선언해줄 수 있다

16. 컴프리헨션
```Python
numbers = [1, 2, 3, 4, 5, 6, 7]
odd_numbers = []

for number in numbers:
    if number % 2 == 1:
        odd_numbers.append(number)

odd_numbers = [number for number in numbers if number % 2 == 1] # 이처럼 파이썬에선 컴프리헨션이라는 것을 이용하여 간편하게 코드가능
```

17. 산술 
```Python
2 ** 3 # 8
4 ** 3 # 64
7 / 3 # 2.3333333333
7 // 3 # 2
7 % 3 # 1
```

18. 문자열 연산자 
```Python
'이건준' + '사랑해' + '알럽' # 이건준사랑해알럽
'이건준' * 3 # 이건준이건준이건준
```

19. 논리 연산자 
```Python
True and False # False
True or False # True
False or False # False
not False # True
```

20. 멤버쉽 연산자
```Python
list = ['뽀로로', '아구몬', '짱구']
'뽀로로' in list # True 
'루피' in list # False
'루피' not in list # True
```
