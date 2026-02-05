pipeline {
    agent any

    environment {
        // Java & Maven
        JAVA_HOME   = "/usr/lib/jvm/java-21-amazon-corretto.x86_64"
        MAVEN_HOME  = "/opt/maven"
        PATH        = "${MAVEN_HOME}/bin:${JAVA_HOME}/bin:${env.PATH}"

        // Docker
        DOCKERHUB_USER = "awarenivrutti11"
        IMAGE_NAME     = "stepup-app"
        IMAGE_TAG      = "v2"

        // Kubernetes / Helm
        K8S_NAMESPACE  = "stepup"
        HELM_RELEASE   = "stepup"
        HELM_CHART     = "./helm/stepup-chart"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/awarenivrutti2011/Java_app.git'
            }
        }

        stage('Verify Tools') {
            steps {
                sh '''
                  java -version
                  mvn -version
                  docker --version
                  kubectl version --client
                  helm version
                '''
            }
        }

        stage('Build WAR (Maven)') {
            steps {
                sh '''
                  mvn clean package
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                  docker build -t ${DOCKERHUB_USER}/${IMAGE_NAME}:${IMAGE_TAG} .
                '''
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                      echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                  docker push ${DOCKERHUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }

        stage('Helm Lint & Dry Run') {
            steps {
                sh '''
                  helm lint ${HELM_CHART}
                  helm upgrade --install ${HELM_RELEASE} ${HELM_CHART} \
                    --namespace ${K8S_NAMESPACE} \
                    --create-namespace \
                    --set app.image=${DOCKERHUB_USER}/${IMAGE_NAME} \
                    --set app.tag=${IMAGE_TAG} \
                    --dry-run
                '''
            }
        }

        stage('Helm Deploy to Kubernetes') {
            steps {
                sh '''
                  helm upgrade --install ${HELM_RELEASE} ${HELM_CHART} \
                    --namespace ${K8S_NAMESPACE} \
                    --create-namespace \
                    --set app.image=${DOCKERHUB_USER}/${IMAGE_NAME} \
                    --set app.tag=${IMAGE_TAG}
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                  kubectl get pods -n ${K8S_NAMESPACE}
                  kubectl get svc -n ${K8S_NAMESPACE}
                '''
            }
        }
    }

    post {
        success {
            echo '✅ CI/CD Pipeline completed successfully with Helm'
        }
        failure {
            echo '❌ CI/CD Pipeline failed'
        }
    }
}
