# 🧪 Git 실습 안내서

## 🧾 실습 개요

- 실습은 **3~4인 1팀**으로 진행하며, Git의 기본 명령어와 협업 기능을 실습합니다.
- 팀별로 실습용 리포지토리를 **Fork**하여 사용합니다.
- 리포지토리 이름: `git-practice-origin`
    - 팀 구성원중 1명만 Fork한뒤, 이름을 변경
    - 팀 구성원 모두 로컬에 clone

---

## 📁 실습 리포지토리 구성

```
git-practice-main/
├── README.md
└── scripts/
    ├── date_tool.sh       # 날짜 계산 스크립트
    └── file_finder.sh     # 파일 검색 스크립트
```

---

## ✍️ 실습 문제

### [문제 1] Git 기본 명령어 실습

**목표:** `main` 브랜치에서 clone, commit, push, pull 등의 기본 흐름 실습

1. 팀 리포지토리를 Clone 하고 `main` 브랜치를 확인한다.
2. `README.md`에 각 팀원 이름을 추가하고 commit, push 합니다.
3. 다른 팀원은 `fetch`와 `pull`을 통해 변경사항을 받아옵니다.

```bash
git clone https://github.com/2025-kbu/<team-repository-name>.git
cd <team-repository-name>
echo "- 김학생" >> README.md
git add README.md
git commit -m "Add student name"
git push origin main
```

---

### [문제 2] 브랜치 전략 실습 (merge, squash, rebase)

**목표:** 여러 브랜치에서 작업 후 merge, squash, rebase 실습

1. 새로운 브랜치를 만들어 `date_tool.sh`를 개선합니다.

```bash
git checkout -b feature/date-enhance
# date_tool.sh 수정
git commit -am "Add option to show day of week"
git push origin feature/date-enhance
```

2. `main` 브랜치에 병합:
    - 한 명은 `--no-ff`로 머지
    - 다른 한 명은 `--squash`로 머지

```bash
git checkout main
git merge --no-ff feature/date-enhance
# 또는
git merge --squash feature/date-enhance
git commit -m "Squash merge for date enhancement"
```

3. `rebase` 실습: `feature/extra` 브랜치를 만든 뒤, 최신 `main` 브랜치를 기준으로 rebase 합니다.

```bash
git checkout -b feature/extra
echo "echo 'Hello Git'" > hello.sh
git add hello.sh
git commit -m "Add hello script"

# main 브랜치를 최신 상태로 갱신하고 rebase 수행
git checkout main
git pull origin main
git checkout feature/extra
git rebase main

# 충돌이 발생하면 충돌 파일 수정 후
git add <파일명>
git rebase --continue

# rebase 완료 후 병합
git checkout main
git merge --no-ff feature/extra
```

---

### [문제 3] GitHub Issue & Pull Request 실습

**목표:** GitHub에서 issue를 생성하고, PR로 문제 해결 후 병합하는 흐름 익히기

1. 팀원 중 한 명이 Issue 생성
2. 해당 이슈를 해결하는 브랜치를 생성하고 작업
3. Pull Request를 생성하고 팀원 리뷰
4. PR에는 이슈 번호를 명시 (`[Fixes #3] solution` 등)

---

### [추가 팁]
```bash
git log --oneline --graph --all # 히스토리 확인
git rebase -i main # squash까지 함께 실습 가능
```
	

---

## 🔍 실습 파일 소개

### ✅ `date_tool.sh`

- 입력한 일수만큼 미래/과거 날짜 계산

```bash
./scripts/date_tool.sh +3  # 3일 후
./scripts/date_tool.sh -2  # 2일 전
```

### ✅ `file_finder.sh`

- 특정 확장자를 가진 파일을 현재 디렉토리 이하에서 탐색

```bash
./scripts/file_finder.sh txt
```
