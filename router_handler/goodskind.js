const db = require('../db/index')


// 获取商品分类菜单
exports.getgoodskind = (req, res) => {
    const sql = `select * from goods_kind`
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
