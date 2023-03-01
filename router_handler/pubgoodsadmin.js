const db = require('../db/index')

// 获取所有商品数据
exports.getallgoodsadmin = (req, res) => {
    const sql = `select * from pub_goods`
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

// 下架商品
exports.removegoodsadmin = (req, res) => {
    const sql = `update pub_goods set  goods_status = '5' where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows === 0) return res.cc('下架失败')
        // 判断是否有人收藏该商品
        const sql = `select * from collect_goods where goods_id = ?`
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) return res.cc(err)
            if (results.length !== 0) {
                // 将收藏表中商品状态设为失效
                const sql = `update collect_goods set goods_status = '2' where goods_id = ?`
                db.query(sql, req.body.goods_id, (err, results) => {
                    if (err) return res.cc(err)
                    if (results.affectedRows === 0) return res.cc('修改收藏表失败')
                    res.cc('下架成功', true)
                })
            }
            if (results.length === 0) {
                res.cc('下架成功', true)
            }
        })

    })
}