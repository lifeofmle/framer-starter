/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
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
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports) {

	var bg, device, deviceHeight, deviceWidth, i, j, layer, page;
	
	device = new Framer.DeviceView();
	
	device.setupContext();
	
	device.deviceType = "google-nexus-6p";
	
	device.contentScale = 1;
	
	deviceHeight = device.screen.height;
	
	deviceWidth = device.screen.width;
	
	print("Device height: " + deviceHeight);
	
	print("Device height: " + deviceWidth);
	
	bg = new BackgroundLayer({
	  backgroundColor: "#7DDD11"
	});
	
	page = new PageComponent({
	  width: 900,
	  height: 600,
	  scrollVertical: false,
	  borderRadius: 3
	});
	
	page.center();
	
	for (i = j = 0; j < 8; i = ++j) {
	  layer = new Layer({
	    superLayer: page.content,
	    width: 600,
	    height: 600,
	    backgroundColor: "#fff",
	    borderRadius: 3,
	    opacity: 0.3,
	    x: 640 * i
	  });
	}
	
	page.snapToNextPage();
	
	page.currentPage.opacity = 1;
	
	page.on("change:currentPage", function() {
	  page.previousPage.animate({
	    properties: {
	      opacity: 0.3
	    },
	    time: 0.4
	  });
	  return page.currentPage.animate({
	    properties: {
	      opacity: 1
	    },
	    time: 0.4
	  });
	});


/***/ }
/******/ ]);
//# sourceMappingURL=app.js.map