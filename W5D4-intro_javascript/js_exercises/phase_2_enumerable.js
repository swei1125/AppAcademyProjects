Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function (callback) {
  let result = [];
  this.myEach(function (el) {
    result.push(callback(el));
  });
  return result;
};

Array.prototype.myReduce = function (callback, initialValue = 0) {
  if (initialValue) {
    let acc = initialValue;
    this.myEach(function (el) {
      acc = callback(acc, el);
    });
    return acc;
  } else {
    let acc = this[0];
    this.slice([1,]).myEach(function (el) {
      acc = callback(acc, el);
    });
    return acc;
  }
};

const res = [1, 2, 3].myReduce(function(acc, el) {
  return acc + el;
}); // => 6

// console.log(res);

// with initialValue
const res2 = [1, 2, 3].myReduce(function(acc, el) {
  return acc + el;
}, 25); // => 31

// console.log(res2);
