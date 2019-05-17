var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 

// 获取收藏表
router.post("/star",(req,res)=>{
    var {usid}=req.body;
    var sql=`SELECT * FROM star WHERE us_id=?  ORDER BY id DESC`;
    // console.log(usid)
    pool.query(sql,[usid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:-1,data:result});
        }else{
            res.send({code:200});
        }
    })
});

// 判断是否已收藏
router.post("/check_star",(req,res)=>{
    var {us_id,st_id,type}=req.body;
    var sql=`SELECT * FROM star WHERE us_id=? AND st_id=? AND type=?`;
    // console.log(req.body)
    pool.query(sql,[us_id,st_id,type],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            // console.log(result)
            res.send({code:-1,data:result});
        }else{
            res.send({code:200});
        }
    })
})

// 加入收藏
router.post("/add_star",(req,res)=>{
    var {us_id,st_id,type}=req.body;
    switch (type) {
        case '1': 
            table = 'estimate'
            name = 'es_'
            break
        case '2': 
            table = 'dining_hall' 
            name = 'dh_'
            break
        default:
            table = 'gonglue'
            name = 'gl_'
    }
    var sql=`INSERT INTO star(us_id,st_id,type ) VALUES(?,?,?)`;
    var addstar = `update ${table} set ${name}star=${name}star+1 WHERE ${name}id=${st_id}`
    // console.log(addstar)
    pool.query(sql,[us_id,st_id,type],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            pool.query(addstar,(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({code:200});
                }else{
                    res.send({code:-1,mag:"发表失败，请稍后再试。"});
                }
            })
        }else{
            res.send({code:-1,mag:"发表失败，请稍后再试。"});
        }
    })
})

// 移出收藏
router.post("/remove_star",(req,res)=>{
    var {us_id,st_id,type}=req.body;
    switch (type) {
        case '1': 
            table = 'estimate'
            name = 'es_'
            break
        case '2': 
            table = 'dining_hall' 
            name = 'dh_'
            break
        default:
            table = 'gonglue'
            name = 'gl_'
    }
    // `DELETE FROM 表名称 WHERE 列名称 = 值`
    var sql=`DELETE FROM star WHERE us_id=? AND st_id=? AND type=?`;
    var addstar = `update ${table} set ${name}star=${name}star-1 WHERE ${name}id=${st_id}`
    // console.log(addstar)
    pool.query(sql,[us_id,st_id,type],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            pool.query(addstar,(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({code:200});
                }else{
                    res.send({code:-1,mag:"发表失败，请稍后再试。"});
                }
            })
        }else{
            res.send({code:-1,mag:"发表失败，请稍后再试。"});
        }
    })
})

module.exports=router;