let express=require('express');
let pool=require('../modules/mysql');
let router=express.Router();

router.get('/',function(req,res){
    // pool.query('SELECT * FROM emp', function (error, results, fields) {
    //     if (error) throw error;
    //     //console.log(results);
    //     res.render('mysql/list',{list:results});
    //     //conn.release();
    // });
    pool.getConnection(function(err,conn){
        //console.log(conn);
        conn.query('SELECT * FROM emp'
            , function (error, results, fields) {
                if (error) throw error;
                res.render('mysql/list',{list:results});
                conn.release();
        });
    });
});

router.post('/',function(req,res){
    //console.log(req.body);
    // pool.query('insert into emp (empno,ename,sal) values (?,?,?)'
    //     ,[req.body.empno,req.body.ename,req.body.sal],function(err,result){
    //         console.log(result);
    //         res.redirect('./');
    //     });
    pool.getConnection(function(err,conn){
        conn.beginTransaction(function(err) {
            if(err) {throw err;}
            conn.query('insert into emp (empno,ename,sal) values (?,?,?)'
                ,[req.body.empno,req.body.ename,req.body.sal]
                ,function(err,result){
                    if(err) return conn.rollback(function(){throw err;});
                    //conn.rollback();
                    conn.commit();
                    //console.log(result);
                    res.redirect('./');
                    conn.release();
            });
        });
    });
});

//패턴의 경우 -> 완벽히 일치하는 패턴이 제일 위로, 그렇지 않은 패턴이 뒤로 와야함!
// router.get('/*',function(req,res){
//     res.send(req.url.substring(1));
// });
router.get('/:empno',function(req,res){
    let empno=(parseInt(req.params.empno));

    pool.query('select * from emp where empno=?',[empno],function(err,result){
        res.render('mysql/emp',{bean:result[0]});
    });
});

router.put('/:empno',function(req,res){
    pool.query('update emp set ename=?, sal=? where empno=?'
        ,[req.body.ename,parseInt(req.body.sal),parseInt(req.body.empno)]
        ,function(err){
            if(err) throw err;
            res.redirect('./');
    });
});

router.delete('/:empno',function(req,res){
    console.log(req.params.empno);
    pool.query('delete from emp where empno=?'
        ,[parseInt(req.params.empno)]
        ,function(){res.redirect('./');
    });
});


module.exports=router;