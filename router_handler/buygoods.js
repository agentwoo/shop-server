const db = require('../db/index')

// 购买商品,并将商品数据插入到订单列表里
exports.buygoodsitem = (req, res) => {
    let user_id = req.user.user_id
    // 将商品状态改为2
    const sql = `update pub_goods set goods_status = '2' where goods_id = ?`
    db.query(sql, req.body.goods_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) res.cc(err)
        // 获取修改商品状态后的商品详情
        const sql = `select * from pub_goods where goods_id = ?`
        db.query(sql, req.body.goods_id, (err, results) => {
            if (err) return res.cc(err)
            if (results.length === 0) res.cc(err)
            let goodsitem = results[0]
            const goodsinfo = {
                is_delorder: 0,
                order_create_time: new Date(),
                buy_user_id: user_id,//此处购买者id需要由前端传入
                goods_id: goodsitem.goods_id,
                goods_present_price: goodsitem.goods_present_price,
                goods_title_img: goodsitem.goods_title_img,
                goods_contact: goodsitem.goods_contact,
                goods_status: goodsitem.goods_status,
                goods_title: goodsitem.goods_title,
                goods_desc: goodsitem.goods_desc,
            }
            // 将商品详情插入到订单表里
            const sql = `insert into goods_order set ?`
            db.query(sql, goodsinfo, (err, results) => {
                if (err) return res.cc(err)
                if (results.affectedRows !== 1) return res.cc('添加失败！')
                res.cc('成功添加！', true)
            })



            // 将收藏列表的商品状态改为2
            const sql2 = `select * from collect_goods where goods_id = ?`
            db.query(sql2, req.body.goods_id, (err, results) => {
                if (err) res.cc(err)
                if (results.length !== 0) {
                    const sql = `update collect_goods set goods_status = '2' where goods_id= ?`
                    db.query(sql, req.body.goods_id, (err, results) => {
                        if (err) res.cc(err)
                    })
                }
            })
        })
    })
}