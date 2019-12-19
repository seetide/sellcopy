create table 'product_info'(
    'product_id' varchar(32) not null,
    'product_name' varchar(64) not null comment 'product name',
    'product_price' decimal(8, 2) not  null comment 'unit price',
    'product_stock' int not null comment 'stock of this product',
    'product_description' varchar(64) comment 'description',
    'product_icon' varchar(512) comment 'small picture',
    'category_type' int not null comment 'category type',
    'create_time' timestamp not  null default current_timestamp comment 'created time',
    'update_time' timestamp  not null default current_timestamp on update current_timestamp comment 'update time',

    primary key ('product_id')
) comment 'product table';

create table 'product_category'(
    'category_id' int not null auto_increment;
    'category_name' varchar(64) not null comment 'name for category',
    'category_type' int not null comment 'category type',
    'create_time' timestamp not  null default current_timestamp comment 'created time',
    'update_time' timestamp  not null default current_timestamp on update current_timestamp comment 'update time',
    primary key ('category_id'),
    unique key 'uqe_category_type' ('category_type')
) comment 'category of products';

create table 'order_master' (
    'order_id' varchar(32) not null,
    'buyer_name' varchar(32) not null,
    'buyer_phone' varchar(32) not null comment 'phone number of buyer',
    'buyer_address' varchar(128) not null,
    'buyer_openid' varchar(64) not null comment 'buyer wechat openid',
    'order_amount' decimal(8,2) not null comment 'total amount of the order',
    'order_status' tinyint(3) not null default '0' comment 'status of the order, default is 0. new order',
    'pay_status' tinyint(3) not null default '0' comment 'status of payment, default is 0. not paid',

    primary key ('order_id'),
    key 'idx_buyer_openid' (buyer__openid)
) comment 'order master table';

create table 'order_detail' (
    'detail_id' varchar(32) not null,
    'order_id' varchar(32) not null,
    'product_id' varchar(32) not null,
    'product_name' varchar(64) not null,
    'product_price' decimal(8, 2) not null,
    'product_quantity' int not null,
    'product_icon' varchar(512) ,
    'create_time' timestamp not  null default current_timestamp comment 'created time',
    'update_time' timestamp  not null default current_timestamp on update current_timestamp comment 'update time',

    primary key ('detail_id')
    key 'idx_order_id' ('order_id')
) comment 'details of each item in the order master table';