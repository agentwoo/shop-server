// 导入验证规则的包
const joi = require('joi')

const goods_title = joi.string().alphanum().pattern(/^[\S]{0,7}$/).required()
const goods_desc = joi.string().alphanum().pattern(/^[\S]{0,20}$/).required()
const goods_origin_price = joi.string().pattern(/^[\S]{0,5}$/).required()
const goods_present_price = joi.string().pattern(/^[\S]{0,5}$/).required()
const goods_title_img = joi.string().required().required()
const goods_contact = joi.string().alphanum().pattern(/^[\S]{0,20}$/).required()
const goods_pid = joi.string().required()
const goods_kind = joi.string().required()
const goods_swiper_img1 = joi.string().required()
const goods_swiper_img2 = joi.string().required()
const goods_swiper_img3 = joi.string().required()
const goods_swiper_img4 = joi.string().required()



const pub_user_id = joi.string().min(1)

const goods_id = joi.string().min(1).required()

exports.pubgoods_schema = {
    body: {
        goods_title,
        goods_desc,
        goods_origin_price,
        goods_present_price,
        goods_title_img,
        goods_contact,
        goods_pid,
        goods_kind,
        goods_swiper_img1,
        goods_swiper_img2,
        goods_swiper_img3,
        goods_swiper_img4,
    },
}
exports.getpubgoods_schema = {
    body: {
        pub_user_id,
    }
}

exports.delgoodsitem_schema = {
    body: {
        goods_id,
    }
}