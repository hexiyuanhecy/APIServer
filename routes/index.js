var express = require('express');
var router = express.Router();

/* 导入mysql模块 */
var mysql = require('mysql');
var dbconfig = require('../db/DBConfig');
var userSQL = require('../db/Usersql');
var pool = mysql.createPool(dbconfig.mysql);     
// 使用DBConfig.js的配置信息创建一个MySQL连接池

//定义一个get请求 path为根目录
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express12312313' });
});

/*定义一个路由的基本格式为：*/
/* app.METHOD(PATH, HANDLER)*/

module.exports = router;
