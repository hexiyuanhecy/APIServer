var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

/*=======路由信息 （接口地址）开始 存放在./routes目录下===========*/
var indexRouter = require('./routes/index');//home page接口
var usersRouter = require('./routes/users');//用户接口

var app = express();

///=======模板 开始===========//
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
///=======模板 结束===========//

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

///=======路由信息 （接口地址 介绍===========//
/*定义一个路由的基本格式为：*/
/* app.METHOD(PATH, HANDLER)
 *app 是express的实例
 method 是http请求方法
 handler 是在路由匹配时执行的函数*/
app.use('/', indexRouter);//在app中注册indexRouter该接口 
app.use('/users', usersRouter);//在app中注册usersRouter接口

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
