const express = require('express')
const router = express.Router()
const path = require('path')
const multer = require('multer')

const { getswiper } = require('../router_handler/swiper')

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './uploads/swiper/');
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname));
    }
})
const upload = multer({ storage })


// 上传轮播图
router.post('/uploadswiper', upload.single('file'), (req, res) => {
    res.send({
        ok: true,
        message: '上传成功',
        data: req.file.filename
    })
})

// 获取轮播图
router.get('/getswiper', getswiper)


module.exports = router