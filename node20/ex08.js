var callback1=function(){
    console.log('1실행');
};
console.log('main start...');
//var t3=setTimeout(callback1,0);
var call1=setImmediate(callback1);
clearImmediate(call1);
setTimeout(function(){
    console.log('3실행');
},0);
console.log('main end...');