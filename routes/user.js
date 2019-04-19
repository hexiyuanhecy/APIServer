var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 

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
    var sql=`SELECT * FROM user WHERE us_pwd=? AND us_ph=?`;
    pool.query(sql,[password, loginname],(err,result)=>{
        if(err) throw err;
        console.log(result)
        if(result.length>0){
            res.send({code:200,msg:result[0]})
        }else{
            res.send({code:-1,msg:"用户名或密码错误"})
        }
    })
});

//注册用户名验证
router.post("/register/cname",(req,res)=>{
    var {phone,password}=req.body;
    var sql=`SELECT * FROM user WHERE us_ph=?`;
    pool.query(sql,[phone],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:-1,msg:"用户名已存在"});
        }else{
            res.send({code:200});
        }
    })
})

//注册成功验证
router.post("/register",(req,res)=>{
    var {phone,password}=req.body;
    var pic = '0.jpg'
    var sql=`INSERT INTO user(us_ph,us_pwd,us_pic) VALUES(?,?,?)`;
    console.log(req.body)
    pool.query(sql,[phone,password,pic],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:200});
        }else{
            res.send({code:-1,mag:"注册失败，请重新输入信息"});
        }
    })
})

router.get("/info",(req,res)=>{
    var sql=`select * from user;`;
    pool.query(sql,(err,result)=>{
        console.log(res)
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1,msg:'12123123'});
        }
    })
})

module.exports=router;