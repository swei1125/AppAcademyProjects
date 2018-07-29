Function.prototype.inherits1 = function (parent) {
  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate(); 
  this.prototype.constructor = this;
};


Function.prototype.inherits2 = function (parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};


