var express = require("express");
var $mysql   = require("mysql");
var sql = require("./DBConfig");       //   这句话是，引入当前目录的mysql模板   mysql就是我们上面创建的mysql.js
var $sql = $mysql.createConnection(sql.mysql)       //创建一个连接        mysql是我们上面文件暴露出来的模板的方法
$sql.connect()                          //运用了这句才是真正连接

//查询

var school = "select * from school"   //假设我们数据表叫mono  *代表查询全部内容  select查询
$sql.query(school,function(err,res){   //err提示错误信息  res是查询到的内容全在里面
  if(err){
    console.log("错误",err)//我们打印出，错误信息  
  }else {
  console.log(res)      //打印出我们查询的内容
  }
});

var dining_hall = "select * from dining_hall"   //假设我们数据表叫mono  *代表查询全部内容  select查询
$sql.query(dining_hall,function(err,res){   //err提示错误信息  res是查询到的内容全在里面
  if(err){
    console.log("错误",err)//我们打印出，错误信息  
  }else {
  console.log(res)      //打印出我们查询的内容
  }
});

var user = "select * from user"   //假设我们数据表叫mono  *代表查询全部内容  select查询
$sql.query(user,function(err,res){   //err提示错误信息  res是查询到的内容全在里面
  if(err){
    console.log("错误",err)//我们打印出，错误信息  
  }else {
  console.log(res)      //打印出我们查询的内容
  }
});