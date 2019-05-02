var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 
var usid;
//用户登录验证
router.post("/login",(req,res)=>{
    var {loginname,password}=req.body;
    var email=/@/;
    var temp;
    if(email.test(loginname)){
        this.temp = `us_email=?`;
    }
    else this.temp = `us_ph=?`;
    var sql=`SELECT * FROM user WHERE us_pwd=? AND ${this.temp}`;
    pool.query(sql,[password, loginname],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,msg:result[0]})
            usid = result[0].us_id;
            console.log(usid)
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
});

//注册成功验证
router.post("/register",(req,res)=>{
    var {phone,password}=req.body;
    var pic = '0.jpg'
    var sql=`INSERT INTO user(us_id,us_ph,us_pwd ) VALUES(?,?,?)`;
    console.log(req.body)
    // pool.query('INSERT INTO user (us_ph, us_pwd) VALUES(?, ?)',[phone,password],(err,result)=>{
    //     if(err) throw err;
    //     if(result.affectedRows>0){
    //         res.send({code:200});
    //     }else{
    //         res.send({code:-1,mag:"注册失败，请重新输入信息"});
    //     }
    // })
    pool.query(sql,[null,phone,password],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:200});
        }else{
            res.send({code:-1,mag:"发表失败，请稍后再试。"});
        }
    })
})

router.post("/info",(req,res)=>{
    var {usid}=req.body;
    // console.log('+++'+usid)
    var sql=`select * from user WHERE us_id=?`;
    pool.query(sql,[usid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
            console.log(result)
        }else{
            res.send({code:-1});
        }
    })
})

module.exports=router;