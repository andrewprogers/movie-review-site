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
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
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
/******/ 	__webpack_require__.p = "/packs-test/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 190);
/******/ })
/************************************************************************/
/******/ ({

/***/ 190:
/***/ (function(module, exports) {

var countVotes = function countVotes(votes) {
  var up = 0;
  var down = 0;
  for (var i = 0; i < votes.length; i++) {
    if (votes[i].value === 1) {
      up += 1;
    } else if (votes[i].value === -1) {
      down += 1;
    }
  }
  return {
    up: up,
    down: down,
    total: up - down
  };
};

var createVote = function createVote(reviewId, reviewValue, callback) {
  var formPayload = { value: reviewValue };
  fetch('/api/v1/reviews/' + reviewId + '/votes', {
    method: 'POST',
    credentials: 'same-origin',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(formPayload)
  }).then(function (response) {
    if (response.ok) {
      return response;
    } else {
      throw new Error('Error updating votes');
    }
  }).then(function (response) {
    return response.json();
  }).then(function (json) {
    return json.votes;
  }).then(function (votes) {
    return countVotes(votes);
  }).then(function (count) {
    return callback(count);
  });
};

document.addEventListener("DOMContentLoaded", function () {
  var upvotes = document.getElementsByClassName('upvote');

  var _loop = function _loop() {
    var reviewId = parseInt(upvotes[i].classList[1].split('-')[1]);

    upvotes[i].addEventListener('click', function (event) {
      event.preventDefault();
      createVote(reviewId, 1, function (count) {
        var votesDigest = document.getElementById('votes-review-' + reviewId);
        votesDigest.innerHTML = 'Total Votes: ' + count.total + ' Upvote Count: ' + count.up + ' Downvote Count: ' + count.down;
      });
    });
  };

  for (var i = 0; i < upvotes.length; i++) {
    _loop();
  }

  var downvotes = document.getElementsByClassName('downvote');

  var _loop2 = function _loop2() {
    var reviewId = parseInt(downvotes[i].classList[1].split('-')[1]);

    downvotes[i].addEventListener('click', function (event) {
      event.preventDefault();
      createVote(reviewId, -1, function (count) {
        var votesDigest = document.getElementById('votes-review-' + reviewId);
        votesDigest.innerHTML = 'Total Votes: ' + count.total + ' Upvote Count: ' + count.up + ' Downvote Count: ' + count.down;
      });
    });
  };

  for (var i = 0; i < downvotes.length; i++) {
    _loop2();
  }
});

/***/ })

/******/ });