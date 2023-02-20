const express = require('express')
const router = express.Router()

const {
    getallordergoods,
    updateunsendadmin,
    updatefinishedadmin,
    updatefinishedtradadmin
} = require('../router_handler/ordergoodsadmin')

// 获取所用用户的商品订单
router.get('/getallordergoods', getallordergoods)

// 设置为未发货状态
router.post('/updateunsendadmin', updateunsendadmin)

// 设置为已收货状态
router.post('/updatefinishedadmin', updatefinishedadmin)

// 设置为已发货状态
router.post('/updatefinishedtradadmin', updatefinishedtradadmin)

module.exports = router