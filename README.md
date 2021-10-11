## iOS 커리어 스타터 캠프

### 묵찌빠 프로젝트 저장소

#### 참고링크
[그라운드룰](https://github.com/FIIIIN/ios-rock-paper-scissors.wiki.git)
<hr/>

#### Step 1 구현 세부단계 설정

[1단계]
* 사용자의 입력받는 함수 (입력 검증까지 진행)
* 컴퓨터의 임의의 패를 정하는 함수
* 사용자와 컴퓨터의 패를 비교하는 함수(반환값을 아래의 switch로 연결)

[2단계]
* 경우 enum을 어떻게 처리할지 받아주는 swtich
* 출력 메세지를 담는 enum (rawValue 외의 방법 구상하기)
* 게임 실행 함수 -> while? if?

[3단계]
* 오류처리
* 리팩토링

#### 고민할 점
1. do-catch를 게임 실행 함수 안에 적는다 vs do-catch에 함수를 호출한다. -> do-catch를 외부에 적을 경우, 이후 추가되는 함수의 오류를 처리할 수 있기 때문에 오류처리의 확장성이 좋아진다. -> 조언을 묻고싶은 점으로 PR에 작성해볼 것
