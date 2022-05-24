var express=require('express');
var app=express();

app
    .use(express.static('static'))
    .use(express.json())
    .use(express.urlencoded({ extended: true }));

app.set('views', './views');
app.set('view engine', 'ejs');

app.get('/',function(req,res){
    res.setHeader('content-type','text/html; charset=utf-8');
    res.render('index.ejs', { title: 'Hey', message: 'Hello there!'});
});

app.post('/add.html',function(req,res){
    console.log(req.body);
    res.setHeader('content-type','text/html; charset=utf-8');
    res.end('<h1>새로운 페이지</h1>');
});

app.listen(7070,function(){
    console.log("service run...");
});