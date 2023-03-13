CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]; then
  echo "Student Submission Successful" 
  cp student-submission/ListExamples.java ./ 
  javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java

if [[ $? -eq 0 ]]; then
    java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > testResults.txt
    passedTest=$(grep -c 'OK' testResults.txt)
    failedTest=$(grep -c 'FAILURES!!!' testResults.txt)
    totalTest=passedTest+failedTest
    score=$((100*(passedTest/totalTest)))
    echo "Final Grade: $score%"
 else 
    echo "Tests failed to compile"
    exit
  fi
else
  echo "Incorrect File, please submit the correct file"
  exit 
fi