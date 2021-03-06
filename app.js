//使用express构建服务器
var express=require("express");
var app=express();
var bodyParser=require("body-parser");
var pool = require("./routes/DBConfig");       //   这句话是，引入当前目录的mysql模板   mysql就是我们上面创建的mysql.js
//创建一个连接        mysql是我们上面文件暴露出来的模板的方法
var cors=require("cors")
pool.connect()

var bodyParser = require('body-parser');
app.use(bodyParser.json({limit: '50mb'}));
app.use(bodyParser.urlencoded({limit: '50mb', extended: true}))

//设置跨域访问
app.all('*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
  res.header("X-Powered-By",' 3.2.1');
  // res.header("Content-Type", "application/json;charset=utf-8");
  next();
});

//引入路由模块
var star=require("./routes/star");
var gonglue=require("./routes/gonglue");
var estimate=require("./routes/estimate");
var dining_hall=require("./routes/dining_hall");
var user=require("./routes/user");

app.listen(3001,()=>{
    console.log("创建成功")
})

app.use(cors({
  origin:"http://192.168.43.224:8081",
  // origin:"http://10.202.44.234:8081",
  credentials:true
}))
//托管静态资源
// app.use(express.static('./public'));
app.use('/public',express.static('public'));//将文件设置成静态
app.use(bodyParser.urlencoded({
    extended:false
}))
// app.set('192.168.137.1', process.env.PORT || 3000);

//使用路由器来管理路由
app.use("/star",star);
app.use("/gonglue",gonglue);
app.use("/estimate",estimate);
app.use("/dining_hall",dining_hall);
app.use("/user",user);