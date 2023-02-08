const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const { getordergoods, getfinishordergoods, cancelordergoods } = require('../router_handler/ordergoods')


// 获取商品订单
router.post('/getordergoods', getordergoods)

//获取已完成商品订单
router.post('/getfinishordergoods', getfinishordergoods)

// 取消订单
router.post('/cancelordergoods', cancelordergoods)

module.exports = router