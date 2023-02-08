const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const { buygoodsitem } = require('../router_handler/buygoods')


// 购买商品
router.post('/buygoodsitem', buygoodsitem)


module.exports = router