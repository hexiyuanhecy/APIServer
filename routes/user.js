var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 
//注册
router.post("/register",(req,res)=>{
    var password = req.body.password;
    console.log(req.body);
    console.log(password)
    // var sql=`SELECT * FROM estimate`;
    // pool.query(sql,(err,result)=>{
    //     if(err) throw err;
    //     if(result.length>0){
    //         res.send({code:200,data:result})
    //     }else{
    //         res.send({code:-1})
    //     }
    // })
})

//用户登录验证
router.post("/login",(req,res)=>{
    var {loginname,password}=req.body;
    var email=/@/;
    var sql_temp;
    if(email.test(loginname)){
        sql_temp = ` us_email=?`;
    }
    else sql_temp = ` us_ph=?`;
    console.log(req.body)
    var sql=`SELECT * FROM user WHERE us_ph=? AND us_ph=?`;
    pool.query(sql,[loginname,password],(err,result)=>{
        if(err) throw err;
        console.log(result)
        if(result.length>0){
            res.send({code:200,msg:result[0]})
        }else{
            res.send({code:-1,msg:"用户名或密码错误"})
        }
    })
});
module.exports=router;