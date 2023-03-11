const db = require('../db/index')


// 获取商品分类菜单
exports.getgoodskind = (req, res) => {
    const sql = `select * from goods_kind order by value`
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


// 添加商品分类
exports.addgoodskind = (req, res) => {
    const sql = `select * from goods_kind where text = ? and value = ?`
    db.query(sql, [req.body.text, req.body.value], (err, results) => {
        if (err) res.cc(err)
        if (results.length === 2) return res.cc('已存在该分类，请重试！', true)
        if (results.length === 1) return res.cc('分类名或值已存在,请重试！', true)
        const sql = `insert into goods_kind set ?`
        db.query(sql, { text: req.body.text, value: req.body.value }, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows !== 1) {
                return res.cc('添加失败，请重试！')
            }
            res.cc('添加成功！', true)
        })
    })
}


// 修改商品分类名称
exports.editgoodskindtext = (req, res) => {
    const sql = `update goods_kind set text = ?,value = ? where kind_id = ?`
    db.query(sql, [req.body.text, req.body.value, req.body.kind_id], (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows === 0) return res.cc('修改失败，请重试！', true)
        // 查询pub_goods中是否有该分类的商品
        const sql = `select * from pub_goods where goods_pid = ?`
        db.query(sql, req.body.value, (err, results) => {
            if (err) return res.cc(err)
            if (results.length !== 0) {
                // 修改已发布商品列表中的商品分类名称
                const sql = `update pub_goods set goods_kind = ? where goods_pid = ?`
                db.query(sql, [req.body.text, req.body.value], (err, results) => {
                    if (err) return res.cc(err)
                    if (results.affectedRows === 0) return res.cc('修改pubgoods失败')
                    res.cc('修改成功！', true)
                })
            }
            if (results.length === 0) {
                res.cc('修改成功', true)
            }
        })
    })
}


// exports.editgoodskindtext = (req, res) => {
//     const sql = `update goods_kind set text = ? where kind_id = ?`
//     db.query(sql, [req.body.text, req.body.kind_id], (err, results) => {
//         if (err) return res.cc(err)
//         if (results.affectedRows === 0) return res.cc('修改失败，请重试！', true)
//         // 查询pub_goods中是否有该分类的商品
//         const sql = `select * from pub_goods where goods_pid = ?`
//         db.query(sql, req.body.value, (err, results) => {
//             if (err) return res.cc(err)
//             if (results.length !== 0) {
//                 // 修改已发布商品列表中的商品分类名称
//                 const sql = `update pub_goods set goods_kind = ? where goods_pid = ?`
//                 db.query(sql, [req.body.text, req.body.value], (err, results) => {
//                     if (err) return res.cc(err)
//                     if (results.affectedRows === 0) return res.cc('修改pubgoods失败')
//                     res.cc('修改成功！', true)
//                 })
//             }
//             if (results.length === 0) {
//                 res.cc('修改成功', true)
//             }
//         })
//     })
// }

// 删除分类---当该分类存在商品时则不允许删除
exports.delgoodskind = (req, res) => {
    const sql = `select * from pub_goods where goods_pid = ?`
    db.query(sql, req.body.value, (err, results) => {
        if (err) return res.cc(err)
        if (results.length !== 0) return res.cc('该分类存在商品，不允许删除')
        const sql = `delete from goods_kind where value = ?`
        db.query(sql, req.body.value, (err, results) => {
            if (err) return res.cc(err)
            if (results.affectedRows === 0) return res.cc('删除失败')
            res.cc('删除成功！', true)
        })
    })
}
