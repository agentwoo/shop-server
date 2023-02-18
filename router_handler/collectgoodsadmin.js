const db = require('../db/index')

// 获取所有收藏商品
exports.getallcollectgoods = (req, res) => {
    // if (req.user.user_name !== 'admin') return res.cc('该账号不是管理员')
    const sql = `select * from collect_goods`
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