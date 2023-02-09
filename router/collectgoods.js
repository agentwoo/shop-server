const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const { addcollectgoods } = require('../router_handler/collectgoods')


// 购买商品
router.post('/addcollectgoods', addcollectgoods)


module.exports = router