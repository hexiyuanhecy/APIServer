var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 
//获取评论
router.get("/register",(req,res)=>{
    var {
        password
    } = req.body;
    console.log(password)
    var sql=`SELECT * FROM estimate`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1})
        }
    })
})
module.exports=router;