var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 

//获取评论
router.get("/dining_hall",(req,res)=>{
    var sql=`SELECT * FROM dining_hall`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1})
        }
    })
})

//获取餐厅信息
router.post("/dining_hall/item",(req,res)=>{
    var sql=`SELECT * FROM dining_hall WHERE dh_id=?`;
    var sql2=`SELECT * FROM dining_hall_img WHERE dh_id=?`;
    var sql3=`SELECT * FROM dish WHERE dh_id=?`;
    var {id} = req.body;
    // console.log('餐厅id'+id)
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            pool.query(sql2,[id],(err2,result2)=>{
                if(err2) throw err2;
                if(result2.length>0){
                    pool.query(sql3,[id],(err3,result3)=>{
                        if(err3) throw err3;
                        if(result3.length>0){
                            res.send({code:200,data:result,img:result2,dish:result3})
                        }else{
                            res.send({code:200,data:result,img:result2,dish:null})
                        }
                    })
                }else{
                    res.send({code:200,data:result,img:null,dish:null})
                }
            })
        }else{
            res.send({code:-1})
        }
    })
})

//获取餐厅评论
router.post("/dining_hall/item_es",(req,res)=>{
    var sql=`select * from estimate es,user us where es.us_id = us.us_id and  dh_id=?`;
    var {id} = req.body;
    // console.log('餐厅id'+id)
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,data:result})
        }else{
            res.send({code:-1})
        }
    })
})
module.exports=router;
