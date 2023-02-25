const express = require('express')
const router = express.Router()

// 导入验证规则
const expressJoi = require('@escook/express-joi')
const { reg_login_schema } = require('../schema/user')

// 导入用户路由处理函数
const {
    register,
    login,
    updatepasswod,
    updateuserImg,
    updateuserName,
    loginadmin,
    getuserList,
    updateuserpasswod,
    disableuser,
    enableuser,
    comment,
} = require('../router_handler/user')

// 注册新用户
router.post('/register', expressJoi(reg_login_schema), register)

// 登录
router.post('/login', expressJoi(reg_login_schema), login)

// 修改密码
router.post('/updatepasswod', updatepasswod)

// 更改头像
router.post('/updateuserImg', updateuserImg)

// 更换用户名
router.post('/updateuserName', updateuserName)

// 后台管理系统
// 登录
router.post('/loginadmin', expressJoi(reg_login_schema), loginadmin)

//获取用户列表(除管理员) 
router.get('/getuserList', getuserList)

// 管理员修改用户密码
router.post('/updateuserpasswod', updateuserpasswod)

// 停用用户
router.post('/disableuser', disableuser)

// 启用用户
router.post('/enableuser', enableuser)

// 添加备注
router.post('/comment', comment)

module.exports = router