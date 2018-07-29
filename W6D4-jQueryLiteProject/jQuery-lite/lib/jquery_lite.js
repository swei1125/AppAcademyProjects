/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./lib/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./lib/dom_node_collection.js":
/*!************************************!*\
  !*** ./lib/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(els) {\n    this.els = els;\n  }\n\n  html(str) {\n    if (str) {\n      this.els.forEach((el) => {\n        el.innerHTML = str;\n      });\n    }else {\n      return this.els[0].innerHTML;\n    }\n  }\n\n  empty() {\n    return this.html(\"\");\n  }\n\n  append(el) {\n    if (typeof el === \"string\") {\n      this.els.forEach(function(node) {\n        node.innerHTML += el;\n      });\n    } else if (el instanceof HTMLElement) {\n      this.els.forEach(function(node) {\n        node.appendChild(el);\n      });\n    } else {\n      this.els.forEach(function(node) {\n        el.els.forEach(function(node2) {\n          node.appendChild(node2);\n        });\n      });\n    }\n  }\n\n  attr(attrName, value) {\n    for (let i = 0; i < this.els.length; i++) {\n      if (value) {\n        this.els[i].setAttribute(attrName, value);\n      } else {\n        this.els[i].getAttribute(attrName);\n      }\n    }\n  }\n\n  addClass(value) {\n    for (let i = 0; i < this.els.length; i++) {\n      let classes = this.els[i].className;\n      if (classes.length) classes += \" \";\n      classes += value;\n      this.els[i].setAttribute(\"class\", classes);\n    }\n  }\n\n  removeClass(value) {\n    for (let i = 0; i < this.els.length; i++) {\n      let classes = this.els[i].className.split(\" \");\n      classes.splice(classes.indexOf(value), 1);\n      this.els[i].setAttribute(\"class\", classes.join(\" \"));\n    }\n  }\n\n  children() {\n    let result = [];\n    for (let i = 0; i < this.els.length; i++) {\n      result.push(this.els[i].childNodes);\n    }\n    return new DOMNodeCollection(result);\n  }\n\n  parent() {\n    let result = [];\n    for (let i = 0; i < this.els.length; i++) {\n      result.push(this.els[i].parentNode);\n    }\n\n    return new DOMNodeCollection(result);\n  }\n\n  find(selector) {\n    let result = [];\n    for (let i = 0; i < this.els.length; i++) {\n      const nodeList = this.els[i].querySelectorAll(selector);\n      result = result.concat(Array.from(nodeList));\n    }\n\n    return result;\n  }\n\n  remove() {\n    for (let i = 0; i < this.els.length; i++) {\n      this.els[i].remove();\n    }\n    this.els = [];\n  }\n\n  on(e, cb) {\n    for (let i = 0; i < this.els.length; i++) {\n      this.els[i].addEventListener(e, cb);\n      const eventKey = `jqliteEvents-${e}`;\n      if (typeof this.els[i][eventKey] === 'undefined') {\n        this.els[i][eventKey] = [];\n      }\n      this.els[i][eventKey].push(cb);\n    }\n  }\n\n  off(e) {\n    this.els.forEach( el => {\n      // let events = Object.keys().filter( key => {\n      //   key.includes(`jqliteEvents-${e}`)\n      // });\n      let callbacks = el[`jqliteEvents-${e}`];\n      if (callbacks) {\n        callbacks.forEach( cb => {\n          el.removeEventListener(e, cb);\n        });\n      }\n      this.els[`jqliteEvents-${e}`] = [];\n    });\n  }\n\n}\n\nmodule.exports = DOMNodeCollection;\n\n\n//# sourceURL=webpack:///./lib/dom_node_collection.js?");

/***/ }),

/***/ "./lib/main.js":
/*!*********************!*\
  !*** ./lib/main.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./lib/dom_node_collection.js\");\n\nconst $l = function($el) {\n  if (typeof $el === \"string\") {\n    let nodeList = document.querySelectorAll($el);\n    return new DOMNodeCollection(Array.from(nodeList));\n  }else if ($el instanceof HTMLElement) {\n    return new DOMNodeCollection([$el]);\n  }\n};\n\nwindow.$l = $l;\n\n\n//# sourceURL=webpack:///./lib/main.js?");

/***/ })

/******/ });