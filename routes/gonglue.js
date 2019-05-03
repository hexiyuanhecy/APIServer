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
    var sql=`INSERT INTO gonglue(us_id,us_name,gl_name,gl_date,gl_main_img,gl_content,gl_star) VALUES(?,?,?,?,?,?,?)`;
    pool.query(sql,[us_id, us_name, gl_name, gl_date, gl_main_img,  gl_content, gl_star],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1});
        }
    })
})

module.exports=router;