const db = require('../db/index')
/* 需要获取用户id */

// 获取购买商品列表
exports.getordergoods = (req, res) => {
    const sql = `select * from goods_order where buy_user_id = ? and is_delorder = 0 and goods_status between 2 and 3`
    db.query(sql, 2, (err, results) => {
        if (err) res.cc(err)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
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
        // 修改goods_status表中的信息
        const sql = `update pub_goods set goods_status = '1' where goods_id = ?`
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) res.cc(err)
            if (results.affectedRows !== 1) res.cc(err)
            res.cc('取消成功', true)
        })
    })
}