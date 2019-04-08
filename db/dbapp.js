var express = require("express");
var app =express();
var pool = require("./DBConfig");       //   这句话是，引入当前目录的mysql模板   mysql就是我们上面创建的mysql.js
     //创建一个连接        mysql是我们上面文件暴露出来的模板的方法
pool.connect()                          //运用了这句才是真正连接

//设置跨域访问
app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By",' 3.2.1');
    res.header("Content-Type", "application/json;charset=utf-8");
    next();
});

var result = {
    "status": "200",
    "message": "success", 
}
var school = "select * from estimate"   //假设我们数据表叫mono  *代表查询全部内容  select查询


pool.end();
//写个接口123
app.get('/estimate',function(req,res){
  pool.query(school,function(err,res){   //err提示错误信息  res是查询到的内容全在里面
    if(err){
      throw err;
    }else {
      result.data=res;
    }
  });
    res.status(200),
    res.json(result)
});
//配置服务端口
var server = app.listen(3001, function () {
  var host = server.address().address;
  var port = server.address().port;
  console.log(`Example app listening at http://${host}:${port}`);
})

