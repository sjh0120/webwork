var http=require('http');
var serv=http.createServer(function(req,res){
    console.log(req.method, req.url);
    res.statusCode(404);
    res.setHeader('Content-Type', 'text/html;charset=utf-8')
    res.write('<h1>응답</h1>');
    res.end();
});
serv.listen(7070,function(){
    console.log('서버가 리슨중...');
});

