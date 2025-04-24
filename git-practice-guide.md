# 🧪 Git 실습 안내서

## 🧾 실습 개요

- 각 팀은 GitHub Organization에 초대받았고, 팀별로 실습용 리포지토리를 **Fork**하여 사용합니다.
- 실습은 **3~4인 1팀**으로 진행하며, Git의 기본 명령어와 협업 기능을 실습합니다.
- 리포지토리 이름 예시: `git-practice-main`

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

1. 팀 리포지토리를 Fork한 뒤, `main` 브랜치를 clone 합니다.
2. `README.md`에 각 팀원 이름을 추가하고 commit, push 합니다.
3. 다른 팀원은 `fetch`와 `pull`을 통해 변경사항을 받아옵니다.

```bash
git clone https://github.com/<your-org>/git-practice-main.git
cd git-practice-main
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

3. `rebase` 실습: `feature/extra` 브랜치를 만든 뒤 rebase 합니다.

---

### [문제 3] GitHub Issue & Pull Request 실습

**목표:** GitHub에서 issue를 생성하고, PR로 문제 해결 후 병합하는 흐름 익히기

1. 팀원 중 한 명이 Issue 생성
2. 해당 이슈를 해결하는 브랜치를 생성하고 작업
3. Pull Request를 생성하고 팀원 리뷰
4. PR에는 이슈 번호를 명시 (`Fixes #3` 등)

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

---

## 📌 평가 기준

| 항목 | 확인 방법 |
|------|-----------|
| 브랜치 생성 | `git branch`, `git log --graph` |
| 기능 구현 | 스크립트 실행 결과 확인 |
| Pull Request | GitHub 기록 |
| 이슈 생성 및 연결 | GitHub Issue & PR |
| squash / no-ff 머지 여부 | `git log --graph` |

---

## 📦 실습 파일 다운로드

> 실습 템플릿 파일을 아래에서 다운로드 후 GitHub에 업로드하세요:  
[git-practice-main.zip 다운로드](sandbox:/mnt/data/git-practice-main.zip)
