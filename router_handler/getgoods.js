const db = require('../db/index')

// 获取单个商品详情
exports.getgoodsdesc = (req, res) => {
    // console.log(req.body.goods_id);
    const sql = `select * from pub_goods where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 0) return res.cc('暂无查询！', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}

// 获取全部商品
exports.getallgoodsList = (req, res) => {
    const sql = `select * from pub_goods where goods_status = '1' and is_delgoods = '0'`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 0) return res.cc('暂无查询！', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}

// 获取最新商品列表
exports.getnewgoodsList = (req, res) => {
    const sql = `select * from pub_goods where goods_status = '1' and is_delgoods = '0' order by goods_pub_time desc `
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 0) return res.cc('暂无查询！', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}


// 获取热门商品列表
exports.gethotgoodsList = (req, res) => {
    const sql = `select * from pub_goods where goods_status = '1' and is_delgoods = '0' order by goods_views desc ,goods_present_price desc`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 0) return res.cc('暂无查询！', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}


// 获取免费商品列表
exports.getfreegoodsList = (req, res) => {
    const sql = `select * from pub_goods where goods_present_price = '0' and goods_status = '1' and is_delgoods = '0'`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 0) return res.cc('暂无查询！', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}

// 获取搜索商品列表
exports.getsearchgoodsList = (req, res) => {
    const sql =
        `select * from pub_goods 
         where goods_status = '1' 
         and is_delgoods = '0' 
         and goods_title like '%${req.query.searchVal}%' order by goods_present_price,goods_views desc`

    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}




