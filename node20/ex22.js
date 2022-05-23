var evn=require('events');
var emit=new evn.EventEmitter();
emit.addListener('event1',function(e){
    console.log('이벤트1 발생');
});
var callback2=function(e){
    console.log('이벤트2 발생');
};
emit.on('event1',callback2);

var callback3=function(e){
    console.log('이벤트3 발생');
};

emit.removeListener('event1',callback2)

emit.addListener('event3',callback3);
console.log(emit.eventNames(),emit.listenerCount('event1'));
emit.emit('event1');
emit.emit('event1');
// emit.removeListener('event3',callback3);
emit.off();
emit.emit('event3');

//addListener -> 이벤트 붙히기
//emit -> 이벤트 실행하기
//이제는 addListener 대신 on을 많이 쓴다!
//동일 이벤트명으로 이벤트가 선언이 되면 이벤트는 누적되어진다