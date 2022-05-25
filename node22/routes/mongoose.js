let express=require('express');
const Student=require('../modules/mongoose');
let router=express.Router();

router.get('/add.html', function(req,res){
    res.render('mongoose/add');
});
router.get('/',function(req,res){
    Student.find(function(err,results){
        res.render('mongoose/list',{list:results});
    });
});
router.post('/', function(req,res){
    // 8. Student 객체를 new 로 생성해서 값을 입력
    var newStudent = new Student(req.body);

    // 9. 데이터 저장
    newStudent.save(function(){
        res.redirect('./');
    });
});
router.get('/:_id',function(req,res){
    Student.findOne({_id:req.params._id}, function(error,result){
        res.render('mongoose/emp.ejs',{bean:result});
    });
});
router.put('/:_id',function(req,res){
    Student.findById({_id:req.params._id}, function(error,student){
        if(error){
            console.log(error);
        }else{
            student.empno = req.body.empno;
            student.ename = req.body.ename;
            student.sal = req.body.sal;
            student.save(function(error,modified_student){
                if(error){
                    console.log(error);
                }else{
                    console.log(modified_student);
                    res.redirect('./');
                }
            });
        }
    });
});
router.delete('/:_id',function(req,res){
    Student.remove({_id:req.params._id}, function(error,output){
        if(error){
            console.log(error);
        }else{
            res.redirect('./');
        }
    });
});


module.exports=router;