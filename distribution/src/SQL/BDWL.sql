-- 1
-- 消费者
create table Customer (
  cuID         varchar(20) primary key, -- 消费者ID 
  customerName varchar(20), -- 姓名
  customerPaw  varchar(20), -- 密码
  customerSex  char(10), -- 性别
  Brithday     date, -- 出生日期
  Tel          varchar(20), -- 电话
  Address      varchar(20), -- 地址
  `Comment`    varchar(50) -- 备注
);

-- 车辆
create table Car(
  carID varchar(20)  primary key,
  routeID varchar(20),
  carType varchar(20),
  carOrgin varchar(50),
  carProDate datetime,
  carBuyDate datetime,
  carCapacity int,
  carState bit,
  `Comment` varchar(100),
  foreign key(routeID) references route(routeID)
);

create table Role(
  roleID varchar(20) primary key ,
  roleName varchar(20),
  `Comment` varchar(100)
);

create table Manager(
  mgID varchar(20) primary key ,
  roleID varchar(20),
  managerName varchar(20),
  managerPsd varchar(20),
  managerSex char(10),
  Tel varchar(20),
  Address varchar(50),
  `Comment` varchar(100),
  foreign key (roleID) references Role(roleID)
);

create table DeliveryPlace(
  dePID varchar(20) primary key ,
  mgID varchar(20),
  dePNAme varchar(20),
  provinceName varchar(20),
  cityName varchar(20),
  mgName varchar(20),
  dePTel varchar(20),
  dePAddr varchar(100),
  `Comment` varchar(100),
  foreign key (mgID) references Manager(mgID)
);

create table DeliveryRange(
  rangeID varchar(20) primary key ,
  dePID varchar(20),
  areaID varchar(20),
  rangeName varchar(20),
  deliveryPrice decimal(20),
  `Comment` varchar(100)
 -- foreign key (dePID) references DeliveryPlace (dePID),
 --  foreign key (areaID)references CityArea(areaID)
);

create table CityArea(
  areaID varchar(20) primary key ,
  cityID varchar(20),
  rangeID varchar(20),
  areaName varchar(20),
  cityName varchar(20)
 -- foreign key (cityID) references City(cityID),
 -- foreign key (rangeID) references DeliveryRange(rangeID)
);
alter table DeliveryRange add constraint fk_dePID foreign key (dePID) references DeliveryPlace(dePID);
alter table DeliveryRange add constraint fk_dePID2 foreign key (areaID) references CityArea(areaID);
alter table CityArea add constraint fk_dePID3 foreign key (cityID) references City(cityID);
alter table CityArea add constraint fk_dePID4 foreign key (rangeID) references DeliveryRange(rangeID);

create table City(
  cityID varchar(20) primary key ,
  provinceID varchar(20),
  cityName varchar(20),
  provinceName varchar(20),
  foreign key (provinceID) references Privance(provinceID)
);

create table Privance(
  provinceID varchar(20) primary key ,
  provinceName varchar(20)
);

create table Route(
  routeID varchar(20) primary key ,
  cityID varchar(20),
  provinceID varchar(20),
  routName varchar(20),
  startProvince varchar(20),
  startCity varchar(20),
  endProvince varchar(20),
  endCity varchar(20),
  minProvince varchar(20),
  midCity varchar(20),
  transportPrice decimal(20),
  `Comment` varchar(100),
  foreign key (cityID) references City(cityID),
  foreign key (provinceID) references Privance(provinceID)
);


create table `Order`(
  orderID varchar(20) primary key,
  carID varchar(20),
  cuID varchar(20),
  postPName varchar(20),
  postPTel varchar(20),
  postPAddr varchar(20),
  getPName varchar(20),
  getPTeL varchar(20),
  getPAddr varchar(50),
  goodsName varchar(100),
  goodsWeight int,
  orderType varchar(10),
  orderState varchar(20),
  transportPrice decimal(20),
  deliveryPrice decimal(20),
  totalPrice varchar(20),
  `Comment` nvarchar(100),
  foreign key(carID) references Car(carID),
  foreign key (cuID) references Customer(cuID)
);

create table DeliveryReceipt(
  deliveryReceiptID varchar(20) primary key ,
  startCity varchar(20),
  endCity varchar(20),
  midCity varchar(20),
  makeDtae datetime,
  State varchar(20),
  `COMMENT` varchar(100)
);
