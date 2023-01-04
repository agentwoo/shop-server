const express = require('express')
const app = express()
// 配置跨域
const cors = require('cors')
app.use(cors())

app.use(express.urlencoded({ extended: false }))

// 封装res.cc函数
app.use((req, res, next) => {
    // status默认值为1，表示失败的情况
    res.cc = function (err, status = 1) {
        res.send({
            status,
            message: err instanceof Error ? err.message : err
        })
    }
    next()
})

// 配置解析token的中间件
const expressJWt = require('express-jwt')
const config = require('./config')
app.use(expressJWt({ secret: config.jwtSecretKey }).unless({ path: [/^\/api\//] }))


// 导入并注册用户路由模块
const userRouter = require('./router/user')
app.use('/api', userRouter)



// 定义错误级别中间件
app.use((err, req, res, next) => {
    // 捕获验证规则失败导致的错误
    if (err instanceof joi.ValidationError) return res.cc(err)
    // 捕获身份验证失败的错误
    if (err.name = 'UnauthorizedError') return res.cc('身份验证失败！')
    // 未知的错误
    res.cc(err)
})

app.listen(3000, () => {
    console.log('express服务器启动成功~');
});