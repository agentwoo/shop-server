const express = require('express')
const router = express.Router()

const { getallordergoods } = require('../router_handler/ordergoodsadmin')

// 获取所用用户的商品订单
router.get('/getallordergoods', getallordergoods)


module.exports = router