const mysql = require('mysql')

// 创建数据库连接对象
const db = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: 'sumdoo',
    database: 'graduation_project',
})

// 向外共享 db 数据库连接对象
module.exports = db