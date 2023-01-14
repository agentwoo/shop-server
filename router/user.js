const express = require('express')
const router = express.Router()

// 导入验证规则
const expressJoi = require('@escook/express-joi')
const { reg_login_schema } = require('../schema/user')

// 导入用户路由处理函数
const { register, login } = require('../router_handler/user')

// 注册新用户
router.post('/register', expressJoi(reg_login_schema), register)

// 登录
router.post('/login', expressJoi(reg_login_schema), login)


module.exports = router