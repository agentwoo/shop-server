const db = require('../db/index')
/* 需要获取用户id */

// 获取待发货的商品列表
exports.gettradeordergoods = (req, res) => {
    const sql = `select * from goods_order where buy_user_id = ? and is_delorder = 0 and goods_status = '2'`
    db.query(sql, 2, (err, results) => {
        if (err) res.cc(err)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
        // console.log(results);
    })
}

// 获取已发货的商品列表
exports.getshippedgoods = (req, res) => {
    const sql = `select * from goods_order where buy_user_id = ? and is_delorder = 0 and goods_status= '3'`
    db.query(sql, 2, (err, results) => {
        if (err) res.cc(err)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
        // console.log(results);
    })
}



// 获取已完成的商品列表
exports.getfinishordergoods = (req, res) => {
    const sql = `select * from goods_order where buy_user_id = ? and is_delorder = 0 and goods_status = 4`
    db.query(sql, 2, (err, results) => {
        if (err) res.cc(err)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}


// 取消订单
exports.cancelordergoods = (req, res) => {
    // 删除goods_order表中的信息
    const sql = `delete from goods_order where goods_id = ? `
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) res.cc(err)
        if (results.affectedRows !== 1) res.cc(err)
        // 修改pub_goods表中goods_status的信息
        const sql = `update pub_goods set goods_status = '1' where goods_id = ?`
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) res.cc(err)
            if (results.affectedRows !== 1) res.cc(err)
            res.cc('取消成功!', true)
        })
    })
}


// 确认收货
exports.confirmordergoods = (req, res) => {
    // 修改goods_order表中goods_status的信息
    const sql = `update goods_order set goods_status = '4' where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) res.cc(err)
        if (results.affectedRows !== 1) res.cc(err)
        // 修改pub_goods表中goods_status的信息
        const sql = `update pub_goods set goods_status = '4' where goods_id = ?`
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) res.cc(err)
            if (results.affectedRows !== 1) res.cc(err)
            res.cc('收货成功！', true)
        })
    })
}

// 确认发货
exports.confirmsendgoods = (req, res) => {
    // 修改goods_order表中goods_status的信息
    const sql = `update goods_order set goods_status = '3' where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) res.cc(err)
        if (results.affectedRows !== 1) res.cc(err)
        // 修改pub_goods表中goods_status的信息
        const sql = `update pub_goods set goods_status = '3' where goods_id = ?`
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) res.cc(err)
            if (results.affectedRows !== 1) res.cc(err)
            res.cc('发货成功！', true)
        })
    })
}