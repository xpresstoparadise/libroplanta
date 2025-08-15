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
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/panzoom-extension.ts");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/panzoom-extension.ts":
/*!**********************************!*\
  !*** ./app/panzoom-extension.ts ***!
  \**********************************/
/*! exports provided: PanzoomExtensions, ElementType */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PanzoomExtensions", function() { return PanzoomExtensions; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ElementType", function() { return ElementType; });
/* harmony import */ var _style_index_scss__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./style/index.scss */ "./app/style/index.scss");
/* harmony import */ var _style_index_scss__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_style_index_scss__WEBPACK_IMPORTED_MODULE_0__);

var panzoom = __webpack_require__(/*! panzoom */ "./node_modules/panzoom/index.js");
var svgPanzoom = __webpack_require__(/*! svg-pan-zoom */ "./node_modules/svg-pan-zoom/src/browserify.js");
var fullscreenClass = "fullscreen";
var ElementType;
(function (ElementType) {
    ElementType[ElementType["any"] = 0] = "any";
    ElementType[ElementType["objectSvg"] = 1] = "objectSvg";
    ElementType[ElementType["svg"] = 2] = "svg";
})(ElementType || (ElementType = {}));
var PanzoomExtensions = /** @class */ (function () {
    function PanzoomExtensions(type, element, maxHeight, className, attrIdentName, attrNameName, attrTitleName) {
        this.clickHandlers = [];
        this.fullscreenHandlers = [];
        this.unFullscreenHandlers = [];
        this._element = element;
        this._element.classList.add("lp-panzoom-extension-object");
        this.attrIdentName = attrIdentName;
        this.attrNameName = attrNameName;
        this.attrTitleName = attrTitleName;
        this.type = type;
        this.hotspotClassName = className;
        this.maxHeight = maxHeight;
        this.toggleMaxHeight();
        var self = this;
        var panel = this.wrapElement(element);
        this.addControlButtons(panel);
        if (this.type === ElementType.any) {
            self.initPanZoom(element);
        }
        else if (this.type === ElementType.objectSvg) {
            // element.onload = (e:any) => {
            //     self.initSvgPanZoom(e);
            //     // TODO удалить после тестирования
            //     this.highlightByName("5");
            //     this.clearHighlightByName("5");
            // };
            element.addEventListener("load", function (e) {
                self.initSvgPanZoom(e);
            });
        }
        else if (this.type === ElementType.svg) {
            self.initSvgPanZoom(element);
        }
        this.OnFullscreen(function () {
            var a = 1;
        });
        this.OnUnFullscreen(function () {
            var a = 1;
        });
    }
    PanzoomExtensions.prototype.toggleMaxHeight = function () {
        if (this._element.style.maxHeight === "") {
            this._element.style.maxHeight = this.maxHeight;
        }
        else {
            this._element.style.maxHeight = "";
        }
    };
    PanzoomExtensions.prototype.wrapElement = function (element) {
        this.wrapper = document.createElement("div");
        this.wrapper.classList.add("lp-panzoom-extension-wrapper");
        element.parentNode.insertBefore(this.wrapper, element);
        var elementContainer = document.createElement("div");
        elementContainer.classList.add("lp-panzoom-extension-container");
        this.wrapper.appendChild(elementContainer);
        elementContainer.appendChild(element);
        var panel = document.createElement("div");
        panel.classList.add("lp-panzoom-extension-control-panel");
        this.wrapper.appendChild(panel);
        return panel;
    };
    PanzoomExtensions.prototype.addControlButtons = function (panel) {
        var _this = this;
        var self = this;
        if (this.type === ElementType.objectSvg || this.type === ElementType.svg) {
            this.buttonHighlight = addButton(null, "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABHNCSVQICAgIfAhkiAAAAipJREFUOI2V0k9IFHEUwPHvm21TWUosTZBqQYzaggrszy3qVBFGB0Gok3SJ6BhEEF6CFKFbQUSHoJIOIixb4dJC0aEow4UIO+T6Z1fdUmpax2Vd98/rEjGzO5vTgzm8P7/PPH4zQkU0barj3rUTHDvY1gBcAulBCKEoMAE8Bb3/eernau/Nl8wtZR3nxZ7U+Q2Gb52mc09rh4hERGR35QsBVPWLqp6dWsgkuq4+w7Tyf3uGffBK9346Q63NIhKrhQGISEhEYu1tjc19Fw87eg6w90wIQQZEZGctzIYGRaS/+3gHmwP+anD7tgBbGusDwPn1MFtc8PmMwL72rW4bCiJGSETqvWoiUi8ie+01o2LGM2YLvz1xgIrOgKp3S1XRKVdwOZsHmFMl7p1jTODboplzAwu8/ZQGuOFtSy0D1ydTGRJzmWoQYPDxOKo6qsqQh+0equqrgUcfHXWfPZlfytLS1MCBXS3jwGURcfRt2ipwLvYhuTL4xHlDlV+Z20Nx8mvFWWCk5nYwUiyV030P3lf1qsClXzmGX08CvKgFAtE38Xlm0tb6IED0XRIg+Q9wNjaWcm24gqnvFigzqrpW2VPVvKp+TS1Wbwewwa24aOaY/iHJXGnj0VJZQvZ/yGfoRJ1RSE8vLHsHTSvP3egKO4LBfpBTzhXLz03T7ErM/wcIkC8UKZe1R4STtrmSKqOFYqnWMfc7BIhEIliWZQGHgDt/niOAFQ6Ha4K/AUCM24blHmQhAAAAAElFTkSuQmCC", function () { return _this.highlightAll(); }, function () { return _this.clearHighlightAll(); });
            panel.appendChild(this.buttonHighlight);
        }
        this.buttonZoomEnlarge = addButton(function () { return _this.zoomEnlarge(); }, "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABHNCSVQICAgIfAhkiAAAA5VJREFUOI2FlE1InFcUhp93vpnRcWYwajJiNTbKxITYVPAH7MgYoi5KWiwUShVaCV20dlPatYtsumwo7a5p6Q9IxKJtwAYKsaW2FAqhpCFSsTg6NjbBP0g6A6Nx5jtd+GmdNDTv6t573vPcy7nnXuGpo6ODZDKJ3+8/LekNoAdo8MJp4Hvgkuu6N69fv87MzAxmxsMSQF9fH62trSWSLgLDknz/ce7KNbNPgHfS6XRuYmKCQqFQZHDa29tJJBIlkr6R9LIkmdl94EuDUUPTYOtAg6QSSW1Asry8fDwcDudTqVQR0Nfd3Y2k9yT1ApjZqJk15Kz0/B+cmJjj5LUNq3zFzBrN7CsASd2SPmxpaSEWixUD/X5/MzDswT43s6HFxcV7V3/6jU0dPn9Ple/fXHeYm5vbMLOXzGzSg74mqa2jo6MYKOl1SY6ZrZvZW6lUisnJSTLZzL5pe3ubqakpZmdnzcyGzSzj1X+4sbGxGAj0euPxHKHsr7e3OPLUWcrrTu2bguEKYqd7mF0z/nbLNg2+9kK9oVCI0tLSfa8frzUMbqTV8OTRnrbzBzY8Axwrq6q7cOK5twFYsuwPzfx+I0h+CKgH/MFgML+1tbUPdLxkt4BzyIPs6RhQtObipA25Xh1lZkUt5gf+BOKC5pitfnH3zp2efCFPMFxBWVXdBeBMfivbk11bwicf9bVl+JX/yLvENeCB67pFNZzxxgMx1kqiy1e5dXmE279M7Juya0vcujxC6cIVavkr4sN90Qv9mM/nyWaz/wLN7FPAJNVJerezs5NEIoHvocfS3t5OMplE0kVJVd4JP1tZWSnyOV1dXSvAKUnNkp4BIvX19TNHjzUWsr4KHNzlxvKdmy0NVSGfz/eB984xsywwUigUsvPz8+zs7OwCo9Eo1dXV08A5SdWSEsBQyMlXH2YjF2OdQ9x/1Sc+lnR27ySSgsDzoVDoSjwez+xBFQgEGBgYoKamplLSqKRn+R+ZWUGSc2C+APRubm7eHhsb2/1tAoEA/f39xONxgBeAN4FuSaVe0gPgZzO7JGkB+Havjl58yYOmdXD348eP09bWRm1tLY7j+IEnvF67CzxYXV0lEokQiUSeBq5JOnIAugz0FgH3FAgEiEajhMNhAHK5HJlMhu3tbSorKxkcHCQcDjdLmpZUfQCaeiTwcToAPSnpO0k1HnDceVzyo5TL5UilUjQ1NW0Eg8Ep4BwwDQz9A3UdbG6m+Qf/AAAAAElFTkSuQmCC");
        panel.appendChild(this.buttonZoomEnlarge);
        this.buttonZoomReset = addButton(function () { return _this.panZoomReset(); }, "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABHNCSVQICAgIfAhkiAAAAdZJREFUOI211LFrE2EYx/Hv895xihlCTRbbDDXgnQbi4KigdKpw5MgoOCgGheig4FJQqa3o4CYEFyeX6L+gS6lk6RxwCEJKBgUxpQeKJGd8XC7xTEk1of7gXe5938/7vA+8J+yTQqGA7/uIyBNgQVWvvW+1B61oHgARQVUB6La22PmwhT0J8zxvhBljVgBU1ZzyTlz5LmdO9nFqCfBFL/z8aiLoeR5BEGCMWReRleF3EblsoVGWL48+MX8aOBqjm8M1e8AE9kBE7o/Pi3B1QT9GfZzlrmbfIjInIiCyF3Rdl1KpRHzFh5PacUii68d1uw8sdzX7RhNzI9B1XYIgwLKsu8BjkfjIyeitxZ/tCNGLO2TPgv4GE5XdBp7+DRvmsPlxJ6/t/hy7974eMXQAK5fLUS6XsW37pjHm2b9iw1ii51J8M/lj6Y1er4dVqVRwHOeGiNRExEyDDSMi54FBPp9/ZzuOcwl4PiuWyBqwa4DXgK2qBliaAVoCDGABtVG/0uk01Wr1ArAxLViv1zc7nQ7E8oFm4luOsx2PZBbjMRP4MgzDtTAMAUilUmQymVVgdVaQZrNJo9EAoFgs4vv+vusPvIf/D1TV0d93mozvG69wMENRf+z5BZqMlOTVr4GKAAAAAElFTkSuQmCC");
        panel.appendChild(this.buttonZoomReset);
        this.buttonZoomReduce = addButton(function () { return _this.zoomReduce(); }, "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABHNCSVQICAgIfAhkiAAAA2VJREFUOI2FlEtMnFUYhp93blxmRhqkGBzFcI1hWohcAiEMjcCCuMCkiwouSDdV3DTRte5c2o0rbRovCckEC3GBJiZWIyRGE2JwAjEhdOjQYglUGg3DDJCf/3PBXzqjaN/Vf3Le8+T7v/c7R3jq6uoikUgQCATOS3oTGADqvO0M8D1w3XXd1MLCAnNzc5gZ/5QAhoaGaG9vL5F0DZiQ5PuX81iumd0A3s5kMvnp6WmOjo6KDP7Ozk56e3tLJH0l6TVJMrO/gC+ASeAW8ACok1QiqQNIVFRUTIXDYSedThcBA/39/Uj6QNIggJlNmtlVx3H+XF9fx3EcGhoaCAQCVcBHki5K6gc+bGtru7K4uMj29vbjChOJRFzSDUk+M/vMzC6vra3tT01NkUqlWFlZIZVKEY1Gc1VVVTeBc5JaJL0EfB0MBjdXV1dPgD5Jb0jym9kDM7uaTqeZmZkhm82emHK5HLOzsywvL5uZTZjZrtf/ifr6+uJfBga976k8Zdlf7u1z9tzLpyayvG3UuuU7T/nzXwrGgcGysjJKS0vZ398/AdYBGCxmVPfC8wMdl/8jYQDuWPaHOL8thnDGgVogEAqFnEKg3/O6R/jPABf+D+jizxhyAbyJKBqxAHAXaBTEq23r88379wecI+dUmE8+amPlBOR8DGBm28Ch67pFwDmgERitZvu96PrPB/Pz86cCu7u7icUuRIQuendi3nGcogB9ZvYJYJKek/R+T08Pvb29SCqCdXZ2kkgkkHRN0tNehZ9ubGwU+QLAT2Z2U9IlSe8A1tfX925LS8vh0tISrusSj8eprq4u8y7AFQ+WBX6NRqOUl5eTy+UA0PDwMK2trWckzUk675nvAklgCfABbcDrkmoKqzGzFTMbevjw4e/JZJK9vT0UDAYZHR2lpqamUtKkpOFTG/gYciTJX7C+DQzu7OzcSyaTx50NBoOMjIzQ2NgI8CrwFtAvqdQ7dAj8aGbXJd0GvnnUR2//jgfNFHW+qamJjo4OYrEYfr8/ADzrzdomcLi1tUUkEiESibQC30o6WwBdBwaLo/QUDAaJRqOEw2EA8vk8u7u7HBwcUFlZydjYGOFwOC7plqRnCqDpU4FPUgH0RUnfPQrLzKb8Tzp8mvL5POl0mubm5j9CodAs8ArHD/H439IcYN4/H7lhAAAAAElFTkSuQmCC");
        panel.appendChild(this.buttonZoomReduce);
        this.buttonFullscreen = addButton(function () { return _this.fullscreen(); }, "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKWSURBVDhPrZVNa1NBFIbvTdu0tC7U6MKtKK5bcadCVsWG/gTBpWJRXCRpwaXQJKBFLehS8CeEVgqFgoobsf0Botsu/FzYYm2b+Dzj3EviR1ceeDnnno83Z2bOTNJqtTqdJMnFNE2L6D2QRr3QbDY30X9IvV4/gZoBw8GRJKG22+2upbVa7R4f18E++AG+g13wBZQh/YTOBbISag0cBkNgBEg8AOGDAsYg2KdDnXZ3jcANdA0chUBfkGgfB3Pk3ERfBQOxVo6ihHa1Q8IWjjHsuUKh8AK9At63Wq0u/kRo43sLlmPObfyj1H7DlmdPQsVlXiawQcIEdhtdgsBt6BN9xjCX0OPUrGNfAXKkEu6AXQK2fgn7DTgH2izxGLpPom8JnAWvqZmi1s7d99DhIvhKwGV7ABXQSzpmvsAexZeTgWlrqLU7D3GhEEejDN4Bvz+iM9JXjUZjCx0Eexv1EgSymGtT1joRm+GXBeOTn6ZiN1nsd9h1TAtibRYLRia0Hq0kBA+Sf+Vmp/zfJCdkGX1Lnp2d7VtWrxDzcHLprQ2EOJyrU+zFQPx2NFYpvOt3r0TfWsxx/6w5EzkS77IX3VvhVVthbwy0gWPjSZfj6WZdr4IsVmH/HLUpMA8m7fAWOEJg5C9kFUZh2wMQ2I6Qr5Nj4yx6W0rU+tr4WMxI6OMwRMATX8buJXPO+iT6clJqnlHawfblGZbQM/cJekJggoQN7LCUbE97RZ8xTG/JOjXj2E+BHOFQ7LBI4BAJ7tWdTqdzAe2+nIYgH1ptfCfBJDnn0fP4s1fKJ6xYwOGz46/6SPi6PCbhPtpN/sAS86mN9mfQIuch+hGgNNS6mr3wF0DQu2ynkismLEJw0F+Ah2mNPzL4q7Hk+U+hdVymRIC2PgAAAABJRU5ErkJggg==");
        this.buttonFullscreen.classList.add("button-fullscreen");
        panel.appendChild(this.buttonFullscreen);
        this.buttonUnFullscreen = addButton(function () { return _this.unFullscreen(); }, "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAJFSURBVDhPzZQ/T5NRFIf7vqWAYVH+DM7wARRwkUjSCaTwERjcNBiNSxsSVjVtYkgMCavhKzSQMGECYQHsToCVAVsY8A9iqc9zpZi+gY3Bkzw9t/c95/ee9957blQoFD6kUqkRyDUajSo+DQNwVCqVaswx/GfE63qgG/ajKLrA90IZNmN+HsMQLIOBBii4ls/n7+OT5twaL+rH+7am2DCMKDgF2zDE24IowR34u/ASkvYG7sEdsICm2A7kFPwKQRQhK11BuI7PgMJJc0kyxDheISeI4cOSxfxIFRStwENYgk64yXz2CYytkDuJr0HaCvuZGIMnjN/Dd+gCq2uHFiPOCp03xti3zI3iJ2BAwRrll+Aj40VwoX+Bib8haT4z7wxcmkVy5/Hv4KiNH4/KGLjYijSrMHHd/wlzzjwxRlN8wWMWkfx36pbM0m/V/n/BiPbS2052RfMgZ1hbd/gzC20nXBnxntdRdtajY4wnXD9fLBYP3SnbZxVsNbvDQ6uw1dvXLYIIZXEz4JFxl3/COYxzcWRN6qOaWXjN+DmEg0ti/bKKpFmEz3yp1b0g9xXeT+1WcJeH9q/naw5s+lPw7Tcd7DNEvpFjt8zGcWyuX3kQM3kBPeBN8wC+wDPwU8INcI35bBrRCnmDjMtqsN51K/Q+U2yQyS28twYurMt1FdoV58SkiX/K2GvrEZRZw14FgxhsEeQOVgn8gT8GezRpC3BCjJ9t2+bgSlTBDbCyIAbO7UGWTzjEt5hHA+dO70PMf+/TS9HU5h+q6eW1AhOb0wAAAABJRU5ErkJggg==");
        this.buttonUnFullscreen.classList.add("button-unfullscreen");
        panel.appendChild(this.buttonUnFullscreen);
        function addButton(clickHandler, icon, mouseDownHandler, mouseUpHandler) {
            if (mouseDownHandler === void 0) { mouseDownHandler = null; }
            if (mouseUpHandler === void 0) { mouseUpHandler = null; }
            var button = document.createElement("img");
            button.classList.add("lp-panzoom-extension-control-button");
            button.onclick = clickHandler;
            button.onmousedown = mouseDownHandler;
            button.onmouseup = mouseUpHandler;
            button.onmouseout = mouseUpHandler;
            button.src = icon;
            return button;
        }
    };
    PanzoomExtensions.prototype.highlightAll = function () {
        // this.hotspots = this.svg.getElementsByClassName(this.hotspotClassName);
        for (var index = 0; index < this.hotspots.length; index++) {
            var element = this.hotspots[index];
            this.highlight(element);
        }
    };
    PanzoomExtensions.prototype.highlight = function (hotspot) {
        if (hotspot.nodeName === "text") {
            hotspot.style.fill = "red";
        }
        else {
            hotspot.style.fill = "red";
        }
    };
    PanzoomExtensions.prototype.clearHighlightAll = function () {
        for (var index = 0; index < this.hotspots.length; index++) {
            var element = this.hotspots[index];
            this.clearHighlight(element);
        }
    };
    PanzoomExtensions.prototype.clearHighlight = function (hotspot) {
        if (hotspot.nodeName === "text") {
            hotspot.style.fill = null;
        }
        else {
            hotspot.style.fill = null;
        }
    };
    PanzoomExtensions.prototype.actionHotsoptByValue = function (attrName, attrValue, highlight) {
        for (var index = 0; index < this.hotspots.length; index++) {
            var hotspot = this.hotspots[index];
            if (hotspot.getAttribute(attrName) === attrValue) {
                if (highlight) {
                    this.highlight(hotspot);
                }
                else {
                    this.clearHighlight(hotspot);
                }
            }
        }
    };
    PanzoomExtensions.prototype.actionHotspotByAttr = function (value, attrName, highlight) {
        if (typeof value === "object") {
            for (var indexValue = 0; indexValue < value.length; indexValue++) {
                var currentValue = value[indexValue];
                this.actionHotsoptByValue(attrName, currentValue, highlight);
            }
        }
        else {
            this.actionHotsoptByValue(attrName, value, highlight);
        }
    };
    PanzoomExtensions.prototype.highlightById = function (id) {
        this.actionHotspotByAttr(id, this.attrIdentName, true);
    };
    PanzoomExtensions.prototype.highlightByName = function (name) {
        this.actionHotspotByAttr(name, this.attrNameName, true);
    };
    PanzoomExtensions.prototype.clearHighlightById = function (id) {
        this.actionHotspotByAttr(id, this.attrIdentName, false);
    };
    PanzoomExtensions.prototype.clearHighlightByName = function (name) {
        this.actionHotspotByAttr(name, this.attrNameName, false);
    };
    PanzoomExtensions.prototype.getNameById = function (id) {
        for (var index = 0; index < this.hotspots.length; index++) {
            var element = this.hotspots[index];
            if (element.getAttribute(this.attrIdentName) === id) {
                return element.getAttribute(this.attrNameName);
            }
        }
        return null;
    };
    PanzoomExtensions.prototype.initSvgPanZoom = function (e) {
        var self = this;
        if (this.type === ElementType.objectSvg) {
            var objectContent = e.target.contentDocument;
            this.svg = objectContent.getElementsByTagName("svg")[0];
        }
        else if (this.type === ElementType.svg) {
            this.svg = e;
        }
        var options = {
            viewportSelector: '.svg-pan-zoom_viewport',
            preventMouseEventsDefault: false,
            zoomScaleSensitivity: 0.8,
            dblClickZoomEnabled: false,
            minZoom: 0.5,
            maxZoom: 5,
            beforeZoom: function () {
                if (window.event.type === "click") {
                    return true;
                }
                var e = window.event;
                return e.altKey;
            },
            beforePan: function () {
                if (window.event.type === "wheel") {
                    return false;
                }
            }
        };
        this.instancePanZoom = svgPanzoom(this.svg, options);
        this.hotspots = this.svg.getElementsByClassName(this.hotspotClassName);
        for (var index = 0; index < this.hotspots.length; index++) {
            var hotspot = this.hotspots[index];
            this.settingSvgHotSpot(hotspot);
        }
    };
    PanzoomExtensions.prototype.initPanZoom = function (e) {
        var img = e;
        var options = {
            smoothScroll: false,
            preventMouseEventsDefault: false,
            zoomSpeed: 0.8,
            minZoom: 0.5,
            maxZoom: 5,
            onDoubleClick: function (e) {
                return false; // tells the library to not preventDefault, and not stop propagation
            },
            bounds: false,
            beforeWheel: function (e) {
                var shouldIgnore = !e.altKey;
                return shouldIgnore;
            },
        };
        this.instancePanZoom = panzoom(img, options);
        // this.hotspots = this.svg.getElementsByClassName(this.hotspotClassName);
        // for (let index = 0; index < this.hotspots.length; index++) {
        //     const hotspot = this.hotspots[index] as HTMLElement;
        //     this.settingSvgHotSpot(hotspot);
        // }
    };
    PanzoomExtensions.prototype.settingSvgHotSpot = function (hotspot) {
        var _this = this;
        hotspot.style.cursor = "pointer";
        hotspot.onclick = function () {
            _this.triggerClickHandlers(hotspot);
        };
        hotspot.title = hotspot.getAttribute(this.attrTitleName);
        // hotspot.onmouseover = () => this.highlight(hotspot);
        // hotspot.onmouseout = () => this.clearHighlight(hotspot);
    };
    PanzoomExtensions.prototype.OnClick = function (handler) {
        this.clickHandlers.push(handler);
    };
    PanzoomExtensions.prototype.triggerFullscreenHandlers = function () {
        if (this.fullscreenHandlers && this.fullscreenHandlers.length > 0) {
            this.fullscreenHandlers.forEach(function (x) { return x(); });
        }
    };
    PanzoomExtensions.prototype.triggerUnFullscreenHandlers = function () {
        if (this.unFullscreenHandlers && this.unFullscreenHandlers.length > 0) {
            this.unFullscreenHandlers.forEach(function (x) { return x(); });
        }
    };
    PanzoomExtensions.prototype.triggerClickHandlers = function (hotspot) {
        if (this.clickHandlers && this.clickHandlers.length > 0) {
            var ident = getAttribute(hotspot, this.attrIdentName);
            var name = getAttribute(hotspot, this.attrNameName);
            var title = getAttribute(hotspot, this.attrTitleName);
            var args = {
                ident: ident,
                name: name,
                title: title
            };
            this.clickHandlers.forEach(function (x) { return x(args); });
        }
        function getAttribute(hotspot, attrName) {
            var attrs = hotspot.attributes;
            for (var index = 0; index < attrs.length; index++) {
                var attr = attrs[index];
                if (attr.name.toLowerCase() === attrName.toLowerCase()) {
                    return attr.value;
                }
            }
            return null;
        }
    };
    PanzoomExtensions.prototype.zoomEnlarge = function () {
        if (this.type === ElementType.objectSvg || this.type === ElementType.svg) {
            var size = this.instancePanZoom.getSizes();
            var point = this.svg.createSVGPoint();
            point.x = size.width / 2;
            point.y = size.height / 2;
            this.instancePanZoom.zoomAtPointBy(1.3, point);
        }
        else {
            this.instancePanZoom.zoomTo(this._element.clientWidth / 2, this._element.clientHeight / 2, 1.3);
        }
    };
    PanzoomExtensions.prototype.zoomReduce = function () {
        if (this.type === ElementType.objectSvg || this.type === ElementType.svg) {
            var size = this.instancePanZoom.getSizes();
            var point = this.svg.createSVGPoint();
            point.x = size.width / 2;
            point.y = size.height / 2;
            this.instancePanZoom.zoomAtPointBy(0.8, point);
        }
        else {
            this.instancePanZoom.zoomTo(this._element.clientWidth / 2, this._element.clientHeight / 2, 0.8);
        }
    };
    PanzoomExtensions.prototype.panZoomReset = function () {
        if (this.type === ElementType.objectSvg || this.type === ElementType.svg) {
            //this.instancePanZoom.zoom(1);
            this.instancePanZoom.reset();
        }
        else {
            this.instancePanZoom.moveTo(0, 0);
            this.instancePanZoom.zoomAbs(0, 0, 1);
        }
    };
    PanzoomExtensions.prototype.fullscreen = function () {
        this.wrapper.classList.add(fullscreenClass);
        this.repaint();
        var html = document.getElementsByTagName("html")[0];
        this.htmlOverflow = html.style.overflow;
        html.style.overflow = "hidden";
        this.triggerFullscreenHandlers();
        this.toggleMaxHeight();
    };
    PanzoomExtensions.prototype.unFullscreen = function () {
        this.wrapper.classList.remove(fullscreenClass);
        this.repaint();
        var html = document.getElementsByTagName("html")[0];
        html.style.overflow = this.htmlOverflow;
        this.triggerUnFullscreenHandlers();
        this.toggleMaxHeight();
    };
    PanzoomExtensions.prototype.OnFullscreen = function (handler) {
        this.fullscreenHandlers.push(handler);
    };
    PanzoomExtensions.prototype.OnUnFullscreen = function (handler) {
        this.unFullscreenHandlers.push(handler);
    };
    PanzoomExtensions.prototype.repaint = function () {
        if (this.type === ElementType.svg || this.type === ElementType.objectSvg) {
            this.instancePanZoom.resize();
            this.instancePanZoom.fit();
            this.instancePanZoom.center();
        }
    };
    return PanzoomExtensions;
}());

