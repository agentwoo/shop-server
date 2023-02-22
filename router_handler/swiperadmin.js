const db = require('../db/index')


// 添加轮播图
exports.addswiperadmin = (req, res) => {
    const sql = `insert into swiper set ?`
    db.query(sql, { swiper_url: req.body.file }, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('添加失败！')

        // 获取插入到数据库的数据
        const sql = `select * from swiper where swiper_url = ?`
        db.query(sql, req.body.file, (err, results) => {
            if (err) return res.cc(err)
            if (results.length !== 1) return res.cc('添加失败')
            res.send({
                ok: true,
                message: '添加成功',
                data: results[0]
            })
        })
    })
}

// 删除轮播图
exports.delswiperadmin = (req, res) => {
    const sql = `delete from swiper where swiper_id = ?`
    db.query(sql, req.body.swiper_id, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('删除失败')
        res.cc('删除成功', true)
    })
}

// 修改轮播图
exports.updateswiperadmin = (req, res) => {
    const sql = `update swiper set swiper_url =? where swiper_id =?`
    db.query(sql, [req.body.file, req.body.swiper_id], (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('修改失败')
        res.cc('修改成功', true)
    })
}