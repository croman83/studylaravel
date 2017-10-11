var WGL = function WhenGoogleLoaded(fnt) {
    if(typeof google != 'undefined')
        fnt();
    else
        setTimeout(function() {
            (function(fnt) {
                WhenGoogleLoaded(fnt)
            })(fnt)}, 500);
};
var EF = function eventFire(el, etype){
    if (el.fireEvent) {
        el.fireEvent('on' + etype);
    } else {
        var evObj = document.createEvent('Events');
        evObj.initEvent(etype, true, false);
        el.dispatchEvent(evObj);
    }
};
var WE = function wordend(num, words){
    return words[ ((num=Math.abs(num%100)) > 10 && num < 15 || (num%=10) > 4 || num === 0) + (num !== 1) ];
};

export {WGL,EF,WE}


