var express = require("express");
var router = express.Router();
var pool = require("./DBConfig"); 
//获取评论
router.get("/estimate",(req,res)=>{
    var sql=`select * from estimate es,user us where es.us_id = us.us_id`;
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

// 发表评论
router.post("/submit_estimate",(req,res)=>{
    var {
        dh_id,
        us_id,
        es_content,// 用户填
        es_date,
        es_score,// 用户填
        es_main_img,
        imgs,
        hot,
        rihan,
        specialty,
        noodles,
        meat,
        daily
    }=req.body;
    var sql=`INSERT INTO estimate(dh_id,us_id,es_content,es_date,es_score,es_star,es_main_img,hot,rihan,specialty,noodles,meat,daily) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)`;
    pool.query(sql,[
        dh_id,
        us_id,
        es_content,// 用户填
        es_date,
        es_score,// 用户填
        0,
        es_main_img,
        hot,
        rihan,
        specialty,
        noodles,
        meat,
        daily],(err,result)=>{
        if(err) throw err;

        if(result.affectedRows>0){// 如果评论填入成功
            console.log('评论填入成功')
            var sql_es_id = `SELECT es_id FROM estimate ORDER BY es_id DESC LIMIT 1; `;
            var sql_es_imgs=`INSERT INTO estimate_img(es_id,es_img_path) VALUES(?,?)`;
            pool.query(sql_es_id,[es_content],(err,result1)=>{// 获取填入评论的es_id
                let es_id = result1[0].es_id;
                if(err) throw err;

                if(es_id){ //获取es_id成功
                    console.log('获取es_id成功')
                    imgs.map(function(value,index) {
                        pool.query(sql_es_imgs,[es_id,value],(err,result2)=>{// 将评论图片一张张填入评论图片表
                            if(err) throw err;
                            if(result2.affectedRows>0){
                                console.log('评论图片一张张填入评论图片表成功')
                                if(index===imgs.length) res.send({code:200});
                                // down = 1;
                            }else{
                                res.send({code:"发表失败，请稍后再试。",mag:"发表失败，请稍后再试。"});
                            }
                        })
                    })
                    res.send({code:200});
                }
                else{
                    res.send({code:"发表失败，请稍后再试。",mag:"发表失败，请稍后再试。"});
                }
            })
        }
        else{
            res.send({code:"发表失败，请稍后再试。",mag:"发表失败，请稍后再试。"});
        }
    })



})

module.exports=router;
