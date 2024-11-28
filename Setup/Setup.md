# oracle virtual box

## 설치 전 확인 사항

- vbox는 호스트 가상화 플랫폼이므로 windows의 하이퍼바이저와 양립할 수 없음. 따라서 hyper-V를 비활성화 해줘야 함. 또한, 프로세서의 가상화 기능을 켜줘야 함.
    - 제어판 - 프로그램 - Windows 기능 켜기/끄기 - Hyper-V가 활성화되어 있다면 해제 - 재부팅
    - BIOS에서 가상화 활성화 (intel은 VT-x, AMD는 AMD-V)
- oracle virtual box 다운로드 창에서 자신의 OS에 맞게 설치 (따로 설정 없이 걍 설치하란대로 하면 됨)
- 우분투 22.04 jammy jellyfish로 할 예정
    - [Ubuntu 22.04.5 LTS (Jammy Jellyfish)](https://releases.ubuntu.com/22.04/)

## V-box 설치 후

### 가상머신 생성

- 새로 만들기 클릭
- 이름은 원하는 걸로 입력/Folder는 자신이 찾기 편한 곳으로/설치할 OS의 ISO 이미지는 우분투 22.04로 지정(위에서 다운받은 파일의 경로를 넣어주면 됨)/ unattended installation 해제
- master 노드의 경우 메모리 2048MB이상, CPU 2개 이상/worker 노드의 경우 메모리 1024MB이상, CPU 1개 이상으로 설정. (둘 다 넉넉잡아 최소 사양의 두 배로 설정)
- 디스크 크기는 35GB 이상으로 설정
- 완료(master 예시)
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/53547203-fa23-4383-883c-11311cacccb7/b3c551aa-9c69-441f-8c11-79b1d8934f2d/image.png)
    

### 가상머신 설정

- 설정 클릭
- 시스템 - 프로세서에서 CPU 개수와 CPU 당 점유율 제한 가능
- 디스플레이 - 화면에서 비디오 메모리 및 모니터 개수 설정 가능 (GUI 환경에서 원활하게 128MB 설정 권장)
- NAT 네트워크를 생성한 후 모든 가상 머신의 네트워크 설정을 NAT 네트워크로 변경

### 우분투 설치

- Try or Install Ubuntu 선택 후 엔터
- 한국어 - 우분투 설치 누르고 기본 세팅으로 설치 시작
- 윈도우처럼 쓰면 됨

## 우분투

### 클립보드 설정

- 장치 - 클립보드 공유 - 양방향
- 장치 - 게스트 확장 CD 이미지 삽입
- 자동으로 실행 버튼이 나오면 실행. 그렇지 않으면 좌측에 생긴 CD 클릭 후 터미널에서 열기
- sh autorun.sh로 자동 실행
- 재부팅
- 참고로 지지직 거린다면 
1. 비디오 메모리 올리기
2. 화면 비율 조정하기