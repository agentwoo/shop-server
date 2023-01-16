const db = require('../db/index')

// 商品发布
exports.pubgoods = (req, res) => {
    const goodsinfo = {
        ...req.body,
        goods_views: 0,
        goods_pub_time: new Date(),
        goods_status: 1,
        pub_user_id: 3,
        is_delgoods: 0,
    }
    const sql = `insert into pub_goods set ?`
    db.query(sql, goodsinfo, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('添加失败！')
        res.cc('成功添加！', true)
    })
}


// 我发布的商品
exports.getpubgoods = (req, res) => {
    const sql = `select * from pub_goods where pub_user_id = ? order by goods_pub_time desc`
    // const pub_user_id = req.user.id

    db.query(sql, 3, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            ok: true,
            message: '查询成功！',
            data: results
        })
    })
}


// 删除我发布的商品
exports.delgoodsitem = (req, res) => {
    const sql = `update pub_goods set is_delgoods = '1' where goods_id = ?`
    // console.log(req.body.goods_id);
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) res.cc(err)
        res.cc('删除成功！', true)
    })
}




