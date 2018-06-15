// server.js

var express = require('express');
var app = express();
var http = require('http').Server(app); //1
var io = require('socket.io')(http); //1
var path = require('path');
app.use(express.static('public'));
app.use(express.static('files'));

// Express의 미들웨어 불러오기
/*var bodyParser = require('body-parser')
  , cookieParser = require('cookie-parser')
  , static = require('serve-static')
  , errorHandler = require('errorhandler');*/

/*app.get('/chat1',function(req, res){  //2
  res.sendFile(__dirname + '/client1.html');
});

app.get('/chat2',function(req, res){  //2
  res.sendFile(__dirname + '/client2.html');
});*/


app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.get('/chat', function (req, res) {

    res.writeHead('200', {
        'Content-Type': 'text/html;charset = utf8'
    });
    var context = {
        userid: req.query.id
    };

    req.app.render('login_success', context, function (err, html) {
        if (err) {
            console.error('뷰 렌더링 중 에러 발생 : ' + err.stack);

            res.writeHead('200', {
                'Content-Type': 'text/html;charset=utf8'
            });
            res.write('<h2>뷰 렌더링 중 에러 발생</h2>');
            res.write('<p>' + err.stack + '</p>');
            res.end();

            return;
        }
        console.log('rendered : ' + html);

        res.end(html);
    });

});
/*
app.get('/chat', function (req, res) { //2
    
    var paramId = req.query.id;
    
    console.log(paramId);
    res.writeHead('200', {
        'Content-Type': 'text/html;charset = utf8'
    });
    var context = {
        userid: paramId
    };
    req.app.render('login_success', context, function (err, html) {

        if (err) {
            console.error('뷰 렌더링 중 오류 발생 : ' + err.stack);
            res.writeHead('200', {
                'Content-Type': 'text/html;charset=utf8'
            });
            res.write('<h2>뷰 렌더링 중 오류 발생</h2>');
            res.write('<p>' + err.stack + '</p>');
            res.end();
            return;
        }

    });
    console.log('rendered : ' + html);
    res.end(html);



});
*/

var count = 1;
io.on('connection', function (socket) { //3
    console.log('user connected: ', socket.id); //3-1

    socket.on('disconnect', function () { //3-2
        console.log('user disconnected: ', socket.id);
    });

    socket.on('send message', function (group, name, text) { //3-3
        socket.join(group);
        var msg = name + ' : ' + text;
        console.log(msg);
        io.to(group).emit('receive message', msg);
       
    });
});

http.listen(3000, function () { //4
    console.log('server on!');
});
