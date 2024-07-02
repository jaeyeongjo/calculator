# 프로젝트 개요

## 콘솔 프로그램 (CLI)

### 구조
- **디렉토리**: `lib/cli`
- **구성 파일**: `controller`, `model`, `view`, `main.dart`

### 기능
- 기본 산술 연산(덧셈, 뺄셈, 곱셈, 나눗셈) 수행
- 명령행 자바 프로그램에서 인수로 입력 받음
- 결과를 콘솔에 출력

### 테스트
- **파일**: `test/cli/model/calculator_test.dart`
- TDD 방식을 사용한 단위 테스트 작성

## 앱 프로그램 (App)
<table>
  <tr>
    <td>
      <img src="https://github.com/jaeyeongjo/calculator/assets/124424829/e5f89216-ec40-4954-b448-32e86d56219b" width="300">
    </td>
    <td>
      <img src="https://github.com/jaeyeongjo/calculator/assets/124424829/b63d7a1b-599a-4f58-9a51-6907a0a9906e" width="300">
    </td>
  </tr>
</table>

### 구조
- **디렉토리**: `lib/app`
- **구성 파일**: `model`, `view`, `view_model`

### 기능
- 콘솔 프로그램의 모델을 사용하여 Flutter로 앱 구현
- Firebase를 이용하여 사용자가 이전에 계산한 기록을 저장하고 조회 가능

### UI
- 계산기 UI 및 기록 조회 화면 구현

## 작업 내용 요약
1. CLI와 앱 두 가지 환경에서 작동하는 계산기 프로그램 개발
2. CLI에서는 명령행 인수로 산술 연산을 수행하고 결과를 출력
3. 앱에서는 사용자 인터페이스를 통해 계산 기능을 제공하며 Firebase를 통해 사용자 기록을 관리
4. 단위 테스트를 통해 코드의 신뢰성 확보

## 기존 작업 코드 제출
출시된 앱의 코드를 직접 보여드릴 수 없어, 이번 과제에서 작업한 콘솔 프로그램 코드를 앱으로도 만들어서 대신 제출합니다.
