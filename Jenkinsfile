//########################################################################################################################
//#                                                                                                                      #
//#   We should run this pipeline on ubuntu slave you will find all build output in ine file called  Build_output.txt    #
//#                                                                                                                      #
//########################################################################################################################
pipeline{
    agent any 
    stages{
        stage ('Build App'){
            steps{
                script{
                    //###############################################################
                    //IN this Stage We only build the application and have two dirs # 
                    //1- for windows                                                #
                    //2- for Ubuntu                                                 #
                    //###############################################################
	                sh """
	                    dotnet build HelloWorldSolution -r win-x64 -o windows_build/ |  tee -a windowsbuildlogfile.txt Build_output.txt
	                    dotnet build HelloWorldSolution -r linux-x64 -o ubuntu_build/ |  tee -a ubuntubuildlogfile.txt Build_output.txt
	                """
                }
            }
        }
        stage ('Run UnitTest'){
            steps{
                script{
                    //###############################################################
                    //          IN this Stage We only Run the Unit Tests            # 
                    //###############################################################
                    sh 'dotnet test HelloWorldTest >> Build_output.txt ' 
                }
            }
        }
        // We will use here package called StyleCop.Analyzers but we can also use sonarqube windows slave and integrate it 
        stage ('Run linting Checks'){
            steps{
                script{
                    //###################################################################################################
                    //  IN this Stage We only Run the linting dummy tests and we run it using StyleCop.Analyzers        # 
                    //###################################################################################################
	                echo "linting test is done by package named StyleCop.Analyzers and can be printed on the console"
	                sh """
	                	dotnet  add HelloWorldSolution package StyleCop.Analyzers | tee  Build_output.txt
	                	dotnet build  | tee  lint_checker_output.txt Build_output.txt

	                """
                }
            }
        }
        stage ('Run Integration test on master Branch'){
            steps{
                script{
                    //######################################################################################
                    //          IN this Stage We only Run the Integration test on Master Branch            # 
                    //######################################################################################
                    if (env.BRANCH_NAME.equals('master') ){
	                    echo 'Integration test'
	                    sh 'dotnet test HelloWorldSolutions.Tests | tee  Build_output.txt'
                    }
                }
            }
        }
        stage ('Store the build output along with a build log'){
            steps{
                script{
                    //#################################################################################################
                    // IN this Stage We run our bash script to compress our windows and ubuntu packages and logs files# 
                    //#################################################################################################
	                sh '''
	                chmod u+x outputscript.sh | tee  Build_output.txt
	                ./outputscript.sh | tee  Build_output.txt
	                '''
                }
            }
        }
    }
}
