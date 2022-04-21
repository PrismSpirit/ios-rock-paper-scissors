# 묵찌빠 프로젝트 저장소
> 프로젝트 기간 2022/04/18 ~ 2022/04/22  
> 팀원: @BaekGom @Finnn/ 리뷰어: @malrang

# 목차
* [프로젝트 소개](#프로젝트-소개)
* [순서도](#순서도)
* [키워드](#키워드)
* [그라운드 룰](#그라운드-룰)
* [STEP 1 고민한점 및 해결방안](#STEP-1-고민한점-및-해결방안-🤔)
    - [배운개념](#배운개념)
* [STEP 2 고민한점 및 해결방안](#STEP-2-고민한점-및-해결방안-🤔)
    - [배운개념](#배운개념)


# 프로젝트 소개
묵찌빠 게임을 콘솔 프로그램으로 구현하는 프로젝트이다.


# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

# 순서도 
<img width="100%" src="https://user-images.githubusercontent.com/87175392/164392119-b5db3b0d-86be-429b-b9fc-59d23e32bb17.jpg"/>


# 키워드  
`함수 네이밍`
`optioinal`
`코딩 컨벤션`
`타입 만들기`
`협업자세 고민하기`

# 그라운드 룰
## 활동시간
변동사항 있으면 DM 보내줄 것


+ 점심시간 12:30 ~ 13:30
+ 저녁시간 19:00 ~ 20:00

## 예외사항
+ 백곰 4/18(월) - 19:00 ~ 22:00

## 스크럼 
* 활동학습이 없는 매일 오전 10시에 디스코드에서 진행
* 어제 한 일
* 오늘 할 일
* 컨디션

## 의사소통 방법
+ 디스코드 회의실
+ 단톡방

## 코딩 컨벤션
Swift 코드 스타일 : [스위프트 API 가이드라인](https://www.swift.org/documentation/api-design-guidelines/)
커밋 Title 규칙

* feat = 주로 사용자에게 새로운 기능이 추가되는 경우
* fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
* docs = 문서에 변경 사항이 있는 경우
* style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
* refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
* test = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
* chore = 별로 중요하지 않은 일을 수정하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

현재 시제를 사용, 이전 행동과 대조하여 변경을 한 동기를 포함하는 것을 권장 문장형으로 끝내지 않기
* commitTitle 과 body 사이는 한 줄 띄워 구분하기
* commitTitle line의 글자수는 50자 이내로 제한하기
* commitTitle line의 마지작에 마침표(.) 사용하지 않기
* commitBody는 72자마다 줄 바꾸기
* commitBody는 어떻게 보다 무엇을,왜 에 맞춰 작성하기

네이밍 규칙
* 기타 코딩 컨벤션
    * 네이밍 가이드 최대한 준수하기!
    * [네이밍 가이드 한글 번역본](https://minsone.github.io/swift-internals/api-design-guidelines/)


# [STEP 1] 고민한점 및 해결방안 🤔
### 고민한점
### 매직 리터럴 값 사용에 따른 가독성에 대한 고민 :
- 처음 코드를 작성했을 때 가위, 바위, 보를 그냥 숫자 1, 2, 3과 같은 매직 넘버/매직 리터럴 형태로 사용하여 가독성이 좋지 못했다.
- 고민 끝에 가위, 바위, 보를 rockPaperScissors 열거형 타입으로 선언하여 .rock, .paper, .scissors 형태로 사용하니 가독성이 훨씬 좋아졌다.
### 반복되는 코드에 대한 고민 :
- 주어진 요구조건에 맞춰 코드를 짜다보니 반복되는 부분이 많아졌고, 이 부분에 대해서 어떻게 해결할 수 있을지 고민했다.
    1. 함수로 분리 : 반복되는 코드를 함수 단위로 분리해 코드의 재사용성을 높혔다.
    2. 불필요한 조건문 삭제 : 모든 경우의 수를 전부 조건문 연산에 넣는 것이 아닌, 상반되는 조건 둘 중 하나만 검사하여 코드를 간결하게 만들었다.
### 네이밍에 대한 고민 :
- 변수 및 함수를 선언함에 있어 네이밍에 관해 많은 고민을 했다. 이 부분은 아직 해결되지 않았지만, 앞으로도 프로젝트를 진행하면서 꾸준하게 노력해야할 부분이라 생각한다.

### 배운개념 💡

- 짝 프로그래밍을 통해, 서로 의견을 주고 받으며 함께 성장할 수 있음을 깨우쳤다.

# [STEP 2] 고민한점 및 해결방안 🤔
### 고민한점 및 해결방안
### while 문 사용하지 않기 : 
- while 문을 사용하지 않고 재귀함수를 사용하여 같은 효과냈다

### 캡슐화 :
- STEP1은 main 파일에 모든 코드가 집중되어있어서 STEP2는 연관성있는 객체끼리 묶어서 재사용성과 확장성을 높였습니다.

### 배운개념 💡
### Upper CamelCase와 Lower CamelCase의 차이 :
- Upper CamelCase의 경우 class, struct, enum 등과 같은 **타입명**에 사용된다.
- Lower CamelCase의 경우 **변수 및 상수명, 속성, 함수명, 메서드명** 등에 사용된다.

### 함수를 한 문장처럼 읽히도록 네이밍 :
- 전달인자 레이블을 사용해서 of, in, by 등의 전치사를 사용하면, 함수의 역할을 직관적으로 전달할 수 있음을 깨달았다.

### 삼항연산자 사용으로 가독성 향상 :
- 리뷰어인 marlang의 조언으로 삼항연산자를 사용해 코드의 가독성을 높이는 것을 배웠다.
