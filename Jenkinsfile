pipeline {
    agent any
    
    stages {
        stage('检出代码') {
            steps {
                echo '检出代码...'
                checkout scm
            }
        }
        
        stage('检查环境') {
            steps {
                echo '检查Java和Maven环境...'
                script {
                    if (isUnix()) {
                        sh 'java -version'
                        sh 'mvn -version'
                    } else {
                        bat 'java -version'
                        bat 'mvn -version'
                    }
                }
            }
        }
        
        stage('编译') {
            steps {
                echo '编译项目...'
                script {
                    if (isUnix()) {
                        sh 'mvn clean compile'
                    } else {
                        bat 'mvn clean compile'
                    }
                }
            }
        }
        
        stage('测试') {
            steps {
                echo '运行测试...'
                script {
                    if (isUnix()) {
                        sh 'mvn test'
                    } else {
                        bat 'mvn test'
                    }
                }
            }
            post {
                always {
                    // 发布测试结果
                    publishTestResults testResultsPattern: 'target/surefire-reports/*.xml'
                }
            }
        }
        
        stage('打包') {
            steps {
                echo '打包应用...'
                script {
                    if (isUnix()) {
                        sh 'mvn package -DskipTests'
                    } else {
                        bat 'mvn package -DskipTests'
                    }
                }
            }
            post {
                success {
                    // 归档构建产物
                    archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                }
            }
        }
        
        stage('部署测试') {
            steps {
                echo '启动应用进行测试...'
                script {
                    if (isUnix()) {
                        sh '''
                            echo "启动Spring Boot应用..."
                            nohup java -jar target/jenkins-test-1.0.0.jar --server.port=8081 > app.log 2>&1 &
                            sleep 10
                            echo "测试应用是否启动成功..."
                            curl -f http://localhost:8081/health || exit 1
                            echo "应用启动成功！"
                        '''
                    } else {
                        bat '''
                            echo 启动Spring Boot应用...
                            start /B java -jar target\\jenkins-test-1.0.0.jar --server.port=8081
                            timeout /T 10
                            echo 测试应用健康检查...
                            curl -f http://localhost:8081/health || exit 1
                            echo 应用启动成功！
                        '''
                    }
                }
            }
        }
    }
    
    post {
        always {
            echo '构建流程完成'
            // 清理：停止可能仍在运行的应用
            script {
                if (isUnix()) {
                    sh 'pkill -f "jenkins-test-1.0.0.jar" || true'
                } else {
                    bat 'taskkill /F /IM java.exe || exit 0'
                }
            }
        }
        success {
            echo '🎉 构建成功！应用已通过所有测试'
        }
        failure {
            echo '❌ 构建失败，请检查日志'
        }
    }
}