window.PanzoomExtension = function (a, b, c, d, e, f) { return new PanzoomExtensions(a, b, c, d, e, f); };


/***/ }),

/***/ "./app/style/index.scss":
/*!******************************!*\
  !*** ./app/style/index.scss ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),

/***/ "./node_modules/amator/index.js":
/*!**************************************!*\
  !*** ./node_modules/amator/index.js ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var BezierEasing = __webpack_require__(/*! bezier-easing */ "./node_modules/bezier-easing/src/index.js")

// Predefined set of animations. Similar to CSS easing functions
var animations = {
  ease:  BezierEasing(0.25, 0.1, 0.25, 1),
  easeIn: BezierEasing(0.42, 0, 1, 1),
  easeOut: BezierEasing(0, 0, 0.58, 1),
  easeInOut: BezierEasing(0.42, 0, 0.58, 1),
  linear: BezierEasing(0, 0, 1, 1)
}


module.exports = animate;
module.exports.makeAggregateRaf = makeAggregateRaf;
module.exports.sharedScheduler = makeAggregateRaf();


function animate(source, target, options) {
  var start = Object.create(null)
  var diff = Object.create(null)
  options = options || {}
  // We let clients specify their own easing function
  var easing = (typeof options.easing === 'function') ? options.easing : animations[options.easing]

  // if nothing is specified, default to ease (similar to CSS animations)
  if (!easing) {
    if (options.easing) {
      console.warn('Unknown easing function in amator: ' + options.easing);
    }
    easing = animations.ease
  }

  var step = typeof options.step === 'function' ? options.step : noop
  var done = typeof options.done === 'function' ? options.done : noop

  var scheduler = getScheduler(options.scheduler)

  var keys = Object.keys(target)
  keys.forEach(function(key) {
    start[key] = source[key]
    diff[key] = target[key] - source[key]
  })

  var durationInMs = typeof options.duration === 'number' ? options.duration : 400
  var durationInFrames = Math.max(1, durationInMs * 0.06) // 0.06 because 60 frames pers 1,000 ms
  var previousAnimationId
  var frame = 0

  previousAnimationId = scheduler.next(loop)

  return {
    cancel: cancel
  }

  function cancel() {
    scheduler.cancel(previousAnimationId)
    previousAnimationId = 0
  }

  function loop() {
    var t = easing(frame/durationInFrames)
    frame += 1
    setValues(t)
    if (frame <= durationInFrames) {
      previousAnimationId = scheduler.next(loop)
      step(source)
    } else {
      previousAnimationId = 0
      setTimeout(function() { done(source) }, 0)
    }
  }

  function setValues(t) {
    keys.forEach(function(key) {
      source[key] = diff[key] * t + start[key]
    })
  }
}

function noop() { }

function getScheduler(scheduler) {
  if (!scheduler) {
    var canRaf = typeof window !== 'undefined' && window.requestAnimationFrame
    return canRaf ? rafScheduler() : timeoutScheduler()
  }
  if (typeof scheduler.next !== 'function') throw new Error('Scheduler is supposed to have next(cb) function')
  if (typeof scheduler.cancel !== 'function') throw new Error('Scheduler is supposed to have cancel(handle) function')

  return scheduler
}

function rafScheduler() {
  return {
    next: window.requestAnimationFrame.bind(window),
    cancel: window.cancelAnimationFrame.bind(window)
  }
}

function timeoutScheduler() {
  return {
    next: function(cb) {
      return setTimeout(cb, 1000/60)
    },
    cancel: function (id) {
      return clearTimeout(id)
    }
  }
}

function makeAggregateRaf() {
  var frontBuffer = new Set();
  var backBuffer = new Set();
  var frameToken = 0;

  return {
    next: next,
    cancel: next,
    clearAll: clearAll
  }

  function clearAll() {
    frontBuffer.clear();
    backBuffer.clear();
    cancelAnimationFrame(frameToken);
    frameToken = 0;
  }

  function next(callback) {
    backBuffer.add(callback);
    renderNextFrame();
  }

  function renderNextFrame() {
    if (!frameToken) frameToken = requestAnimationFrame(renderFrame);
  }

  function renderFrame() {
    frameToken = 0;

    var t = backBuffer;
    backBuffer = frontBuffer;
    frontBuffer = t;

    frontBuffer.forEach(function(callback) {
      callback();
    });
    frontBuffer.clear();
  }

  function cancel(callback) {
    backBuffer.delete(callback);
  }
}


/***/ }),

/***/ "./node_modules/bezier-easing/src/index.js":
/*!*************************************************!*\
  !*** ./node_modules/bezier-easing/src/index.js ***!
  \*************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

/**
 * https://github.com/gre/bezier-easing
 * BezierEasing - use bezier curve for transition easing function
 * by Gaëtan Renaudeau 2014 - 2015 – MIT License
 */

// These values are established by empiricism with tests (tradeoff: performance VS precision)
var NEWTON_ITERATIONS = 4;
var NEWTON_MIN_SLOPE = 0.001;
var SUBDIVISION_PRECISION = 0.0000001;
var SUBDIVISION_MAX_ITERATIONS = 10;

var kSplineTableSize = 11;
var kSampleStepSize = 1.0 / (kSplineTableSize - 1.0);

var float32ArraySupported = typeof Float32Array === 'function';

function A (aA1, aA2) { return 1.0 - 3.0 * aA2 + 3.0 * aA1; }
function B (aA1, aA2) { return 3.0 * aA2 - 6.0 * aA1; }
function C (aA1)      { return 3.0 * aA1; }

// Returns x(t) given t, x1, and x2, or y(t) given t, y1, and y2.
function calcBezier (aT, aA1, aA2) { return ((A(aA1, aA2) * aT + B(aA1, aA2)) * aT + C(aA1)) * aT; }

// Returns dx/dt given t, x1, and x2, or dy/dt given t, y1, and y2.
function getSlope (aT, aA1, aA2) { return 3.0 * A(aA1, aA2) * aT * aT + 2.0 * B(aA1, aA2) * aT + C(aA1); }

function binarySubdivide (aX, aA, aB, mX1, mX2) {
  var currentX, currentT, i = 0;
  do {
    currentT = aA + (aB - aA) / 2.0;
    currentX = calcBezier(currentT, mX1, mX2) - aX;
    if (currentX > 0.0) {
      aB = currentT;
    } else {
      aA = currentT;
    }
  } while (Math.abs(currentX) > SUBDIVISION_PRECISION && ++i < SUBDIVISION_MAX_ITERATIONS);
  return currentT;
}

function newtonRaphsonIterate (aX, aGuessT, mX1, mX2) {
 for (var i = 0; i < NEWTON_ITERATIONS; ++i) {
   var currentSlope = getSlope(aGuessT, mX1, mX2);
   if (currentSlope === 0.0) {
     return aGuessT;
   }
   var currentX = calcBezier(aGuessT, mX1, mX2) - aX;
   aGuessT -= currentX / currentSlope;
 }
 return aGuessT;
}

function LinearEasing (x) {
  return x;
}

module.exports = function bezier (mX1, mY1, mX2, mY2) {
  if (!(0 <= mX1 && mX1 <= 1 && 0 <= mX2 && mX2 <= 1)) {
    throw new Error('bezier x values must be in [0, 1] range');
  }

  if (mX1 === mY1 && mX2 === mY2) {
    return LinearEasing;
  }

  // Precompute samples table
  var sampleValues = float32ArraySupported ? new Float32Array(kSplineTableSize) : new Array(kSplineTableSize);
  for (var i = 0; i < kSplineTableSize; ++i) {
    sampleValues[i] = calcBezier(i * kSampleStepSize, mX1, mX2);
  }

  function getTForX (aX) {
    var intervalStart = 0.0;
    var currentSample = 1;
    var lastSample = kSplineTableSize - 1;

    for (; currentSample !== lastSample && sampleValues[currentSample] <= aX; ++currentSample) {
      intervalStart += kSampleStepSize;
    }
    --currentSample;

    // Interpolate to provide an initial guess for t
    var dist = (aX - sampleValues[currentSample]) / (sampleValues[currentSample + 1] - sampleValues[currentSample]);
    var guessForT = intervalStart + dist * kSampleStepSize;

    var initialSlope = getSlope(guessForT, mX1, mX2);
    if (initialSlope >= NEWTON_MIN_SLOPE) {
      return newtonRaphsonIterate(aX, guessForT, mX1, mX2);
    } else if (initialSlope === 0.0) {
      return guessForT;
    } else {
      return binarySubdivide(aX, intervalStart, intervalStart + kSampleStepSize, mX1, mX2);
    }
  }

  return function BezierEasing (x) {
    // Because JavaScript number are imprecise, we should guarantee the extremes are right.
    if (x === 0) {
      return 0;
    }
    if (x === 1) {
      return 1;
    }
    return calcBezier(getTForX(x), mY1, mY2);
  };
};


/***/ }),

