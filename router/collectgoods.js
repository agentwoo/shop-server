const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const { addcollectgoods, getcollectgoods, delcollectgoods, expirecollectgoods } = require('../router_handler/collectgoods')


// 添加收藏商品
router.post('/addcollectgoods', addcollectgoods)

// 获取收藏列表
router.post('/getcollectgoods', getcollectgoods)

// 取消收藏商品
router.post('/delcollectgoods', delcollectgoods)

// 失效收藏商品
router.post('/expirecollectgoods', expirecollectgoods)


module.exports = router