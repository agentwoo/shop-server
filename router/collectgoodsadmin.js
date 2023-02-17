const express = require('express')
const router = express.Router()

// 导入用户路由处理函数
const { getallcollectgoods } = require('../router_handler/collectgoodsadmin')


// 获取所有用户的收藏商品
router.get('/getallcollectgoods', getallcollectgoods)


module.exports = router