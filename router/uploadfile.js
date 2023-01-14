const express = require('express')
const router = express.Router()
const path = require('path')
const multer = require('multer')

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './uploads/goods_pic/');
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname));
    }
})
const upload = multer({ storage })


router.post('/uploadfile', upload.single('cover_img'), (req, res) => {
    res.send(req.file.filename)
})


module.exports = router