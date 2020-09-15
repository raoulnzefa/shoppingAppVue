/* 
**created by Agampreet Singh aka artisticGeek
** LinkedIn: https://www.linkedin.com/in/agampreet-singh-arora/
** website: www.agampreetsingh.com
** github: www.github.com/agampreetsingh
*/
const Sequelize = require('sequelize')

const db = new Sequelize({
  host: 'localhost',
  dialect: 'sqlite',
  storage: 'data.db',
});

db.authenticate()
  .then(() => console.log("Connected"))
  .catch((err) => console.error("Unable to authenticate."))

const Vendor = db.define('vendors', {
  id: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  name: {
    type: Sequelize.STRING,
    allowNull: false
  }
});

const User=db.define('users',{
    id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
      },
    username:{
        type:Sequelize.STRING(30),
        unique:true,
        allowNull:false,
    },
    password:{
        type:Sequelize.STRING,
        allowNull:false
    }
  });

const Product = db.define('products', {
  id: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  name: Sequelize.STRING,
  price: {
    type: Sequelize.INTEGER,
    allowNull: false,
    defaultValue: 0
  }

});

const Cart = db.define('cart', {
  id: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  quantity: {
    type: Sequelize.INTEGER,
    allowNull: false,
    defaultValue: 1
  },
  name: {
    type: Sequelize.STRING,
    allowNull: false
  },
  price: {
    type: Sequelize.INTEGER,
    allowNull: false
  }
});

Product.belongsTo(Vendor, {foreignKey: 'manufacturerId'})
Cart.belongsTo(Product, {foreignKey: 'productId'});
Cart.belongsTo(User,{foreignKey: 'userId'});
db.sync().then(() => console.log("Database created successfully."));


let addUser=function(name,password)
{
    User.create()
}
module.exports = {
  Vendor, Product, Cart, User
}
