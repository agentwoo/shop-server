// 导入验证规则的包
const joi = require('joi')

const goods_id = joi.string().required()

exports.goods_id_schema = {
    body: {
        goods_id,
    }
}