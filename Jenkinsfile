pipeline{
    agent any 
    stages{
        stage ('Build App'){
            steps{
                script{
	                sh """
	                    dotnet build HelloWorldSolution -r win-x64 -o windows/ > windowsbuildlogfile.txt
	                    dotnet build HelloWorldSolution -r linux-x64 -o ubuntu/ > ubuntubuildlogfile.txt
	                """
                }
            }
        }
        stage ('Run UnitTest'){
            steps{
                script{
                        sh 'dotnet test HelloWorldTest'
                }
            }
        }
        // We will use here package called StyleCop.Analyzers but we can also use sonarqube windows slave and integrate it 
        stage ('Run linting Checks'){
            steps{
                script{
	                echo "linting test is done by package named StyleCop.Analyzers and can be printed on the console"
	                sh """
	                	dotnet  add HelloWorldSolution package StyleCop.Analyzers
	                	dotnet build 

	                """
                }
            }
        }
        stage ('Run Integration test on master Branch'){
            steps{
                script{
                    if (env.BRANCH_NAME.equals('master') ){
	                    echo 'Integration test'
	                    sh 'dotnet test HelloWorldSolutions.Tests'
                    }
                }
            }
        }
        stage ('Store the build output along with a build log'){
            steps{
                script{
	                sh '''
	                chmod u+x outputscript.sh
	                ./outputscript.sh
	                '''
                }
            }
        }
    }
}