/***/ "./node_modules/ngraph.events/index.js":
/*!*********************************************!*\
  !*** ./node_modules/ngraph.events/index.js ***!
  \*********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = function eventify(subject) {
  validateSubject(subject);

  var eventsStorage = createEventsStorage(subject);
  subject.on = eventsStorage.on;
  subject.off = eventsStorage.off;
  subject.fire = eventsStorage.fire;
  return subject;
};

function createEventsStorage(subject) {
  // Store all event listeners to this hash. Key is event name, value is array
  // of callback records.
  //
  // A callback record consists of callback function and its optional context:
  // { 'eventName' => [{callback: function, ctx: object}] }
  var registeredEvents = Object.create(null);

  return {
    on: function (eventName, callback, ctx) {
      if (typeof callback !== 'function') {
        throw new Error('callback is expected to be a function');
      }
      var handlers = registeredEvents[eventName];
      if (!handlers) {
        handlers = registeredEvents[eventName] = [];
      }
      handlers.push({callback: callback, ctx: ctx});

      return subject;
    },

    off: function (eventName, callback) {
      var wantToRemoveAll = (typeof eventName === 'undefined');
      if (wantToRemoveAll) {
        // Killing old events storage should be enough in this case:
        registeredEvents = Object.create(null);
        return subject;
      }

      if (registeredEvents[eventName]) {
        var deleteAllCallbacksForEvent = (typeof callback !== 'function');
        if (deleteAllCallbacksForEvent) {
          delete registeredEvents[eventName];
        } else {
          var callbacks = registeredEvents[eventName];
          for (var i = 0; i < callbacks.length; ++i) {
            if (callbacks[i].callback === callback) {
              callbacks.splice(i, 1);
            }
          }
        }
      }

      return subject;
    },

    fire: function (eventName) {
      var callbacks = registeredEvents[eventName];
      if (!callbacks) {
        return subject;
      }

      var fireArguments;
      if (arguments.length > 1) {
        fireArguments = Array.prototype.splice.call(arguments, 1);
      }
      for(var i = 0; i < callbacks.length; ++i) {
        var callbackInfo = callbacks[i];
        callbackInfo.callback.apply(callbackInfo.ctx, fireArguments);
      }

      return subject;
    }
  };
}

function validateSubject(subject) {
  if (!subject) {
    throw new Error('Eventify cannot use falsy object as events subject');
  }
  var reservedWords = ['on', 'fire', 'off'];
  for (var i = 0; i < reservedWords.length; ++i) {
    if (subject.hasOwnProperty(reservedWords[i])) {
      throw new Error("Subject cannot be eventified, since it already has property '" + reservedWords[i] + "'");
    }
  }
}


/***/ }),

/***/ "./node_modules/panzoom/index.js":
/*!***************************************!*\
  !*** ./node_modules/panzoom/index.js ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";

/**
 * Allows to drag and zoom svg elements
 */
var wheel = __webpack_require__(/*! wheel */ "./node_modules/wheel/index.js");
var animate = __webpack_require__(/*! amator */ "./node_modules/amator/index.js");
var eventify = __webpack_require__(/*! ngraph.events */ "./node_modules/ngraph.events/index.js");
var kinetic = __webpack_require__(/*! ./lib/kinetic.js */ "./node_modules/panzoom/lib/kinetic.js");
var createTextSelectionInterceptor = __webpack_require__(/*! ./lib/createTextSelectionInterceptor.js */ "./node_modules/panzoom/lib/createTextSelectionInterceptor.js");
var domTextSelectionInterceptor = createTextSelectionInterceptor();
var fakeTextSelectorInterceptor = createTextSelectionInterceptor(true);
var Transform = __webpack_require__(/*! ./lib/transform.js */ "./node_modules/panzoom/lib/transform.js");
var makeSvgController = __webpack_require__(/*! ./lib/svgController.js */ "./node_modules/panzoom/lib/svgController.js");
var makeDomController = __webpack_require__(/*! ./lib/domController.js */ "./node_modules/panzoom/lib/domController.js");

var defaultZoomSpeed = 1;
var defaultDoubleTapZoomSpeed = 1.75;
var doubleTapSpeedInMS = 300;

module.exports = createPanZoom;

/**
 * Creates a new instance of panzoom, so that an object can be panned and zoomed
 *
 * @param {DOMElement} domElement where panzoom should be attached.
 * @param {Object} options that configure behavior.
 */
function createPanZoom(domElement, options) {
  options = options || {};

  var panController = options.controller;

  if (!panController) {
    if (makeSvgController.canAttach(domElement)) {
      panController = makeSvgController(domElement, options);
    } else if (makeDomController.canAttach(domElement)) {
      panController = makeDomController(domElement, options);
    }
  }

  if (!panController) {
    throw new Error(
      'Cannot create panzoom for the current type of dom element'
    );
  }
  var owner = panController.getOwner();
  // just to avoid GC pressure, every time we do intermediate transform
  // we return this object. For internal use only. Never give it back to the consumer of this library
  var storedCTMResult = { x: 0, y: 0 };

  var isDirty = false;
  var transform = new Transform();

  if (panController.initTransform) {
    panController.initTransform(transform);
  }

  var filterKey = typeof options.filterKey === 'function' ? options.filterKey : noop;
  // TODO: likely need to unite pinchSpeed with zoomSpeed
  var pinchSpeed = typeof options.pinchSpeed === 'number' ? options.pinchSpeed : 1;
  var bounds = options.bounds;
  var maxZoom = typeof options.maxZoom === 'number' ? options.maxZoom : Number.POSITIVE_INFINITY;
  var minZoom = typeof options.minZoom === 'number' ? options.minZoom : 0;

  var boundsPadding = typeof options.boundsPadding === 'number' ? options.boundsPadding : 0.05;
  var zoomDoubleClickSpeed = typeof options.zoomDoubleClickSpeed === 'number' ? options.zoomDoubleClickSpeed : defaultDoubleTapZoomSpeed;
  var beforeWheel = options.beforeWheel || noop;
  var beforeMouseDown = options.beforeMouseDown || noop;
  var speed = typeof options.zoomSpeed === 'number' ? options.zoomSpeed : defaultZoomSpeed;
  var transformOrigin = parseTransformOrigin(options.transformOrigin);
  var textSelection = options.enableTextSelection ? fakeTextSelectorInterceptor : domTextSelectionInterceptor;

  validateBounds(bounds);

  if (options.autocenter) {
    autocenter();
  }

  var frameAnimation;
  var lastTouchEndTime = 0;
  var lastSingleFingerOffset;
  var touchInProgress = false;

  // We only need to fire panstart when actual move happens
  var panstartFired = false;

  // cache mouse coordinates here
  var mouseX;
  var mouseY;

  var pinchZoomLength;

  var smoothScroll;
  if ('smoothScroll' in options && !options.smoothScroll) {
    // If user explicitly asked us not to use smooth scrolling, we obey
    smoothScroll = rigidScroll();
  } else {
    // otherwise we use forward smoothScroll settings to kinetic API
    // which makes scroll smoothing.
    smoothScroll = kinetic(getPoint, scroll, options.smoothScroll);
  }

  var moveByAnimation;
  var zoomToAnimation;

  var multiTouch;
  var paused = false;

  listenForEvents();

  var api = {
    dispose: dispose,
    moveBy: internalMoveBy,
    moveTo: moveTo,
    smoothMoveTo: smoothMoveTo, 
    centerOn: centerOn,
    zoomTo: publicZoomTo,
    zoomAbs: zoomAbs,
    smoothZoom: smoothZoom,
    smoothZoomAbs: smoothZoomAbs,
    showRectangle: showRectangle,

    pause: pause,
    resume: resume,
    isPaused: isPaused,

    getTransform: getTransformModel,

    getMinZoom: getMinZoom,
    setMinZoom: setMinZoom,

    getMaxZoom: getMaxZoom,
    setMaxZoom: setMaxZoom,

    getTransformOrigin: getTransformOrigin,
    setTransformOrigin: setTransformOrigin,

    getZoomSpeed: getZoomSpeed,
    setZoomSpeed: setZoomSpeed
  };

  eventify(api);
  
  var initialX = typeof options.initialX === 'number' ? options.initialX : transform.x;
  var initialY = typeof options.initialY === 'number' ? options.initialY : transform.y;
  var initialZoom = typeof options.initialZoom === 'number' ? options.initialZoom : transform.scale;

  if(initialX != transform.x || initialY != transform.y || initialZoom != transform.Scale){
    zoomAbs(initialX, initialY, initialZoom);
  }

  return api;

  function pause() {
    releaseEvents();
    paused = true;
  }

  function resume() {
    if (paused) {
      listenForEvents();
      paused = false;
    }
  }

  function isPaused() {
    return paused;
  }

  function showRectangle(rect) {
    // TODO: this duplicates autocenter. I think autocenter should go.
    var clientRect = owner.getBoundingClientRect();
    var size = transformToScreen(clientRect.width, clientRect.height);

    var rectWidth = rect.right - rect.left;
    var rectHeight = rect.bottom - rect.top;
    if (!Number.isFinite(rectWidth) || !Number.isFinite(rectHeight)) {
      throw new Error('Invalid rectangle');
    }

    var dw = size.x / rectWidth;
    var dh = size.y / rectHeight;
    var scale = Math.min(dw, dh);
    transform.x = -(rect.left + rectWidth / 2) * scale + size.x / 2;
    transform.y = -(rect.top + rectHeight / 2) * scale + size.y / 2;
    transform.scale = scale;
  }

  function transformToScreen(x, y) {
    if (panController.getScreenCTM) {
      var parentCTM = panController.getScreenCTM();
      var parentScaleX = parentCTM.a;
      var parentScaleY = parentCTM.d;
      var parentOffsetX = parentCTM.e;
      var parentOffsetY = parentCTM.f;
      storedCTMResult.x = x * parentScaleX - parentOffsetX;
      storedCTMResult.y = y * parentScaleY - parentOffsetY;
    } else {
      storedCTMResult.x = x;
      storedCTMResult.y = y;
    }

    return storedCTMResult;
  }

  function autocenter() {
    var w; // width of the parent
    var h; // height of the parent
    var left = 0;
    var top = 0;
    var sceneBoundingBox = getBoundingBox();
    if (sceneBoundingBox) {
      // If we have bounding box - use it.
      left = sceneBoundingBox.left;
      top = sceneBoundingBox.top;
      w = sceneBoundingBox.right - sceneBoundingBox.left;
      h = sceneBoundingBox.bottom - sceneBoundingBox.top;
    } else {
      // otherwise just use whatever space we have
      var ownerRect = owner.getBoundingClientRect();
      w = ownerRect.width;
      h = ownerRect.height;
    }
    var bbox = panController.getBBox();
    if (bbox.width === 0 || bbox.height === 0) {
      // we probably do not have any elements in the SVG
      // just bail out;
      return;
    }
    var dh = h / bbox.height;
    var dw = w / bbox.width;
    var scale = Math.min(dw, dh);
    transform.x = -(bbox.left + bbox.width / 2) * scale + w / 2 + left;
    transform.y = -(bbox.top + bbox.height / 2) * scale + h / 2 + top;
    transform.scale = scale;
  }

  function getTransformModel() {
    // TODO: should this be read only?
    return transform;
  }

  function getMinZoom() {
    return minZoom;
  }

  function setMinZoom(newMinZoom) {
    minZoom = newMinZoom;
  }

  function getMaxZoom() {
    return maxZoom;
  }

  function setMaxZoom(newMaxZoom) {
    maxZoom = newMaxZoom;
  }

  function getTransformOrigin() {
    return transformOrigin;
  }

  function setTransformOrigin(newTransformOrigin) {
    transformOrigin = parseTransformOrigin(newTransformOrigin);
  }

  function getZoomSpeed() {
    return speed;
  }

  function setZoomSpeed(newSpeed) {
    if (!Number.isFinite(newSpeed)) {
      throw new Error('Zoom speed should be a number');
    }
    speed = newSpeed;
  }

  function getPoint() {
    return {
      x: transform.x,
      y: transform.y
    };
  }

  function moveTo(x, y) {
    transform.x = x;
    transform.y = y;

    keepTransformInsideBounds();

    triggerEvent('pan');
    makeDirty();
  }

  function moveBy(dx, dy) {
    moveTo(transform.x + dx, transform.y + dy);
  }

  function keepTransformInsideBounds() {
    var boundingBox = getBoundingBox();
    if (!boundingBox) return;

    var adjusted = false;
    var clientRect = getClientRect();

    var diff = boundingBox.left - clientRect.right;
    if (diff > 0) {
      transform.x += diff;
      adjusted = true;
    }
    // check the other side:
    diff = boundingBox.right - clientRect.left;
    if (diff < 0) {
      transform.x += diff;
      adjusted = true;
    }

    // y axis:
    diff = boundingBox.top - clientRect.bottom;
    if (diff > 0) {
      // we adjust transform, so that it matches exactly our bounding box:
      // transform.y = boundingBox.top - (boundingBox.height + boundingBox.y) * transform.scale =>
      // transform.y = boundingBox.top - (clientRect.bottom - transform.y) =>
      // transform.y = diff + transform.y =>
      transform.y += diff;
      adjusted = true;
    }

    diff = boundingBox.bottom - clientRect.top;
    if (diff < 0) {
      transform.y += diff;
      adjusted = true;
    }
    return adjusted;
  }

  /**
   * Returns bounding box that should be used to restrict scene movement.
   */
  function getBoundingBox() {
    if (!bounds) return; // client does not want to restrict movement

    if (typeof bounds === 'boolean') {
      // for boolean type we use parent container bounds
      var ownerRect = owner.getBoundingClientRect();
      var sceneWidth = ownerRect.width;
      var sceneHeight = ownerRect.height;

      return {
        left: sceneWidth * boundsPadding,
        top: sceneHeight * boundsPadding,
        right: sceneWidth * (1 - boundsPadding),
        bottom: sceneHeight * (1 - boundsPadding)
      };
    }

    return bounds;
  }

  function getClientRect() {
    var bbox = panController.getBBox();
    var leftTop = client(bbox.left, bbox.top);

    return {
      left: leftTop.x,
      top: leftTop.y,
      right: bbox.width * transform.scale + leftTop.x,
      bottom: bbox.height * transform.scale + leftTop.y
    };
  }

  function client(x, y) {
    return {
      x: x * transform.scale + transform.x,
      y: y * transform.scale + transform.y
    };
  }

  function makeDirty() {
    isDirty = true;
    frameAnimation = window.requestAnimationFrame(frame);
  }

  function zoomByRatio(clientX, clientY, ratio) {
    if (isNaN(clientX) || isNaN(clientY) || isNaN(ratio)) {
      throw new Error('zoom requires valid numbers');
    }

    var newScale = transform.scale * ratio;

    if (newScale < minZoom) {
      if (transform.scale === minZoom) return;

      ratio = minZoom / transform.scale;
    }
    if (newScale > maxZoom) {
      if (transform.scale === maxZoom) return;

      ratio = maxZoom / transform.scale;
    }

    var size = transformToScreen(clientX, clientY);

    transform.x = size.x - ratio * (size.x - transform.x);
    transform.y = size.y - ratio * (size.y - transform.y);

    // TODO: https://github.com/anvaka/panzoom/issues/112
    if (bounds && boundsPadding === 1 && minZoom === 1) {
      transform.scale *= ratio;
      keepTransformInsideBounds();
    } else {
      var transformAdjusted = keepTransformInsideBounds();
      if (!transformAdjusted) transform.scale *= ratio;
    }

    triggerEvent('zoom');

    makeDirty();
  }

  function zoomAbs(clientX, clientY, zoomLevel) {
    var ratio = zoomLevel / transform.scale;
    zoomByRatio(clientX, clientY, ratio);
  }

  function centerOn(ui) {
    var parent = ui.ownerSVGElement;
    if (!parent)
      throw new Error('ui element is required to be within the scene');

    // TODO: should i use controller's screen CTM?
    var clientRect = ui.getBoundingClientRect();
    var cx = clientRect.left + clientRect.width / 2;
    var cy = clientRect.top + clientRect.height / 2;

    var container = parent.getBoundingClientRect();
    var dx = container.width / 2 - cx;
    var dy = container.height / 2 - cy;

    internalMoveBy(dx, dy, true);
  }

  function smoothMoveTo(x, y){
    internalMoveBy(x - transform.x, y - transform.y, true)
  }

  function internalMoveBy(dx, dy, smooth) {
    if (!smooth) {
      return moveBy(dx, dy);
    }

    if (moveByAnimation) moveByAnimation.cancel();

    var from = { x: 0, y: 0 };
    var to = { x: dx, y: dy };
    var lastX = 0;
    var lastY = 0;

    moveByAnimation = animate(from, to, {
      step: function (v) {
        moveBy(v.x - lastX, v.y - lastY);

        lastX = v.x;
        lastY = v.y;
      }
    });
  }

  function scroll(x, y) {
    cancelZoomAnimation();
    moveTo(x, y);
  }

  function dispose() {
    releaseEvents();
  }

  function listenForEvents() {
    owner.addEventListener('mousedown', onMouseDown, { passive: false });
    owner.addEventListener('dblclick', onDoubleClick, { passive: false });
    owner.addEventListener('touchstart', onTouch, { passive: false });
    owner.addEventListener('keydown', onKeyDown, { passive: false });

    // Need to listen on the owner container, so that we are not limited
    // by the size of the scrollable domElement
    wheel.addWheelListener(owner, onMouseWheel, { passive: false });

    makeDirty();
  }

  function releaseEvents() {
    wheel.removeWheelListener(owner, onMouseWheel);
    owner.removeEventListener('mousedown', onMouseDown);
    owner.removeEventListener('keydown', onKeyDown);
    owner.removeEventListener('dblclick', onDoubleClick);
    owner.removeEventListener('touchstart', onTouch);

    if (frameAnimation) {
      window.cancelAnimationFrame(frameAnimation);
      frameAnimation = 0;
    }

    smoothScroll.cancel();

    releaseDocumentMouse();
    releaseTouches();
    textSelection.release();

    triggerPanEnd();
  }

  function frame() {
    if (isDirty) applyTransform();
  }

  function applyTransform() {
    isDirty = false;

    // TODO: Should I allow to cancel this?
    panController.applyTransform(transform);

    triggerEvent('transform');
    frameAnimation = 0;
  }

  function onKeyDown(e) {
    var x = 0,
      y = 0,
      z = 0;
    if (e.keyCode === 38) {
      y = 1; // up
    } else if (e.keyCode === 40) {
      y = -1; // down
    } else if (e.keyCode === 37) {
      x = 1; // left
    } else if (e.keyCode === 39) {
      x = -1; // right
    } else if (e.keyCode === 189 || e.keyCode === 109) {
      // DASH or SUBTRACT
      z = 1; // `-` -  zoom out
    } else if (e.keyCode === 187 || e.keyCode === 107) {
      // EQUAL SIGN or ADD
      z = -1; // `=` - zoom in (equal sign on US layout is under `+`)
    }

    if (filterKey(e, x, y, z)) {
      // They don't want us to handle the key: https://github.com/anvaka/panzoom/issues/45
      return;
    }

    if (x || y) {
      e.preventDefault();
      e.stopPropagation();

      var clientRect = owner.getBoundingClientRect();
      // movement speed should be the same in both X and Y direction:
      var offset = Math.min(clientRect.width, clientRect.height);
      var moveSpeedRatio = 0.05;
      var dx = offset * moveSpeedRatio * x;
      var dy = offset * moveSpeedRatio * y;

      // TODO: currently we do not animate this. It could be better to have animation
      internalMoveBy(dx, dy);
    }

    if (z) {
      var scaleMultiplier = getScaleMultiplier(z * 100);
      var offset = transformOrigin ? getTransformOriginOffset() : midPoint();
      publicZoomTo(offset.x, offset.y, scaleMultiplier);
    }
  }

  function midPoint() {
    var ownerRect = owner.getBoundingClientRect();
    return {
      x: ownerRect.width / 2,
      y: ownerRect.height / 2
    };
  }

  function onTouch(e) {
    // let the override the touch behavior
    beforeTouch(e);

    if (e.touches.length === 1) {
      return handleSingleFingerTouch(e, e.touches[0]);
    } else if (e.touches.length === 2) {
      // handleTouchMove() will care about pinch zoom.
      pinchZoomLength = getPinchZoomLength(e.touches[0], e.touches[1]);
      multiTouch = true;
      startTouchListenerIfNeeded();
    }
  }

  function beforeTouch(e) {
    // TODO: Need to unify this filtering names. E.g. use `beforeTouch`
    if (options.onTouch && !options.onTouch(e)) {
      // if they return `false` from onTouch, we don't want to stop
      // events propagation. Fixes https://github.com/anvaka/panzoom/issues/12
      return;
    }

    e.stopPropagation();
    e.preventDefault();
  }

  function beforeDoubleClick(e) {
    // TODO: Need to unify this filtering names. E.g. use `beforeDoubleClick``
    if (options.onDoubleClick && !options.onDoubleClick(e)) {
      // if they return `false` from onTouch, we don't want to stop
      // events propagation. Fixes https://github.com/anvaka/panzoom/issues/46
      return;
    }

    e.preventDefault();
    e.stopPropagation();
  }

  function handleSingleFingerTouch(e) {
    var touch = e.touches[0];
    var offset = getOffsetXY(touch);
    lastSingleFingerOffset = offset;
    var point = transformToScreen(offset.x, offset.y);
    mouseX = point.x;
    mouseY = point.y;

    smoothScroll.cancel();
    startTouchListenerIfNeeded();
  }

  function startTouchListenerIfNeeded() {
    if (touchInProgress) {
      // no need to do anything, as we already listen to events;
      return;
    }

    touchInProgress = true;
    document.addEventListener('touchmove', handleTouchMove);
    document.addEventListener('touchend', handleTouchEnd);
    document.addEventListener('touchcancel', handleTouchEnd);
  }

  function handleTouchMove(e) {
    if (e.touches.length === 1) {
      e.stopPropagation();
      var touch = e.touches[0];

      var offset = getOffsetXY(touch);
      var point = transformToScreen(offset.x, offset.y);

      var dx = point.x - mouseX;
      var dy = point.y - mouseY;

      if (dx !== 0 && dy !== 0) {
        triggerPanStart();
      }
      mouseX = point.x;
      mouseY = point.y;
      internalMoveBy(dx, dy);
    } else if (e.touches.length === 2) {
      // it's a zoom, let's find direction
      multiTouch = true;
      var t1 = e.touches[0];
      var t2 = e.touches[1];
      var currentPinchLength = getPinchZoomLength(t1, t2);

      // since the zoom speed is always based on distance from 1, we need to apply
      // pinch speed only on that distance from 1:
      var scaleMultiplier =
        1 + (currentPinchLength / pinchZoomLength - 1) * pinchSpeed;

      var firstTouchPoint = getOffsetXY(t1);
      var secondTouchPoint = getOffsetXY(t2);
      mouseX = (firstTouchPoint.x + secondTouchPoint.x) / 2;
      mouseY = (firstTouchPoint.y + secondTouchPoint.y) / 2;
      if (transformOrigin) {
        var offset = getTransformOriginOffset();
        mouseX = offset.x;
        mouseY = offset.y;
      }

      publicZoomTo(mouseX, mouseY, scaleMultiplier);

      pinchZoomLength = currentPinchLength;
      e.stopPropagation();
      e.preventDefault();
    }
  }

  function handleTouchEnd(e) {
    if (e.touches.length > 0) {
      var offset = getOffsetXY(e.touches[0]);
      var point = transformToScreen(offset.x, offset.y);
      mouseX = point.x;
      mouseY = point.y;
    } else {
      var now = new Date();
      if (now - lastTouchEndTime < doubleTapSpeedInMS) {
        if (transformOrigin) {
          var offset = getTransformOriginOffset();
          smoothZoom(offset.x, offset.y, zoomDoubleClickSpeed);
        } else {
          // We want untransformed x/y here.
          smoothZoom(lastSingleFingerOffset.x, lastSingleFingerOffset.y, zoomDoubleClickSpeed);
        }
      }

      lastTouchEndTime = now;

      triggerPanEnd();
      releaseTouches();
    }
  }

  function getPinchZoomLength(finger1, finger2) {
    var dx = finger1.clientX - finger2.clientX;
    var dy = finger1.clientY - finger2.clientY;
    return Math.sqrt(dx * dx + dy * dy);
  }

  function onDoubleClick(e) {
    beforeDoubleClick(e);
    var offset = getOffsetXY(e);
    if (transformOrigin) {
      // TODO: looks like this is duplicated in the file.
      // Need to refactor
      offset = getTransformOriginOffset();
    }
    smoothZoom(offset.x, offset.y, zoomDoubleClickSpeed);
  }

  function onMouseDown(e) {
    // if client does not want to handle this event - just ignore the call
    if (beforeMouseDown(e)) return;

    if (touchInProgress) {
      // modern browsers will fire mousedown for touch events too
      // we do not want this: touch is handled separately.
      e.stopPropagation();
      return false;
    }
    // for IE, left click == 1
    // for Firefox, left click == 0
    var isLeftButton =
      (e.button === 1 && window.event !== null) || e.button === 0;
    if (!isLeftButton) return;

    smoothScroll.cancel();

    var offset = getOffsetXY(e);
    var point = transformToScreen(offset.x, offset.y);
    mouseX = point.x;
    mouseY = point.y;

    // We need to listen on document itself, since mouse can go outside of the
    // window, and we will loose it
    document.addEventListener('mousemove', onMouseMove);
    document.addEventListener('mouseup', onMouseUp);
    textSelection.capture(e.target || e.srcElement);

    return false;
  }

  function onMouseMove(e) {
    // no need to worry about mouse events when touch is happening
    if (touchInProgress) return;

    triggerPanStart();

    var offset = getOffsetXY(e);
    var point = transformToScreen(offset.x, offset.y);
    var dx = point.x - mouseX;
    var dy = point.y - mouseY;

    mouseX = point.x;
    mouseY = point.y;

    internalMoveBy(dx, dy);
  }

  function onMouseUp() {
    textSelection.release();
    triggerPanEnd();
    releaseDocumentMouse();
  }

  function releaseDocumentMouse() {
    document.removeEventListener('mousemove', onMouseMove);
    document.removeEventListener('mouseup', onMouseUp);
    panstartFired = false;
  }

  function releaseTouches() {
    document.removeEventListener('touchmove', handleTouchMove);
    document.removeEventListener('touchend', handleTouchEnd);
    document.removeEventListener('touchcancel', handleTouchEnd);
    panstartFired = false;
    multiTouch = false;
    touchInProgress = false;
  }

  function onMouseWheel(e) {
    // if client does not want to handle this event - just ignore the call
    if (beforeWheel(e)) return;

    smoothScroll.cancel();

    var delta = e.deltaY;
    if (e.deltaMode > 0) delta *= 100;

    var scaleMultiplier = getScaleMultiplier(delta);

    if (scaleMultiplier !== 1) {
      var offset = transformOrigin
        ? getTransformOriginOffset()
        : getOffsetXY(e);
      publicZoomTo(offset.x, offset.y, scaleMultiplier);
      e.preventDefault();
    }
  }

  function getOffsetXY(e) {
    var offsetX, offsetY;
    // I tried using e.offsetX, but that gives wrong results for svg, when user clicks on a path.
    var ownerRect = owner.getBoundingClientRect();
    offsetX = e.clientX - ownerRect.left;
    offsetY = e.clientY - ownerRect.top;

    return { x: offsetX, y: offsetY };
  }

  function smoothZoom(clientX, clientY, scaleMultiplier) {
    var fromValue = transform.scale;
    var from = { scale: fromValue };
    var to = { scale: scaleMultiplier * fromValue };

    smoothScroll.cancel();
    cancelZoomAnimation();

    zoomToAnimation = animate(from, to, {
      step: function (v) {
        zoomAbs(clientX, clientY, v.scale);
      },
      done: triggerZoomEnd
    });
  }

  function smoothZoomAbs(clientX, clientY, toScaleValue) {
    var fromValue = transform.scale;
    var from = { scale: fromValue };
    var to = { scale: toScaleValue };

    smoothScroll.cancel();
    cancelZoomAnimation();

    zoomToAnimation = animate(from, to, {
      step: function (v) {
        zoomAbs(clientX, clientY, v.scale);
      }
    });
  }

  function getTransformOriginOffset() {
    var ownerRect = owner.getBoundingClientRect();
    return {
      x: ownerRect.width * transformOrigin.x,
      y: ownerRect.height * transformOrigin.y
    };
  }

  function publicZoomTo(clientX, clientY, scaleMultiplier) {
    smoothScroll.cancel();
    cancelZoomAnimation();
    return zoomByRatio(clientX, clientY, scaleMultiplier);
  }

  function cancelZoomAnimation() {
    if (zoomToAnimation) {
      zoomToAnimation.cancel();
      zoomToAnimation = null;
    }
  }

  function getScaleMultiplier(delta) {
    var sign = Math.sign(delta);
    var deltaAdjustedSpeed = Math.min(0.25, Math.abs(speed * delta / 128));
    return 1 - sign * deltaAdjustedSpeed;
  }

  function triggerPanStart() {
    if (!panstartFired) {
      triggerEvent('panstart');
      panstartFired = true;
      smoothScroll.start();
    }
  }

  function triggerPanEnd() {
    if (panstartFired) {
      // we should never run smooth scrolling if it was multiTouch (pinch zoom animation):
      if (!multiTouch) smoothScroll.stop();
      triggerEvent('panend');
    }
  }

  function triggerZoomEnd() {
    triggerEvent('zoomend');
  }

  function triggerEvent(name) {
    api.fire(name, api);
  }
}

