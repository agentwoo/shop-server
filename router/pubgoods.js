const express = require('express')
const router = express.Router()

// 导入验证规则
const expressJoi = require('@escook/express-joi')
const { pubgoods_schema, getpubgoods_schema, delgoodsitem_schema } = require('../schema/pubgoods')
// 导入用户路由处理函数
const {
    pubgoods,
    getpubgoods,
    delgoodsitem,
    tradegoods,
    shippedgoods,
    tradefinishedgoods,
    updategoodsdesc,
    deltradefinishedgoods,
    getremovegoods,
    removegoods,
    readdpubgoods,
} = require('../router_handler/pubgoods')


// 商品发布
// router.post('/pubgoods', expressJoi(pubgoods_schema), pubgoods)
router.post('/pubgoods', pubgoods)


// 我发布的商品
router.post('/getpubgoods', expressJoi(getpubgoods_schema), getpubgoods)


// 删除我发布的商品
router.post('/delgoodsitem', expressJoi(delgoodsitem_schema), delgoodsitem)

// 待发货的商品列表
router.post('/tradegoods', tradegoods)

// 待买家确认收货的商品列表
router.post('/shippedgoods', shippedgoods)

// 已完成交易的商品列表
router.post('/tradefinishedgoods', tradefinishedgoods)

// 修改商品详情
router.post('/updategoodsdesc', updategoodsdesc)

// 删除已完成的交易商品
router.post('/deltradefinishedgoods', deltradefinishedgoods)

// 获取下架的商品
router.post('/getremovegoods', getremovegoods)

// 删除下架的商品
router.post('/removegoods', removegoods)

// 重新上架商品
router.post('/readdpubgoods', readdpubgoods)

module.exports = router