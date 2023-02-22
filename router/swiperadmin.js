const express = require('express')
const router = express.Router()

const { addswiperadmin, delswiperadmin, updateswiperadmin } = require('../router_handler/swiperadmin')

// 添加轮播图
router.post('/addswiperadmin', addswiperadmin)

// 删除轮播图
router.post('/delswiperadmin', delswiperadmin)

// 修改轮播图
router.post('/updateswiperadmin', updateswiperadmin)

module.exports = router