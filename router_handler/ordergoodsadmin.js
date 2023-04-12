const db = require('../db/index')

// 获取所有订单的商品列表
exports.getallordergoods = (req, res) => {
    const sql = `select * from goods_order order by order_id desc`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 0) return res.cc('暂无查询', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}

// 将商品设置为未发货
exports.updateunsendadmin = (req, res) => {
    const sql = `update goods_order set goods_status = '2' where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('修改失败')
        const sql = `update pub_goods set goods_status = '2' where goods_id = ? `
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('修改失败')
            res.cc('修改成功', true)
        })
    })
}

// 将商品设置为已收货
exports.updatefinishedadmin = (req, res) => {
    const sql = `update goods_order set goods_status = '4' where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('修改失败')
        const sql = `update pub_goods set goods_status = '4' where goods_id = ? `
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('修改失败')
            res.cc('修改成功', true)
        })
    })
}

// 将商品设置为已发货
exports.updatefinishedtradadmin = (req, res) => {
    const sql = `update goods_order set goods_status = '3' where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('修改失败')
        const sql = `update pub_goods set goods_status = '3' where goods_id = ? `
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('修改失败')
            res.cc('修改成功', true)
        })
    })
}