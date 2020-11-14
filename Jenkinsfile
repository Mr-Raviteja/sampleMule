pipeline {
  agent any
  stages {
        stage('gitclone') {
      steps {
        git(url: 'https://github.com/Mr-Raviteja/sampleMule.git', branch: 'master')
      }
    }
    stage('Build') {
      steps {
        withEnv(overrides: ["JAVA_HOME=${ tool 'JDK 8' }", "PATH+MAVEN=${tool 'Maven'}/bin:${env.JAVA_HOME}/bin"]) {
          bat 'mvn -f pom.xml clean install'
        }

      }
    }
    
   stage('upload to nexus') {
      steps {
        script {
          echo "hello";
          pom = readMavenPom file: "pom.xml";
          filesbyGlob = findFiles(glob: "target/*.jar");
          echo "${filesbyGlob[0].path}";
          echo pom.version
          nexusArtifactUploader(artifacts: [[artifactId: pom.artifactId, classifier: '', file: filesbyGlob[0].path, type: 'jar']], credentialsId: 'nexus-repo', groupId: pom.groupId, nexusUrl: 'localhost:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'nexus-releases', version: pom.version)

        }
      }
    }
}
}
