Array.prototype.bubbleSort = function () {
  let flag = false;

  while (!flag) {
    flag = true;
    for (let i = 0; i < this.length; i++) {
      for (let j = i + 1; j < this.length; j++) {
        if (this[i] > this[j]) {
          let temp = this[i];
          this[i] = this[j];
          this[j] = temp;
          flag = false;
        }
      }
    }
  }
  return this;
};

// let arr = [1,3,2,2,8,6,5,0];
// console.log(arr.bubbleSort());

String.prototype.substrings = function () {
  let result = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      result.push(this.slice(i, j));
    }
  }
  return result;
};

// let str = 'abc';
// console.log(str.substrings());
