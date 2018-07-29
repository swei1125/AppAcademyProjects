function sum() {
  nums = Array.from(arguments);
  return nums.reduce((sum, num) => sum + num, 0);
}

function sum2(...nums) {
  return nums.reduce((sum, num) => sum + num, 0);
}

Function.prototype.myBind = function(ctx, ...args1) {
  return (...args2) => {
    return this.apply(ctx, args1.concat(args2));
  };
};

function curriedSum(numArgs) {
  let numbers = [];
  let _curriedSum = function (num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((sum, el) => sum + el, 0);
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
}

Function.prototype.curry = function (numArgs) {
  let args = [];
  
  // console.log(curried);
  let curries = (num) => {
    args.push(num);
    if (args.length === numArgs) {
      console.log("curries" + args);
      return this.apply(this, args);
    } else {
      return curries;
    }
  };
  return curries;
};


Function.prototype.curry2 = function (numArgs) {
  let args = [];
  
  // console.log(curried);
  let curries = (num) => {
    args.push(num);
    if (args.length === numArgs) {
      console.log("curries" + args);
      return this(...args);
    } else {
      return curries;
    }
  };
  return curries;
};

let soup = function () {
  array = Array.from(arguments);
  console.log(array);
  return array.reduce((sum, num) => sum + num, 0);
};


