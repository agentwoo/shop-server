const db = require('../db/index')

// 获取所有订单的商品列表
exports.getallordergoods = (req, res) => {
    const sql = `select * from goods_order`
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