function parseTransformOrigin(options) {
  if (!options) return;
  if (typeof options === 'object') {
    if (!isNumber(options.x) || !isNumber(options.y))
      failTransformOrigin(options);
    return options;
  }

  failTransformOrigin();
}

function failTransformOrigin(options) {
  console.error(options);
  throw new Error(
    [
      'Cannot parse transform origin.',
      'Some good examples:',
      '  "center center" can be achieved with {x: 0.5, y: 0.5}',
      '  "top center" can be achieved with {x: 0.5, y: 0}',
      '  "bottom right" can be achieved with {x: 1, y: 1}'
    ].join('\n')
  );
}

function noop() { }

function validateBounds(bounds) {
  var boundsType = typeof bounds;
  if (boundsType === 'undefined' || boundsType === 'boolean') return; // this is okay
  // otherwise need to be more thorough:
  var validBounds =
    isNumber(bounds.left) &&
    isNumber(bounds.top) &&
    isNumber(bounds.bottom) &&
    isNumber(bounds.right);

  if (!validBounds)
    throw new Error(
      'Bounds object is not valid. It can be: ' +
      'undefined, boolean (true|false) or an object {left, top, right, bottom}'
    );
}

function isNumber(x) {
  return Number.isFinite(x);
}

// IE 11 does not support isNaN:
function isNaN(value) {
  if (Number.isNaN) {
    return Number.isNaN(value);
  }

  return value !== value;
}

function rigidScroll() {
  return {
    start: noop,
    stop: noop,
    cancel: noop
  };
}

function autoRun() {
  if (typeof document === 'undefined') return;

  var scripts = document.getElementsByTagName('script');
  if (!scripts) return;
  var panzoomScript;

  for (var i = 0; i < scripts.length; ++i) {
    var x = scripts[i];
    if (x.src && x.src.match(/\bpanzoom(\.min)?\.js/)) {
      panzoomScript = x;
      break;
    }
  }

  if (!panzoomScript) return;

  var query = panzoomScript.getAttribute('query');
  if (!query) return;

  var globalName = panzoomScript.getAttribute('name') || 'pz';
  var started = Date.now();

  tryAttach();

  function tryAttach() {
    var el = document.querySelector(query);
    if (!el) {
      var now = Date.now();
      var elapsed = now - started;
      if (elapsed < 2000) {
        // Let's wait a bit
        setTimeout(tryAttach, 100);
        return;
      }
      // If we don't attach within 2 seconds to the target element, consider it a failure
      console.error('Cannot find the panzoom element', globalName);
      return;
    }
    var options = collectOptions(panzoomScript);
    console.log(options);
    window[globalName] = createPanZoom(el, options);
  }

  function collectOptions(script) {
    var attrs = script.attributes;
    var options = {};
    for (var i = 0; i < attrs.length; ++i) {
      var attr = attrs[i];
      var nameValue = getPanzoomAttributeNameValue(attr);
      if (nameValue) {
        options[nameValue.name] = nameValue.value;
      }
    }

    return options;
  }

  function getPanzoomAttributeNameValue(attr) {
    if (!attr.name) return;
    var isPanZoomAttribute =
      attr.name[0] === 'p' && attr.name[1] === 'z' && attr.name[2] === '-';

    if (!isPanZoomAttribute) return;

    var name = attr.name.substr(3);
    var value = JSON.parse(attr.value);
    return { name: name, value: value };
  }
}

autoRun();
	

/***/ }),

/***/ "./node_modules/panzoom/lib/createTextSelectionInterceptor.js":
/*!********************************************************************!*\
  !*** ./node_modules/panzoom/lib/createTextSelectionInterceptor.js ***!
  \********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

/**
 * Disallows selecting text.
 */
module.exports = createTextSelectionInterceptor;

function createTextSelectionInterceptor(useFake) {
  if (useFake) {
    return {
      capture: noop,
      release: noop
    };
  }

  var dragObject;
  var prevSelectStart;
  var prevDragStart;
  var wasCaptured = false;

  return {
    capture: capture,
    release: release
  };

  function capture(domObject) {
    wasCaptured = true;
    prevSelectStart = window.document.onselectstart;
    prevDragStart = window.document.ondragstart;

    window.document.onselectstart = disabled;

    dragObject = domObject;
    dragObject.ondragstart = disabled;
  }

  function release() {
    if (!wasCaptured) return;
    
    wasCaptured = false;
    window.document.onselectstart = prevSelectStart;
    if (dragObject) dragObject.ondragstart = prevDragStart;
  }
}

function disabled(e) {
  e.stopPropagation();
  return false;
}

function noop() {}


/***/ }),

/***/ "./node_modules/panzoom/lib/domController.js":
/*!***************************************************!*\
  !*** ./node_modules/panzoom/lib/domController.js ***!
  \***************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = makeDomController

module.exports.canAttach = isDomElement;

function makeDomController(domElement, options) {
  var elementValid = isDomElement(domElement); 
  if (!elementValid) {
    throw new Error('panzoom requires DOM element to be attached to the DOM tree')
  }

  var owner = domElement.parentElement;
  domElement.scrollTop = 0;
  
  if (!options.disableKeyboardInteraction) {
    owner.setAttribute('tabindex', 0);
  }

  var api = {
    getBBox: getBBox,
    getOwner: getOwner,
    applyTransform: applyTransform,
  }
  
  return api

  function getOwner() {
    return owner
  }

  function getBBox() {
    // TODO: We should probably cache this?
    return  {
      left: 0,
      top: 0,
      width: domElement.clientWidth,
      height: domElement.clientHeight
    }
  }

  function applyTransform(transform) {
    // TODO: Should we cache this?
    domElement.style.transformOrigin = '0 0 0';
    domElement.style.transform = 'matrix(' +
      transform.scale + ', 0, 0, ' +
      transform.scale + ', ' +
      transform.x + ', ' + transform.y + ')'
  }
}

function isDomElement(element) {
  return element && element.parentElement && element.style;
}


/***/ }),

/***/ "./node_modules/panzoom/lib/kinetic.js":
/*!*********************************************!*\
  !*** ./node_modules/panzoom/lib/kinetic.js ***!
  \*********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

/**
 * Allows smooth kinetic scrolling of the surface
 */
module.exports = kinetic;

function kinetic(getPoint, scroll, settings) {
  if (typeof settings !== 'object') {
    // setting could come as boolean, we should ignore it, and use an object.
    settings = {};
  }

  var minVelocity = typeof settings.minVelocity === 'number' ? settings.minVelocity : 5;
  var amplitude = typeof settings.amplitude === 'number' ? settings.amplitude : 0.25;
  var cancelAnimationFrame = typeof settings.cancelAnimationFrame === 'function' ? settings.cancelAnimationFrame : getCancelAnimationFrame();
  var requestAnimationFrame = typeof settings.requestAnimationFrame === 'function' ? settings.requestAnimationFrame : getRequestAnimationFrame();

  var lastPoint;
  var timestamp;
  var timeConstant = 342;

  var ticker;
  var vx, targetX, ax;
  var vy, targetY, ay;

  var raf;

  return {
    start: start,
    stop: stop,
    cancel: dispose
  };

  function dispose() {
    cancelAnimationFrame(ticker);
    cancelAnimationFrame(raf);
  }

  function start() {
    lastPoint = getPoint();

    ax = ay = vx = vy = 0;
    timestamp = new Date();

    cancelAnimationFrame(ticker);
    cancelAnimationFrame(raf);

    // we start polling the point position to accumulate velocity
    // Once we stop(), we will use accumulated velocity to keep scrolling
    // an object.
    ticker = requestAnimationFrame(track);
  }

  function track() {
    var now = Date.now();
    var elapsed = now - timestamp;
    timestamp = now;

    var currentPoint = getPoint();

    var dx = currentPoint.x - lastPoint.x;
    var dy = currentPoint.y - lastPoint.y;

    lastPoint = currentPoint;

    var dt = 1000 / (1 + elapsed);

    // moving average
    vx = 0.8 * dx * dt + 0.2 * vx;
    vy = 0.8 * dy * dt + 0.2 * vy;

    ticker = requestAnimationFrame(track);
  }

  function stop() {
    cancelAnimationFrame(ticker);
    cancelAnimationFrame(raf);

    var currentPoint = getPoint();

    targetX = currentPoint.x;
    targetY = currentPoint.y;
    timestamp = Date.now();

    if (vx < -minVelocity || vx > minVelocity) {
      ax = amplitude * vx;
      targetX += ax;
    }

    if (vy < -minVelocity || vy > minVelocity) {
      ay = amplitude * vy;
      targetY += ay;
    }

    raf = requestAnimationFrame(autoScroll);
  }

  function autoScroll() {
    var elapsed = Date.now() - timestamp;

    var moving = false;
    var dx = 0;
    var dy = 0;

    if (ax) {
      dx = -ax * Math.exp(-elapsed / timeConstant);

      if (dx > 0.5 || dx < -0.5) moving = true;
      else dx = ax = 0;
    }

    if (ay) {
      dy = -ay * Math.exp(-elapsed / timeConstant);

      if (dy > 0.5 || dy < -0.5) moving = true;
      else dy = ay = 0;
    }

    if (moving) {
      scroll(targetX + dx, targetY + dy);
      raf = requestAnimationFrame(autoScroll);
    }
  }
}

