let express=require('express');
const Student=require('../modules/mongoose');
let router=express.Router();

router.get('/',function(req,res){
    Student.find(function(err,results){
        res.render('mongoose/list',{list:results});
    });
});

module.exports=router;