pipeline {
    agent any
    
    tools {
        maven 'Maven-3.8.1'  // 确保Jenkins中配置了Maven
        jdk 'JDK-17'         // 确保Jenkins中配置了JDK 17
    }
    
    stages {
        stage('检出代码') {
            steps {
                echo '检出代码...'
                checkout scm
            }
        }
        
        stage('编译') {
            steps {
                echo '编译项目...'
                bat 'mvn clean compile'
            }
        }
        
        stage('测试') {
            steps {
                echo '运行测试...'
                bat 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        
        stage('打包') {
            steps {
                echo '打包应用...'
                bat 'mvn package -DskipTests'
            }
        }
        
        stage('部署') {
            steps {
                echo '部署应用...'
                // 这里可以添加部署到测试环境的命令
                bat 'java -jar target/jenkins-test-1.0.0.jar --server.port=8081 &'
            }
        }
    }
    
    post {
        always {
            echo '清理工作空间...'
            cleanWs()
        }
        success {
            echo '构建成功！'
        }
        failure {
            echo '构建失败！'
        }
    }
}
