const express = require('express')
const router = express.Router()

const { getallgoodsadmin, removegoodsadmin } = require('../router_handler/pubgoodsadmin')

// 获取所有商品数据
router.get('/getallgoodsadmin', getallgoodsadmin)

// 下架商品
router.post('/removegoodsadmin', removegoodsadmin)

module.exports = router