var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 
// 发表评论
router.post("/submit_gonglue",(req,res)=>{
    var {
        us_id,
        us_name,
        gl_name,
        gl_date,
        gl_main_img,// 用户填
        gl_content,
        gl_star
    }=req.body;
    var sql=`INSERT INTO gonglue(us_id,gl_name,gl_date,gl_main_img,gl_content,gl_star) VALUES(?,?,?,?,?,?)`;
    pool.query(sql,[us_id, gl_name, gl_date, gl_main_img,  gl_content, gl_star],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1});
        }
    })
})

//获取攻略
router.get("/gonglue",(req,res)=>{
    var sql=`select * from gonglue gl, user us where gl.us_id = us.us_id ORDER BY gl_id DESC`;
    // var sql=`select * from estimate`;
    pool.query(sql,(err,result)=>{
        // console.log(result)
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1})
        }
    })
})
//获取攻略
router.post("/gonglue_item",(req,res)=>{
    var {id} = req.body;
    var sql=`select * from gonglue gl, user us where gl.us_id = us.us_id and gl.gl_id=?`;
    // var sql=`select * from estimate`;
    pool.query(sql,[id],(err,result)=>{
        // console.log(result)
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1})
        }
    })
})

router.post("/user_gonglue",(req,res)=>{
    var {id} = req.body;
    // console.log(id)
    var sql=`select * from gonglue where us_id=? ORDER BY gl_id DESC`;
    // var sql=`select * from estimate`;
    pool.query(sql,[id],(err,result)=>{
        // console.log(result)
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1})
        }
    })
})
module.exports=router;