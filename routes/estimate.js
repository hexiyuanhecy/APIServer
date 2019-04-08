var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 
//获取评论
router.get("/estimate",(req,res)=>{
    var sql=`select * from estimate es,user us where es.us_id = us.us_id ;`;
    pool.query(sql,(err,result)=>{
        console.log(result)
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1})
        }
    })
})
module.exports=router;
