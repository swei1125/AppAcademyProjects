function addNumbers(sum, numsLeft, completionCallback) {
  const readline = require('readline');
  const reader = readline.createInterface ({
    input: process.stdin,
    output: process.stdout
  });
  
  if (numsLeft > 0) {
    reader.question("What is the number?", function(num) {
      num = parseInt(num);
      sum += num;
      numsLeft -= 1;
      console.log(sum);
      addNumbers(sum, numsLeft, completionCallback);
    });
  }else if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  }
  
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));