const db = require('../db/index')

// 删除已完成的交易商品
exports.getallgoodsadmin = (req, res) => {
    const sql = `select * from pub_goods`
    db.query(sql, (err, results) => {
        if (err) res.cc(err)
        if (results.length === 0) res.cc('暂无查询', true)
        res.send({
            ok: true,
            message: '查询成功',
            data: results
        })
    })
}