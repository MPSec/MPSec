
# Commit Message Rule

## 왜 좋게 작성해야 할까?

* 더 좋은 커밋 로그 가독성
* 더 나은 협업과 리뷰 프로세스
* 더 쉬운 코드 유지보수

## 좋은 커밋 메시지를 위한 8가지 약속

1. 제목과 본문을 한 줄 띄워 분리하기
2. 제목은 영문 기준 50자 이내로
3. 제목 첫글자를 대문자로
4. 제목 끝에 `.` 금지
5. 제목은 `명령조`로
6. Github - 제목(이나 본문)에 이슈 번호 붙이기
7. 본문은 영문 기준 72자마다 줄 바꾸기
8. 본문은 `어떻게`보다 `무엇을`, `왜`에 맞춰 작성하기

<hr/>

> 다음과 같이 작성해주시면 감사드리겠습니다. :)

## 예제

* 제목은 명령문, (대문자)
* 본문은 평서문  (소문자)  -> 왜 했는지?

### 제목 예제

제목을 작성할 때 다음 예문을 통해 문장이 어울리나 확인하면, 그 문장이 올바른 명령문이 되었나 확인할 수 있다.

`If applied, this commit will {제목}`

~~~
Refactor subsystem X for readability
Test company class and its public methods
Update getting started documentation
Fix occasionally test failure
Remove deprecated methods
Release version 1.0.0
Merge pull request #123 from user/branch
~~~

### Issue 자동 종료 시키기

* close는 일반 계열 Issue
* fix는 hotfix Issue
* resolve는 문의나 요청 사항에 대한 Issue

~~~
close #1336
fix #1336
resolve #1336
~~~

### 기획자에게 참고 날리기

* ref를 걸어 Issue에 알림을 넣을 수 있다.

~~~
ref #1476
~~~

### 전체 예제

~~~
[#noissue] Refactor ASM class
- abc
- def
- ggg
~~~

~~~
[#1336] Update Feature Solid
- abc
- def 
- ggg
~~~

~~~
[close #1336]
- abc
~~~