function getCancelAnimationFrame() {
  if (typeof cancelAnimationFrame === 'function') return cancelAnimationFrame;
  return clearTimeout;
}

function getRequestAnimationFrame() {
  if (typeof requestAnimationFrame === 'function') return requestAnimationFrame;

  return function (handler) {
    return setTimeout(handler, 16);
  }
}

/***/ }),

/***/ "./node_modules/panzoom/lib/svgController.js":
/*!***************************************************!*\
  !*** ./node_modules/panzoom/lib/svgController.js ***!
  \***************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = makeSvgController
module.exports.canAttach = isSVGElement;

function makeSvgController(svgElement, options) {
  if (!isSVGElement(svgElement)) {
    throw new Error('svg element is required for svg.panzoom to work')
  }

  var owner = svgElement.ownerSVGElement
  if (!owner) {
    throw new Error(
      'Do not apply panzoom to the root <svg> element. ' +
      'Use its child instead (e.g. <g></g>). ' +
      'As of March 2016 only FireFox supported transform on the root element')
  }

  if (!options.disableKeyboardInteraction) {
    owner.setAttribute('tabindex', 0);
  }

  var api = {
    getBBox: getBBox,
    getScreenCTM: getScreenCTM,
    getOwner: getOwner,
    applyTransform: applyTransform,
    initTransform: initTransform
  }
  
  return api

  function getOwner() {
    return owner
  }

  function getBBox() {
    var bbox =  svgElement.getBBox()
    return {
      left: bbox.x,
      top: bbox.y,
      width: bbox.width,
      height: bbox.height,
    }
  }

  function getScreenCTM() {
    var ctm = owner.getCTM();
    if (!ctm) {
      // This is likely firefox: https://bugzilla.mozilla.org/show_bug.cgi?id=873106
      // The code below is not entirely correct, but still better than nothing
      return owner.getScreenCTM();
    }
    return ctm;
  }

  function initTransform(transform) {
    var screenCTM = svgElement.getCTM()

    // The above line returns null on Firefox
    if (screenCTM === null) {
      screenCTM = document.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGMatrix()
    }

    transform.x = screenCTM.e;
    transform.y = screenCTM.f;
    transform.scale = screenCTM.a;
    owner.removeAttributeNS(null, 'viewBox');
  }

  function applyTransform(transform) {
    svgElement.setAttribute('transform', 'matrix(' +
      transform.scale + ' 0 0 ' +
      transform.scale + ' ' +
      transform.x + ' ' + transform.y + ')')
  }
}

function isSVGElement(element) {
  return element && element.ownerSVGElement && element.getCTM;
}

/***/ }),

/***/ "./node_modules/panzoom/lib/transform.js":
/*!***********************************************!*\
  !*** ./node_modules/panzoom/lib/transform.js ***!
  \***********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = Transform;

function Transform() {
  this.x = 0;
  this.y = 0;
  this.scale = 1;
}


/***/ }),

/***/ "./node_modules/svg-pan-zoom/src/browserify.js":
/*!*****************************************************!*\
  !*** ./node_modules/svg-pan-zoom/src/browserify.js ***!
  \*****************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var SvgPanZoom = __webpack_require__(/*! ./svg-pan-zoom.js */ "./node_modules/svg-pan-zoom/src/svg-pan-zoom.js");

module.exports = SvgPanZoom;


/***/ }),

/***/ "./node_modules/svg-pan-zoom/src/control-icons.js":
/*!********************************************************!*\
  !*** ./node_modules/svg-pan-zoom/src/control-icons.js ***!
  \********************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var SvgUtils = __webpack_require__(/*! ./svg-utilities */ "./node_modules/svg-pan-zoom/src/svg-utilities.js");

module.exports = {
  enable: function(instance) {
    // Select (and create if necessary) defs
    var defs = instance.svg.querySelector("defs");
    if (!defs) {
      defs = document.createElementNS(SvgUtils.svgNS, "defs");
      instance.svg.appendChild(defs);
    }

    // Check for style element, and create it if it doesn't exist
    var styleEl = defs.querySelector("style#svg-pan-zoom-controls-styles");
    if (!styleEl) {
      var style = document.createElementNS(SvgUtils.svgNS, "style");
      style.setAttribute("id", "svg-pan-zoom-controls-styles");
      style.setAttribute("type", "text/css");
      style.textContent =
        ".svg-pan-zoom-control { cursor: pointer; fill: black; fill-opacity: 0.333; } .svg-pan-zoom-control:hover { fill-opacity: 0.8; } .svg-pan-zoom-control-background { fill: white; fill-opacity: 0.5; } .svg-pan-zoom-control-background { fill-opacity: 0.8; }";
      defs.appendChild(style);
    }

    // Zoom Group
    var zoomGroup = document.createElementNS(SvgUtils.svgNS, "g");
    zoomGroup.setAttribute("id", "svg-pan-zoom-controls");
    zoomGroup.setAttribute(
      "transform",
      "translate(" +
        (instance.width - 70) +
        " " +
        (instance.height - 76) +
        ") scale(0.75)"
    );
    zoomGroup.setAttribute("class", "svg-pan-zoom-control");

    // Control elements
    zoomGroup.appendChild(this._createZoomIn(instance));
    zoomGroup.appendChild(this._createZoomReset(instance));
    zoomGroup.appendChild(this._createZoomOut(instance));

    // Finally append created element
    instance.svg.appendChild(zoomGroup);

    // Cache control instance
    instance.controlIcons = zoomGroup;
  },

  _createZoomIn: function(instance) {
    var zoomIn = document.createElementNS(SvgUtils.svgNS, "g");
    zoomIn.setAttribute("id", "svg-pan-zoom-zoom-in");
    zoomIn.setAttribute("transform", "translate(30.5 5) scale(0.015)");
    zoomIn.setAttribute("class", "svg-pan-zoom-control");
    zoomIn.addEventListener(
      "click",
      function() {
        instance.getPublicInstance().zoomIn();
      },
      false
    );
    zoomIn.addEventListener(
      "touchstart",
      function() {
        instance.getPublicInstance().zoomIn();
      },
      false
    );

    var zoomInBackground = document.createElementNS(SvgUtils.svgNS, "rect"); // TODO change these background space fillers to rounded rectangles so they look prettier
    zoomInBackground.setAttribute("x", "0");
    zoomInBackground.setAttribute("y", "0");
    zoomInBackground.setAttribute("width", "1500"); // larger than expected because the whole group is transformed to scale down
    zoomInBackground.setAttribute("height", "1400");
    zoomInBackground.setAttribute("class", "svg-pan-zoom-control-background");
    zoomIn.appendChild(zoomInBackground);

    var zoomInShape = document.createElementNS(SvgUtils.svgNS, "path");
    zoomInShape.setAttribute(
      "d",
      "M1280 576v128q0 26 -19 45t-45 19h-320v320q0 26 -19 45t-45 19h-128q-26 0 -45 -19t-19 -45v-320h-320q-26 0 -45 -19t-19 -45v-128q0 -26 19 -45t45 -19h320v-320q0 -26 19 -45t45 -19h128q26 0 45 19t19 45v320h320q26 0 45 19t19 45zM1536 1120v-960 q0 -119 -84.5 -203.5t-203.5 -84.5h-960q-119 0 -203.5 84.5t-84.5 203.5v960q0 119 84.5 203.5t203.5 84.5h960q119 0 203.5 -84.5t84.5 -203.5z"
    );
    zoomInShape.setAttribute("class", "svg-pan-zoom-control-element");
    zoomIn.appendChild(zoomInShape);

    return zoomIn;
  },

  _createZoomReset: function(instance) {
    // reset
    var resetPanZoomControl = document.createElementNS(SvgUtils.svgNS, "g");
    resetPanZoomControl.setAttribute("id", "svg-pan-zoom-reset-pan-zoom");
    resetPanZoomControl.setAttribute("transform", "translate(5 35) scale(0.4)");
    resetPanZoomControl.setAttribute("class", "svg-pan-zoom-control");
    resetPanZoomControl.addEventListener(
      "click",
      function() {
        instance.getPublicInstance().reset();
      },
      false
    );
    resetPanZoomControl.addEventListener(
      "touchstart",
      function() {
        instance.getPublicInstance().reset();
      },
      false
    );

    var resetPanZoomControlBackground = document.createElementNS(
      SvgUtils.svgNS,
      "rect"
    ); // TODO change these background space fillers to rounded rectangles so they look prettier
    resetPanZoomControlBackground.setAttribute("x", "2");
    resetPanZoomControlBackground.setAttribute("y", "2");
    resetPanZoomControlBackground.setAttribute("width", "182"); // larger than expected because the whole group is transformed to scale down
    resetPanZoomControlBackground.setAttribute("height", "58");
    resetPanZoomControlBackground.setAttribute(
      "class",
      "svg-pan-zoom-control-background"
    );
    resetPanZoomControl.appendChild(resetPanZoomControlBackground);

    var resetPanZoomControlShape1 = document.createElementNS(
      SvgUtils.svgNS,
      "path"
    );
    resetPanZoomControlShape1.setAttribute(
      "d",
      "M33.051,20.632c-0.742-0.406-1.854-0.609-3.338-0.609h-7.969v9.281h7.769c1.543,0,2.701-0.188,3.473-0.562c1.365-0.656,2.048-1.953,2.048-3.891C35.032,22.757,34.372,21.351,33.051,20.632z"
    );
    resetPanZoomControlShape1.setAttribute(
      "class",
      "svg-pan-zoom-control-element"
    );
    resetPanZoomControl.appendChild(resetPanZoomControlShape1);

    var resetPanZoomControlShape2 = document.createElementNS(
      SvgUtils.svgNS,
      "path"
    );
    resetPanZoomControlShape2.setAttribute(
      "d",
      "M170.231,0.5H15.847C7.102,0.5,0.5,5.708,0.5,11.84v38.861C0.5,56.833,7.102,61.5,15.847,61.5h154.384c8.745,0,15.269-4.667,15.269-10.798V11.84C185.5,5.708,178.976,0.5,170.231,0.5z M42.837,48.569h-7.969c-0.219-0.766-0.375-1.383-0.469-1.852c-0.188-0.969-0.289-1.961-0.305-2.977l-0.047-3.211c-0.03-2.203-0.41-3.672-1.142-4.406c-0.732-0.734-2.103-1.102-4.113-1.102h-7.05v13.547h-7.055V14.022h16.524c2.361,0.047,4.178,0.344,5.45,0.891c1.272,0.547,2.351,1.352,3.234,2.414c0.731,0.875,1.31,1.844,1.737,2.906s0.64,2.273,0.64,3.633c0,1.641-0.414,3.254-1.242,4.84s-2.195,2.707-4.102,3.363c1.594,0.641,2.723,1.551,3.387,2.73s0.996,2.98,0.996,5.402v2.32c0,1.578,0.063,2.648,0.19,3.211c0.19,0.891,0.635,1.547,1.333,1.969V48.569z M75.579,48.569h-26.18V14.022h25.336v6.117H56.454v7.336h16.781v6H56.454v8.883h19.125V48.569z M104.497,46.331c-2.44,2.086-5.887,3.129-10.34,3.129c-4.548,0-8.125-1.027-10.731-3.082s-3.909-4.879-3.909-8.473h6.891c0.224,1.578,0.662,2.758,1.316,3.539c1.196,1.422,3.246,2.133,6.15,2.133c1.739,0,3.151-0.188,4.236-0.562c2.058-0.719,3.087-2.055,3.087-4.008c0-1.141-0.504-2.023-1.512-2.648c-1.008-0.609-2.607-1.148-4.796-1.617l-3.74-0.82c-3.676-0.812-6.201-1.695-7.576-2.648c-2.328-1.594-3.492-4.086-3.492-7.477c0-3.094,1.139-5.664,3.417-7.711s5.623-3.07,10.036-3.07c3.685,0,6.829,0.965,9.431,2.895c2.602,1.93,3.966,4.73,4.093,8.402h-6.938c-0.128-2.078-1.057-3.555-2.787-4.43c-1.154-0.578-2.587-0.867-4.301-0.867c-1.907,0-3.428,0.375-4.565,1.125c-1.138,0.75-1.706,1.797-1.706,3.141c0,1.234,0.561,2.156,1.682,2.766c0.721,0.406,2.25,0.883,4.589,1.43l6.063,1.43c2.657,0.625,4.648,1.461,5.975,2.508c2.059,1.625,3.089,3.977,3.089,7.055C108.157,41.624,106.937,44.245,104.497,46.331z M139.61,48.569h-26.18V14.022h25.336v6.117h-18.281v7.336h16.781v6h-16.781v8.883h19.125V48.569z M170.337,20.14h-10.336v28.43h-7.266V20.14h-10.383v-6.117h27.984V20.14z"
    );
    resetPanZoomControlShape2.setAttribute(
      "class",
      "svg-pan-zoom-control-element"
    );
    resetPanZoomControl.appendChild(resetPanZoomControlShape2);

    return resetPanZoomControl;
  },

  _createZoomOut: function(instance) {
    // zoom out
    var zoomOut = document.createElementNS(SvgUtils.svgNS, "g");
    zoomOut.setAttribute("id", "svg-pan-zoom-zoom-out");
    zoomOut.setAttribute("transform", "translate(30.5 70) scale(0.015)");
    zoomOut.setAttribute("class", "svg-pan-zoom-control");
    zoomOut.addEventListener(
      "click",
      function() {
        instance.getPublicInstance().zoomOut();
      },
      false
    );
    zoomOut.addEventListener(
      "touchstart",
      function() {
        instance.getPublicInstance().zoomOut();
      },
      false
    );

    var zoomOutBackground = document.createElementNS(SvgUtils.svgNS, "rect"); // TODO change these background space fillers to rounded rectangles so they look prettier
    zoomOutBackground.setAttribute("x", "0");
    zoomOutBackground.setAttribute("y", "0");
    zoomOutBackground.setAttribute("width", "1500"); // larger than expected because the whole group is transformed to scale down
    zoomOutBackground.setAttribute("height", "1400");
    zoomOutBackground.setAttribute("class", "svg-pan-zoom-control-background");
    zoomOut.appendChild(zoomOutBackground);

    var zoomOutShape = document.createElementNS(SvgUtils.svgNS, "path");
    zoomOutShape.setAttribute(
      "d",
      "M1280 576v128q0 26 -19 45t-45 19h-896q-26 0 -45 -19t-19 -45v-128q0 -26 19 -45t45 -19h896q26 0 45 19t19 45zM1536 1120v-960q0 -119 -84.5 -203.5t-203.5 -84.5h-960q-119 0 -203.5 84.5t-84.5 203.5v960q0 119 84.5 203.5t203.5 84.5h960q119 0 203.5 -84.5 t84.5 -203.5z"
    );
    zoomOutShape.setAttribute("class", "svg-pan-zoom-control-element");
    zoomOut.appendChild(zoomOutShape);

    return zoomOut;
  },

  disable: function(instance) {
    if (instance.controlIcons) {
      instance.controlIcons.parentNode.removeChild(instance.controlIcons);
      instance.controlIcons = null;
    }
  }
};


/***/ }),

/***/ "./node_modules/svg-pan-zoom/src/shadow-viewport.js":
/*!**********************************************************!*\
  !*** ./node_modules/svg-pan-zoom/src/shadow-viewport.js ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var SvgUtils = __webpack_require__(/*! ./svg-utilities */ "./node_modules/svg-pan-zoom/src/svg-utilities.js"),
  Utils = __webpack_require__(/*! ./utilities */ "./node_modules/svg-pan-zoom/src/utilities.js");

var ShadowViewport = function(viewport, options) {
  this.init(viewport, options);
};

/**
 * Initialization
 *
 * @param  {SVGElement} viewport
 * @param  {Object} options
 */
ShadowViewport.prototype.init = function(viewport, options) {
  // DOM Elements
  this.viewport = viewport;
  this.options = options;

  // State cache
  this.originalState = { zoom: 1, x: 0, y: 0 };
  this.activeState = { zoom: 1, x: 0, y: 0 };

  this.updateCTMCached = Utils.proxy(this.updateCTM, this);

  // Create a custom requestAnimationFrame taking in account refreshRate
  this.requestAnimationFrame = Utils.createRequestAnimationFrame(
    this.options.refreshRate
  );

  // ViewBox
  this.viewBox = { x: 0, y: 0, width: 0, height: 0 };
  this.cacheViewBox();

  // Process CTM
  var newCTM = this.processCTM();

  // Update viewport CTM and cache zoom and pan
  this.setCTM(newCTM);

  // Update CTM in this frame
  this.updateCTM();
};

/**
 * Cache initial viewBox value
 * If no viewBox is defined, then use viewport size/position instead for viewBox values
 */
ShadowViewport.prototype.cacheViewBox = function() {
  var svgViewBox = this.options.svg.getAttribute("viewBox");

  if (svgViewBox) {
    var viewBoxValues = svgViewBox
      .split(/[\s\,]/)
      .filter(function(v) {
        return v;
      })
      .map(parseFloat);

    // Cache viewbox x and y offset
    this.viewBox.x = viewBoxValues[0];
    this.viewBox.y = viewBoxValues[1];
    this.viewBox.width = viewBoxValues[2];
    this.viewBox.height = viewBoxValues[3];

    var zoom = Math.min(
      this.options.width / this.viewBox.width,
      this.options.height / this.viewBox.height
    );

    // Update active state
    this.activeState.zoom = zoom;
    this.activeState.x = (this.options.width - this.viewBox.width * zoom) / 2;
    this.activeState.y = (this.options.height - this.viewBox.height * zoom) / 2;

    // Force updating CTM
    this.updateCTMOnNextFrame();

    this.options.svg.removeAttribute("viewBox");
  } else {
    this.simpleViewBoxCache();
  }
};

/**
 * Recalculate viewport sizes and update viewBox cache
 */
