const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const { getgoodsdesc, getallgoodsList, getnewgoodsList, gethotgoodsList, getfreegoodsList } = require('../router_handler/getgoods')

// 导入验证规则
const expressJoi = require('@escook/express-joi')
const { goods_id_schema } = require('../schema/getgoods')

// 获取单个商品详情
router.post('/getgoodsdesc', expressJoi(goods_id_schema), getgoodsdesc)

// 获取全部商品
router.get('/getallgoodsList', getallgoodsList)

// 获取最新商品
router.get('/getnewgoodsList', getnewgoodsList)

// 获取热门商品
router.get('/gethotgoodsList', gethotgoodsList)

// 获取免费商品
router.get('/getfreegoodsList', getfreegoodsList)

module.exports = router