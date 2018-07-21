function range(start, end) {
  let result = [];
  for (let i = start; i <= end; i++) {
    result.push(i);
  }
  return result;
}

function rangeRec(start, end) {
  let result = [];
  if (start === end) {
    result.push(start);
    return result;
  }
  return rangeRec(start, (end - 1)).concat(end);
}
// console.log(rangeRec(0, 4));

function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  return sumRec(arr.slice(0,arr.length - 1)) + arr[arr.length - 1];
}
// console.log(sumRec([1,2,3]));

function exponent1(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent1(base, exp - 1);
}
// console.log(exponent1(2, 3));

function fibonacci(n) {
  if (n === 1) {
    return [1];
  } else if (n === 2) {
    return [1, 1];
  }
  let last = fibonacci(n - 1);
  return last.concat([(last[last.length - 1] + last[last.length - 2])]);
}
// console.log(fibonacci(4));

function deepDup(arr) {
  let result = [];
  for (let i = 0; i < arr.length; i++) {
    if (arr[i].isArray) {
      result.concat(deepDup(arr[i]));
    } else {
      result.push(arr[i]);
    }
  }
  return result;
}
// console.log(deepDup([1, [2, 3], 4]));

function bsearch(arr, target) {
  let mid = Math.floor(arr.length / 2);

  if (arr[mid] === target) {
    return mid;
  } else if (arr.length === 1) {
    return -1;
  }

  if (arr[mid] > target) {
    return bsearch(arr.slice(0,mid), target);
  } else {
      let idx = bsearch(arr.slice(mid+1, arr.length), target);
      if (idx === -1) {
        return -1;
      } else {
        return idx + mid + 1;
      }
  }
}
// console.log(bsearch([1, 2, 3, 6, 8, 11], 10));
