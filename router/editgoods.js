const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const { updateviews } = require('../router_handler/editgoods')


// 商品点击量加1
router.post('/updateviews', updateviews)


module.exports = router