const db = require('../db/index')


// 获取轮播图
exports.getswiper = (req, res) => {
    const sql = `select * from swiper`
    db.query(sql, (err, result) => {
        if (err) return res.cc(err)
        if (result.length === 0) return res.cc('查询失败！')
        res.send({
            ok: true,
            message: '查询成功！',
            data: result
        })
    })
}