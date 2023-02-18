const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const { getgoodskind, addgoodskind, editgoodskindtext, delgoodskind } = require('../router_handler/goodskind')

// 获取商品分类菜单
router.get('/getgoodskind', getgoodskind)

// 添加商品分类
router.post('/addgoodskind', addgoodskind)

// 修改商品分类名称
router.post('/editgoodskindtext', editgoodskindtext)

// 删除商品分类
router.post('/delgoodskind', delgoodskind)

module.exports = router