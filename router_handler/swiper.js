const db = require('../db/index')

// 获取轮播图
exports.getswiper = (req, res) => {
    const sql = `select swiper_img1,swiper_img2,swiper_img3,swiper_img4 from swiper where swiper_id = 1`
    db.query(sql, (err, result) => {
        if (err) return res.cc(err)
        if (result.length !== 1) return res.cc('查询失败!')
        res.send({
            ok: true,
            data: result
        })
    })
}