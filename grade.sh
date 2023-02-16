CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
if [ -f student-submission/.java];
 echo "Student Submission Successful"
  mkdir testFolder
  cp student-submission/.txt testFolder
  cp TestListExamples.java testFolder
  javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
    if [ $? -eq 0 ]; then
        set +e
        java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > testResults.txt
        grep -e "# of Tests: " -e "# of Failures" -e "# of Errors" testResults.txt
    else
        echo "Tests failed to compile"
        exit 
    fi
else
  echo "Incorrect File, please submit the correct file"
  exit 
fi