echo "Hello ansible" > hello.txt
ansible node1 -i 004.02.inventory -m copy 'src=hello.txt dest=/tmp'
  # node1 이라고 별칭을 지은 VM에 hello.txt 복사
rm hello.txt
ansible node1 -i 004.02.inventory -m fetch 'src=/tmp/hello.txt dest=/home/student'
  # node1의 /tmp/hello.txt 파일을 현재 VM의 /home/student로 복사

ansible node1 -i inventory -m file -a 'path=/tmp/hello.txt'
ansible node1 -i inventory -m file -a 'dest=/tmp/hello.txt'
ansible node1 -i inventory -m file -a 'name=/tmp/hello.txt'
  # file의 상태 확인
ansible node1 -i inventory -m file -a 'name=/tmp/hello.txt mode=777'
  # 파일 권한 변경
ansible node1 -i inventory -m file -a 'path=/tmp/a.txt state=touch'
  # file 생성
ansible node1 -i inventory -m file -a 'path=/tmp/b state=directory'
  # 디렉토리 생성
ansible node1 -i inventory -m file -a 'path=/tmp/b state=absent'
  # 디렉토리 삭제
ansible node1 -i inventory -m file -a 'path=/tmp/a.txt state=absent'
  # 파일 삭제
ansible node1 -i inventory -m command -a 'id -a'
  # 사용자의 id 출력
ansible node1 -i inventory  -m user -a 'name=abc state=present' -b -k
  # user 추가
  # useradd는 일반 사용자가 할 수 없음

# 다양한 module이 존재하며 사용 시 module과 option을 잘 확인할 것