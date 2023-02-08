const db = require('../db/index')

// 商品点击量加1
exports.updateviews = (req, res) => {
    const sql = `update pub_goods set goods_views = goods_views +1 where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) res.cc(err)
        res.cc('修改成功', true)
    })
}