ShadowViewport.prototype.simpleViewBoxCache = function() {
  var bBox = this.viewport.getBBox();

  this.viewBox.x = bBox.x;
  this.viewBox.y = bBox.y;
  this.viewBox.width = bBox.width;
  this.viewBox.height = bBox.height;
};

/**
 * Returns a viewbox object. Safe to alter
 *
 * @return {Object} viewbox object
 */
ShadowViewport.prototype.getViewBox = function() {
  return Utils.extend({}, this.viewBox);
};

/**
 * Get initial zoom and pan values. Save them into originalState
 * Parses viewBox attribute to alter initial sizes
 *
 * @return {CTM} CTM object based on options
 */
ShadowViewport.prototype.processCTM = function() {
  var newCTM = this.getCTM();

  if (this.options.fit || this.options.contain) {
    var newScale;
    if (this.options.fit) {
      newScale = Math.min(
        this.options.width / this.viewBox.width,
        this.options.height / this.viewBox.height
      );
    } else {
      newScale = Math.max(
        this.options.width / this.viewBox.width,
        this.options.height / this.viewBox.height
      );
    }

    newCTM.a = newScale; //x-scale
    newCTM.d = newScale; //y-scale
    newCTM.e = -this.viewBox.x * newScale; //x-transform
    newCTM.f = -this.viewBox.y * newScale; //y-transform
  }

  if (this.options.center) {
    var offsetX =
        (this.options.width -
          (this.viewBox.width + this.viewBox.x * 2) * newCTM.a) *
        0.5,
      offsetY =
        (this.options.height -
          (this.viewBox.height + this.viewBox.y * 2) * newCTM.a) *
        0.5;

    newCTM.e = offsetX;
    newCTM.f = offsetY;
  }

  // Cache initial values. Based on activeState and fix+center opitons
  this.originalState.zoom = newCTM.a;
  this.originalState.x = newCTM.e;
  this.originalState.y = newCTM.f;

  return newCTM;
};

/**
 * Return originalState object. Safe to alter
 *
 * @return {Object}
 */
ShadowViewport.prototype.getOriginalState = function() {
  return Utils.extend({}, this.originalState);
};

/**
 * Return actualState object. Safe to alter
 *
 * @return {Object}
 */
ShadowViewport.prototype.getState = function() {
  return Utils.extend({}, this.activeState);
};

/**
 * Get zoom scale
 *
 * @return {Float} zoom scale
 */
ShadowViewport.prototype.getZoom = function() {
  return this.activeState.zoom;
};

/**
 * Get zoom scale for pubilc usage
 *
 * @return {Float} zoom scale
 */
ShadowViewport.prototype.getRelativeZoom = function() {
  return this.activeState.zoom / this.originalState.zoom;
};

/**
 * Compute zoom scale for pubilc usage
 *
 * @return {Float} zoom scale
 */
ShadowViewport.prototype.computeRelativeZoom = function(scale) {
  return scale / this.originalState.zoom;
};

/**
 * Get pan
 *
 * @return {Object}
 */
ShadowViewport.prototype.getPan = function() {
  return { x: this.activeState.x, y: this.activeState.y };
};

/**
 * Return cached viewport CTM value that can be safely modified
 *
 * @return {SVGMatrix}
 */
ShadowViewport.prototype.getCTM = function() {
  var safeCTM = this.options.svg.createSVGMatrix();

  // Copy values manually as in FF they are not itterable
  safeCTM.a = this.activeState.zoom;
  safeCTM.b = 0;
  safeCTM.c = 0;
  safeCTM.d = this.activeState.zoom;
  safeCTM.e = this.activeState.x;
  safeCTM.f = this.activeState.y;

  return safeCTM;
};

/**
 * Set a new CTM
 *
 * @param {SVGMatrix} newCTM
 */
ShadowViewport.prototype.setCTM = function(newCTM) {
  var willZoom = this.isZoomDifferent(newCTM),
    willPan = this.isPanDifferent(newCTM);

  if (willZoom || willPan) {
    // Before zoom
    if (willZoom) {
      // If returns false then cancel zooming
      if (
        this.options.beforeZoom(
          this.getRelativeZoom(),
          this.computeRelativeZoom(newCTM.a)
        ) === false
      ) {
        newCTM.a = newCTM.d = this.activeState.zoom;
        willZoom = false;
      } else {
        this.updateCache(newCTM);
        this.options.onZoom(this.getRelativeZoom());
      }
    }

    // Before pan
    if (willPan) {
      var preventPan = this.options.beforePan(this.getPan(), {
          x: newCTM.e,
          y: newCTM.f
        }),
        // If prevent pan is an object
        preventPanX = false,
        preventPanY = false;

      // If prevent pan is Boolean false
      if (preventPan === false) {
        // Set x and y same as before
        newCTM.e = this.getPan().x;
        newCTM.f = this.getPan().y;

        preventPanX = preventPanY = true;
      } else if (Utils.isObject(preventPan)) {
        // Check for X axes attribute
        if (preventPan.x === false) {
          // Prevent panning on x axes
          newCTM.e = this.getPan().x;
          preventPanX = true;
        } else if (Utils.isNumber(preventPan.x)) {
          // Set a custom pan value
          newCTM.e = preventPan.x;
        }

        // Check for Y axes attribute
        if (preventPan.y === false) {
          // Prevent panning on x axes
          newCTM.f = this.getPan().y;
          preventPanY = true;
        } else if (Utils.isNumber(preventPan.y)) {
          // Set a custom pan value
          newCTM.f = preventPan.y;
        }
      }

      // Update willPan flag
      // Check if newCTM is still different
      if ((preventPanX && preventPanY) || !this.isPanDifferent(newCTM)) {
        willPan = false;
      } else {
        this.updateCache(newCTM);
        this.options.onPan(this.getPan());
      }
    }

    // Check again if should zoom or pan
    if (willZoom || willPan) {
      this.updateCTMOnNextFrame();
    }
  }
};

ShadowViewport.prototype.isZoomDifferent = function(newCTM) {
  return this.activeState.zoom !== newCTM.a;
};

ShadowViewport.prototype.isPanDifferent = function(newCTM) {
  return this.activeState.x !== newCTM.e || this.activeState.y !== newCTM.f;
};

/**
 * Update cached CTM and active state
 *
 * @param {SVGMatrix} newCTM
 */
ShadowViewport.prototype.updateCache = function(newCTM) {
  this.activeState.zoom = newCTM.a;
  this.activeState.x = newCTM.e;
  this.activeState.y = newCTM.f;
};

ShadowViewport.prototype.pendingUpdate = false;

/**
 * Place a request to update CTM on next Frame
 */
ShadowViewport.prototype.updateCTMOnNextFrame = function() {
  if (!this.pendingUpdate) {
    // Lock
    this.pendingUpdate = true;

    // Throttle next update
    this.requestAnimationFrame.call(window, this.updateCTMCached);
  }
};

/**
 * Update viewport CTM with cached CTM
 */
ShadowViewport.prototype.updateCTM = function() {
  var ctm = this.getCTM();

  // Updates SVG element
  SvgUtils.setCTM(this.viewport, ctm, this.defs);

  // Free the lock
  this.pendingUpdate = false;

  // Notify about the update
  if (this.options.onUpdatedCTM) {
    this.options.onUpdatedCTM(ctm);
  }
};

module.exports = function(viewport, options) {
  return new ShadowViewport(viewport, options);
};


/***/ }),

/***/ "./node_modules/svg-pan-zoom/src/svg-pan-zoom.js":
/*!*******************************************************!*\
  !*** ./node_modules/svg-pan-zoom/src/svg-pan-zoom.js ***!
  \*******************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var Wheel = __webpack_require__(/*! ./uniwheel */ "./node_modules/svg-pan-zoom/src/uniwheel.js"),
  ControlIcons = __webpack_require__(/*! ./control-icons */ "./node_modules/svg-pan-zoom/src/control-icons.js"),
  Utils = __webpack_require__(/*! ./utilities */ "./node_modules/svg-pan-zoom/src/utilities.js"),
  SvgUtils = __webpack_require__(/*! ./svg-utilities */ "./node_modules/svg-pan-zoom/src/svg-utilities.js"),
  ShadowViewport = __webpack_require__(/*! ./shadow-viewport */ "./node_modules/svg-pan-zoom/src/shadow-viewport.js");

var SvgPanZoom = function(svg, options) {
  this.init(svg, options);
};

var optionsDefaults = {
  viewportSelector: ".svg-pan-zoom_viewport", // Viewport selector. Can be querySelector string or SVGElement
  panEnabled: true, // enable or disable panning (default enabled)
  controlIconsEnabled: false, // insert icons to give user an option in addition to mouse events to control pan/zoom (default disabled)
  zoomEnabled: true, // enable or disable zooming (default enabled)
  dblClickZoomEnabled: true, // enable or disable zooming by double clicking (default enabled)
  mouseWheelZoomEnabled: true, // enable or disable zooming by mouse wheel (default enabled)
  preventMouseEventsDefault: true, // enable or disable preventDefault for mouse events
  zoomScaleSensitivity: 0.1, // Zoom sensitivity
  minZoom: 0.5, // Minimum Zoom level
  maxZoom: 10, // Maximum Zoom level
  fit: true, // enable or disable viewport fit in SVG (default true)
  contain: false, // enable or disable viewport contain the svg (default false)
  center: true, // enable or disable viewport centering in SVG (default true)
  refreshRate: "auto", // Maximum number of frames per second (altering SVG's viewport)
  beforeZoom: null,
  onZoom: null,
  beforePan: null,
  onPan: null,
  customEventsHandler: null,
  eventsListenerElement: null,
  onUpdatedCTM: null
};

var passiveListenerOption = { passive: true };

SvgPanZoom.prototype.init = function(svg, options) {
  var that = this;

  this.svg = svg;
  this.defs = svg.querySelector("defs");

  // Add default attributes to SVG
  SvgUtils.setupSvgAttributes(this.svg);

  // Set options
  this.options = Utils.extend(Utils.extend({}, optionsDefaults), options);

  // Set default state
  this.state = "none";

  // Get dimensions
  var boundingClientRectNormalized = SvgUtils.getBoundingClientRectNormalized(
    svg
  );
  this.width = boundingClientRectNormalized.width;
  this.height = boundingClientRectNormalized.height;

  // Init shadow viewport
  this.viewport = ShadowViewport(
    SvgUtils.getOrCreateViewport(this.svg, this.options.viewportSelector),
    {
      svg: this.svg,
      width: this.width,
      height: this.height,
      fit: this.options.fit,
      contain: this.options.contain,
      center: this.options.center,
      refreshRate: this.options.refreshRate,
      // Put callbacks into functions as they can change through time
      beforeZoom: function(oldScale, newScale) {
        if (that.viewport && that.options.beforeZoom) {
          return that.options.beforeZoom(oldScale, newScale);
        }
      },
      onZoom: function(scale) {
        if (that.viewport && that.options.onZoom) {
          return that.options.onZoom(scale);
        }
      },
      beforePan: function(oldPoint, newPoint) {
        if (that.viewport && that.options.beforePan) {
          return that.options.beforePan(oldPoint, newPoint);
        }
      },
      onPan: function(point) {
        if (that.viewport && that.options.onPan) {
          return that.options.onPan(point);
        }
      },
      onUpdatedCTM: function(ctm) {
        if (that.viewport && that.options.onUpdatedCTM) {
          return that.options.onUpdatedCTM(ctm);
        }
      }
    }
  );

  // Wrap callbacks into public API context
  var publicInstance = this.getPublicInstance();
  publicInstance.setBeforeZoom(this.options.beforeZoom);
  publicInstance.setOnZoom(this.options.onZoom);
  publicInstance.setBeforePan(this.options.beforePan);
  publicInstance.setOnPan(this.options.onPan);
  publicInstance.setOnUpdatedCTM(this.options.onUpdatedCTM);

  if (this.options.controlIconsEnabled) {
    ControlIcons.enable(this);
  }

  // Init events handlers
  this.lastMouseWheelEventTime = Date.now();
  this.setupHandlers();
};

/**
 * Register event handlers
 */
SvgPanZoom.prototype.setupHandlers = function() {
  var that = this,
    prevEvt = null; // use for touchstart event to detect double tap

  this.eventListeners = {
    // Mouse down group
    mousedown: function(evt) {
      var result = that.handleMouseDown(evt, prevEvt);
      prevEvt = evt;
      return result;
    },
    touchstart: function(evt) {
      var result = that.handleMouseDown(evt, prevEvt);
      prevEvt = evt;
      return result;
    },

    // Mouse up group
    mouseup: function(evt) {
      return that.handleMouseUp(evt);
    },
    touchend: function(evt) {
      return that.handleMouseUp(evt);
    },

    // Mouse move group
    mousemove: function(evt) {
      return that.handleMouseMove(evt);
    },
    touchmove: function(evt) {
      return that.handleMouseMove(evt);
    },

    // Mouse leave group
    mouseleave: function(evt) {
      return that.handleMouseUp(evt);
    },
    touchleave: function(evt) {
      return that.handleMouseUp(evt);
    },
    touchcancel: function(evt) {
      return that.handleMouseUp(evt);
    }
  };

  // Init custom events handler if available
  // eslint-disable-next-line eqeqeq
  if (this.options.customEventsHandler != null) {
    this.options.customEventsHandler.init({
      svgElement: this.svg,
      eventsListenerElement: this.options.eventsListenerElement,
      instance: this.getPublicInstance()
    });

    // Custom event handler may halt builtin listeners
    var haltEventListeners = this.options.customEventsHandler
      .haltEventListeners;
    if (haltEventListeners && haltEventListeners.length) {
      for (var i = haltEventListeners.length - 1; i >= 0; i--) {
        if (this.eventListeners.hasOwnProperty(haltEventListeners[i])) {
          delete this.eventListeners[haltEventListeners[i]];
        }
      }
    }
  }

  // Bind eventListeners
  for (var event in this.eventListeners) {
    // Attach event to eventsListenerElement or SVG if not available
    (this.options.eventsListenerElement || this.svg).addEventListener(
      event,
      this.eventListeners[event],
      !this.options.preventMouseEventsDefault ? passiveListenerOption : false
    );
  }

  // Zoom using mouse wheel
  if (this.options.mouseWheelZoomEnabled) {
    this.options.mouseWheelZoomEnabled = false; // set to false as enable will set it back to true
    this.enableMouseWheelZoom();
  }
};

/**
 * Enable ability to zoom using mouse wheel
 */
SvgPanZoom.prototype.enableMouseWheelZoom = function() {
  if (!this.options.mouseWheelZoomEnabled) {
    var that = this;

    // Mouse wheel listener
    this.wheelListener = function(evt) {
      return that.handleMouseWheel(evt);
    };

    // Bind wheelListener
    var isPassiveListener = !this.options.preventMouseEventsDefault;
    Wheel.on(
      this.options.eventsListenerElement || this.svg,
      this.wheelListener,
      isPassiveListener
    );

    this.options.mouseWheelZoomEnabled = true;
  }
};

/**
 * Disable ability to zoom using mouse wheel
 */
SvgPanZoom.prototype.disableMouseWheelZoom = function() {
  if (this.options.mouseWheelZoomEnabled) {
    var isPassiveListener = !this.options.preventMouseEventsDefault;
    Wheel.off(
      this.options.eventsListenerElement || this.svg,
      this.wheelListener,
      isPassiveListener
    );
    this.options.mouseWheelZoomEnabled = false;
  }
};

/**
 * Handle mouse wheel event
 *
 * @param  {Event} evt
 */
SvgPanZoom.prototype.handleMouseWheel = function(evt) {
  if (!this.options.zoomEnabled || this.state !== "none") {
    return;
  }

  if (this.options.preventMouseEventsDefault) {
    if (evt.preventDefault) {
      evt.preventDefault();
    } else {
      evt.returnValue = false;
    }
  }

  // Default delta in case that deltaY is not available
  var delta = evt.deltaY || 1,
    timeDelta = Date.now() - this.lastMouseWheelEventTime,
    divider = 3 + Math.max(0, 30 - timeDelta);

  // Update cache
  this.lastMouseWheelEventTime = Date.now();

  // Make empirical adjustments for browsers that give deltaY in pixels (deltaMode=0)
  if ("deltaMode" in evt && evt.deltaMode === 0 && evt.wheelDelta) {
    delta = evt.deltaY === 0 ? 0 : Math.abs(evt.wheelDelta) / evt.deltaY;
  }

  delta =
    -0.3 < delta && delta < 0.3
      ? delta
      : ((delta > 0 ? 1 : -1) * Math.log(Math.abs(delta) + 10)) / divider;

  var inversedScreenCTM = this.svg.getScreenCTM().inverse(),
    relativeMousePoint = SvgUtils.getEventPoint(evt, this.svg).matrixTransform(
      inversedScreenCTM
    ),
    zoom = Math.pow(1 + this.options.zoomScaleSensitivity, -1 * delta); // multiplying by neg. 1 so as to make zoom in/out behavior match Google maps behavior

  this.zoomAtPoint(zoom, relativeMousePoint);
};

/**
 * Zoom in at a SVG point
 *
 * @param  {SVGPoint} point
 * @param  {Float} zoomScale    Number representing how much to zoom
 * @param  {Boolean} zoomAbsolute Default false. If true, zoomScale is treated as an absolute value.
 *                                Otherwise, zoomScale is treated as a multiplied (e.g. 1.10 would zoom in 10%)
 */
SvgPanZoom.prototype.zoomAtPoint = function(zoomScale, point, zoomAbsolute) {
  var originalState = this.viewport.getOriginalState();

  if (!zoomAbsolute) {
    // Fit zoomScale in set bounds
    if (
      this.getZoom() * zoomScale <
      this.options.minZoom * originalState.zoom
    ) {
      zoomScale = (this.options.minZoom * originalState.zoom) / this.getZoom();
    } else if (
      this.getZoom() * zoomScale >
      this.options.maxZoom * originalState.zoom
    ) {
      zoomScale = (this.options.maxZoom * originalState.zoom) / this.getZoom();
    }
  } else {
    // Fit zoomScale in set bounds
    zoomScale = Math.max(
      this.options.minZoom * originalState.zoom,
      Math.min(this.options.maxZoom * originalState.zoom, zoomScale)
    );
    // Find relative scale to achieve desired scale
    zoomScale = zoomScale / this.getZoom();
  }

  var oldCTM = this.viewport.getCTM(),
    relativePoint = point.matrixTransform(oldCTM.inverse()),
    modifier = this.svg
      .createSVGMatrix()
      .translate(relativePoint.x, relativePoint.y)
      .scale(zoomScale)
      .translate(-relativePoint.x, -relativePoint.y),
    newCTM = oldCTM.multiply(modifier);

  if (newCTM.a !== oldCTM.a) {
    this.viewport.setCTM(newCTM);
  }
};

