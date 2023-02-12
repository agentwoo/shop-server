const db = require('../db/index')

//添加收藏 --- 需要获取用的token
exports.addcollectgoods = (req, res) => {
    // console.log('addcollect', req.user.user_id);
    let user_id = req.user.user_id
    const sql = `select * from collect_goods where goods_id = ? and collect_user_id = ?`
    db.query(sql, [req.body.goods_id, user_id], (err, results) => {
        // 校验是否重复收藏
        if (err) res.cc(err)
        if (results.length === 1) res.cc('该商品已经收藏过了')
        if (results.length === 0) {
            // 添加收藏
            const sql = `select * from pub_goods where goods_id = ?`
            db.query(sql, req.body.goods_id, (err, results) => {
                if (err) res.cc(err)
                if (results.length === 0) res.cc('查询出错！')
                let goodsinfo = results[0]
                let collectgoodsinfo = {
                    collect_user_id: user_id,//此处收藏者id需要由前端传入
                    goods_id: goodsinfo.goods_id,
                    collect_create_time: new Date(),
                    goods_present_price: goodsinfo.goods_present_price,
                    goods_title_img: goodsinfo.goods_title_img,
                    goods_contact: goodsinfo.goods_contact,
                    goods_status: goodsinfo.goods_status,
                    goods_title: goodsinfo.goods_title,
                    goods_desc: goodsinfo.goods_desc,
                    is_delgoods: goodsinfo.is_delgoods
                }
                // 将商品详情插入到订单表里
                const sql = `insert into collect_goods set ?`
                db.query(sql, collectgoodsinfo, (err, results) => {
                    if (err) return res.cc(err)
                    if (results.affectedRows !== 1) return res.cc('添加失败！')
                    res.cc('成功添加收藏！', true)
                })
            })
        }
    })
}



// 获取收藏列表 --- 需要token
exports.getcollectgoods = (req, res) => {
    let user_id = req.user.user_id
    const sql = `select * from collect_goods where collect_user_id = ? and goods_status = '1'`
    //  此处的collect_user_id需由前端传
    db.query(sql, user_id, (err, results) => {
        if (err) res.cc(err)
        // if (results.length === 0) res.cc('暂无查询结果')
        res.send({
            ok: true,
            message: '查询成功！',
            data: results
        })
    })
}

// 取消收藏
exports.delcollectgoods = (req, res) => {
    const sql = `delete from collect_goods where collect_id = ?`
    db.query(sql, req.body.collect_id, (err, results) => {
        if (err) res.cc(err)
        if (results.affectedRows !== 1) res.cc('取消收藏失败！')
        res.cc('成功取消收藏！', true)
    })
}



// 失效收藏列表 --- 需要token
exports.expirecollectgoods = (req, res) => {
    let user_id = req.user.user_id
    const sql = `select * from collect_goods where collect_user_id = ?  and goods_status != '1'`
    db.query(sql, user_id, (err, results) => {
        if (err) res.cc(err)
        // if (results.length === 0) res.cc('暂无商品失效！')
        res.send({
            ok: true,
            message: '查询成功！',
            data: results
        })
    })
}
