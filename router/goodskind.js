const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const { getgoodskind } = require('../router_handler/goodskind')

// 获取商品分类
router.get('/getgoodskind', getgoodskind)

module.exports = router