/**
 * Zoom at center point
 *
 * @param  {Float} scale
 * @param  {Boolean} absolute Marks zoom scale as relative or absolute
 */
SvgPanZoom.prototype.zoom = function(scale, absolute) {
  this.zoomAtPoint(
    scale,
    SvgUtils.getSvgCenterPoint(this.svg, this.width, this.height),
    absolute
  );
};

/**
 * Zoom used by public instance
 *
 * @param  {Float} scale
 * @param  {Boolean} absolute Marks zoom scale as relative or absolute
 */
SvgPanZoom.prototype.publicZoom = function(scale, absolute) {
  if (absolute) {
    scale = this.computeFromRelativeZoom(scale);
  }

  this.zoom(scale, absolute);
};

/**
 * Zoom at point used by public instance
 *
 * @param  {Float} scale
 * @param  {SVGPoint|Object} point    An object that has x and y attributes
 * @param  {Boolean} absolute Marks zoom scale as relative or absolute
 */
SvgPanZoom.prototype.publicZoomAtPoint = function(scale, point, absolute) {
  if (absolute) {
    // Transform zoom into a relative value
    scale = this.computeFromRelativeZoom(scale);
  }

  // If not a SVGPoint but has x and y then create a SVGPoint
  if (Utils.getType(point) !== "SVGPoint") {
    if ("x" in point && "y" in point) {
      point = SvgUtils.createSVGPoint(this.svg, point.x, point.y);
    } else {
      throw new Error("Given point is invalid");
    }
  }

  this.zoomAtPoint(scale, point, absolute);
};

/**
 * Get zoom scale
 *
 * @return {Float} zoom scale
 */
SvgPanZoom.prototype.getZoom = function() {
  return this.viewport.getZoom();
};

/**
 * Get zoom scale for public usage
 *
 * @return {Float} zoom scale
 */
SvgPanZoom.prototype.getRelativeZoom = function() {
  return this.viewport.getRelativeZoom();
};

/**
 * Compute actual zoom from public zoom
 *
 * @param  {Float} zoom
 * @return {Float} zoom scale
 */
SvgPanZoom.prototype.computeFromRelativeZoom = function(zoom) {
  return zoom * this.viewport.getOriginalState().zoom;
};

/**
 * Set zoom to initial state
 */
SvgPanZoom.prototype.resetZoom = function() {
  var originalState = this.viewport.getOriginalState();

  this.zoom(originalState.zoom, true);
};

/**
 * Set pan to initial state
 */
SvgPanZoom.prototype.resetPan = function() {
  this.pan(this.viewport.getOriginalState());
};

/**
 * Set pan and zoom to initial state
 */
SvgPanZoom.prototype.reset = function() {
  this.resetZoom();
  this.resetPan();
};

/**
 * Handle double click event
 * See handleMouseDown() for alternate detection method
 *
 * @param {Event} evt
 */
SvgPanZoom.prototype.handleDblClick = function(evt) {
  if (this.options.preventMouseEventsDefault) {
    if (evt.preventDefault) {
      evt.preventDefault();
    } else {
      evt.returnValue = false;
    }
  }

  // Check if target was a control button
  if (this.options.controlIconsEnabled) {
    var targetClass = evt.target.getAttribute("class") || "";
    if (targetClass.indexOf("svg-pan-zoom-control") > -1) {
      return false;
    }
  }

  var zoomFactor;

  if (evt.shiftKey) {
    zoomFactor = 1 / ((1 + this.options.zoomScaleSensitivity) * 2); // zoom out when shift key pressed
  } else {
    zoomFactor = (1 + this.options.zoomScaleSensitivity) * 2;
  }

  var point = SvgUtils.getEventPoint(evt, this.svg).matrixTransform(
    this.svg.getScreenCTM().inverse()
  );
  this.zoomAtPoint(zoomFactor, point);
};

/**
 * Handle click event
 *
 * @param {Event} evt
 */
SvgPanZoom.prototype.handleMouseDown = function(evt, prevEvt) {
  if (this.options.preventMouseEventsDefault) {
    if (evt.preventDefault) {
      evt.preventDefault();
    } else {
      evt.returnValue = false;
    }
  }

  Utils.mouseAndTouchNormalize(evt, this.svg);

  // Double click detection; more consistent than ondblclick
  if (this.options.dblClickZoomEnabled && Utils.isDblClick(evt, prevEvt)) {
    this.handleDblClick(evt);
  } else {
    // Pan mode
    this.state = "pan";
    this.firstEventCTM = this.viewport.getCTM();
    this.stateOrigin = SvgUtils.getEventPoint(evt, this.svg).matrixTransform(
      this.firstEventCTM.inverse()
    );
  }
};

/**
 * Handle mouse move event
 *
 * @param  {Event} evt
 */
SvgPanZoom.prototype.handleMouseMove = function(evt) {
  if (this.options.preventMouseEventsDefault) {
    if (evt.preventDefault) {
      evt.preventDefault();
    } else {
      evt.returnValue = false;
    }
  }

  if (this.state === "pan" && this.options.panEnabled) {
    // Pan mode
    var point = SvgUtils.getEventPoint(evt, this.svg).matrixTransform(
        this.firstEventCTM.inverse()
      ),
      viewportCTM = this.firstEventCTM.translate(
        point.x - this.stateOrigin.x,
        point.y - this.stateOrigin.y
      );

    this.viewport.setCTM(viewportCTM);
  }
};

/**
 * Handle mouse button release event
 *
 * @param {Event} evt
 */
SvgPanZoom.prototype.handleMouseUp = function(evt) {
  if (this.options.preventMouseEventsDefault) {
    if (evt.preventDefault) {
      evt.preventDefault();
    } else {
      evt.returnValue = false;
    }
  }

  if (this.state === "pan") {
    // Quit pan mode
    this.state = "none";
  }
};

/**
 * Adjust viewport size (only) so it will fit in SVG
 * Does not center image
 */
SvgPanZoom.prototype.fit = function() {
  var viewBox = this.viewport.getViewBox(),
    newScale = Math.min(
      this.width / viewBox.width,
      this.height / viewBox.height
    );

  this.zoom(newScale, true);
};

/**
 * Adjust viewport size (only) so it will contain the SVG
 * Does not center image
 */
SvgPanZoom.prototype.contain = function() {
  var viewBox = this.viewport.getViewBox(),
    newScale = Math.max(
      this.width / viewBox.width,
      this.height / viewBox.height
    );

  this.zoom(newScale, true);
};

/**
 * Adjust viewport pan (only) so it will be centered in SVG
 * Does not zoom/fit/contain image
 */
SvgPanZoom.prototype.center = function() {
  var viewBox = this.viewport.getViewBox(),
    offsetX =
      (this.width - (viewBox.width + viewBox.x * 2) * this.getZoom()) * 0.5,
    offsetY =
      (this.height - (viewBox.height + viewBox.y * 2) * this.getZoom()) * 0.5;

  this.getPublicInstance().pan({ x: offsetX, y: offsetY });
};

/**
 * Update content cached BorderBox
 * Use when viewport contents change
 */
SvgPanZoom.prototype.updateBBox = function() {
  this.viewport.simpleViewBoxCache();
};

/**
 * Pan to a rendered position
 *
 * @param  {Object} point {x: 0, y: 0}
 */
SvgPanZoom.prototype.pan = function(point) {
  var viewportCTM = this.viewport.getCTM();
  viewportCTM.e = point.x;
  viewportCTM.f = point.y;
  this.viewport.setCTM(viewportCTM);
};

/**
 * Relatively pan the graph by a specified rendered position vector
 *
 * @param  {Object} point {x: 0, y: 0}
 */
SvgPanZoom.prototype.panBy = function(point) {
  var viewportCTM = this.viewport.getCTM();
  viewportCTM.e += point.x;
  viewportCTM.f += point.y;
  this.viewport.setCTM(viewportCTM);
};

/**
 * Get pan vector
 *
 * @return {Object} {x: 0, y: 0}
 */
SvgPanZoom.prototype.getPan = function() {
  var state = this.viewport.getState();

  return { x: state.x, y: state.y };
};

/**
 * Recalculates cached svg dimensions and controls position
 */
SvgPanZoom.prototype.resize = function() {
  // Get dimensions
  var boundingClientRectNormalized = SvgUtils.getBoundingClientRectNormalized(
    this.svg
  );
  this.width = boundingClientRectNormalized.width;
  this.height = boundingClientRectNormalized.height;

  // Recalculate original state
  var viewport = this.viewport;
  viewport.options.width = this.width;
  viewport.options.height = this.height;
  viewport.processCTM();

  // Reposition control icons by re-enabling them
  if (this.options.controlIconsEnabled) {
    this.getPublicInstance().disableControlIcons();
    this.getPublicInstance().enableControlIcons();
  }
};

/**
 * Unbind mouse events, free callbacks and destroy public instance
 */
SvgPanZoom.prototype.destroy = function() {
  var that = this;

  // Free callbacks
  this.beforeZoom = null;
  this.onZoom = null;
  this.beforePan = null;
  this.onPan = null;
  this.onUpdatedCTM = null;

  // Destroy custom event handlers
  // eslint-disable-next-line eqeqeq
  if (this.options.customEventsHandler != null) {
    this.options.customEventsHandler.destroy({
      svgElement: this.svg,
      eventsListenerElement: this.options.eventsListenerElement,
      instance: this.getPublicInstance()
    });
  }

  // Unbind eventListeners
  for (var event in this.eventListeners) {
    (this.options.eventsListenerElement || this.svg).removeEventListener(
      event,
      this.eventListeners[event],
      !this.options.preventMouseEventsDefault ? passiveListenerOption : false
    );
  }

  // Unbind wheelListener
  this.disableMouseWheelZoom();

  // Remove control icons
  this.getPublicInstance().disableControlIcons();

  // Reset zoom and pan
  this.reset();

  // Remove instance from instancesStore
  instancesStore = instancesStore.filter(function(instance) {
    return instance.svg !== that.svg;
  });

  // Delete options and its contents
  delete this.options;

  // Delete viewport to make public shadow viewport functions uncallable
  delete this.viewport;

  // Destroy public instance and rewrite getPublicInstance
  delete this.publicInstance;
  delete this.pi;
  this.getPublicInstance = function() {
    return null;
  };
};

/**
 * Returns a public instance object
 *
 * @return {Object} Public instance object
 */
SvgPanZoom.prototype.getPublicInstance = function() {
  var that = this;

  // Create cache
  if (!this.publicInstance) {
    this.publicInstance = this.pi = {
      // Pan
      enablePan: function() {
        that.options.panEnabled = true;
        return that.pi;
      },
      disablePan: function() {
        that.options.panEnabled = false;
        return that.pi;
      },
      isPanEnabled: function() {
        return !!that.options.panEnabled;
      },
      pan: function(point) {
        that.pan(point);
        return that.pi;
      },
      panBy: function(point) {
        that.panBy(point);
        return that.pi;
      },
      getPan: function() {
        return that.getPan();
      },
      // Pan event
      setBeforePan: function(fn) {
        that.options.beforePan =
          fn === null ? null : Utils.proxy(fn, that.publicInstance);
        return that.pi;
      },
      setOnPan: function(fn) {
        that.options.onPan =
          fn === null ? null : Utils.proxy(fn, that.publicInstance);
        return that.pi;
      },
      // Zoom and Control Icons
      enableZoom: function() {
        that.options.zoomEnabled = true;
        return that.pi;
      },
      disableZoom: function() {
        that.options.zoomEnabled = false;
        return that.pi;
      },
      isZoomEnabled: function() {
        return !!that.options.zoomEnabled;
      },
      enableControlIcons: function() {
        if (!that.options.controlIconsEnabled) {
          that.options.controlIconsEnabled = true;
          ControlIcons.enable(that);
        }
        return that.pi;
      },
      disableControlIcons: function() {
        if (that.options.controlIconsEnabled) {
          that.options.controlIconsEnabled = false;
          ControlIcons.disable(that);
        }
        return that.pi;
      },
      isControlIconsEnabled: function() {
        return !!that.options.controlIconsEnabled;
      },
      // Double click zoom
      enableDblClickZoom: function() {
        that.options.dblClickZoomEnabled = true;
        return that.pi;
      },
      disableDblClickZoom: function() {
        that.options.dblClickZoomEnabled = false;
        return that.pi;
      },
      isDblClickZoomEnabled: function() {
        return !!that.options.dblClickZoomEnabled;
      },
      // Mouse wheel zoom
      enableMouseWheelZoom: function() {
        that.enableMouseWheelZoom();
        return that.pi;
      },
      disableMouseWheelZoom: function() {
        that.disableMouseWheelZoom();
        return that.pi;
      },
      isMouseWheelZoomEnabled: function() {
        return !!that.options.mouseWheelZoomEnabled;
      },
      // Zoom scale and bounds
      setZoomScaleSensitivity: function(scale) {
        that.options.zoomScaleSensitivity = scale;
        return that.pi;
      },
      setMinZoom: function(zoom) {
        that.options.minZoom = zoom;
        return that.pi;
      },
      setMaxZoom: function(zoom) {
        that.options.maxZoom = zoom;
        return that.pi;
      },
      // Zoom event
      setBeforeZoom: function(fn) {
        that.options.beforeZoom =
          fn === null ? null : Utils.proxy(fn, that.publicInstance);
        return that.pi;
      },
      setOnZoom: function(fn) {
        that.options.onZoom =
          fn === null ? null : Utils.proxy(fn, that.publicInstance);
        return that.pi;
      },
      // Zooming
      zoom: function(scale) {
        that.publicZoom(scale, true);
        return that.pi;
      },
      zoomBy: function(scale) {
        that.publicZoom(scale, false);
        return that.pi;
      },
      zoomAtPoint: function(scale, point) {
        that.publicZoomAtPoint(scale, point, true);
        return that.pi;
      },
      zoomAtPointBy: function(scale, point) {
        that.publicZoomAtPoint(scale, point, false);
        return that.pi;
      },
      zoomIn: function() {
        this.zoomBy(1 + that.options.zoomScaleSensitivity);
        return that.pi;
      },
      zoomOut: function() {
        this.zoomBy(1 / (1 + that.options.zoomScaleSensitivity));
        return that.pi;
      },
      getZoom: function() {
        return that.getRelativeZoom();
      },
      // CTM update
      setOnUpdatedCTM: function(fn) {
        that.options.onUpdatedCTM =
          fn === null ? null : Utils.proxy(fn, that.publicInstance);
        return that.pi;
      },
      // Reset
      resetZoom: function() {
        that.resetZoom();
        return that.pi;
      },
      resetPan: function() {
        that.resetPan();
        return that.pi;
      },
      reset: function() {
        that.reset();
        return that.pi;
      },
      // Fit, Contain and Center
      fit: function() {
        that.fit();
        return that.pi;
      },
      contain: function() {
        that.contain();
        return that.pi;
      },
      center: function() {
        that.center();
        return that.pi;
      },
      // Size and Resize
      updateBBox: function() {
        that.updateBBox();
        return that.pi;
      },
      resize: function() {
        that.resize();
        return that.pi;
      },
      getSizes: function() {
        return {
          width: that.width,
          height: that.height,
          realZoom: that.getZoom(),
          viewBox: that.viewport.getViewBox()
        };
      },
      // Destroy
      destroy: function() {
        that.destroy();
        return that.pi;
      }
    };
  }

  return this.publicInstance;
};

/**
 * Stores pairs of instances of SvgPanZoom and SVG
 * Each pair is represented by an object {svg: SVGSVGElement, instance: SvgPanZoom}
 *
 * @type {Array}
 */
var instancesStore = [];

var svgPanZoom = function(elementOrSelector, options) {
  var svg = Utils.getSvg(elementOrSelector);

  if (svg === null) {
    return null;
  } else {
    // Look for existent instance
    for (var i = instancesStore.length - 1; i >= 0; i--) {
      if (instancesStore[i].svg === svg) {
        return instancesStore[i].instance.getPublicInstance();
      }
    }

    // If instance not found - create one
    instancesStore.push({
      svg: svg,
      instance: new SvgPanZoom(svg, options)
    });

    // Return just pushed instance
    return instancesStore[
      instancesStore.length - 1
    ].instance.getPublicInstance();
  }
};

module.exports = svgPanZoom;


/***/ }),

/***/ "./node_modules/svg-pan-zoom/src/svg-utilities.js":
/*!********************************************************!*\
  !*** ./node_modules/svg-pan-zoom/src/svg-utilities.js ***!
  \********************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var Utils = __webpack_require__(/*! ./utilities */ "./node_modules/svg-pan-zoom/src/utilities.js"),
  _browser = "unknown";

// http://stackoverflow.com/questions/9847580/how-to-detect-safari-chrome-ie-firefox-and-opera-browser
if (/*@cc_on!@*/  false || !!document.documentMode) {
  // internet explorer
  _browser = "ie";
}

