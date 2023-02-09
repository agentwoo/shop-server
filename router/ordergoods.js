const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const {
    gettradeordergoods,
    getfinishordergoods,
    cancelordergoods,
    confirmordergoods,
    confirmsendgoods,
    getshippedgoods
} = require('../router_handler/ordergoods')


// 获取待发货的商品订单列表
router.post('/gettradeordergoods', gettradeordergoods)

// 获取已发货的商品订单列表
router.post('/getshippedgoods', getshippedgoods)

//获取已完成商品订单
router.post('/getfinishordergoods', getfinishordergoods)

// 取消订单
router.post('/cancelordergoods', cancelordergoods)

// 确认收货
router.post('/confirmordergoods', confirmordergoods)

// 确认发货
router.post('/confirmsendgoods', confirmsendgoods)

module.exports = router