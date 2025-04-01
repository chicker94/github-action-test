# 1. Tomcat 기반의 컨테이너 생성
FROM tomcat:9.0

# 2. WAR 파일을 Tomcat의 webapps 디렉터리에 복사
COPY build/libs/java-ci-test.war /usr/local/tomcat/webapps/ROOT.war

# 3. Tomcat 포트 개방
EXPOSE 8080

# 4. Tomcat 실행
CMD ["catalina.sh", "run"]

