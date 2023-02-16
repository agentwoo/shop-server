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
        db.query(sql,
            {
                user_name: userInfo.username,
                password: userInfo.password,
                user_img: 'http://localhost:3000/api/my/uploads/goods_pic/1676427516337.jpeg'
            },
            (err, results) => {
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

// 修改密码
exports.updatepasswod = (req, res) => {
    const sql = `select * from user where user_name = ?`
    db.query(sql, req.body.user_name, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 0) res.cc('查询不到该用户')
        // 拿着用户输入的密码，和数据库中存储的密码进行对比
        const compareResult = bcrypt.compareSync(req.body.password, results[0].password)
        // 如果对比的结果等于true，则证明用户修改的密码与原密码一致，不允许修改
        if (compareResult) return res.cc('新密码不能与原密码一致!')
        let password = bcrypt.hashSync(req.body.password, 10)
        const sql = `update user set password = ? where user_name = ?`
        db.query(sql, [password, req.body.user_name], (err, results) => {
            if (err) res.cc(err)
            if (results.affectedRows !== 1) res.cc('修改失败')
            const sql = `select * from user where user_name = ?`
            db.query(sql, req.body.user_name, (err, results) => {
                if (err) return res.cc(err)
                const user = { ...results[0], password: '', user_img: '' }
                const tokenStr = jwt.sign(user, config.jwtSecretKey, { expiresIn: config.expiresIn })
                res.send({
                    ok: true,
                    message: '登录成功！',
                    token: 'Bearer ' + tokenStr,
                    userInfo: { ...results[0], password: '' }
                })
            })
        })
    })
}


// 更新头像
exports.updateuserImg = (req, res) => {
    const sql = `select * from user where user_name = ?`
    db.query(sql, req.body.user_name, (err, results) => {
        if (err) res.cc(err)
        if (results.length === 0) res.cc('查询错误！')
        const sql = `update user set user_img = ? where user_name = ?`
        db.query(sql, [req.body.user_img, req.body.user_name], (err, results) => {
            if (err) res.cc(err)
            if (results.affectedRows !== 1) res.cc('更改失败！')
            res.cc('修改成功！', true)
        })
    })
}

// 更换用户名
exports.updateuserName = (req, res) => {
    const sql = `select * from user where user_name=?`
    db.query(sql, req.body.user_name, (err, results) => {
        if (err) res.cc(err)
        if (results.length !== 0) res.cc('用户名已被使用，请重试！')
        if (results.length === 0) {
            const sql = `update user set user_name = ? where user_id = ?`
            db.query(sql, [req.body.user_name, req.body.user_id], (err, results) => {
                if (err) res.cc(err)
                if (results.affectedRows !== 1) res.cc('修改失败！')
                res.cc('修改成功！', true)
            })
        }
    })
}
