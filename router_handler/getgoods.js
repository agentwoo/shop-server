const db = require('../db/index')


// 获取全部商品
exports.getallgoodsList = (req, res) => {
    const sql = `select * from pub_goods`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 1) return res.cc('暂无查询！', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}

// 获取最新商品列表
exports.getnewgoodsList = (req, res) => {
    const sql = `select * from pub_goods order by goods_pub_time desc`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 1) return res.cc('暂无查询！', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}


// 获取热门商品列表
exports.gethotgoodsList = (req, res) => {
    const sql = `select * from pub_goods order by goods_views desc`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 1) return res.cc('暂无查询！', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}


// 获取免费商品列表
exports.getfreegoodsList = (req, res) => {
    const sql = `select * from pub_goods where goods_present_price = '0'`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 1) return res.cc('暂无查询！', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}




