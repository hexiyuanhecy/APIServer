var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 
var usid;
//用户登录验证
router.post("/login",(req,res)=>{
    var {loginname,password}=req.body;
    var email=/@/;
    var phone = /\d{11}/;
    if(email.test(loginname)){
        this.temp = `us_email=?`;
    }
    else if(phone.test(loginname)){
        this.temp = `us_ph=?`;
    }
    else this.temp = `us_id=?`;
    var sql=`SELECT * FROM user WHERE us_pwd=? AND ${this.temp}`;
    pool.query(sql,[password, loginname],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,msg:result[0]})
            usid = result[0].us_id;
        }else{
            res.send({code:-1,msg:"用户名或密码错误"})
        }
    })
});

//注册用户名验证
router.post("/register/cname",(req,res)=>{
    var {phone,password}=req.body;

    var email=/@/;
    var ph = /\d{11}/;
    if(email.test(phone)){
        this.temp = `us_email=?`;
    }
    else {
        this.temp = `us_ph=?`;
    }
    var sql=`SELECT * FROM user WHERE ${this.temp}`;
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
    var name = '爱校评用户';
    var ph_em = null;
    var pic = 'http://192.168.43.224:3001/public/images/user_imgs/1.jpg';
    var sign ='这家伙很懒，什么也没写'
    var bg = 'http://192.168.43.224:3001/public/images/images/shuosi2.jpg';
    
    var email=/@/;
    // var ph = /\d{11}/;
    if(email.test(phone)){
        sql=`INSERT INTO user(us_email,us_ph,us_name,us_pwd,us_pic,us_sign,us_bg ) VALUES(?,?,?,?,?,?,?)`;
    }
    else {
        sql=`INSERT INTO user(us_ph,us_email,us_name,us_pwd,us_pic,us_sign,us_bg ) VALUES(?,?,?,?,?,?,?)`;
    }

    pool.query(sql,[phone,ph_em,name,password,pic,sign,bg],(err,result)=>{
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
    var sql=`select * from user WHERE us_id=?`;
    pool.query(sql,[usid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
            // console.log(result)
        }else{
            res.send({code:-1});
        }
    })
})

router.get("/allinfo",(req,res)=>{
    var sql=`select * from user`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
            // console.log(result)
        }else{
            res.send({code:-1});
        }
    })
})

router.post("/edit_info",(req,res)=>{
    var {
        us_id,
        kind,
        txt
    }=req.body;
    // console.log(req.body)
    var sql=`update user set ${kind}=? WHERE us_id=${us_id}`;
    pool.query(sql,[txt],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:200})
        }else{
            res.send({code:-1});
        }
    })
})

module.exports=router;