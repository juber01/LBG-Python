pipeline{
        agent any
        stages{
            stage('Build Images'){
                steps{
                    sh '''
                    docker build -t gcr.io/lbg-mea-14/ja-lbg-python-app:latest .
                    docker build -t gcr.io/lbg-mea-14/ja-lbg-python-app:v${BUILD_NUMBER} .
                    '''
                }
            }
            stage('Push Images'){
                steps{
                    sh '''
                    docker push gcr.io/lbg-mea-14/ja-lbg-python-app:latest
                    docker push gcr.io/lbg-mea-14/ja-lbg-python-app:v${BUILD_NUMBER}
                    '''
                }
            }
            stage('Cleanup Jenkins'){
                steps{
                    sh '''
                    docker rmi gcr.io/lbg-mea-14/ja-lbg-python-app
                    docker rmi gcr.io/lbg-mea-14/ja-lbg-python-app:v${BUILD_NUMBER}
                    '''
                }
            }
            stage('Deploy Containers'){
                steps{
                    sh '''
                    ssh -i "~/.ssh/id_rsa" jenkins@10.154.0.26 << EOF
                    docker stop lbg-python-app && (docker rm lbg-python-app) || (docker rm lbg-python-app $$ sleep 1 || sleep 1)
                    docker image pull gcr.io/lbg-mea-14/ja-lbg-python-app
                    docker run -d -p 80:8080 --name lbg-python-app gcr.io/lbg-mea-14/ja-lbg-python-app
                    '''
                }
            }
        }
}
