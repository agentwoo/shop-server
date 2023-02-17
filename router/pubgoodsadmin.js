const express = require('express')
const router = express.Router()

const { getallgoodsadmin } = require('../router_handler/pubgoodsadmin')

// 获取所有商品数据
router.get('/getallgoodsadmin', getallgoodsadmin)

module.exports = router