module.exports = {
  svgNS: "http://www.w3.org/2000/svg",
  xmlNS: "http://www.w3.org/XML/1998/namespace",
  xmlnsNS: "http://www.w3.org/2000/xmlns/",
  xlinkNS: "http://www.w3.org/1999/xlink",
  evNS: "http://www.w3.org/2001/xml-events",

  /**
   * Get svg dimensions: width and height
   *
   * @param  {SVGSVGElement} svg
   * @return {Object}     {width: 0, height: 0}
   */
  getBoundingClientRectNormalized: function(svg) {
    if (svg.clientWidth && svg.clientHeight) {
      return { width: svg.clientWidth, height: svg.clientHeight };
    } else if (!!svg.getBoundingClientRect()) {
      return svg.getBoundingClientRect();
    } else {
      throw new Error("Cannot get BoundingClientRect for SVG.");
    }
  },

  /**
   * Gets g element with class of "viewport" or creates it if it doesn't exist
   *
   * @param  {SVGSVGElement} svg
   * @return {SVGElement}     g (group) element
   */
  getOrCreateViewport: function(svg, selector) {
    var viewport = null;

    if (Utils.isElement(selector)) {
      viewport = selector;
    } else {
      viewport = svg.querySelector(selector);
    }

    // Check if there is just one main group in SVG
    if (!viewport) {
      var childNodes = Array.prototype.slice
        .call(svg.childNodes || svg.children)
        .filter(function(el) {
          return el.nodeName !== "defs" && el.nodeName !== "#text";
        });

      // Node name should be SVGGElement and should have no transform attribute
      // Groups with transform are not used as viewport because it involves parsing of all transform possibilities
      if (
        childNodes.length === 1 &&
        childNodes[0].nodeName === "g" &&
        childNodes[0].getAttribute("transform") === null
      ) {
        viewport = childNodes[0];
      }
    }

    // If no favorable group element exists then create one
    if (!viewport) {
      var viewportId =
        "viewport-" + new Date().toISOString().replace(/\D/g, "");
      viewport = document.createElementNS(this.svgNS, "g");
      viewport.setAttribute("id", viewportId);

      // Internet Explorer (all versions?) can't use childNodes, but other browsers prefer (require?) using childNodes
      var svgChildren = svg.childNodes || svg.children;
      if (!!svgChildren && svgChildren.length > 0) {
        for (var i = svgChildren.length; i > 0; i--) {
          // Move everything into viewport except defs
          if (svgChildren[svgChildren.length - i].nodeName !== "defs") {
            viewport.appendChild(svgChildren[svgChildren.length - i]);
          }
        }
      }
      svg.appendChild(viewport);
    }

    // Parse class names
    var classNames = [];
    if (viewport.getAttribute("class")) {
      classNames = viewport.getAttribute("class").split(" ");
    }

    // Set class (if not set already)
    if (!~classNames.indexOf("svg-pan-zoom_viewport")) {
      classNames.push("svg-pan-zoom_viewport");
      viewport.setAttribute("class", classNames.join(" "));
    }

    return viewport;
  },

  /**
   * Set SVG attributes
   *
   * @param  {SVGSVGElement} svg
   */
  setupSvgAttributes: function(svg) {
    // Setting default attributes
    svg.setAttribute("xmlns", this.svgNS);
    svg.setAttributeNS(this.xmlnsNS, "xmlns:xlink", this.xlinkNS);
    svg.setAttributeNS(this.xmlnsNS, "xmlns:ev", this.evNS);

    // Needed for Internet Explorer, otherwise the viewport overflows
    if (svg.parentNode !== null) {
      var style = svg.getAttribute("style") || "";
      if (style.toLowerCase().indexOf("overflow") === -1) {
        svg.setAttribute("style", "overflow: hidden; " + style);
      }
    }
  },

  /**
   * How long Internet Explorer takes to finish updating its display (ms).
   */
  internetExplorerRedisplayInterval: 300,

  /**
   * Forces the browser to redisplay all SVG elements that rely on an
   * element defined in a 'defs' section. It works globally, for every
   * available defs element on the page.
   * The throttling is intentionally global.
   *
   * This is only needed for IE. It is as a hack to make markers (and 'use' elements?)
   * visible after pan/zoom when there are multiple SVGs on the page.
   * See bug report: https://connect.microsoft.com/IE/feedback/details/781964/
   * also see svg-pan-zoom issue: https://github.com/ariutta/svg-pan-zoom/issues/62
   */
  refreshDefsGlobal: Utils.throttle(
    function() {
      var allDefs = document.querySelectorAll("defs");
      var allDefsCount = allDefs.length;
      for (var i = 0; i < allDefsCount; i++) {
        var thisDefs = allDefs[i];
        thisDefs.parentNode.insertBefore(thisDefs, thisDefs);
      }
    },
    this ? this.internetExplorerRedisplayInterval : null
  ),

  /**
   * Sets the current transform matrix of an element
   *
   * @param {SVGElement} element
   * @param {SVGMatrix} matrix  CTM
   * @param {SVGElement} defs
   */
  setCTM: function(element, matrix, defs) {
    var that = this,
      s =
        "matrix(" +
        matrix.a +
        "," +
        matrix.b +
        "," +
        matrix.c +
        "," +
        matrix.d +
        "," +
        matrix.e +
        "," +
        matrix.f +
        ")";

    element.setAttributeNS(null, "transform", s);
    if ("transform" in element.style) {
      element.style.transform = s;
    } else if ("-ms-transform" in element.style) {
      element.style["-ms-transform"] = s;
    } else if ("-webkit-transform" in element.style) {
      element.style["-webkit-transform"] = s;
    }

    // IE has a bug that makes markers disappear on zoom (when the matrix "a" and/or "d" elements change)
    // see http://stackoverflow.com/questions/17654578/svg-marker-does-not-work-in-ie9-10
    // and http://srndolha.wordpress.com/2013/11/25/svg-line-markers-may-disappear-in-internet-explorer-11/
    if (_browser === "ie" && !!defs) {
      // this refresh is intended for redisplaying the SVG during zooming
      defs.parentNode.insertBefore(defs, defs);
      // this refresh is intended for redisplaying the other SVGs on a page when panning a given SVG
      // it is also needed for the given SVG itself, on zoomEnd, if the SVG contains any markers that
      // are located under any other element(s).
      window.setTimeout(function() {
        that.refreshDefsGlobal();
      }, that.internetExplorerRedisplayInterval);
    }
  },

  /**
   * Instantiate an SVGPoint object with given event coordinates
   *
   * @param {Event} evt
   * @param  {SVGSVGElement} svg
   * @return {SVGPoint}     point
   */
  getEventPoint: function(evt, svg) {
    var point = svg.createSVGPoint();

    Utils.mouseAndTouchNormalize(evt, svg);

    point.x = evt.clientX;
    point.y = evt.clientY;

    return point;
  },

  /**
   * Get SVG center point
   *
   * @param  {SVGSVGElement} svg
   * @return {SVGPoint}
   */
  getSvgCenterPoint: function(svg, width, height) {
    return this.createSVGPoint(svg, width / 2, height / 2);
  },

  /**
   * Create a SVGPoint with given x and y
   *
   * @param  {SVGSVGElement} svg
   * @param  {Number} x
   * @param  {Number} y
   * @return {SVGPoint}
   */
  createSVGPoint: function(svg, x, y) {
    var point = svg.createSVGPoint();
    point.x = x;
    point.y = y;

    return point;
  }
};


/***/ }),

/***/ "./node_modules/svg-pan-zoom/src/uniwheel.js":
/*!***************************************************!*\
  !*** ./node_modules/svg-pan-zoom/src/uniwheel.js ***!
  \***************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

// uniwheel 0.1.2 (customized)
// A unified cross browser mouse wheel event handler
// https://github.com/teemualap/uniwheel

module.exports = (function(){

  //Full details: https://developer.mozilla.org/en-US/docs/Web/Reference/Events/wheel

  var prefix = "", _addEventListener, _removeEventListener, support, fns = [];
  var passiveOption = {passive: true};

  // detect event model
  if ( window.addEventListener ) {
    _addEventListener = "addEventListener";
    _removeEventListener = "removeEventListener";
  } else {
    _addEventListener = "attachEvent";
    _removeEventListener = "detachEvent";
    prefix = "on";
  }

  // detect available wheel event
  support = "onwheel" in document.createElement("div") ? "wheel" : // Modern browsers support "wheel"
            document.onmousewheel !== undefined ? "mousewheel" : // Webkit and IE support at least "mousewheel"
            "DOMMouseScroll"; // let's assume that remaining browsers are older Firefox


  function createCallback(element,callback) {

    var fn = function(originalEvent) {

      !originalEvent && ( originalEvent = window.event );

      // create a normalized event object
      var event = {
        // keep a ref to the original event object
        originalEvent: originalEvent,
        target: originalEvent.target || originalEvent.srcElement,
        type: "wheel",
        deltaMode: originalEvent.type == "MozMousePixelScroll" ? 0 : 1,
        deltaX: 0,
        delatZ: 0,
        preventDefault: function() {
          originalEvent.preventDefault ?
            originalEvent.preventDefault() :
            originalEvent.returnValue = false;
        }
      };

      // calculate deltaY (and deltaX) according to the event
      if ( support == "mousewheel" ) {
        event.deltaY = - 1/40 * originalEvent.wheelDelta;
        // Webkit also support wheelDeltaX
        originalEvent.wheelDeltaX && ( event.deltaX = - 1/40 * originalEvent.wheelDeltaX );
      } else {
        event.deltaY = originalEvent.detail;
      }

      // it's time to fire the callback
      return callback( event );

    };

    fns.push({
      element: element,
      fn: fn,
    });

    return fn;
  }

  function getCallback(element) {
    for (var i = 0; i < fns.length; i++) {
      if (fns[i].element === element) {
        return fns[i].fn;
      }
    }
    return function(){};
  }

  function removeCallback(element) {
    for (var i = 0; i < fns.length; i++) {
      if (fns[i].element === element) {
        return fns.splice(i,1);
      }
    }
  }

  function _addWheelListener(elem, eventName, callback, isPassiveListener ) {
    var cb;

    if (support === "wheel") {
      cb = callback;
    } else {
      cb = createCallback(elem, callback);
    }

    elem[_addEventListener](prefix + eventName, cb, isPassiveListener ? passiveOption : false);
  }

  function _removeWheelListener(elem, eventName, callback, isPassiveListener ) {

    var cb;

    if (support === "wheel") {
      cb = callback;
    } else {
      cb = getCallback(elem);
    }

    elem[_removeEventListener](prefix + eventName, cb, isPassiveListener ? passiveOption : false);

    removeCallback(elem);
  }

  function addWheelListener( elem, callback, isPassiveListener ) {
    _addWheelListener(elem, support, callback, isPassiveListener );

    // handle MozMousePixelScroll in older Firefox
    if( support == "DOMMouseScroll" ) {
      _addWheelListener(elem, "MozMousePixelScroll", callback, isPassiveListener );
    }
  }

  function removeWheelListener(elem, callback, isPassiveListener){
    _removeWheelListener(elem, support, callback, isPassiveListener);

    // handle MozMousePixelScroll in older Firefox
    if( support == "DOMMouseScroll" ) {
      _removeWheelListener(elem, "MozMousePixelScroll", callback, isPassiveListener);
    }
  }

  return {
    on: addWheelListener,
    off: removeWheelListener
  };

})();


/***/ }),

/***/ "./node_modules/svg-pan-zoom/src/utilities.js":
/*!****************************************************!*\
  !*** ./node_modules/svg-pan-zoom/src/utilities.js ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = {
  /**
   * Extends an object
   *
   * @param  {Object} target object to extend
   * @param  {Object} source object to take properties from
   * @return {Object}        extended object
   */
  extend: function(target, source) {
    target = target || {};
    for (var prop in source) {
      // Go recursively
      if (this.isObject(source[prop])) {
        target[prop] = this.extend(target[prop], source[prop]);
      } else {
        target[prop] = source[prop];
      }
    }
    return target;
  },

  /**
   * Checks if an object is a DOM element
   *
   * @param  {Object}  o HTML element or String
   * @return {Boolean}   returns true if object is a DOM element
   */
  isElement: function(o) {
    return (
      o instanceof HTMLElement ||
      o instanceof SVGElement ||
      o instanceof SVGSVGElement || //DOM2
      (o &&
        typeof o === "object" &&
        o !== null &&
        o.nodeType === 1 &&
        typeof o.nodeName === "string")
    );
  },

  /**
   * Checks if an object is an Object
   *
   * @param  {Object}  o Object
   * @return {Boolean}   returns true if object is an Object
   */
  isObject: function(o) {
    return Object.prototype.toString.call(o) === "[object Object]";
  },

  /**
   * Checks if variable is Number
   *
   * @param  {Integer|Float}  n
   * @return {Boolean}   returns true if variable is Number
   */
  isNumber: function(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
  },

  /**
   * Search for an SVG element
   *
   * @param  {Object|String} elementOrSelector DOM Element or selector String
   * @return {Object|Null}                   SVG or null
   */
  getSvg: function(elementOrSelector) {
    var element, svg;

    if (!this.isElement(elementOrSelector)) {
      // If selector provided
      if (
        typeof elementOrSelector === "string" ||
        elementOrSelector instanceof String
      ) {
        // Try to find the element
        element = document.querySelector(elementOrSelector);

        if (!element) {
          throw new Error(
            "Provided selector did not find any elements. Selector: " +
              elementOrSelector
          );
          return null;
        }
      } else {
        throw new Error("Provided selector is not an HTML object nor String");
        return null;
      }
    } else {
      element = elementOrSelector;
    }

    if (element.tagName.toLowerCase() === "svg") {
      svg = element;
    } else {
      if (element.tagName.toLowerCase() === "object") {
        svg = element.contentDocument.documentElement;
      } else {
        if (element.tagName.toLowerCase() === "embed") {
          svg = element.getSVGDocument().documentElement;
        } else {
          if (element.tagName.toLowerCase() === "img") {
            throw new Error(
              'Cannot script an SVG in an "img" element. Please use an "object" element or an in-line SVG.'
            );
          } else {
            throw new Error("Cannot get SVG.");
          }
          return null;
        }
      }
    }

    return svg;
  },

  /**
   * Attach a given context to a function
   * @param  {Function} fn      Function
   * @param  {Object}   context Context
   * @return {Function}           Function with certain context
   */
  proxy: function(fn, context) {
    return function() {
      return fn.apply(context, arguments);
    };
  },

  /**
   * Returns object type
   * Uses toString that returns [object SVGPoint]
   * And than parses object type from string
   *
   * @param  {Object} o Any object
   * @return {String}   Object type
   */
  getType: function(o) {
    return Object.prototype.toString
      .apply(o)
      .replace(/^\[object\s/, "")
      .replace(/\]$/, "");
  },

  /**
   * If it is a touch event than add clientX and clientY to event object
   *
   * @param  {Event} evt
   * @param  {SVGSVGElement} svg
   */
  mouseAndTouchNormalize: function(evt, svg) {
    // If no clientX then fallback
    if (evt.clientX === void 0 || evt.clientX === null) {
      // Fallback
      evt.clientX = 0;
      evt.clientY = 0;

      // If it is a touch event
      if (evt.touches !== void 0 && evt.touches.length) {
        if (evt.touches[0].clientX !== void 0) {
          evt.clientX = evt.touches[0].clientX;
          evt.clientY = evt.touches[0].clientY;
        } else if (evt.touches[0].pageX !== void 0) {
          var rect = svg.getBoundingClientRect();

          evt.clientX = evt.touches[0].pageX - rect.left;
          evt.clientY = evt.touches[0].pageY - rect.top;
        }
        // If it is a custom event
      } else if (evt.originalEvent !== void 0) {
        if (evt.originalEvent.clientX !== void 0) {
          evt.clientX = evt.originalEvent.clientX;
          evt.clientY = evt.originalEvent.clientY;
        }
      }
    }
  },

  /**
   * Check if an event is a double click/tap
   * TODO: For touch gestures use a library (hammer.js) that takes in account other events
   * (touchmove and touchend). It should take in account tap duration and traveled distance
   *
   * @param  {Event}  evt
   * @param  {Event}  prevEvt Previous Event
   * @return {Boolean}
   */
  isDblClick: function(evt, prevEvt) {
    // Double click detected by browser
    if (evt.detail === 2) {
      return true;
    }
    // Try to compare events
    else if (prevEvt !== void 0 && prevEvt !== null) {
      var timeStampDiff = evt.timeStamp - prevEvt.timeStamp, // should be lower than 250 ms
        touchesDistance = Math.sqrt(
          Math.pow(evt.clientX - prevEvt.clientX, 2) +
            Math.pow(evt.clientY - prevEvt.clientY, 2)
        );

      return timeStampDiff < 250 && touchesDistance < 10;
    }

    // Nothing found
    return false;
  },

  /**
   * Returns current timestamp as an integer
   *
   * @return {Number}
   */
  now:
    Date.now ||
    function() {
      return new Date().getTime();
    },

  // From underscore.
  // Returns a function, that, when invoked, will only be triggered at most once
  // during a given window of time. Normally, the throttled function will run
  // as much as it can, without ever going more than once per `wait` duration;
  // but if you'd like to disable the execution on the leading edge, pass
  // `{leading: false}`. To disable execution on the trailing edge, ditto.
  throttle: function(func, wait, options) {
    var that = this;
    var context, args, result;
    var timeout = null;
    var previous = 0;
    if (!options) {
      options = {};
    }
    var later = function() {
      previous = options.leading === false ? 0 : that.now();
      timeout = null;
      result = func.apply(context, args);
      if (!timeout) {
        context = args = null;
      }
    };
    return function() {
      var now = that.now();
      if (!previous && options.leading === false) {
        previous = now;
      }
      var remaining = wait - (now - previous);
      context = this; // eslint-disable-line consistent-this
      args = arguments;
      if (remaining <= 0 || remaining > wait) {
        clearTimeout(timeout);
        timeout = null;
        previous = now;
        result = func.apply(context, args);
        if (!timeout) {
          context = args = null;
        }
      } else if (!timeout && options.trailing !== false) {
        timeout = setTimeout(later, remaining);
      }
      return result;
    };
  },

  /**
   * Create a requestAnimationFrame simulation
   *
   * @param  {Number|String} refreshRate
   * @return {Function}
   */
  createRequestAnimationFrame: function(refreshRate) {
    var timeout = null;

    // Convert refreshRate to timeout
    if (refreshRate !== "auto" && refreshRate < 60 && refreshRate > 1) {
      timeout = Math.floor(1000 / refreshRate);
    }

    if (timeout === null) {
      return window.requestAnimationFrame || requestTimeout(33);
    } else {
      return requestTimeout(timeout);
    }
  }
};

/**
 * Create a callback that will execute after a given timeout
 *
 * @param  {Function} timeout
 * @return {Function}
 */
function requestTimeout(timeout) {
  return function(callback) {
    window.setTimeout(callback, timeout);
  };
}


/***/ }),

/***/ "./node_modules/wheel/index.js":
/*!*************************************!*\
  !*** ./node_modules/wheel/index.js ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports) {

/**
 * This module used to unify mouse wheel behavior between different browsers in 2014
 * Now it's just a wrapper around addEventListener('wheel');
 *
 * Usage:
 *  var addWheelListener = require('wheel').addWheelListener;
 *  var removeWheelListener = require('wheel').removeWheelListener;
 *  addWheelListener(domElement, function (e) {
 *    // mouse wheel event
 *  });
 *  removeWheelListener(domElement, function);
 */

module.exports = addWheelListener;

// But also expose "advanced" api with unsubscribe:
module.exports.addWheelListener = addWheelListener;
module.exports.removeWheelListener = removeWheelListener;


function addWheelListener(element, listener, useCapture) {
  element.addEventListener('wheel', listener, useCapture);
}

function removeWheelListener( element, listener, useCapture ) {
  element.removeEventListener('wheel', listener, useCapture);
}

/***/ })

/******/ });
//# sourceMappingURL=panzoom-extension.js.map
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IiIsImZpbGUiOiJwYW56b29tLWV4dGVuc2lvbi5qcyIsInNvdXJjZVJvb3QiOiIifQ==