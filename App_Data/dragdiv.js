function $() {
var elements = new Array();
for (var i = 0; i < arguments.length; i++) {
    var element = arguments[i];
    if (typeof element == 'string')
      element = document.getElementById(element);
    if (arguments.length == 1)
      return element;
    elements.push(element);
}
return elements;
}

var isIE=(navigator.appVersion.indexOf("MSIE")!=-1)?true:false;
var bIsCatchFlyBar = false;
var dragClickX = 0;
var dragClickY = 0;

function catchFlyBar(ev){
    ev=ev||window.event;
    bIsCatchFlyBar = true;

    var x=ev.clientX+document.body.scrollLeft;
    var y=ev.clientY+document.body.scrollTop;
    dragClickX=x-parseInt($("divFlyBar").style.left);
    dragClickY=y-parseInt($("divFlyBar").style.top);
    isIE? $("divFlyBar").setCapture():null;
    document.onmousemove = moveFlyBar;
}

function moveFlyBar(ev){
    ev=ev||window.event;
    if(bIsCatchFlyBar){
        divFlyBar.style.left = ev.clientX+document.body.scrollLeft-dragClickX;
        divFlyBar.style.top = ev.clientY+document.body.scrollTop-dragClickY;
    }
}

function releaseFlyBar(ev){
    bIsCatchFlyBar = false;
    isIE? $("divFlyBar").releaseCapture():null;
    document.onmousemove = null;
}

