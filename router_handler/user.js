const db = require('../db/index')

// 导入bcript包--用于加密及解密密码
const bcrypt = require('bcryptjs')

// 导入生成token的包
const jwt = require('jsonwebtoken')
const config = require('../config')

// 注册处理函数
exports.register = (req, res) => {
    const userInfo = req.body
    const sql = `select * from user where user_name = ?`
    db.query(sql, userInfo.username, (err, results) => {
        if (err) return res.cc(err)
        if (results.length > 0) return res.cc('该用户名已经被注册了！')
        // 调用bcript.hashSync() 对密码进行加密
        userInfo.password = bcrypt.hashSync(userInfo.password, 10)
        const sql = `insert into user set ?`
        db.query(sql, { user_name: userInfo.username, password: userInfo.password }, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) {
                return res.cc('注册用户失败，请稍后再试！')
            }
            res.cc('注册成功！', true)
        })
    })
}



// 登录处理函数
exports.login = (req, res) => {
    const userInfo = req.body
    const sql = `select * from user where user_name = ?`
    db.query(sql, userInfo.username, (err, results) => {
        if (err) return res.cc(err)
        if (results.length != 1) return res.cc('登录失败！')
        // 判断密码是否正确
        // 拿着用户输入的密码，和数据库中存储的密码进行对比
        const compareResult = bcrypt.compareSync(userInfo.password, results[0].password)
        // 如果对比的结果等于false，则证明用户输入的密码错误
        if (!compareResult) return res.cc('登录失败！')

        // 在服务器端生成token
        const user = { ...results[0], password: '', user_img: '' }
        // 生成token字符串
        const tokenStr = jwt.sign(user, config.jwtSecretKey, { expiresIn: config.expiresIn })
        // // 向客户端发送token
        res.send({
            ok: true,
            message: '登录成功！',
            token: 'Bearer ' + tokenStr,
            userInfo: { ...results[0], password: '' }
        })
    })
}



