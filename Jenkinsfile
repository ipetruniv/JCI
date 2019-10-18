def ENV_NAME = "${TEST_SUITE}"
def BRANCH = "${git_branch}"
def NODE = "${Node_Name}"
def DHost = "${Exec_Host}"
pipeline {
    agent { node { label "${Node_Name}"} }
    stages {
		stage ('Check Portals'){
				steps{
					script {
						bat "portal_check.cmd"
					}
				}
		}
        stage('Checkout') {
                steps {
                    checkout([
                    $class: 'GitSCM', 
                    branches: [[name: '*/${git_branch}']], 
                    gitTool: 'Git-P5CPAJ00001JKWS', 
                    userRemoteConfigs: [
                        [
                        credentialsId: '0252520b-3a6c-4b94-8e1c-ff657d89be92', 
                        url: 'ssh://git@bitbucket.corp.ad.ctc:22/mdmdevops/auto.git'
                        ]
                    ]
					])
    			}
        }
        stage('EecuteTests') {
            steps {
                script {
                    def GRADLE_HOME = tool name: 'Gradle 4.10.2', type: 'hudson.plugins.gradle.GradleInstallation'
                    if (ENV_NAME == 'automotive-tests') {
                        def TestsToExecute = 'runAutomotiveTests'
                        def DlowValue='7090000'
                        def DhighValue='7091000'
                        def Dheadless='true'
                        def Dbrowser='chrome'
                        def DhighLightMarker='off'
                        bat "${GRADLE_HOME}\\bin\\gradle.bat -i --continue ${TestsToExecute} -DlowValue=${DlowValue} -DhighValue=${DhighValue} -Dheadless=${Dheadless} -Dbrowser=${Dbrowser} -DhighLightMarker=${DhighLightMarker}"
                    } else if (ENV_NAME == 'backend-tests') {
                        def TestsToExecute = 'runBackendTests1'
                        def DlowValue='7050000'
                        def DhighValue='7060000'
                        def Dheadless='False'
                        def Dbrowser='chrome'
                        defDhighLightMarker='off'
                        bat "${GRADLE_HOME}\\bin\\gradle.bat -i --continue ${TestsToExecute} -DlowValue=${DlowValue} -DhighValue=${DhighValue} -Dheadless=${Dheadless} -Dbrowser=${Dbrowser} -DhighLightMarker=${DhighLightMarker}"
                    } else if (ENV_NAME == 'digital-tests') {
                        def TestsToExecute = 'runDigitalTests'
                        def DlowValue='0'
                        def DhighValue='0'
                        def Dheadless='False'
                        def Dbrowser='chrome'
                        def DhighLightMarker='off'
                        bat "${GRADLE_HOME}\\bin\\gradle.bat -i --continue ${TestsToExecute} -DlowValue=${DlowValue} -DhighValue=${DhighValue} -Dheadless=${Dheadless} -Dbrowser=${Dbrowser} -DhighLightMarker=${DhighLightMarker}"
                    }
                    else if (ENV_NAME == 'fgl-tests') {
                        def TestsToExecute = 'runAllFglTests'
                        def DlowValue=0
                        def DhighValue=0
                        def Dheadless='True'
                        def Dbrowser='chrome'
                        def DhighLightMarker='off'
                        bat "${GRADLE_HOME}\\bin\\gradle.bat -i --continue ${TestsToExecute} -Dhost=${DHost} -Dheadless=${Dheadless} -Dbrowser=${Dbrowser} -DhighLightMarker=${DhighLightMarker}"
                    }
                    else if (ENV_NAME == 'frontend-tests') {
                        def TestsToExecute = 'runFrontendTests'
                        def DlowValue=0
                        def DhighValue=0
                        def Dheadless='true'
                        def Dbrowser='chrome'
                        def DhighLightMarker='off'
                        bat "${GRADLE_HOME}\\bin\\gradle.bat -i --continue ${TestsToExecute} -DlowValue=${DlowValue} -DhighValue=${DhighValue} -Dheadless=${Dheadless} -Dbrowser=${Dbrowser} -DhighLightMarker=${DhighLightMarker}"
                    }
                    else if (ENV_NAME == 'gtin-tests') {
                        def TestsToExecute = 'runGtinTests'
                        def DlowValue=0
                        def DhighValue=0
                        def Dheadless='true'
                        def Dbrowser='chrome'
                        def DhighLightMarker='off'
						bat "${GRADLE_HOME}\\bin\\gradle.bat -i --continue ${TestsToExecute} -DlowValue=${DlowValue} -DhighValue=${DhighValue} -Dheadless=${Dheadless} -Dbrowser=${Dbrowser} -DhighLightMarker=${DhighLightMarker}"
                    }
                    else if (ENV_NAME == 'mdm-tests') {
                        def TestsToExecute = 'runMdmTests'
                        def DlowValue=0
                        def DhighValue=0
                        def Dheadless='true'
                        def Dbrowser='chrome'
                        def DhighLightMarker='off'
                        bat "${GRADLE_HOME}\\bin\\gradle.bat -i --continue ${TestsToExecute} -DlowValue=${DlowValue} -DhighValue=${DhighValue} -Dheadless=${Dheadless} -Dbrowser=${Dbrowser} -DhighLightMarker=${DhighLightMarker}"
                    }
				}
            }
        }
    }
    post { 
            always {
				script {
						allure([includeProperties: false, jdk: '', results: [[path: 'build/allure-results']]])   
					}  
            }            
        }
}