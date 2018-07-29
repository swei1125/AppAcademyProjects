class DOMNodeCollection {
  constructor(els) {
    this.els = els;
  }

  html(str) {
    if (str) {
      this.els.forEach((el) => {
        el.innerHTML = str;
      });
    }else {
      return this.els[0].innerHTML;
    }
  }

  empty() {
    return this.html("");
  }

  append(el) {
    if (typeof el === "string") {
      this.els.forEach(function(node) {
        node.innerHTML += el;
      });
    } else if (el instanceof HTMLElement) {
      this.els.forEach(function(node) {
        node.appendChild(el);
      });
    } else {
      this.els.forEach(function(node) {
        el.els.forEach(function(node2) {
          node.appendChild(node2);
        });
      });
    }
  }

  attr(attrName, value) {
    for (let i = 0; i < this.els.length; i++) {
      if (value) {
        this.els[i].setAttribute(attrName, value);
      } else {
        this.els[i].getAttribute(attrName);
      }
    }
  }

  addClass(value) {
    for (let i = 0; i < this.els.length; i++) {
      let classes = this.els[i].className;
      if (classes.length) classes += " ";
      classes += value;
      this.els[i].setAttribute("class", classes);
    }
  }

  removeClass(value) {
    for (let i = 0; i < this.els.length; i++) {
      let classes = this.els[i].className.split(" ");
      classes.splice(classes.indexOf(value), 1);
      this.els[i].setAttribute("class", classes.join(" "));
    }
  }

  children() {
    let result = [];
    for (let i = 0; i < this.els.length; i++) {
      result.push(this.els[i].childNodes);
    }
    return new DOMNodeCollection(result);
  }

  parent() {
    let result = [];
    for (let i = 0; i < this.els.length; i++) {
      result.push(this.els[i].parentNode);
    }

    return new DOMNodeCollection(result);
  }

  find(selector) {
    let result = [];
    for (let i = 0; i < this.els.length; i++) {
      const nodeList = this.els[i].querySelectorAll(selector);
      result = result.concat(Array.from(nodeList));
    }

    return result;
  }

  remove() {
    for (let i = 0; i < this.els.length; i++) {
      this.els[i].remove();
    }
    this.els = [];
  }

  on(e, cb) {
    for (let i = 0; i < this.els.length; i++) {
      this.els[i].addEventListener(e, cb);
      const eventKey = `jqliteEvents-${e}`;
      if (typeof this.els[i][eventKey] === 'undefined') {
        this.els[i][eventKey] = [];
      }
      this.els[i][eventKey].push(cb);
    }
  }

  off(e) {
    this.els.forEach( el => {
      // let events = Object.keys().filter( key => {
      //   key.includes(`jqliteEvents-${e}`)
      // });
      let callbacks = el[`jqliteEvents-${e}`];
      if (callbacks) {
        callbacks.forEach( cb => {
          el.removeEventListener(e, cb);
        });
      }
      this.els[`jqliteEvents-${e}`] = [];
    });
  }

}

module.exports = DOMNodeCollection;
