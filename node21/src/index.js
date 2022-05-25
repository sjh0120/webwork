var path=require('path');
var express=require('express');
var app = express();   //express

app
    .use(express.static(path.resolve(__dirname,'../public')))
    .use(express.json())
    .use(express.urlencoded({extended:false}));
    //.use(express.json(),express.urlencoded({extended:false})) 또한 된다!
    // .use(function(req,res,cb){//왜 2번 찍히지...?
    //     console.log('사용자 모듈요청',typeof cb);
    //     cb();
    // });

    // .use(function(req,res,cb){//왜 2번 찍히지...?
    //     console.log('사용자 모듈요청1');
    //     cb();
    // },function(req,res,cb){
    //     console.log('사용자 모듈요청2');
    //     cb();
    // });


//static은 우선순위를 제일 높게(제일 위에) 주는 것이 좋다!

app.set('views', path.resolve(__dirname,'../views'));
app.set('view engine', 'ejs');

var emp=require('./routers/emp');
var dept=require('./routers/dept');

app.use('/emp',emp);
app.use('/dept',dept);

app.listen(3000, () => {
    console.log('server start...');
});