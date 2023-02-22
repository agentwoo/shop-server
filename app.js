const express = require('express')
const app = express()

// 配置验证规则
const joi = require('joi')

// 配置跨域
const cors = require('cors')
app.use(cors())

app.use(express.urlencoded({ extended: false }))
app.use(express.json());

// 封装res.cc函数
app.use((req, res, next) => {
    // ok默认值为false，表示失败的情况
    res.cc = function (err, ok = false) {
        res.send({
            ok,
            message: err instanceof Error ? err.message : err
        })
    }
    next()
})

// 配置解析token的中间件
const expressJWt = require('express-jwt')
const config = require('./config')
app.use(expressJWt({ secret: config.jwtSecretKey }).unless({ path: [/^\/api\/my\//] }))


// 导入并注册用户路由模块
const userRouter = require('./router/user')
app.use('/api/my', userRouter)

// 导入上传轮播图图片路由模块 
const uploadswiperRouter = require('./router/swiper')
app.use('/api/my', uploadswiperRouter)

// 导入上传图片路由模块
const uploadfileRouter = require('./router/uploadfile')
app.use('/api/my', uploadfileRouter)

// 导入上传商品路由模块
const pubgoodsRouter = require('./router/pubgoods')
app.use('/api', pubgoodsRouter)

// 导入首页获取商品列表路由模块 --/api/my
const getgoodslistRouter = require('./router/getgoods')
app.use('/api/my', getgoodslistRouter)

// 导入商品分类路由模块 --/api/my
const goodskindRouter = require('./router/goodskind')
app.use('/api/my', goodskindRouter)

// 导入商品编辑路由模块
const editgoodsRouter = require('./router/editgoods')
app.use('/api/my', editgoodsRouter)

// 导入购买商品的路由模块
const buygoodsRouter = require('./router/buygoods')
app.use('/api', buygoodsRouter)

// 导入订单的路由模块
const ordergoodsRouter = require('./router/ordergoods')
app.use('/api', ordergoodsRouter)

// 导入收藏列表的路由模块
const collectgoodsRouter = require('./router/collectgoods')
app.use('/api', collectgoodsRouter)


// 导入后台收藏商品
const allcollectgoodsRouter = require('./router/collectgoodsadmin')
app.use('/api/my', allcollectgoodsRouter)

// 导入后台订单商品
const ordergoodsadminRouter = require('./router/ordergoodsadmin')
app.use('/api/my', ordergoodsadminRouter)

// 导入后台所有商品列表
const pubgoodsadminRouter = require('./router/pubgoodsadmin')
app.use('/api/my', pubgoodsadminRouter)

// 导入后台轮播图管理界面
const swiperadminRouter = require('./router/swiperadmin')
app.use('/api/my', swiperadminRouter)













// 定义错误级别中间件
app.use((err, req, res, next) => {
    // 捕获验证规则失败导致的错误
    if (err instanceof joi.ValidationError) return res.cc(err)
    // 捕获身份验证失败的错误
    if (err.name = 'UnauthorizedError') return res.cc('身份验证失败!请重新登录')

    // 未知的错误
    res.cc(err)
})

// 挂载图片静态资源
app.use('/api/my/uploads/goods_pic', express.static('./uploads/goods_pic'))

// 挂载轮播图静态资源
app.use('/api/my/uploads/swiper', express.static('./uploads/swiper'))


app.listen(3000, () => {
    console.log('express服务器启动成功~');
});