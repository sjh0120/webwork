var mysql = require('mysql');
var my=require('../mymodule/bitmysql'); 

var express=require('express');
var router=express.Router();

router.get('/list', function (req, res) {
    var p=req.query.p==undefined?1:parseInt(req.query.p);

    //mysql에서 아래 수행 ( 'caching_sh2_password' -> 'mysql_native_password' )
    //alter user 'user01'@'localhost' identified with mysql_native_password by '1234';
    
    var conn = mysql.createConnection(my);

    conn.connect(function(err){
        if (err) throw err;
    });

    var tot;
    conn.query('select count(*) as "tot" from emp',function(err,result){
        tot=result[0].tot;
    });
    conn.query('select * from emp LIMIT '+5*(p-1)+',5', function (error, results, fields) {
        if (error) throw error;
        res.render('emplist',{arr:results,total:tot});
    });

    conn.end();
    
    // res.render('emplist', {arr: [{empno:1,ename:'test1',sal:1}
    //                             ,{empno:2,ename:'test2',sal:2}
    //                             ]});
    
    //동기화가 되지는 않는다, 매번 수정되면 서버를 내렸다 올려야 한다.
    //nodemon 을 사용하자, 실제 서비스를 할때 올려서는 안된다... (임시로 사용)
});               

router.get('/add',function(req,res){
    res.render('empadd',{obj:null});
});

router.post('/add', function(req,res){

    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
    if (err) throw err;
    // var sql = "INSERT INTO emp (empno, ename, sal, hiredate) VALUES ("+req.body.empno+",'"+req.body.ename+"',"+req.body.sal+",now())";
    var sql="insert into emp (empno, ename, sal, hiredate) values (?,?,?,now())";
    //위의 sql보다 아래의 sql 더 많이 사용하기!
    //보안상 더 좋음!

    conn.query(sql,[req.body.empno,req.body.ename,req.body.sal], function (err, result) {
        if (err){
            res.render('empadd',{obj:req.body});
            return;
        };
        console.log("insert", result);
        res.redirect('list');
    });
    conn.end();
    });
});

router.get('/row',function(req,res){

    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
    if (err) throw err;
    conn.query('SELECT empno as "empno",ename as "ename", sal as "sal" FROM emp WHERE empno=?',[parseInt(req.query.empno)], function (err, result) {
        if (err) throw err;
        res.render("emp",{bean:result[0]});
    });
    conn.end();
    });
    //res.redirect('index.html');
    
});

router.post('/row', function(req,res){
    console.log(req.body);

    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
    if (err) throw err;
    var sql = "UPDATE emp SET ename=?, sal=? WHERE empno=?";
    conn.query(sql, [req.body.ename,req.body.sal,req.body.empno], function (err, result) {
        if (err) throw err;
        console.log(result.affectedRows + " record(s) updated");
        res.redirect('list');
    });
    conn.end();
    });

});

router.post('/delete',function(req,res){

    var conn = mysql.createConnection(my);

    conn.connect(function(err) {
    if (err) throw err;
    var sql = "DELETE FROM emp WHERE empno = ?";
    conn.query(sql,[req.body.empno],function (err, result) {
        if (err) throw err;
        console.log("Number of records deleted: " + result.affectedRows);
        if(result.affectedRows>0)res.statusConde=200;
        else res.status=500;
        res.end();
    });
    conn.end();
    });
});

module.exports=router;