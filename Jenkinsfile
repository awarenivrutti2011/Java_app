pipeline {
agent any
tools {
maven 'Maven3'
jdk 'Java11'
}
stages {
stage('Checkout') {
steps {
git url: 'https://github.com/your-username/java-web-app.git', branch: 'main'
}
}
stage('Build') {
steps {
sh 'mvn clean package'
}
}
stage('Deploy') {
steps {
sh '''
/opt/tomcat/bin/shutdown.sh || true
sleep 5
rm -rf /opt/tomcat/webapps/java-web-app*
cp target/java-web-app.war /opt/tomcat/webapps/
/opt/tomcat/bin/startup.sh
'''
}
}
}
}