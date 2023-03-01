const db = require('../db/index')

// 商品发布
exports.pubgoods = (req, res) => {
    let user_id = req.user.user_id
    // 查询该用户
    const sql = `select user_name from user where user_id = ?`
    db.query(sql, user_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.length === 0) return res.cc('找不到该用户')
        let user_name = results[0].user_name

        // 向pub_goods中插入该数据
        const goodsinfo = {
            ...req.body,
            goods_views: 0,
            goods_pub_time: new Date(),
            goods_status: 1,
            pub_user_id: user_id,
            is_delgoods: 0,
            pub_user: user_name
        }
        const sql = `insert into pub_goods set ?`
        db.query(sql, goodsinfo, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('添加失败！')
            res.cc('成功添加！', true)
        })
    })
}


// 我发布的商品
exports.getpubgoods = (req, res) => {
    let user_id = req.user.user_id
    const sql = `select * from pub_goods where is_delgoods = '0' and goods_status = '1' and pub_user_id = ?  order by goods_pub_time desc`
    db.query(sql, user_id, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            ok: true,
            message: '查询成功！',
            data: results
        })
    })
}



// 待发货的商品列表
exports.tradegoods = (req, res) => {
    let user_id = req.user.user_id
    const sql = `select * from pub_goods where goods_status = '2' and pub_user_id = ?  order by goods_pub_time desc`
    db.query(sql, user_id, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            ok: true,
            message: '查询成功！',
            data: results
        })
    })
}

// 待买家确认收货的商品列表
exports.shippedgoods = (req, res) => {
    let user_id = req.user.user_id
    const sql = `select * from pub_goods where goods_status = '3' and pub_user_id = ?  order by goods_pub_time desc`
    db.query(sql, user_id, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            ok: true,
            message: '查询成功！',
            data: results
        })
    })
}

// 交易完成的商品列表
exports.tradefinishedgoods = (req, res) => {
    let user_id = req.user.user_id
    const sql = `select * from pub_goods where 
                 goods_status = '4' and is_delgoods= '0' and pub_user_id = ? 
                 order by goods_pub_time desc`
    db.query(sql, user_id, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            ok: true,
            message: '查询成功！',
            data: results
        })
    })
}


// 修改商品列表
exports.updategoodsdesc = (req, res) => {
    goodsinfo = req.body
    // 修改pub_goods表中的数据
    const sql =
        `update pub_goods set goods_title=? ,goods_desc=?, goods_origin_price=? ,
         goods_present_price=?,goods_contact=?,goods_title_img = ? ,
         goods_swiper_img1 = ?,goods_swiper_img2 = ?,goods_swiper_img3 = ?,goods_swiper_img4 = ?
         where goods_id = ?`
    db.query(sql,
        [
            goodsinfo.goods_title, goodsinfo.goods_desc,
            goodsinfo.goods_origin_price, goodsinfo.goods_present_price,
            goodsinfo.goods_contact, goodsinfo.goods_title_img,
            goodsinfo.goods_swiper_img1, goodsinfo.goods_swiper_img2, goodsinfo.goods_swiper_img3, goodsinfo.goods_swiper_img4,
            goodsinfo.goods_id
        ], (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) return res.cc('禁止重复提交', true)
            // 查询collect_goods表中是否有该数据
            const sql = ` select * from collect_goods where goods_id = ?`
            db.query(sql, goodsinfo.goods_id, (err, results) => {
                if (err) res.cc(err)
                if (results.length === 0) return res.cc('更新成功！', true)
                // 修改collect_goods表中数据
                if (results.length !== 0) {
                    const sql =
                        `update collect_goods set goods_present_price=?,goods_contact=?,goods_title=? ,goods_desc=?,goods_title_img=?
                        where goods_id = ?`
                    db.query(sql,
                        [
                            goodsinfo.goods_present_price, goodsinfo.goods_contact,
                            goodsinfo.goods_title, goodsinfo.goods_desc, goodsinfo.goods_title_img, goodsinfo.goods_id
                        ], (err, results) => {
                            if (err) return res.cc(err)
                            if (results.affectedRows !== 1) return res.cc('更新失败！')
                            return res.cc('更新成功！', true)
                        })
                }
            })
        })
}

// 删除已完成的交易商品
exports.deltradefinishedgoods = (req, res) => {
    const sql = `update pub_goods set is_delgoods = '1' where goods_id = ? and pub_user_id = ?`
    db.query(sql, [req.body.goods_id, req.user.user_id], (err, results) => {
        if (err) res.cc(err)
        if (results.affectedRows !== 1) res.cc('出现错误！')
        res.cc('删除成功！', true)
    })
}


// 获取下架的商品
exports.getremovegoods = (req, res) => {
    const sql = `select * from pub_goods where is_delgoods = '0' and (goods_status = '0' or goods_status = '5') and pub_user_id = ?`
    db.query(sql, req.user.user_id, (err, results) => {
        if (err) return res.cc(err)
        res.send({
            ok: true,
            message: '查询成功！',
            data: results
        })
    })
}


// 下架我发布的商品
exports.delgoodsitem = (req, res) => {
    const sql = `update pub_goods set goods_status = '0' where goods_id = ?`
    // console.log(req.body.goods_id);
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('下架失败')
        // 判断该商品是否有人收藏
        const sql = `select * from collect_goods where  goods_id = ?`
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) return res.cc(err)
            if (results.length !== 0) {
                // 修改收藏表中的商品状态
                const sql = `update collect_goods set goods_status = '2' where goods_id = ?`
                db.query(sql, req.body.goods_id, (err, results) => {
                    if (err) return res.cc(err)
                    if (results.affectedRows !== 1) return res.cc('下架失败')
                    return res.cc('下架成功！', true)
                })
            }
            if (results.length === 0) {
                return res.cc('下架成功！', true)
            }
        })

    })
}
// 删除下架的商品
exports.removegoods = (req, res) => {
    const sql = `update pub_goods set is_delgoods = '1' where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('删除失败')
        res.cc('删除成功！', true)
    })
}

// 重新上架商品
exports.readdpubgoods = (req, res) => {
    const sql = `update pub_goods set goods_status = '1' where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('上架失败')
        // 判断该商品是否有人收藏
        const sql = `select * from collect_goods where  goods_id = ?`
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) return res.cc(err)
            if (results.length !== 0) {
                // 修改收藏表中的商品状态
                const sql = `update collect_goods set goods_status = '1' where goods_id = ?`
                db.query(sql, req.body.goods_id, (err, results) => {
                    if (err) return res.cc(err)
                    if (results.affectedRows !== 1) return res.cc('修改收藏表失败')
                    return res.cc('上架成功！', true)
                })
            }
            if (results.length === 0) {
                return res.cc('上架成功！', true)
            }
        })

    })
}