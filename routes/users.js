var express = require('express');
var URL = require('url');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('user api');
});

router.get('/getUserInfo', function(req, res, next) {

  var user = new User();
  /*  获取url参数 依赖于url模块 使用前需要使用  require('url') */
  var params = URL.parse(req.url, true).query;

if(params.id == '1') {

  user.name = "ligh";
  user.age = "1";
  user.city = "北京市";

}else{  
  user.name = "SPTING";
  user.age = "1";
  user.city = "杭州市";
}

var response = {status:1,data:user};
res.send(JSON.stringify(response));

});

module.exports = router;
