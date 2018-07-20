Array.prototype.uniq = function() {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    if (!result.includes(this[i])){
      result.push(this[i]);
    }
  }
  return result;
};

// const arr = [1, 2, 1, 3];
// console.log(arr.uniq());
// console.log(arr);


Array.prototype.twoSum = function() {
  let result = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }
  return result;
};

// const arr2 = [1, 3, 5, -3, -1];
// console.log(arr2.twoSum());

Array.prototype.transpose = function () {
  let result = [];
  for (let n = 0; n < this[0].length; n++) {
    result.push([]);
  }
  for (let i = 0; i < result.length; i++) {
    for (let j = 0; j < this.length; j++) {
      result[i][j] = this[j][i];
    }
  }
  return result;
};

// const arr3 = [[1, 2], [3, 4], [5, 6]];
// console.log(arr3.transpose());
