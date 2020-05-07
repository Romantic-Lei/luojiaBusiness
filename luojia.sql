prompt PL/SQL Developer import file
prompt Created on 2020年5月5日 by asus
set feedback off
set define off
prompt Creating CONTRACT_C...
create table CONTRACT_C
(
  CONTRACT_ID     VARCHAR2(40) not null,
  OFFEROR         VARCHAR2(200),
  CONTRACT_NO     VARCHAR2(50),
  SIGNING_DATE    TIMESTAMP(6),
  INPUT_BY        VARCHAR2(30),
  CHECK_BY        VARCHAR2(30),
  INSPECTOR       VARCHAR2(30),
  TOTAL_AMOUNT    NUMBER(10,2),
  IMPORT_NUM      INTEGER,
  CREQUEST        VARCHAR2(2000),
  CUSTOM_NAME     VARCHAR2(200),
  DELIVERY_PERIOD TIMESTAMP(6),
  SHIP_TIME       TIMESTAMP(6),
  TRADE_TERMS     VARCHAR2(30),
  REMARK          VARCHAR2(600),
  PRINT_STYLE     CHAR(1),
  OLD_STATE       INTEGER,
  STATE           INTEGER,
  OUT_STATE       INTEGER,
  CREATE_BY       VARCHAR2(40),
  CREATE_DEPT     VARCHAR2(40),
  CREATE_TIME     TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTRACT_C
  add constraint PK_CONTRACT_C primary key (CONTRACT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CONTRACT_HIS_C...
create table CONTRACT_HIS_C
(
  CONTRACT_ID     VARCHAR2(40) not null,
  OFFEROR         VARCHAR2(200),
  CONTRACT_NO     VARCHAR2(50),
  SIGNING_DATE    TIMESTAMP(6),
  INPUT_BY        VARCHAR2(30),
  CHECK_BY        VARCHAR2(30),
  INSPECTOR       VARCHAR2(30),
  TOTAL_AMOUNT    NUMBER(10,2),
  IMPORT_NUM      INTEGER,
  CREQUEST        VARCHAR2(2000),
  CUSTOM_NAME     VARCHAR2(200),
  DELIVERY_PERIOD TIMESTAMP(6),
  SHIP_TIME       TIMESTAMP(6),
  TRADE_TERMS     VARCHAR2(30),
  REMARK          VARCHAR2(600),
  PRINT_STYLE     CHAR(1),
  OLD_STATE       INTEGER,
  STATE           INTEGER,
  OUT_STATE       INTEGER,
  CREATE_BY       VARCHAR2(40),
  CREATE_DEPT     VARCHAR2(40),
  CREATE_TIME     TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTRACT_HIS_C
  add constraint PK_CONTRACT_HIS_C primary key (CONTRACT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CONTRACT_PRODUCT_C...
create table CONTRACT_PRODUCT_C
(
  CONTRACT_PRODUCT_ID VARCHAR2(40) not null,
  CONTRACT_ID         VARCHAR2(40),
  FACTORY_ID          VARCHAR2(40),
  FACTORY_NAME        VARCHAR2(50),
  PRODUCT_NO          VARCHAR2(50),
  PRODUCT_IMAGE       VARCHAR2(200),
  PRODUCT_DESC        VARCHAR2(600),
  CNUMBER             INTEGER,
  OUT_NUMBER          INTEGER,
  LOADING_RATE        VARCHAR2(10),
  BOX_NUM             INTEGER,
  PACKING_UNIT        VARCHAR2(60),
  PRICE               NUMBER(10,2),
  AMOUNT              NUMBER(10,2),
  FINISHED            INTEGER,
  EXTS                VARCHAR2(50),
  ORDER_NO            INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTRACT_PRODUCT_C
  add constraint PK_CONTRACT_PRODUCT_C primary key (CONTRACT_PRODUCT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CONTRACT_PRODUCT_HIS_C...
create table CONTRACT_PRODUCT_HIS_C
(
  CONTRACT_PRODUCT_ID VARCHAR2(40) not null,
  CONTRACT_ID         VARCHAR2(40),
  FACTORY_ID          VARCHAR2(40),
  FACTORY_NAME        VARCHAR2(50),
  PRODUCT_NO          VARCHAR2(50),
  PRODUCT_IMAGE       VARCHAR2(200),
  PRODUCT_DESC        VARCHAR2(600),
  CNUMBER             INTEGER,
  OUT_NUMBER          INTEGER,
  LOADING_RATE        VARCHAR2(10),
  BOX_NUM             INTEGER,
  PACKING_UNIT        VARCHAR2(10),
  PRICE               NUMBER(10,2),
  AMOUNT              NUMBER(10,2),
  FINISHED            INTEGER,
  EXTS                VARCHAR2(50),
  ORDER_NO            INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CONTRACT_PRODUCT_HIS_C
  add constraint PK_CONTRACT_PRODUCT_HIS_C primary key (CONTRACT_PRODUCT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating EXPORT_C...
create table EXPORT_C
(
  EXPORT_ID         VARCHAR2(40) not null,
  INPUT_DATE        TIMESTAMP(6),
  CONTRACT_IDS      VARCHAR2(500),
  CUSTOMER_CONTRACT VARCHAR2(200),
  LCNO              VARCHAR2(10),
  CONSIGNEE         VARCHAR2(100),
  MARKS             VARCHAR2(1000),
  REMARK            VARCHAR2(100),
  SHIPMENT_PORT     VARCHAR2(100),
  DESTINATION_PORT  VARCHAR2(100),
  TRANSPORT_MODE    VARCHAR2(10),
  PRICE_CONDITION   VARCHAR2(10),
  STATE             INTEGER,
  GROSS_WEIGHT      NUMBER(5,2),
  NET_WEIGHT        NUMBER(5,2),
  MEASUREMENT       NUMBER(8,2),
  CREATE_BY         VARCHAR2(40),
  CREATE_DEPT       VARCHAR2(40),
  CREATE_TIME       TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EXPORT_C
  add constraint PK_EXPORT_C primary key (EXPORT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating EXPORT_PRODUCT_C...
create table EXPORT_PRODUCT_C
(
  EXPORT_PRODUCT_ID VARCHAR2(40) not null,
  EXPORT_ID         VARCHAR2(40),
  FACTORY_ID        VARCHAR2(40),
  FACTORY_NAME      VARCHAR2(50),
  PRODUCT_NO        VARCHAR2(50),
  PACKING_UNIT      VARCHAR2(10),
  CNUMBER           INTEGER,
  BOX_NUM           INTEGER,
  GROSS_WEIGHT      NUMBER(8,2),
  NET_WEIGHT        NUMBER(8,2),
  SIZE_LENGTH       NUMBER(8,2),
  SIZE_WIDTH        NUMBER(8,2),
  SIZE_HEIGHT       NUMBER(8,2),
  EX_PRICE          NUMBER(8,2),
  PRICE             NUMBER(10,2),
  TAX               NUMBER(8,2),
  ORDER_NO          INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EXPORT_PRODUCT_C
  add constraint PK_EXPORT_PRODUCT_C primary key (EXPORT_PRODUCT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating EXT_CPRODUCT_C...
create table EXT_CPRODUCT_C
(
  EXT_CPRODUCT_ID     VARCHAR2(40) not null,
  CONTRACT_PRODUCT_ID VARCHAR2(40),
  FACTORY_ID          VARCHAR2(40),
  FACTORY_NAME        VARCHAR2(50),
  CTYPE               INTEGER,
  PRODUCT_NO          VARCHAR2(50),
  PRODUCT_IMAGE       VARCHAR2(200),
  PRODUCT_DESC        VARCHAR2(600),
  CNUMBER             INTEGER,
  PACKING_UNIT        VARCHAR2(10),
  PRICE               NUMBER(10,2),
  AMOUNT              NUMBER(10,2),
  PRODUCT_REQUEST     VARCHAR2(2000),
  ORDER_NO            INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EXT_CPRODUCT_C
  add constraint PK_EXT_CPRODUCT_C primary key (EXT_CPRODUCT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating EXT_CPRODUCT_HIS_C...
create table EXT_CPRODUCT_HIS_C
(
  EXT_CPRODUCT_ID     VARCHAR2(40) not null,
  CONTRACT_PRODUCT_ID VARCHAR2(40),
  FACTORY_ID          VARCHAR2(40),
  FACTORY_NAME        VARCHAR2(50),
  CTYPE               INTEGER,
  PRODUCT_NO          VARCHAR2(50),
  PRODUCT_IMAGE       VARCHAR2(200),
  PRODUCT_DESC        VARCHAR2(600),
  CNUMBER             INTEGER,
  PACKING_UNIT        VARCHAR2(10),
  PRICE               NUMBER(10,2),
  AMOUNT              NUMBER(10,2),
  PRODUCT_REQUEST     VARCHAR2(2000),
  ORDER_NO            INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EXT_CPRODUCT_HIS_C
  add constraint PK_EXT_CPRODUCT_HIS_C primary key (EXT_CPRODUCT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating EXT_EPRODUCT_C...
create table EXT_EPRODUCT_C
(
  EXT_EPRODUCT_ID   VARCHAR2(40) not null,
  EXPORT_PRODUCT_ID VARCHAR2(40),
  FACTORY_ID        VARCHAR2(40),
  FACTORY_NAME      VARCHAR2(50),
  CTYPE             INTEGER,
  PRODUCT_NO        VARCHAR2(50),
  PRODUCT_IMAGE     VARCHAR2(200),
  PRODUCT_DESC      VARCHAR2(600),
  CNUMBER           INTEGER,
  PACKING_UNIT      VARCHAR2(10),
  PRICE             NUMBER(10,2),
  AMOUNT            NUMBER(10,2),
  PRODUCT_REQUEST   VARCHAR2(2000),
  ORDER_NO          INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table EXT_EPRODUCT_C
  add constraint PK_EXT_EPRODUCT_C primary key (EXT_EPRODUCT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating FACTORY_C...
create table FACTORY_C
(
  FACTORY_ID   VARCHAR2(40) not null,
  FULL_NAME    VARCHAR2(200),
  FACTORY_NAME VARCHAR2(50),
  CONTACTS     VARCHAR2(30),
  PHONE        VARCHAR2(20),
  MOBILE       VARCHAR2(20),
  FAX          VARCHAR2(20),
  CNOTE        VARCHAR2(2000),
  INSPECTOR    VARCHAR2(30),
  ORDER_NO     INTEGER,
  STATE        CHAR(1),
  CREATE_BY    VARCHAR2(40),
  CREATE_DEPT  VARCHAR2(40),
  CREATE_TIME  TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating LOGIN_LOG_P...
create table LOGIN_LOG_P
(
  LOGIN_LOG_ID VARCHAR2(40) not null,
  LOGIN_NAME   VARCHAR2(30),
  IP_ADDRESS   VARCHAR2(20),
  LOGIN_TIME   TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table LOGIN_LOG_P
  add primary key (LOGIN_LOG_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ONLINE_T...
create table ONLINE_T
(
  A1 VARCHAR2(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ONLINE_T
  add primary key (A1)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PACKING_LIST_C...
create table PACKING_LIST_C
(
  PACKING_LIST_ID VARCHAR2(40) not null,
  SELLER          VARCHAR2(200),
  BUYER           VARCHAR2(200),
  INVOICE_NO      VARCHAR2(30),
  INVOICE_DATE    TIMESTAMP(6),
  MARKS           VARCHAR2(200),
  DESCRIPTIONS    VARCHAR2(200),
  EXPORT_IDS      VARCHAR2(200),
  EXPORT_NOS      VARCHAR2(200),
  STATE           INTEGER,
  CREATE_BY       VARCHAR2(40),
  CREATE_DEPT     VARCHAR2(40),
  CREATE_TIME     TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PACKING_LIST_C
  add constraint PK_PACKING_LIST_C primary key (PACKING_LIST_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SYS_CODE_B...
create table SYS_CODE_B
(
  SYS_CODE_ID  VARCHAR2(40) not null,
  NAME         VARCHAR2(100),
  PARENT_ID    VARCHAR2(40),
  PARENT_NAME  VARCHAR2(100),
  LAYER_NUM    INTEGER,
  IS_LEAF      INTEGER,
  QUOTE_NUM    INTEGER,
  CNOTE        VARCHAR2(100),
  ICO          VARCHAR2(20),
  ORDER_NO     INTEGER,
  STATE        CHAR(1),
  CREATED_BY   VARCHAR2(40),
  CREATED_TIME TIMESTAMP(6),
  UPDATED_BY   VARCHAR2(40),
  UPDATED_TIME TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SYS_CODE_B
  add constraint PK_SYS_CODE_B primary key (SYS_CODE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating USER_LOGIN_C...
create table USER_LOGIN_C
(
  USER_ID     VARCHAR2(40) not null,
  USERNAME    VARCHAR2(20),
  PASSWORD    VARCHAR2(20),
  EMAIL       VARCHAR2(40),
  DEPARTMENT  VARCHAR2(30),
  CREATE_TIME TIMESTAMP(6),
  BIRTHDAY    TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USER_LOGIN_C
  add constraint USER_ID primary key (USER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for CONTRACT_C...
alter table CONTRACT_C disable all triggers;
prompt Disabling triggers for CONTRACT_HIS_C...
alter table CONTRACT_HIS_C disable all triggers;
prompt Disabling triggers for CONTRACT_PRODUCT_C...
alter table CONTRACT_PRODUCT_C disable all triggers;
prompt Disabling triggers for CONTRACT_PRODUCT_HIS_C...
alter table CONTRACT_PRODUCT_HIS_C disable all triggers;
prompt Disabling triggers for EXPORT_C...
alter table EXPORT_C disable all triggers;
prompt Disabling triggers for EXPORT_PRODUCT_C...
alter table EXPORT_PRODUCT_C disable all triggers;
prompt Disabling triggers for EXT_CPRODUCT_C...
alter table EXT_CPRODUCT_C disable all triggers;
prompt Disabling triggers for EXT_CPRODUCT_HIS_C...
alter table EXT_CPRODUCT_HIS_C disable all triggers;
prompt Disabling triggers for EXT_EPRODUCT_C...
alter table EXT_EPRODUCT_C disable all triggers;
prompt Disabling triggers for FACTORY_C...
alter table FACTORY_C disable all triggers;
prompt Disabling triggers for LOGIN_LOG_P...
alter table LOGIN_LOG_P disable all triggers;
prompt Disabling triggers for ONLINE_T...
alter table ONLINE_T disable all triggers;
prompt Disabling triggers for PACKING_LIST_C...
alter table PACKING_LIST_C disable all triggers;
prompt Disabling triggers for SYS_CODE_B...
alter table SYS_CODE_B disable all triggers;
prompt Disabling triggers for USER_LOGIN_C...
alter table USER_LOGIN_C disable all triggers;
prompt Deleting USER_LOGIN_C...
delete from USER_LOGIN_C;
commit;
prompt Deleting SYS_CODE_B...
delete from SYS_CODE_B;
commit;
prompt Deleting PACKING_LIST_C...
delete from PACKING_LIST_C;
commit;
prompt Deleting ONLINE_T...
delete from ONLINE_T;
commit;
prompt Deleting LOGIN_LOG_P...
delete from LOGIN_LOG_P;
commit;
prompt Deleting FACTORY_C...
delete from FACTORY_C;
commit;
prompt Deleting EXT_EPRODUCT_C...
delete from EXT_EPRODUCT_C;
commit;
prompt Deleting EXT_CPRODUCT_HIS_C...
delete from EXT_CPRODUCT_HIS_C;
commit;
prompt Deleting EXT_CPRODUCT_C...
delete from EXT_CPRODUCT_C;
commit;
prompt Deleting EXPORT_PRODUCT_C...
delete from EXPORT_PRODUCT_C;
commit;
prompt Deleting EXPORT_C...
delete from EXPORT_C;
commit;
prompt Deleting CONTRACT_PRODUCT_HIS_C...
delete from CONTRACT_PRODUCT_HIS_C;
commit;
prompt Deleting CONTRACT_PRODUCT_C...
delete from CONTRACT_PRODUCT_C;
commit;
prompt Deleting CONTRACT_HIS_C...
delete from CONTRACT_HIS_C;
commit;
prompt Deleting CONTRACT_C...
delete from CONTRACT_C;
commit;
prompt Loading CONTRACT_C...
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a3357462e01336d3a0be10014', '武汉珞珈商贸有限公司', '11JK1078', to_timestamp('18-02-2020 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '张明', '李劲泽', 6580000, 1, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生成前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 交期：2011年11月15日/工厂。 ' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', '虎牙直播', to_timestamp('18-02-2020 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('18-02-2020 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'T/T(电汇)', '待样品确认后方可安排生产', '2', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('04-11-2011 14:38:54.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33fc4e280133fd9f8b4e002f', '武汉珞珈商贸有限公司', '11JK1072', to_timestamp('06-03-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '张明', '程浩伟', 11901000, 3, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 交期：2011年12月15日/工厂。' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 'Mercedes-Benz', to_timestamp('19-04-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('08-04-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '三叉戟标质检优秀', '三叉戟数量和质量要达标', '2', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('02-12-2011 16:31:28.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('df42d3b6-56f2-4000-bdc2-f28c860acb24', '武汉珞珈商贸有限公司', 'LJHW20190427', to_timestamp('12-03-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '朱稼津', '陈天牧', '李劲泽', 5100000, 3, '不能延期', '华为科技有限责任公司', to_timestamp('14-05-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('07-05-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '不能延期', '不能延期', '2', null, 1, null, null, null, null);
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33812ffd0133821a8eb5002b', '武汉珞珈商贸有限公司', '11JK1084', to_timestamp('12-02-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '陈天牧', '李劲泽', 0, 1, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生成前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 交期：2011年12月20日/工厂。毛坯送至祁县瑞成玻璃镀膜厂。 ' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', '武汉大学', to_timestamp('21-03-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('15-03-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '电脑配置打到合同要求', '待样品确认后方可安排配置产品', '2', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('01-12-2011 16:58:54.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33d4f8b40133d991a50d0019', '武汉珞珈商贸有限公司', '11JK1066', to_timestamp('07-12-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '何亦鹏', '程浩伟', 4032000, 3, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生成前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 交期：2011年12月5日/工厂。' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 'DXC.technology', to_timestamp('26-12-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('21-12-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '不能延期', '待样品确认后方可安排生产', '2', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('25-11-2011 16:01:28.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33fc4e280133fd81e7d7001d', '武汉珞珈商贸有限公司', '11JK1068', to_timestamp('12-02-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '周文俊', '程浩伟', 1802000, 3, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 交期：2011年12月15日/工厂。' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 'Bayerische Motoren Werke', to_timestamp('05-03-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-03-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '玻璃硬度过关不能延期', '宝马玻璃', '2', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('02-12-2011 14:52:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a3420e78a013421a693730001', '武汉珞珈商贸有限公司', 'C/4040/11', to_timestamp('09-10-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '张明', '李春光', 95715000, 2, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 交期：2012年2月15日/工厂。' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 'Google', to_timestamp('24-12-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('12-12-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '钢铁质量达标', '待样品确认后方可安排生产', '2', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('09-12-2011 16:16:29.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a3357462e01336cc0877b0010', '武汉珞珈商贸有限公司', '11JK1080', to_timestamp('12-02-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '周文俊', '陈曦', 1355000, 3, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生成前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 交期：2011年12月10日/工厂。毛坯送至祁县瑞成玻璃镀膜厂。 ' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', '武汉斗鱼', to_timestamp('02-03-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('26-02-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '不能延期', '待样品确认后方可安排生产', '1', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('04-11-2011 16:50:21.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a3357462e01336d523195001a', '武汉珞珈商贸有限公司', 'C/3847/11', to_timestamp('18-09-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '何亦鹏', '李劲泽', 55005000, 3, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生成前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。' || chr(13) || '' || chr(10) || ' 交期：2011年12月15日/工厂。 ' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', '小米科技有限责任公司', to_timestamp('20-11-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('15-11-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '电池质量过关', '待样品确认后方可安排生产', '2', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('01-02-2012 12:18:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33812ffd0133813f25940001', '武汉珞珈商贸有限公司', 'C/3861/11', to_timestamp('24-10-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '周文俊', '陈曦', 0, 1, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生产前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 包装：产品用白纸，瓦楞纸，气泡纸包裹后入内盒，大箱，大箱用胶带纸工字封口；' || chr(13) || '' || chr(10) || ' 交期：2012年1月10日/工厂。 ' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', '上海申通物流公司', to_timestamp('03-11-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('31-10-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '纸张达标', '待样品确认后方可安排生产', '2', null, 0, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('04-01-2012 14:22:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33812ffd013382048ff80024', '武汉珞珈商贸有限公司', '11JK1082', to_timestamp('17-09-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '张明', '李春光', 130000, 3, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生成前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 包装：产品用白纸，瓦楞纸，气泡纸包裹后入内盒，大箱，大箱用胶带纸工字封口；' || chr(13) || '' || chr(10) || ' 交期：2011年12月30日/工厂。  ' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', 'Facebook', to_timestamp('11-11-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('02-11-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '不能延期', '待布料样品确认后方可安排生产', '2', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('08-11-2011 17:25:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33d4f8b40133d9878e88000d', '武汉珞珈商贸有限公司', '11JK1070', to_timestamp('23-10-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '何亦鹏', '陈天牧', 0, 2, '★   产品与封样无明显差异，唛头、标签及包装质量务必符合公司要求。 ' || chr(13) || '' || chr(10) || ' ★★  产品生成前期、中期、后期抽验率不得少于10%，质量和封样一致， ' || chr(13) || '' || chr(10) || '       并将验货照片传回公司。 ' || chr(13) || '' || chr(10) || '★★★ 重点客人的质量标准检验，产品抽验率不得少于50%，务必做到入箱前检查。 ' || chr(13) || '' || chr(10) || ' 交期：2011年11月5日/工厂。 ' || chr(13) || '' || chr(10) || '       没有经过我司同意无故延期交货造成严重后果的，按照客人的相关要求处理。 ' || chr(13) || '' || chr(10) || ' 开票：出货后请将增值税发票、验货报告、合同复印件及出库单一并寄至我司，以便我司安排付款。', '武汉飞虹有机玻璃', to_timestamp('02-11-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('30-10-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '不能延期', '玻璃规格确定即可生产', '2', null, 1, null, 'ff80808131301abf0131303fe2e40038', '0001002', to_timestamp('25-11-2011 15:01:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into CONTRACT_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('1c3f015c-cf3a-4c06-91db-d5b2ac71d0d9', '武汉珞珈商贸有限公司', '1', to_timestamp('09-02-2020 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '朱稼津', '周文俊', '李劲泽', 130000, 3, null, '1', to_timestamp('05-03-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('09-02-2020 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'DES(目的港船上交货)', null, '2', null, 0, null, null, null, null);
commit;
prompt 13 records loaded
prompt Loading CONTRACT_HIS_C...
insert into CONTRACT_HIS_C (CONTRACT_ID, OFFEROR, CONTRACT_NO, SIGNING_DATE, INPUT_BY, CHECK_BY, INSPECTOR, TOTAL_AMOUNT, IMPORT_NUM, CREQUEST, CUSTOM_NAME, DELIVERY_PERIOD, SHIP_TIME, TRADE_TERMS, REMARK, PRINT_STYLE, OLD_STATE, STATE, OUT_STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('c3c96ae2-0883-4d7f-8ec7-23be50a42aea', '武汉珞珈商贸有限公司', 'LJApple201904131938', to_timestamp('13-04-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '杨丽', '周文俊', '朱稼津', null, 3, null, 'Apple', to_timestamp('02-05-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('28-04-2019 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'T/T', null, '2', null, 0, null, null, null, null);
commit;
prompt 1 records loaded
prompt Loading CONTRACT_PRODUCT_C...
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('79b83617-2ada-4636-9b2f-5211616a449c', '4028817a33d4f8b40133d991a50d0019', '16', '康达', 'LJHD201904271759', '08.png', '   ', 10000, null, '1/2', 20000, 'SETS', 300, 3000000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('f50dbee3-6e2f-4ccb-b2d4-52460fd021f9', '4028817a3357462e01336d3a0be10014', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', '08.png', '666', 2000, null, '1/2', 3500, 'SETS', 300, 600000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('c88828d8-1dff-4fca-a059-df3a96f96e7a', '4028817a33d4f8b40133d991a50d0019', '13', '平遥鸿艺', 'LJ', '08.png', null, 1000, null, '1/2', 3500, 'PCS', 902, 902000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('7bcf8484-9c9a-41d7-b3b0-9176f145f3aa', 'df42d3b6-56f2-4000-bdc2-f28c860acb24', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJHW201810241333', '10.png', '电镀质量过关', 20000, null, '1', 20000, 'SETS', 200, 4000000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('2dae203c-5249-4a46-8099-80b1c887518f', 'df42d3b6-56f2-4000-bdc2-f28c860acb24', '4028817a389cc7b701389d1efd940001', '宇虹包装厂', 'LJHW201904271809', '08.png', '包装盒美观', 20000, null, '1', 2000, 'SETS', 30, 600000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('0b714691-bd52-45ec-a19d-f0a1cbbe95b8', '4028817a33fc4e280133fd9f8b4e002f', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241336', '32.png', '奔驰三叉戟车标', 13000, null, '1/2', 26000, 'SETS', 350, 4550000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('12881520-3efb-4d30-a9ce-f9bfc7b22922', '4028817a33fc4e280133fd9f8b4e002f', '17', '众鑫', 'LJGG201810241338', '33.png', '高强度汽车钢铁', 6500, null, '1/2', 13000, 'PCS', 130, 845000, null, null, 2);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('ab376207-a817-4ab6-85c9-ddc717660e91', '4028817a33fc4e280133fd9f8b4e002f', '4028817a33d4f8b40133d9989f5e0024', '民鑫', 'LJMX20190214', '07.png', '一级品', 15600, null, '3/5', 26000, 'SETS', 200, 3120000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('857f3d4b-73bb-4233-a590-c0614ad11f56', '4028817a33fc4e280133fd9f8b4e002f', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJZX20190215222235', '15.png', null, 10000, null, '4/5', 12500, 'SETS', 260, 2600000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('16b0540b-335d-435f-93ef-2edcf748209e', '4028817a3357462e01336d3a0be10014', '15', '南皮开发', 'LJ01', '03.png', '完美主义', 2300, null, '1/3', 6900, 'PCV', 2600, 5980000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('ebad20e2-f228-407e-a885-1774f4985481', '4028817a3357462e01336d523195001a', '18', '翰林', 'LJ02', '03.png', '无', 3650, null, '1/3', 10950, 'PCV', 6000, 21900000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('2d5d1b64-d7ca-4d8c-9525-12912642ed91', '4028817a3420e78a013421a693730001', '4028817a371a8d7f01372a74451f0068', '铁架厂', 'LJGG001', '33.png', '房梁构架钢铁', 30000, null, '1/2', 60000, 'PCS', 3000, 90000000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('688df635-5126-4efd-b074-0ebb459e9046', '4028817a3420e78a013421a693730001', '13', '平遥鸿艺', 'LJGG201810241317', '03.png', '精美水壶', 4500, null, '1/3', 13500, 'PCS', 1250, 5625000, null, null, 2);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('4d6f0f3c-8f21-439e-9aaa-ddb4323ead58', '4028817a3357462e01336cc0877b0010', '22', '瑞成', '4999', '02.png', '美丽', 1000, null, '1/3', 300, 'PCS', 1000, 1000000, null, null, 2);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('0d69f436-7e4f-4414-b050-973d5d8cf200', '4028817a3357462e01336cc0877b0010', '20', '喜福来', 'LJ001', '01.png', '杯具', 1500, null, '1/2', 3000, 'PCS', 200, 300000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('ce062b58-4f12-40c5-8afa-73cb70dceb2b', '4028817a3357462e01336d523195001a', '22', '瑞成', 'LJ03', '05.png', '无', 2700, null, '1/3', 8100, 'PCV', 150, 405000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('9f14fc8e-527b-4645-a27a-494e850bc23b', '4028817a33d4f8b40133d991a50d0019', '13', '平遥鸿艺', 'LJPYHY201904271800', '03.png', '   ', 2000, null, '1/2', 40000, 'PCS', 65, 130000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('f3e1add2-307f-4120-a289-b136f26e19fe', '4028817a33fc4e280133fd81e7d7001d', '13', '平遥鸿艺', 'LJHW201810241333', '05.png', null, 2000, null, '1/2', 3500, 'SETS', 901, null, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('bc930a27-4ab3-4f56-aa03-0008f9b4cc56', 'a35bc341-0d32-49f0-b51a-d20464289e7a', 'e87f0ba8-ae2c-437a-9d3d-39980241d709', '华为', null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('ef8536d0-76ff-441a-9a0f-0d5329c95156', 'a35bc341-0d32-49f0-b51a-d20464289e7a', 'ff808081301885760130189e47ca0013', '文水志远', null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('34183f6f-7caa-4798-bf95-ec61e3b83965', '4028817a3357462e01336d523195001a', '19', '综艺花纸', 'LJZYHZ20190215231406', '08.png', null, 35000, null, '4/5', 43750, 'SETS', 260, 9100000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('0590411b-458a-4b8d-84c3-93f8b6b7d02c', '1c3f015c-cf3a-4c06-91db-d5b2ac71d0d9', '12', '平遥远江', 'LJ001', '08.png', null, 2000, null, '1/2', 4000, 'SETS', 65, 130000, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('9bb70066-0170-4662-a8c6-cc3cb20c7306', '1c3f015c-cf3a-4c06-91db-d5b2ac71d0d9', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', 'LJHW201810241333', '05.png', null, null, null, '1/2', 3500, 'SETS', null, null, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('31dc5803-c454-495a-b5d0-7f3ce42b6fb0', '1c3f015c-cf3a-4c06-91db-d5b2ac71d0d9', '4028817a33de41d80133e982a18a001c', '太谷PVC', 'LJ001', '03.png', null, null, null, '1/2', 3500, 'PCS', null, null, null, null, 1);
insert into CONTRACT_PRODUCT_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('d39bd625-efb9-4936-a71a-90e3e8a3063c', '4028817a33812ffd013382048ff80024', '13', '平遥鸿艺', 'LJHW201810241333', '05.png', null, 2000, null, '1/2', 4000, 'SETS', 65, 130000, null, null, 1);
commit;
prompt 25 records loaded
prompt Loading CONTRACT_PRODUCT_HIS_C...
insert into CONTRACT_PRODUCT_HIS_C (CONTRACT_PRODUCT_ID, CONTRACT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, OUT_NUMBER, LOADING_RATE, BOX_NUM, PACKING_UNIT, PRICE, AMOUNT, FINISHED, EXTS, ORDER_NO)
values ('7c575f37-3768-4eb9-bef5-6048f32fd27a', 'c3c96ae2-0883-4d7f-8ec7-23be50a42aea', '22', '瑞成', 'LJApple201904131945', '10.png', null, 35000, null, '1/2', 70000, 'SETS', 160, 5600000, null, null, 1);
commit;
prompt 1 records loaded
prompt Loading EXPORT_C...
insert into EXPORT_C (EXPORT_ID, INPUT_DATE, CONTRACT_IDS, CUSTOMER_CONTRACT, LCNO, CONSIGNEE, MARKS, REMARK, SHIPMENT_PORT, DESTINATION_PORT, TRANSPORT_MODE, PRICE_CONDITION, STATE, GROSS_WEIGHT, NET_WEIGHT, MEASUREMENT, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('402c4930-f127-44e0-98a9-05568f2088ca', null, '4028817a33fc4e280133fd81e7d7001d', '11JK1068', 'LJ100', null, null, null, null, null, null, null, 0, null, null, null, null, null, null);
insert into EXPORT_C (EXPORT_ID, INPUT_DATE, CONTRACT_IDS, CUSTOMER_CONTRACT, LCNO, CONSIGNEE, MARKS, REMARK, SHIPMENT_PORT, DESTINATION_PORT, TRANSPORT_MODE, PRICE_CONDITION, STATE, GROSS_WEIGHT, NET_WEIGHT, MEASUREMENT, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('d3693d03-38af-490c-aba4-470782b3f0ce', to_timestamp('15-10-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '4028817a3357462e01336cc0877b0010', '11JK1080', 'L/C', '德国梅赛德斯-奔驰（Mercedes-Benz）', '无', '无', '上海洋山港', '德国汉堡港(Hamburg)', 'SEA', 'CIF', 4, null, null, null, null, null, null);
insert into EXPORT_C (EXPORT_ID, INPUT_DATE, CONTRACT_IDS, CUSTOMER_CONTRACT, LCNO, CONSIGNEE, MARKS, REMARK, SHIPMENT_PORT, DESTINATION_PORT, TRANSPORT_MODE, PRICE_CONDITION, STATE, GROSS_WEIGHT, NET_WEIGHT, MEASUREMENT, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('8a63f9ca-1670-436a-96c7-e0f12b70e8d8', to_timestamp('23-10-2018 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '4028817a3357462e01336d523195001a', 'C/3847/11', 'L/C', '美国洛杉矶码头', '无', '无', '上海浦东', '美国洛杉矶', 'SEA', 'CIF', 1, null, null, null, null, null, null);
insert into EXPORT_C (EXPORT_ID, INPUT_DATE, CONTRACT_IDS, CUSTOMER_CONTRACT, LCNO, CONSIGNEE, MARKS, REMARK, SHIPMENT_PORT, DESTINATION_PORT, TRANSPORT_MODE, PRICE_CONDITION, STATE, GROSS_WEIGHT, NET_WEIGHT, MEASUREMENT, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('b0dca9b3-e4bb-4078-add5-e28a6628652d', null, '4028817a33812ffd0133821a8eb5002b', '11JK1084', null, null, null, null, null, null, null, null, 2, null, null, null, null, null, null);
commit;
prompt 4 records loaded
prompt Loading EXPORT_PRODUCT_C...
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('ef79ce4f-2857-439b-bd3e-fcec533a4064', 'bf46fc44-5bfc-4bd6-b526-319e595539f7', '15', '南皮开发', 'JK01', 'PCV', 1000, 300, null, null, null, null, null, null, 20, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('c58a8cc4-9bce-4333-84be-44c1deecdc31', 'fab9ecbb-82d1-4f3e-826f-efb9b74d36e7', '15', '南皮开发', 'JK01', 'PCV', 1000, 300, null, null, null, null, null, null, 20, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('8238dc5b-9f4d-49e4-a8a6-da17ad117037', '3af76810-5d29-461a-b800-04dc17cd9d24', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 10000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('1a3e07d5-bb33-4d9c-8071-69bc33dccd61', '3af76810-5d29-461a-b800-04dc17cd9d24', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('91cf96d7-2f6b-4fc0-9e8d-3590aea0c0b1', '3af76810-5d29-461a-b800-04dc17cd9d24', '17', '众鑫', 'LJZX20190215222235', 'SETS', 10000, 12500, null, null, null, null, null, null, 260, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('91366d31-d727-40b5-9726-fd40ae91de9a', '3af76810-5d29-461a-b800-04dc17cd9d24', '4028817a33d4f8b40133d9989f5e0024', '民鑫', 'LJMX20190214', 'SETS', 15600, 26000, null, null, null, null, null, null, 200, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('363c9f2c-01bf-433a-98a2-33f4b37216d7', '3af76810-5d29-461a-b800-04dc17cd9d24', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241338', 'PCS', 6500, 13000, null, null, null, null, null, null, 130, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('4c9069ad-5b42-4c6d-a03e-9b27e6152636', '3af76810-5d29-461a-b800-04dc17cd9d24', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241336', 'SETS', 13000, 26000, null, null, null, null, null, null, 350, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('0541af15-64cd-46bf-8c11-914737a6d154', 'e1a19bc8-7b13-4530-9111-2b8f3bfa2fdc', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 10000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('b946d95a-fe2d-4247-9533-0db5ea6fb70d', 'e1a19bc8-7b13-4530-9111-2b8f3bfa2fdc', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('910675dd-1947-4e3e-92d0-5ee04b1ac2a3', '402c4930-f127-44e0-98a9-05568f2088ca', '13', '平遥鸿艺', 'LJHW201810241333', 'SETS', 2000, 3500, 3, 4, 5, 6, 7, 8, 8, 9, 1);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('b2685cd3-201d-4ed6-9305-8b46b9633be2', '37ae134e-4264-4f97-aa6a-1a1f620e57bf', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('21852399-c00d-4db6-a7a1-acf3a725c3d7', '37ae134e-4264-4f97-aa6a-1a1f620e57bf', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 10000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('d40dd6a8-dffc-403b-a35b-adb30c08b3bf', '0bdd2631-559e-4c69-a2f7-2d497eebc80d', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('7f696f4c-7f80-470c-86c8-4f1fefd4d78b', '0bdd2631-559e-4c69-a2f7-2d497eebc80d', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 10000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('62d6ee68-c0ba-48df-81b8-6b821392a32c', '1119699c-313b-43a2-81b5-87e6c97a9fd5', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('bae1385c-6be4-4f79-a40e-99e9a6ca2d5e', '1119699c-313b-43a2-81b5-87e6c97a9fd5', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 10000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('6fa4f272-0994-4c85-bc40-8c0432a7b57d', '6f8000eb-7baa-4d0b-9d35-1ad5f81c0946', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 2000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('aca9b594-844f-48c8-82ef-af33daee40ca', '6f8000eb-7baa-4d0b-9d35-1ad5f81c0946', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('557eaaf9-c74d-44de-a177-8d1c744905bb', 'd3d26e62-b46c-4eef-ac38-9690e5e4e594', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 2000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('9b57251a-4a18-4c87-8369-ba3954e24169', 'd3d26e62-b46c-4eef-ac38-9690e5e4e594', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('57fbe67c-f0f0-44e7-8718-d564041b9fe5', 'd3d26e62-b46c-4eef-ac38-9690e5e4e594', '17', '众鑫', 'LJGG201810241338', 'PCS', 6500, 13000, null, null, null, null, null, null, 130, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('69cb0ada-666d-4e75-aa34-4feca29fc04c', 'd3d26e62-b46c-4eef-ac38-9690e5e4e594', '4028817a33d4f8b40133d9989f5e0024', '民鑫', 'LJMX20190214', 'SETS', 15600, 26000, null, null, null, null, null, null, 200, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('216d9a7d-db44-48c5-9081-72615b3906f5', 'd3d26e62-b46c-4eef-ac38-9690e5e4e594', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJZX20190215222235', 'SETS', 10000, 12500, null, null, null, null, null, null, 260, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('ff7123b7-c7e1-4b8a-97fe-34ca01593540', 'd3d26e62-b46c-4eef-ac38-9690e5e4e594', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241336', 'SETS', 13000, 26000, null, null, null, null, null, null, 350, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('f50a4160-1047-43bd-845c-5c594d9528d7', 'd3693d03-38af-490c-aba4-470782b3f0ce', '20', '喜福来', 'JK001', 'PCS', 1000, 500, 40, 36, 100, 20, 50, 1000, 1100, 130, 1);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('7af2e030-9da8-4923-b058-21c64db83a6f', 'd3693d03-38af-490c-aba4-470782b3f0ce', '22', '瑞成', '4999', 'PCS', 100, 300, 35, 30, 10, 5, 5, 20000, 10, 560, 2);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('7dc730c8-1cee-4031-b09d-a095745f8ba8', 'faab862b-aff7-4cf5-b64c-7655680027ba', '20', '喜福来', 'JK001', 'PCS', 1000, 500, null, null, null, null, null, null, 200, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('3d4cc3b4-1864-415b-9d58-d05f5b3402ea', 'faab862b-aff7-4cf5-b64c-7655680027ba', '22', '瑞成', '4999', 'PCS', 100, 300, null, null, null, null, null, null, 10, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('90fdb225-f186-4bc9-8206-45853a414ba4', '8a63f9ca-1670-436a-96c7-e0f12b70e8d8', '18', '翰林', 'JK02', 'PCV', 1000, 300, null, null, null, null, null, null, 20, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('dde5b243-a62f-4699-a8b4-9d15c69bb1c3', '8a63f9ca-1670-436a-96c7-e0f12b70e8d8', '22', '瑞成', 'JK03', 'PCV', 1000, 300, null, null, null, null, null, null, 30, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('4f096558-fba8-4d23-81c8-897c1f28005e', '860a40b8-cb7e-4462-9819-28a6d48fd02c', '22', '瑞成', 'JKGG201810241712', 'SETS', 10000, 30000, null, null, null, null, null, null, 29.9, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('a429c9bf-17cf-4119-b801-8667c94e4957', '860a40b8-cb7e-4462-9819-28a6d48fd02c', '22', '瑞成', 'JKGG201810241334', 'PCS', 300, 600, null, null, null, null, null, null, 5.5, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('66af9f07-4151-4ab7-a458-43bd826471db', '860a40b8-cb7e-4462-9819-28a6d48fd02c', '4028817a33ecdbf70133ee202e49000b', '瑞成电镀厂', 'JKHW201810241333', 'SETS', 1500, 4500, null, null, null, null, null, null, 4.5, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('ea26cf43-5525-4484-bbc7-8e1e4e29e95a', 'd0bdab6b-81f6-4a4f-aee8-5ac3c2bce992', '15', '南皮开发', null, null, 1, null, 1, null, null, null, null, null, 3, null, 1);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('ef2f4b1a-9e6b-4687-b4d7-f795f19a63a9', 'a7e031f6-0ad7-46ba-8e26-4feff579924b', '20', '喜福来', 'JK001', 'PCS', 1000, 500, null, null, null, null, null, null, 200, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('ec431f4e-1a54-4311-b987-ed25fca65ef3', 'a7e031f6-0ad7-46ba-8e26-4feff579924b', '22', '瑞成', '4999', 'PCS', 100, 300, null, null, null, null, null, null, 10, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('430557f2-64f8-428a-8346-4e4827452ec7', 'd137cd6a-ca95-43f9-8275-05694259edd0', '13', '平遥鸿艺', 'LJ', 'PCS', 1000, 3500, null, null, null, null, null, null, 902, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('ed7936b8-fb84-4595-b8ee-5bb38bd11dda', 'd137cd6a-ca95-43f9-8275-05694259edd0', '13', '平遥鸿艺', 'LJPYHY201904271800', 'PCS', 2000, 40000, null, null, null, null, null, null, 65, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('81113eb5-80ad-44cc-aa3a-ea62f1e14eb4', 'd137cd6a-ca95-43f9-8275-05694259edd0', '16', '康达', 'LJHD201904271759', 'SETS', 10000, 20000, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('c500552f-237e-4146-a1dd-0880bf94b3af', 'a6095938-847b-4457-b650-060ba18cf718', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 10000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('85f06771-7aee-46e4-8ff9-24425a0ab9c8', 'a6095938-847b-4457-b650-060ba18cf718', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('c1b90ae6-967b-467f-b4e7-0df1bfd82126', 'ad9f7730-4337-4ced-ab62-2a8ed60e743e', '17', '众鑫', 'LJZX20190215222235', 'SETS', 10000, 12500, null, null, null, null, null, null, 260, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('51375819-c224-4ee2-81d0-1b8fa7bb0f7c', 'ad9f7730-4337-4ced-ab62-2a8ed60e743e', '4028817a33d4f8b40133d9989f5e0024', '民鑫', 'LJMX20190214', 'SETS', 15600, 26000, null, null, null, null, null, null, 200, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('6015cb36-830a-46c1-a59b-6c5db31ebb5b', 'ad9f7730-4337-4ced-ab62-2a8ed60e743e', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241338', 'PCS', 6500, 13000, null, null, null, null, null, null, 130, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('571a2500-9dbb-4098-aaa0-c02d5728d76c', 'ad9f7730-4337-4ced-ab62-2a8ed60e743e', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241336', 'SETS', 13000, 26000, null, null, null, null, null, null, 350, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('9c1f22f1-d188-46f6-8eec-fb2c2be26854', '12529b8f-d4cb-4334-826a-98652b02007e', '17', '众鑫', 'LJZX20190215222235', 'SETS', 10000, 12500, 3, null, null, null, null, null, 260, null, 1);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('95141a1e-0bce-40db-9ad4-c7ac87536af7', '12529b8f-d4cb-4334-826a-98652b02007e', '4028817a33d4f8b40133d9989f5e0024', '民鑫', 'LJMX20190214', 'SETS', 15600, 26000, null, 4, null, null, null, null, 200, null, 2);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('5b765798-9ec5-4eca-b0f6-57356fecd2bc', '12529b8f-d4cb-4334-826a-98652b02007e', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241338', 'PCS', 6500, 13000, null, null, null, null, null, null, 130, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('7d844f99-9276-4bb8-9cb8-2fd5ef5cf5b2', '12529b8f-d4cb-4334-826a-98652b02007e', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241336', 'SETS', 13000, 26000, null, null, null, null, null, null, 350, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('5b096d03-8e81-4b1f-9d6d-c0c066e14a20', '250b045b-fad4-4850-aaa2-225137bd325b', '4028817a33d4f8b40133d9989f5e0024', '民鑫', 'LJMX20190214', 'SETS', 15600, 26000, null, null, null, null, null, null, 200, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('518cffca-156d-45a5-bf56-495a5e0a8e42', '250b045b-fad4-4850-aaa2-225137bd325b', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241336', 'SETS', 13000, 26000, null, null, null, null, null, null, 350, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('2c5b6108-3fd6-4f8e-a867-11d27a3ffafc', '250b045b-fad4-4850-aaa2-225137bd325b', '17', '众鑫', 'LJZX20190215222235', 'SETS', 10000, 12500, null, null, null, null, null, null, 260, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('3db30490-e780-471b-a7d0-fc65ba50f9e2', '250b045b-fad4-4850-aaa2-225137bd325b', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 'LJGG201810241338', 'PCS', 6500, 13000, null, null, null, null, null, null, 130, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('7a36f708-039c-4e19-8f36-947007e2ad70', '254d724d-e7e3-42e2-b73b-a5d349c4da3d', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 10000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('4ce4abd1-7c43-4c1f-8bad-26898fbf5dff', '254d724d-e7e3-42e2-b73b-a5d349c4da3d', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('e9f81e7c-5973-4ad0-b644-ea8631b1172b', '0d1e76f8-0653-4351-949b-34002a2cf179', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 10000, 3500, null, null, null, null, null, null, 300, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('3c6d692e-54c1-4885-991f-f67275426923', '0d1e76f8-0653-4351-949b-34002a2cf179', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('c2594ee4-7b62-4830-be9e-f621128469b1', '0273b932-2ba6-4cda-befb-6173f677f2d2', '13', '平遥鸿艺', 'LJGG201810241317', 'PCS', 4500, 13500, null, null, null, null, null, null, 1250, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('f434a9cd-24cd-4857-be5e-0d000b956b05', '0273b932-2ba6-4cda-befb-6173f677f2d2', '4028817a371a8d7f01372a74451f0068', '铁架厂', 'LJGG001', 'PCS', 30000, 60000, null, null, null, null, null, null, 3000, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('4cef5013-a70c-48a8-8b82-0ff81645bc36', '0273b932-2ba6-4cda-befb-6173f677f2d2', '20', '喜福来', 'LJ001', 'PCS', 1500, 3000, null, null, null, null, null, null, 200, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('947626e1-5e8e-41c3-8fb6-d3afb6d898b4', '0273b932-2ba6-4cda-befb-6173f677f2d2', '22', '瑞成', '4999', 'PCS', 1000, 300, null, null, null, null, null, null, 1000, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('74af695b-52ef-485c-8503-b135532a3134', '61a289f9-d466-45c3-8ac2-1d609d58ae58', '15', '南皮开发', 'LJ01', 'PCV', 2300, 6900, null, null, null, null, null, null, 2600, null, null);
insert into EXPORT_PRODUCT_C (EXPORT_PRODUCT_ID, EXPORT_ID, FACTORY_ID, FACTORY_NAME, PRODUCT_NO, PACKING_UNIT, CNUMBER, BOX_NUM, GROSS_WEIGHT, NET_WEIGHT, SIZE_LENGTH, SIZE_WIDTH, SIZE_HEIGHT, EX_PRICE, PRICE, TAX, ORDER_NO)
values ('5fc56d4c-43df-45f5-ac74-55155e7605e9', '61a289f9-d466-45c3-8ac2-1d609d58ae58', 'ff808081301885760130189e47ca0013', '文水志远', 'LJHW201810241333', 'SETS', 10000, 3500, null, null, null, null, null, null, 300, null, null);
commit;
prompt 64 records loaded
prompt Loading EXT_CPRODUCT_C...
insert into EXT_CPRODUCT_C (EXT_CPRODUCT_ID, CONTRACT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('5d3af117-3daa-4307-b310-f0d8b6f9a680', '0b714691-bd52-45ec-a19d-f0a1cbbe95b8', '15', '南皮开发', 1, 'LJGG201810241341_FJ', '33.png', '无', 2000, 'PCS', 3, 6000, '无', 1);
insert into EXT_CPRODUCT_C (EXT_CPRODUCT_ID, CONTRACT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('29026f4e-f0fa-4b8c-a615-e0e958395ad0', 'ab376207-a817-4ab6-85c9-ddc717660e91', '2', '光华', 3, 'LJMXGH20190214', '03.png', '一级品', 6000, 'SETS', 130, 780000, null, 1);
insert into EXT_CPRODUCT_C (EXT_CPRODUCT_ID, CONTRACT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('958a927a-dbfe-4194-a573-80a54c8ded3c', '7bcf8484-9c9a-41d7-b3b0-9176f145f3aa', '4028817a3abe8f15013ac019a61f0031', '喜福来电镀厂', 4, 'LJRC201904271811', '03.png', '电镀质量过关', 5000, 'SETS', 100, 500000, '电镀质量过关', 1);
insert into EXT_CPRODUCT_C (EXT_CPRODUCT_ID, CONTRACT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('9b0546d4-5214-4a88-9d4a-4682777b80d0', '688df635-5126-4efd-b074-0ebb459e9046', '21', '美晶', 6, 'LJGG201810241317_FJ', '3.png', '无', 300, 'PCS', 300, 90000, '无', 2);
insert into EXT_CPRODUCT_C (EXT_CPRODUCT_ID, CONTRACT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('cd8a22f4-515d-46ab-b9b9-0cdc0896ae13', 'ebad20e2-f228-407e-a885-1774f4985481', 'ff808081301885760130189e47ca0013', '文水志远', 6, 'JK0101', '04.png', '无', 2000, 'PCS', 300, 600000, '无', 1);
insert into EXT_CPRODUCT_C (EXT_CPRODUCT_ID, CONTRACT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('cb23be2c-3f43-4a7b-9aff-048dd81ab438', '0d69f436-7e4f-4414-b050-973d5d8cf200', '13', '平遥鸿艺', 1, 'LJ001', '1', '无', 1000, 'PCS', 55, 55000, '无', 1);
insert into EXT_CPRODUCT_C (EXT_CPRODUCT_ID, CONTRACT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('3f9ddddd-3e4e-464c-8d8c-e0f6fe180fd0', 'ebad20e2-f228-407e-a885-1774f4985481', '16', '康达', 6, 'LJKD20190225', '8.png', '一级品', 10000, 'PCS', 2300, 23000000, '无瑕疵', 1);
insert into EXT_CPRODUCT_C (EXT_CPRODUCT_ID, CONTRACT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('79caf791-d312-455d-a1c6-43adf4fe913c', '9bb70066-0170-4662-a8c6-cc3cb20c7306', 'e87f0ba8-ae2c-437a-9d3d-39980241d709', '华为', 1, 'LJ', '05.png', null, 2000, 'PCS', null, null, null, 8);
commit;
prompt 8 records loaded
prompt Loading EXT_CPRODUCT_HIS_C...
insert into EXT_CPRODUCT_HIS_C (EXT_CPRODUCT_ID, CONTRACT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('e2507a38-3a00-404e-b7b2-84555108cdd0', '95f264a8-ea51-4827-bf66-b9f38e8a2349', '3', '会龙', 1, 'LJ', '05.png', '1', 1000, 'SETS', 1, 1000, '1', 1);
commit;
prompt 1 records loaded
prompt Loading EXT_EPRODUCT_C...
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('935e7489-4541-4069-810a-9f1acac07c6c', '91366d31-d727-40b5-9726-fd40ae91de9a', '2', '光华', 3, 'LJMXGH20190214', '03.png', '一级品', 6000, 'SETS', 130, 780000, null, 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('1c72132e-51ce-495e-b1bf-47d8350cfa77', '4c9069ad-5b42-4c6d-a03e-9b27e6152636', '4028817a3ae2ac42013ae3550357000d', '临潼华清蜡厂', 1, 'LJGG201810241341_FJ', '33.png', '无', 1500, 'PCS', 3, 4500, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('c6be5848-ebeb-41a3-9443-e5ea69e3015d', '69cb0ada-666d-4e75-aa34-4feca29fc04c', '2', '光华', 3, 'LJMXGH20190214', '03.png', '一级品', 6000, 'SETS', 130, 780000, null, 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('a83090c4-583e-4309-ba42-d81574453989', 'ff7123b7-c7e1-4b8a-97fe-34ca01593540', '15', '南皮开发', 1, 'LJGG201810241341_FJ', '33.png', '无', 2000, 'PCS', 3, 6000, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('715d19ce-e078-43c0-ae3f-dce7e05faaab', 'f50a4160-1047-43bd-845c-5c594d9528d7', '13', '平遥鸿艺', 1, 'JK001', '1', '无', 1000, '1', .5, 500, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('8bfa479e-4d63-4a0c-9cc2-d99dacc3da92', '7dc730c8-1cee-4031-b09d-a095745f8ba8', '13', '平遥鸿艺', 1, 'JK001', '1', '无', 1000, '1', .5, 500, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('46136ef7-f5bc-4150-aad7-7c07bf4c093f', '90fdb225-f186-4bc9-8206-45853a414ba4', 'ff808081301885760130189e47ca0013', '文水志远', 6, 'JK0101', '04.png', '无', 200, 'PVC', 15, 3000, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('0b89e1c4-3bf0-4322-b047-b80a8cc7b438', 'a429c9bf-17cf-4119-b801-8667c94e4957', '4028817a389cc7b701389d1efd940001', '宇虹包装厂', 1, 'JKGG201810241714_FJ', '7.png', '无', 10000, 'PCS', .5, 5000, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('87e1ec3c-36c7-4f3e-b276-bc38761df9b5', 'ef2f4b1a-9e6b-4687-b4d7-f795f19a63a9', '13', '平遥鸿艺', 1, 'JK001', '1', '无', 1000, '1', .5, 500, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('53ce1ff8-1cfe-42df-a3db-5302e383668d', '51375819-c224-4ee2-81d0-1b8fa7bb0f7c', '2', '光华', 3, 'LJMXGH20190214', '03.png', '一级品', 6000, 'SETS', 130, 780000, null, 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('183e29c9-5555-4eda-82e7-078fb67e19a6', '571a2500-9dbb-4098-aaa0-c02d5728d76c', '4028817a3ae2ac42013ae3550357000d', '临潼华清蜡厂', 1, 'LJGG201810241341_FJ', '33.png', '无', 1500, 'PCS', 3, 4500, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('aee31371-5f65-47f0-b743-e3ec6c55bc2c', '95141a1e-0bce-40db-9ad4-c7ac87536af7', '2', '光华', 3, 'LJMXGH20190214', '03.png', '一级品', 6000, 'SETS', 130, 780000, null, 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('66ab2dcd-8b24-4c73-b32e-cc15e6a2a57f', '7d844f99-9276-4bb8-9cb8-2fd5ef5cf5b2', '4028817a3ae2ac42013ae3550357000d', '临潼华清蜡厂', 1, 'LJGG201810241341_FJ', '33.png', '无', 1500, 'PCS', 3, 4500, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('31e4a963-7aa8-49b1-9917-ec1fedb223d7', '5b096d03-8e81-4b1f-9d6d-c0c066e14a20', '2', '光华', 3, 'LJMXGH20190214', '03.png', '一级品', 6000, 'SETS', 130, 780000, null, 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('f98be17a-831d-40f6-bc2a-a9871c527180', '518cffca-156d-45a5-bf56-495a5e0a8e42', '4028817a3ae2ac42013ae3550357000d', '临潼华清蜡厂', 1, 'LJGG201810241341_FJ', '33.png', '无', 1500, 'PCS', 3, 4500, '无', 1);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('860e8090-8727-4a8a-a097-1246614cbf6b', 'c2594ee4-7b62-4830-be9e-f621128469b1', '21', '美晶', 6, 'LJGG201810241317_FJ', '3.png', '无', 300, 'PCS', 300, 90000, '无', 2);
insert into EXT_EPRODUCT_C (EXT_EPRODUCT_ID, EXPORT_PRODUCT_ID, FACTORY_ID, FACTORY_NAME, CTYPE, PRODUCT_NO, PRODUCT_IMAGE, PRODUCT_DESC, CNUMBER, PACKING_UNIT, PRICE, AMOUNT, PRODUCT_REQUEST, ORDER_NO)
values ('38850edd-858a-4cf4-bc01-b03d6e69eb6a', '4cef5013-a70c-48a8-8b82-0ff81645bc36', '13', '平遥鸿艺', 1, 'LJ001', '1', '无', 1000, 'PCS', 55, 55000, '无', 1);
commit;
prompt 17 records loaded
prompt Loading FACTORY_C...
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('e87f0ba8-ae2c-437a-9d3d-39980241d709', '华为科技有限责任公司', '华为', '李坤', '13589452627', '13589452627', '13589452627', '华为科技', '朱稼津', 1, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('ff808081301885760130189e47ca0013', '文水志远厂', '文水志远', '志远', '0358-3934083', null, null, null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('10', '祁县晶晨厂', '晶晨', '续贵', '0354-5271999', null, null, null, '吕波', null, '0', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('11', '祁县浩丰厂', '浩丰', '建生', '0354-524099', null, null, null, '吕波', null, '0', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('12', '平遥远江厂', '平遥远江', '宏远', null, '13935499967', null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('13', '平遥鸿艺厂', '平遥鸿艺', '雄飞', '0354-5940888', null, null, null, '吕波', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('15', '南皮开发玻璃制品厂', '南皮开发', '舒东', '0317-8863999', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('16', '陕西康达彩印厂', '康达', '袁喜', '029-84528015', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('17', '陕西众鑫印务包装有限公司', '众鑫', '赵毅', '029-84341858', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('18', '翰林彩印厂', '翰林', '孙财', '029-88917456', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('19', '祁县综艺玻璃花纸厂', '综艺花纸', '王棕', '0354-5278918', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('2', '祁县光华厂', '光华', '薛成', '0354-5298981', null, null, null, '吕波', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('20', '祁县喜福来玻璃加工厂', '喜福来', '王卫', '0354-5328850', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('21', '祁县美晶泡沫厂', '美晶', '范长', '0354-5071387', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('22', '祁县瑞成玻璃镀膜厂', '瑞成', '温明', null, '13834809374', null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('3', '祁县会龙厂', '会龙', '李伟', '0354-5248696', null, null, null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4', '祁县精艺厂', '精艺', '闫强', '0354-5047289', null, null, null, '高琴', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33d4f8b40133d99621cb0023', '祁县海洋厂', '升华', '刘生', '0354-5299987', null, null, null, '吕波', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33d4f8b40133d9989f5e0024', '闻喜民鑫厂', '民鑫', '李民', '0359-7472727', null, null, null, '吕波', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33de41d80133e982a18a001c', '太谷四通PVC厂', '太谷PVC', '张海', '0354-6226591', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a33ecdbf70133ee202e49000b', '祁县瑞成电镀厂', '瑞成电镀厂', '温民', '13835926900', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a34f93be50134f9df84470001', '神舟玻璃制品有限公司', '神舟厂', '申定', '0356-3961959', '13935672348', '0356-3991304', null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a353b8d8e0135415bf0a90070', '陕西宇津进出口有限公司', '宇津水龙头厂', '任宁', '029-62990818', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a35e0895e0135ec7a4dbe0087', '西安方圆工贸有限公司', '西安方圆工贸', '许涛', '029-86539568', null, '029-86590565', null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a3632e86601363344d16d0001', '淄博雷波陶瓷花纸厂', '淄博花纸厂', '吴璇', '0533-5176946', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a371a8d7f01372a74451f0068', '山西大德成工贸有限公司', '铁架厂', '高辉', '0354-5288919', null, null, null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a37583d45013758d152450038', '祁县顺驰厂', '顺驰', '王明', '0354-5109398', null, null, null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a38024a04013803e3a8a2004b', '祁县欣欣泡沫有限公司', '祁县欣欣泡沫厂', '许杰', '0354-3939793', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a382b4fd401382b9aad2a0008', '祁县仲玉玻璃厂', '仲玉', '吕军', '0354-5018888', null, null, null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a38736298013874c51a800036', '汇融玻璃有限公司', '展鹏厂', '厂长', '0354-5326986', '13834893800', '0354-5826197', null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a389cc7b701389d1efd940001', '宇虹包装彩印厂', '宇虹包装厂', '翟帅', '0358-3099923', '19033470988', '0358-3098183', null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a39b2b37f0139b46268c40025', '祁县馨艺玻璃厂', '馨艺', '袁长', '0354-5041938', null, null, null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a3aa9f950013ab0b6c98d0050', '祁县一先厂', '一先厂', '李刚', '0654-9018444', null, null, null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a3aa9f950013ab97f64110053', '温县致远玻璃制品有限公司', '温县致远厂', '红升', '18936896666', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a3abe8f15013ac019a61f0031', '祁县喜福来电镀厂', '喜福来电镀厂', '王卫', '0154-5282888', null, null, null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('4028817a3ae2ac42013ae3550357000d', '临潼华清蜡厂', '临潼华清蜡厂', '吴波', '13791903888', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('5', '祁县汇越厂', '汇越', '建忠', '0354-5019656', null, null, null, '吕波', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('6', '祁县泰宇厂', '泰宇', '立东', '0354-5299160', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('7', '祁县天顺厂', '天顺', '渠海', '0354-5299499', null, null, null, '李光', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('8', '祁县天诚厂', '天诚', '庞正', '0354-5299539', null, null, null, null, null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('9', '祁县华艺厂', '华艺', '史国', '0354-5041927', null, null, null, '高琴', null, '1', null, null, null);
insert into FACTORY_C (FACTORY_ID, FULL_NAME, FACTORY_NAME, CONTACTS, PHONE, MOBILE, FAX, CNOTE, INSPECTOR, ORDER_NO, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('1', '祁县宏艺厂', '宏艺', '杰诚', '0354-5041999', null, null, null, '高琴', null, '1', null, null, null);
commit;
prompt 42 records loaded
prompt Loading LOGIN_LOG_P...
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('201AA7F0-8E85-400E-B7E7-885D64278CB9', '001|è°ƒè¯•', '192.168.1.105', to_timestamp('24-09-2011 10:33:32.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('201CB44A-B244-446F-81AC-4136153DB008', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('26-09-2011 20:29:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('207D9A59-7330-4DB4-9704-A0CFF584FDBF', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('26-11-2011 13:22:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('20D09711-D3E2-40BA-8AFD-DEC5F7F7F4C6', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('03-10-2011 08:47:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2120970A-1335-4FE0-81E2-A3698C1F3563', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('17-09-2011 23:46:45.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('21228B54-D00F-40E6-8CAE-8652DC811188', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('19-09-2012 09:48:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('21337851-620C-4E31-ADA1-08F9D692E076', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('02-10-2011 00:34:26.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2191758C-872C-4B0B-9FBF-55A6F10126FD', 'anonymous|', '127.0.0.1', to_timestamp('27-11-2012 10:55:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('21F1856C-9B48-4B27-9A9D-460B3868D192', 'anonymous|', '192.168.1.107', to_timestamp('08-11-2012 09:12:08.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('220336B2-7FD2-458D-8426-50A88D8868E2', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-11-2012 11:24:25.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('228A0984-5BE4-4FFF-B5C4-A09ECB8A46F2', '001|è°ƒè¯•', '192.168.1.100', to_timestamp('11-07-2012 11:04:11.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('22DA6C12-23B0-4A34-928A-11732D9BD218', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('29-10-2012 14:42:08.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('23661154-F280-43FC-BA18-C445FFBCF40D', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('09-03-2013 23:30:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('237D9844-5C50-4843-AEDD-98DE912C08B5', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('31-01-2012 13:54:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2424F2EA-0768-45FF-B9B5-9448B8364EC8', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('09-03-2013 23:30:31.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('24652510-1930-45D1-BAA5-5D4D2144F8D2', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('03-02-2012 11:59:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('24894E43-794A-41A3-A012-8F0406BEAF94', 'anonymous|', '192.168.1.250', to_timestamp('11-07-2012 15:17:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2492ABB0-20F4-400F-908F-1EA295674998', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('31-01-2012 12:01:31.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('24B15961-1603-4152-A68B-F99301FE52E3', 'anonymous|å¸­å†›', '192.168.1.103', to_timestamp('05-12-2011 10:06:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('25FB47F1-7F86-4DB0-AC4B-66339043C08C', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 20:23:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('26473199-8658-4F7F-8C68-2C27EDA43C95', '001|è°ƒè¯•', '192.168.1.100', to_timestamp('11-07-2012 14:20:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('264D1896-41C8-4F62-974E-33E0EABDAA3E', '001|è°ƒè¯•', '192.168.1.114', to_timestamp('31-03-2012 17:40:35.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('26573894-76D2-4798-B05B-5E0C0CB4DD65', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('26-11-2011 13:15:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('269CEFEB-67A3-481F-9142-DF15E6C7202E', 'anonymous|ç”°ç‡•', '192.168.1.103', to_timestamp('10-09-2012 11:40:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('27255170-0926-42DD-BF8B-45D20D69B4D1', 'anonymous|', '192.168.1.112', to_timestamp('23-03-2012 18:00:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('275B005C-E72E-4281-A6D1-2CD389AC4D78', 'anonymous|', '192.168.1.107', to_timestamp('08-11-2012 10:12:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2808E396-34EA-4B01-8ECB-0B72B94A5164', 'anonymous|', '192.168.1.250', to_timestamp('11-07-2012 14:52:24.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('29A6FD8E-3F69-4EEC-A5C4-0706C227BB52', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('07-05-2012 11:37:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('29CA2D77-25BA-4987-8AD1-DBA6AD3637D9', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('24-08-2011 23:33:40.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('29E5F036-ABB5-49B5-92EA-57CD9A077C84', 'anonymous|ç”°ç‡•', '192.168.1.110', to_timestamp('29-10-2012 13:32:58.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2A00E72F-8DEB-413D-BC84-2B87D4DAB0D4', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 11:21:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2A5FCFE6-C252-44B7-B980-51A2F514EA26', '001|è°ƒè¯•', '192.168.1.104', to_timestamp('02-11-2012 15:18:56.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2A723397-F714-42EF-9F01-06FD4AED1C48', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 22:26:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2AFE3F35-5AB3-45B8-ACAC-2787AE781149', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 09:22:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2B12F143-58A4-4E8C-886C-DB1BCF40725B', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('16-02-2012 16:27:56.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2B2C5E4F-19ED-4D8C-BF25-A7BD1395A5A4', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('06-10-2011 17:12:23.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2B39C82C-C07D-4414-8683-5A24E5160708', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('30-10-2012 09:46:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2B63F315-7BA2-4E7C-8D34-FD807D8FD294', 'anonymous|', '192.168.1.109', to_timestamp('14-08-2012 09:31:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2BBB1453-BF9D-4012-A088-5636711B800E', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('21-01-2012 09:00:40.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2BC77AB7-5AE2-4775-B921-A2988D1F4330', 'anonymous|æœå¨Ÿä¸½', '192.168.1.107', to_timestamp('30-10-2012 16:18:25.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2BC9E787-7CCB-494B-921F-81DDAA84BBC9', 'anonymous|æœå¨Ÿä¸½', '192.168.1.117', to_timestamp('15-02-2012 17:25:09.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2C05F161-0CF9-4142-ABD1-DF151D1686DB', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('27-02-2012 10:52:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2C316061-4B54-42E2-BBB9-B348254250E8', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('19-08-2011 22:59:09.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2C3B9D8C-5837-47D2-A51B-085742BC3246', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('03-10-2011 09:00:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2CAA2DB1-7038-47F6-9ED8-930DC93C5FC7', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('11-09-2012 11:14:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2CD25F48-1E15-4BB3-998C-E686C2BF975C', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('18-01-2012 13:55:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2CE7EBAA-F0BC-44AD-A3FA-A549378C6987', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('24-09-2011 10:21:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2D05D3DF-A38D-4886-8658-9F2F4470F22A', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 18:38:44.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2D475E0C-F15E-4ED0-98C9-75EFB1F16314', 'anonymous|', '192.168.1.114', to_timestamp('17-05-2012 11:25:09.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2D54E569-6F8B-4281-B3A0-404F7026E2F8', 'anonymous|æœå¨Ÿä¸½', '192.168.1.107', to_timestamp('31-10-2012 14:28:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2D5ADBFC-2675-4415-92F8-1BF82FF34463', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-09-2011 20:09:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2D77EEA3-EABC-428E-8DE1-E8748B82A393', 'anonymous|', '192.168.1.106', to_timestamp('14-09-2012 09:20:26.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2DABB6F3-DB4F-4707-BF9C-A9385E352A47', 'anonymous|ç”°ç‡•', '192.168.1.110', to_timestamp('29-10-2012 14:07:55.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2DB43E71-B5A2-471A-B242-968058C117A0', 'anonymous|', '127.0.0.1', to_timestamp('27-11-2012 10:52:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2E3E9EE3-91B3-4F15-B46B-AB70DB44D475', '001|è°ƒè¯•', '192.168.1.109', to_timestamp('23-11-2012 15:32:02.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2E68F221-90A0-447F-9645-51ECF0C528AB', 'anonymous|', '192.168.1.114', to_timestamp('20-01-2012 11:58:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2EC56A38-103E-4955-A74D-D251C6631A55', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('18-10-2011 09:42:25.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2FEE3C8B-97BA-4C2C-A533-95C62D75BD6E', 'anonymous|', '192.168.1.107', to_timestamp('02-05-2012 15:11:24.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('2FF8499A-6EAD-4548-BEE9-0CA7DDB48484', '001|è°ƒè¯•', '192.168.1.104', to_timestamp('19-06-2012 16:07:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3004CDF0-3AC6-458C-BC62-AF5B6C7F601D', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 20:12:20.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3012147C-9F5B-4FEF-9CDF-882E0E3E2875', 'anonymous|ç”°ç‡•', '192.168.1.110', to_timestamp('29-10-2012 13:13:23.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3017ACD7-8D6E-449E-827D-3540A8178AFF', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 11:45:24.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('301CADBD-923A-47DD-B705-114A4773571E', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('18-01-2012 16:08:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('307270B4-10AA-4752-BE69-E1F7C1DCE976', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('03-10-2011 08:35:09.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('30ACD6F4-D048-4811-912E-6D6809EBE4B4', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('28-08-2011 11:40:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('30F95314-499F-4CB7-9E00-BB81AE7D3056', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('29-01-2012 14:05:28.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('31123A9E-A283-4D66-B489-82C7F3363BBC', '001|è°ƒè¯•', '192.168.1.109', to_timestamp('23-11-2012 09:51:53.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('31980BD3-FB24-4995-B8A7-1FFF59E461DA', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('18-10-2011 10:10:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('31A64C2A-77DE-4019-815E-E43A39E4AAEE', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('04-10-2011 23:01:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('31CAFFF3-C60C-4D42-B984-57F36B744687', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('26-09-2011 00:18:49.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3207E308-BA72-400A-9502-221776DB9C35', 'anonymous|å¸­å†›', '192.168.1.103', to_timestamp('02-12-2011 17:15:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('322DAB4D-BECF-44B7-A47B-9685D4EDC894', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('24-09-2011 10:00:26.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('32B8F34E-E3F4-47B7-BFBD-A62E16B3908F', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('13-01-2012 15:43:35.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('33585EF7-72B6-4045-9372-1054069BE70E', '001|è°ƒè¯•', '192.168.1.114', to_timestamp('01-04-2012 13:52:06.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3396FDD3-58A0-4E09-A939-0D36BC5799A6', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('28-09-2011 23:03:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('33ECC45B-E6D2-449D-BE4D-F679345A335C', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 13:00:08.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('351944AC-38F7-44E4-9CEB-E004115DDF43', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('30-10-2012 13:42:57.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('354EAEB5-F559-4318-B9B1-6DCE6FEEE7C3', '001|è°ƒè¯•', '192.168.1.109', to_timestamp('23-11-2012 09:35:23.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3575CB46-95ED-4B0F-8E1A-A8F391BFCCCD', '001|è°ƒè¯•', '192.168.1.109', to_timestamp('09-11-2012 10:19:23.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('35898414-7715-44EA-9756-8B0862E31302', 'anonymous|æœå¨Ÿä¸½', '192.168.1.117', to_timestamp('15-02-2012 17:48:34.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('35C0536F-C3A5-4EAF-A011-83612EB473C8', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('14-02-2012 10:58:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('363812C2-DDFD-44E7-B474-E5DC90D639BF', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('18-09-2011 14:18:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('364F49C2-3367-4717-874C-78444AC13818', 'anonymous|', '192.168.1.112', to_timestamp('23-03-2012 18:09:55.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('36EA9239-F568-40EC-AC3D-8BC20FD0EE5F', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('06-10-2011 23:57:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('37009E43-C1C5-4305-A4C3-EA36D95BC5B6', 'anonymous|ç”°ç‡•', '192.168.1.110', to_timestamp('29-10-2012 12:57:52.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('370F8792-2AEF-48EE-9F96-E5C5538D6131', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('01-10-2011 20:30:28.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3718C124-5F93-4786-8E18-6EF70E9FEB10', '001|è°ƒè¯•', '192.168.1.109', to_timestamp('09-11-2012 10:37:42.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('375076D6-2835-40B2-A832-7D61E0B1D557', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('24-09-2011 10:03:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3783FB98-7D1D-4500-B9AB-C2808FA90F91', 'anonymous|', '192.168.1.112', to_timestamp('23-03-2012 18:00:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('383B8C8B-6EC5-40ED-9E26-8D75DF7E3AB3', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('05-05-2012 09:57:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('38B3158C-947C-4413-8487-EE381D3DB125', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 01:56:45.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('390FD75A-9698-4D9A-A649-00D6C32221DE', '001|è°ƒè¯•', '192.168.1.112', to_timestamp('17-05-2012 11:19:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('395471C7-BEB7-46E4-8B4C-ED97BBBCFFDE', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('01-10-2011 18:36:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3B180289-F46D-4CBB-A156-66F80B9CB3AE', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('05-05-2012 11:45:51.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3B5EE029-4C94-4A38-B027-73776B14D464', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('19-09-2012 10:44:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3BC7C2E2-D054-4883-ADFB-C14B76F6C656', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('31-01-2012 13:24:29.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3CB24C26-AAD5-443D-89C4-BDC69B95A745', 'anonymous|', '192.168.1.111', to_timestamp('06-09-2012 10:05:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3D585F12-C8FC-42EE-9BB1-2052258A755A', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('11-09-2012 11:01:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3DE2D3DF-699A-4AB1-A5E3-C60E10A05A46', 'anonymous|å¸­å†›', '192.168.1.103', to_timestamp('02-12-2011 14:10:45.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('00330EC5-4F2C-48BB-AFC1-ADC5CBAEB7AC', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('17-01-2012 14:04:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 100 records committed...
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('009275C9-7459-4862-B339-C7CD13C244D6', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('17-01-2012 11:57:33.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('00D0157A-AD60-4856-802E-A3461F6939E0', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 12:37:29.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('00DA73C6-8DB4-402A-BEE0-95BDD79D0CDB', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('11-09-2012 10:56:23.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('011BD53F-99AF-4B45-B23B-4E02723BE7D7', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('29-10-2012 14:23:51.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('015CC22A-5C53-4597-B4AC-B51694D75C86', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('20-01-2012 16:03:49.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('01970044-E8A0-41DD-A7CB-EF0E012FE798', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('18-01-2012 11:40:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('01C6DB18-D8AC-48CE-B3F2-09BCDFD8D9A3', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 22:34:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('01F90304-E542-4B5E-9B3B-E49C17B6E891', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('18-10-2011 11:15:42.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('02AF06BD-65E4-4E02-8128-9E43B2AE06B6', 'anonymous|', '192.168.1.109', to_timestamp('14-08-2012 09:54:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('02B4B900-9D3F-4306-8F54-6395FDB5234A', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('29-10-2012 14:38:24.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('02E0CA26-C6E2-4C90-B94C-4CB7C63A7971', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('26-09-2011 19:48:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('03C5ACAB-C6C4-456F-9B3D-64A80BBECADA', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('18-09-2011 22:49:41.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('03ED9524-0BBA-4082-8FA6-2F6BA905A627', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-09-2011 19:32:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('042027CF-496F-4C79-BDD8-F3BFC05EDBCC', 'anonymous|', '192.168.1.114', to_timestamp('20-01-2012 12:15:28.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0451DE27-3C35-4054-B27B-80EC5F5303E9', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('20-08-2011 00:14:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0464165A-6013-4AF8-8ED3-9350369780ED', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('01-10-2011 21:39:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('04ED9BC3-FB5F-4F89-9DF6-5F34FE0ACB26', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('26-08-2011 20:19:15.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('05586466-481A-4426-A237-D06BB78FA27A', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('09-02-2012 10:33:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('06376BC7-200F-442A-85F4-27578A9BAA54', 'anonymous|', '192.168.1.114', to_timestamp('20-01-2012 11:53:21.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('06767A52-69EC-430D-B15C-9BDB0952CF53', 'anonymous|', '192.168.1.105', to_timestamp('16-04-2012 16:00:36.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('07C0244F-BFAC-45D4-945A-91B1E7B060F4', 'anonymous|', '192.168.1.111', to_timestamp('06-09-2012 09:19:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('07D7377C-F34E-4295-A773-C62FCDE27275', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('17-09-2011 22:54:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0886BF0D-6CAD-499A-9B2F-27BE6AAD6232', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('01-10-2011 21:03:53.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('08B680ED-D8D6-41D7-A21D-377F14A98D00', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 15:00:45.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('08D3AB2B-7377-4655-86CD-218CBBFDD77C', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('31-01-2012 09:47:34.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('091A50DF-C09F-4CE8-9A17-895453989987', 'anonymous|å¸­å†›', '192.168.1.103', to_timestamp('02-12-2011 17:14:41.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('09D1F647-5775-4E7A-8952-ED62C1B8CD55', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('09-03-2013 22:01:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0A71E925-A06B-4228-8103-468C44F235C3', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('26-09-2011 22:36:06.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0A8D201D-F56F-42E6-A87F-A6C49875A617', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('03-02-2012 15:09:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0ABAD9A6-CCFA-49E3-B117-7FCDC139D6FD', 'anonymous|æ¨ä¸½', '192.168.1.106', to_timestamp('29-03-2012 16:38:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0AF5FB33-34EB-4C9D-9BC4-14DE5B017249', '001|è°ƒè¯•', '192.168.1.112', to_timestamp('21-05-2012 14:34:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0B2BB269-E8B5-4780-862F-19375B86D544', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('07-05-2012 11:36:50.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0C1DD696-88D1-4737-854A-639CA191E50F', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('06-10-2011 18:41:57.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0CC13A98-B1A0-45AA-A9BD-9A9ED069D37E', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 12:21:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0CEAE7DF-318D-444B-BBC7-E5C8711F3577', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('22-02-2013 13:32:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0D0ACA9A-275F-40A9-9516-FA90772D7544', '001|è°ƒè¯•', '192.168.1.105', to_timestamp('14-11-2011 08:28:58.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0E0BED1C-7D64-4899-B2A7-BCB7917A369D', 'anonymous|', '192.168.1.105', to_timestamp('17-04-2012 11:15:20.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('0E3D4123-DE0E-48A5-80E9-3BA0DA0C202A', 'anonymous|å¼ çŽ‰æ°', '192.168.1.105', to_timestamp('14-11-2011 08:34:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1018CA16-0828-49D3-AD73-065C88FC3A99', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('05-10-2011 01:19:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('103546FD-CF89-4593-946F-0167A9BE4578', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('09-03-2013 23:00:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('108ABD5F-F9C0-48B9-9614-6EF6104DE2AC', 'anonymous|', '192.168.1.112', to_timestamp('02-05-2012 10:08:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('109F777E-EFC7-4814-9D3E-69BA7201C62F', 'anonymous|æ¼”ç¤º', '127.0.0.1', to_timestamp('07-03-2013 16:53:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('10E293A2-FF4C-47B4-9C69-DA544C26DE2B', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('16-01-2012 09:25:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1114E38F-3DB2-4708-8D4D-46C94F6811DB', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 21:13:31.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('112F4543-9FFC-4093-9D14-A9B5F1BE87F2', '001|è°ƒè¯•', '192.168.1.104', to_timestamp('02-11-2012 15:48:32.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1159EC64-F65C-487A-A185-D692F974B8BF', 'anonymous|', '192.168.1.112', to_timestamp('02-05-2012 14:19:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('11682A60-421D-497C-937B-F5CA404068A0', '001|è°ƒè¯•', '192.168.1.104', to_timestamp('19-06-2012 11:06:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1177E8CC-25F2-4E93-B351-4943819AC267', 'anonymous|', '192.168.1.101', to_timestamp('31-08-2012 09:58:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('12A0B150-BF96-4E05-95ED-2019E47CE750', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('24-09-2011 10:06:36.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('12C6D077-62C1-46BF-8FC2-249394E50919', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('23-09-2011 00:11:44.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('131B77E1-F97B-48A5-A58F-9F873F3447E5', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('02-02-2012 14:44:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1323C4C0-8387-4227-A086-66A3614A0AD5', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('03-02-2012 09:24:53.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('13531B13-BD61-4223-82CB-1CDD91CE70DC', 'anonymous|', '192.168.1.112', to_timestamp('26-07-2012 09:29:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('135EB6E9-D6FF-43CD-B5A5-3EA4AB3A8C79', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('18-10-2012 11:27:15.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1397A21A-407C-4713-AF9E-161C9A90A4E2', 'anonymous|', '192.168.1.112', to_timestamp('26-07-2012 09:07:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('13BDDADC-7D6E-4918-92F7-91F96D3C9EF1', 'anonymous|', '192.168.1.112', to_timestamp('01-06-2012 15:04:02.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('13BFDEC8-A223-4882-AB91-887250C3FC04', 'anonymous|æœå¨Ÿä¸½', '192.168.1.103', to_timestamp('14-09-2012 16:36:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('14149700-5698-495E-8C52-1A20660C6FF9', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 22:21:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('141BCA03-BB2B-4B87-9108-61295E1FE487', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 22:35:21.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('14351CBC-C434-4AF9-980D-37BB0C3F76E1', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('01-02-2012 09:55:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('146892A3-C818-41C3-8698-8C7D760C4340', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 23:10:08.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('14748A0B-5977-4AA7-A68E-4C4256A01BF2', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('25-09-2011 18:27:58.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('151E09DC-F651-42D9-A298-27EEF6ACFB28', '001|è°ƒè¯•', '192.168.1.100', to_timestamp('27-06-2012 09:39:42.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('15C183E1-9500-4BFF-AFB4-31C4B844BAE6', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 23:44:15.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('168854EA-C92D-45F4-8EB4-166596335B52', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('08-05-2012 11:16:25.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('168B7ADB-632C-4A4E-BAB0-2D21EFCFE0A0', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('16-09-2011 21:21:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('16ED96D0-C008-4DCE-B880-50CF0472F542', 'anonymous|', '192.168.1.107', to_timestamp('08-11-2012 09:40:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('175CA69C-B542-4B4D-A67F-B3340807B8AA', 'anonymous|', '192.168.1.111', to_timestamp('06-09-2012 13:40:45.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('17618DFE-5517-4242-9405-699FF9F2B973', 'anonymous|ç”°ç‡•', '192.168.1.110', to_timestamp('29-10-2012 13:52:44.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1770D63E-404D-450F-8F76-9089D619CC18', '001|è°ƒè¯•', '192.168.1.104', to_timestamp('19-06-2012 15:57:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('186B6DAF-8F56-4FF7-A646-84C30D1A6D53', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('30-10-2012 16:07:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('18AAF7D8-F795-4378-8975-9E3F429E96C3', '001|è°ƒè¯•', '192.168.1.109', to_timestamp('23-11-2012 10:51:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1933F97A-B042-49AA-8A1A-3FA631580CC4', 'anonymous|', '192.168.1.112', to_timestamp('26-07-2012 09:16:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1991B0B9-D32A-48F5-8F49-2B0D4573A66B', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('06-10-2011 12:26:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('19983FE7-E249-4881-BC15-40586848A546', 'anonymous|', '127.0.0.1', to_timestamp('27-11-2012 11:06:36.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('19A278AD-5614-4F6B-8720-CE4035A64AF2', 'anonymous|ç”°ç‡•', '192.168.1.110', to_timestamp('29-10-2012 13:23:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('19E76666-BFDE-4D59-B32F-11CAEF51C42E', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 00:15:54.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('19FFE3B2-63F9-49F6-B0A1-3451B5BAD496', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('31-01-2012 13:47:26.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1A5012E7-CA72-4D2C-9BD2-D72DAEC79D83', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 12:27:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1AB04EC8-96CA-411D-B0CF-AC867CEF331C', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('30-10-2012 11:33:45.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1B08FD11-BCE1-434E-AA99-9635471EFF7B', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('29-10-2012 17:11:33.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1B38E3E3-1DAF-4853-A283-092BDC876E2F', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 16:41:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1B5FC7D3-E84D-40CC-ABD9-730CEB476307', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('28-09-2011 22:57:58.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1B655B21-9D3B-46EA-AEAF-F3F62C74BBCF', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('06-10-2011 10:26:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1BAEFFE6-CA02-4949-8A75-6419333D4E36', 'anonymous|', '192.168.1.250', to_timestamp('11-07-2012 15:31:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1BBDE9CC-0C89-46D7-B691-21CB6682D1D9', '001|è°ƒè¯•', '192.168.1.100', to_timestamp('11-07-2012 10:23:58.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1BBE3A3C-F7B6-4878-8871-BEFC5A4AB270', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 00:33:29.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1BC989D7-FF9E-4A3D-BB57-7778FC89A263', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('23-07-2012 10:35:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1BDDB409-D790-43C9-BCAE-0777FC6CDAC7', 'anonymous|æœå¨Ÿä¸½', '192.168.1.103', to_timestamp('14-09-2012 16:43:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1C2BF2D9-A00D-4E5E-9FFB-3589D15FF16A', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('02-02-2012 13:21:50.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1C51A4E6-7CA4-425D-BD32-551881479CFA', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('04-10-2011 10:52:42.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1CFF71C5-A753-458A-8F52-F838900F4A24', 'anonymous|', '192.168.1.103', to_timestamp('18-10-2011 10:05:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1D7D0E31-F4B6-4EF4-AEE6-3ACE7DA9A48B', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('23-07-2012 09:42:56.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1D92740F-D0E8-4929-833B-D602FD204C47', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('31-01-2012 10:36:15.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1E38770B-6150-4034-940D-7609B47C88A6', '001|è°ƒè¯•', '192.168.1.104', to_timestamp('19-06-2012 16:36:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1EF9FE75-F6D4-477D-86B0-14F73CDD0D6D', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('19-10-2012 11:36:35.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1F271A0B-EDB1-4A55-B5FE-9837A35C2395', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('11-09-2012 15:24:37.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1F9472E3-1B37-42EF-BABD-8228D5A60DF2', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 21:44:31.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('1FE8AD39-6AB0-414F-9F72-E7F291D5EE40', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('30-01-2012 13:31:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('200B153D-90F3-427E-B5F3-5CB430319920', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 09:59:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 200 records committed...
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3E315916-5B39-49F9-9CD8-096FAE73E73C', 'anonymous|', '192.168.1.103', to_timestamp('17-05-2012 08:45:54.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3E553D1D-CF27-4FCA-837A-5F5004DB2206', 'anonymous|', '192.168.1.107', to_timestamp('02-05-2012 16:08:37.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3E8A6DD2-CD6D-44B3-BBF4-EEFC4C935BF4', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 19:53:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3E8C4B3B-54DF-4446-89A4-596AEE9B1092', 'anonymous|', '192.168.1.103', to_timestamp('17-05-2012 10:49:41.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3EE2FF28-128A-42AA-B6D3-F6FF5780C202', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('06-10-2011 17:53:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3EE5ADD6-9C81-464E-8763-25761411DC3A', 'anonymous|æœå¨Ÿä¸½', '192.168.1.117', to_timestamp('15-02-2012 15:02:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3FCC961F-77A8-4799-8438-F4D59C5869E0', 'anonymous|æ¨ä¸½', '192.168.1.106', to_timestamp('29-03-2012 16:31:57.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3FCEE369-9FEC-4777-B1A7-C30A65957338', 'anonymous|', '192.168.1.104', to_timestamp('31-10-2011 08:24:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3FCFD611-252A-4394-8619-D99954FFF6E0', '001|è°ƒè¯•', '192.168.1.114', to_timestamp('31-03-2012 16:07:05.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('3FDB6D6A-1018-4DEF-B3EB-1E7D049624D9', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('13-01-2012 17:01:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('426C3C26-AA4F-415E-B878-5900BCDD3DC6', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('09-03-2013 23:33:34.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('403F1176-00FE-48BE-8E12-F198E2386EE7', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('24-08-2011 23:37:40.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('40865F80-E37D-48F9-AA82-57B09AF0A82C', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('31-01-2012 13:47:51.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('42E5C875-C6E1-40B5-B761-41886A3DE524', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('21-08-2011 17:51:06.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('42ED3BDD-54FA-4A48-9248-37609E8EFC41', 'anonymous|', '192.168.1.103', to_timestamp('17-05-2012 09:15:51.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('43068DB6-11D5-45BA-993F-BFD99C885712', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('14-09-2011 20:13:49.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('439F16C1-3AF0-4765-9679-A7D5AE5E95C9', 'anonymous|æ¨ä¸½', '192.168.1.106', to_timestamp('29-03-2012 16:36:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('44EF6141-6ABA-4F48-8C87-2E61E6A1672E', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('20-08-2011 22:50:53.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('45430562-13B1-4ADA-8203-30E6A6D32260', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('04-09-2011 09:13:09.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('457D45ED-70D5-4317-BE39-DCA24D510DCD', 'anonymous|æ¨ä¸½', '192.168.1.106', to_timestamp('30-03-2012 09:12:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('45B4BB2F-0F8B-47E0-97F7-9B261D36DE9A', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-11-2012 11:38:20.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('46A7E187-2670-4957-8034-A47A4B6873F2', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('22-08-2011 23:32:51.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('46D48948-8A15-4C4E-9726-526D6E08556F', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('18-10-2012 16:27:06.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('47980F1D-1B30-4D92-9DBE-B4C031B7BB43', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 12:07:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('47A44E8B-0001-4624-B728-051966DFB3B8', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('06-09-2011 16:13:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('47B43958-A874-4F23-A43A-8CBA063A3899', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 11:59:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('47F1633E-F2AF-43A0-9C84-BFA4C8EF9AD5', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('05-10-2011 08:19:06.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('48ED0172-6E12-4B23-AAF2-BB35F98C4924', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('25-09-2011 23:26:23.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('48F0886B-32A9-47A1-B6BB-49EBA31761F1', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('06-10-2011 16:45:51.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('49349870-4E61-421E-8DBA-0B4FB9CDA90D', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 22:08:26.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4A19FE79-C846-4B59-AE31-1AAF089B671F', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('20-01-2012 15:33:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4A245A22-6647-41F9-93F1-343F75F8E5BA', 'anonymous|æ¨ä¸½', '192.168.1.105', to_timestamp('04-11-2011 16:06:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4A8315A7-BF69-4832-A987-3D652FC1CB70', 'anonymous|æœå¨Ÿä¸½', '192.168.1.103', to_timestamp('14-09-2012 16:34:34.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4A91C497-7179-44BC-B043-A8EE81A6B7B6', 'anonymous|å¸­å†›', '192.168.1.103', to_timestamp('02-12-2011 12:17:05.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4AC5113C-442A-47F3-A699-4F18396F6156', 'anonymous|', '192.168.1.114', to_timestamp('20-01-2012 11:51:47.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4ADFDFF0-FBBD-4EC6-B452-EC30A5F20E7F', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('03-02-2012 10:05:42.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4B057C80-5E9B-4FA3-9214-C5525BC99655', 'anonymous|', '192.168.1.112', to_timestamp('01-06-2012 15:57:20.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4B3339D6-8FDF-4A80-A5D7-B8DE58E56CAD', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('02-02-2012 08:55:56.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4B8C7A1B-BB50-4180-87E2-998AE790B85D', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('06-10-2011 17:46:04.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4C7B3E46-9DF8-42B0-A461-B74A1FBDF745', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('30-08-2011 06:33:37.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4CD33CE0-2FF9-4A61-8A89-646628045D66', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('30-10-2012 15:57:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4D0CA543-EF7C-4A86-AB79-265308123C1D', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('09-02-2012 10:49:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4D672DA9-276C-46A9-942D-DBF7C344A31A', 'anonymous|æœå¨Ÿä¸½', '192.168.1.117', to_timestamp('15-02-2012 14:46:29.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4DAAEA8B-ED71-40C4-AACC-C81DF580DB5E', 'anonymous|å¸­å†›', '192.168.1.103', to_timestamp('02-12-2011 13:50:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4DD7A416-1D2F-4A4C-A41B-F4C7B8AB7086', 'anonymous|', '192.168.1.107', to_timestamp('08-11-2012 11:27:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4DDEBB5E-2049-4C9F-8192-7551428F5B64', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('18-10-2011 11:30:49.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4DF70734-DC02-4AD1-9167-AC86C388794D', '001|è°ƒè¯•', '192.168.1.109', to_timestamp('23-11-2012 15:50:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4E59D1E9-827F-4D77-A5F9-5573B91BFE9B', 'anonymous|å¸­å†›', '192.168.1.103', to_timestamp('02-12-2011 17:00:21.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4E61A8CE-9D32-43DD-BF56-09FD259836CC', 'anonymous|æœå¨Ÿä¸½', '192.168.1.107', to_timestamp('30-10-2012 16:23:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4E74706C-E748-4460-BB0D-8A689EE054B8', 'anonymous|ç”°ç‡•', '192.168.1.103', to_timestamp('10-09-2012 11:09:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4E7B89F4-9FC0-41CE-9707-D8970B65020A', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('30-10-2012 10:11:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4EF7C984-5E04-4C3F-82EC-A209BBEE9BB1', '001|è°ƒè¯•', '192.168.1.114', to_timestamp('01-04-2012 14:17:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4F1FC363-7BD4-4BA3-9C13-D398B760FCA7', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('31-01-2012 16:37:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4F503A4B-8DF7-4518-AFC2-B3EBC64A48F8', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('22-08-2011 18:49:53.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4F6651B3-F05A-43E9-B7CD-77C2A48CB3E8', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('03-02-2012 11:58:15.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4FB5949C-3503-4EE4-9C9B-78144F7E9C03', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('01-02-2012 10:54:41.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4FCF4A54-1C6D-4C79-BD28-BAA3E6D0726E', 'anonymous|æ¨ä¸½', '192.168.1.106', to_timestamp('29-03-2012 15:56:52.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4FD63E18-812C-47E2-AFE0-EADC7B5C1E91', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('17-01-2012 12:01:34.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4FE246EE-CE00-4776-B5AB-BF47A357C8D7', 'anonymous|æœå¨Ÿä¸½', '192.168.1.117', to_timestamp('15-02-2012 15:02:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4FEA45AE-194E-464E-9E3C-6BEB249C6747', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('19-09-2012 09:22:06.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('4FF98B4D-DE53-49E4-8CC7-11592737786C', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('25-09-2011 20:28:54.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('507036DE-CDE7-4A15-9494-BA0D61EE252E', 'anonymous|æœå¨Ÿä¸½', '192.168.1.117', to_timestamp('15-02-2012 15:18:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('50BEC893-656B-4BC5-B69F-3607A66A1556', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('31-01-2012 13:41:34.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('511712BA-CF9F-4B7E-BB54-F13B93F62D4B', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 18:44:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('51B21BA7-8D3D-4BEA-A013-285CACEC849B', '001|è°ƒè¯•', '192.168.1.109', to_timestamp('23-11-2012 15:30:40.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('51EDCA13-9867-4069-8CEC-A6F7720014CC', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('04-09-2011 23:24:50.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('52052599-3860-4A97-9185-882A472E75B4', '001|è°ƒè¯•', '192.168.1.104', to_timestamp('19-07-2012 09:44:25.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('522FA07B-7023-4ACA-8626-441890D4DBFC', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('20-01-2012 15:29:10.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('52935FA1-D468-4D9A-916A-69B8447E7E15', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('23-07-2012 15:26:08.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('52D8FD3D-4474-46F5-9BAF-2B6E9D090EB2', 'anonymous|', '192.168.1.109', to_timestamp('14-08-2012 09:14:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('532C7503-FCE6-4D68-B214-D0FC043A87CA', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('16-01-2012 10:19:37.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('536F5D9D-6912-4071-8AF1-F69532EC38D7', '001|è°ƒè¯•', '192.168.198.1', to_timestamp('24-09-2011 09:10:13.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('53BA3CD2-7765-472D-AF06-6D9678B1382D', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('03-10-2011 08:57:21.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('546C540F-77A0-4ED1-B8BC-64E7647B450B', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('18-10-2011 11:13:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5499D513-DF04-4ABC-8C9E-0886E08B4A2F', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('30-10-2012 15:48:37.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('55B7DB5A-B2C2-420E-9E9A-AE6F6A7582B2', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('31-01-2012 14:06:35.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('55D80221-B4EB-4A62-9B5D-177E4BBFD71E', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('20-08-2011 00:30:15.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('56573699-39DF-4E68-8C7B-35F789393A04', 'anonymous|å¸­å†›', '192.168.1.103', to_timestamp('05-12-2011 11:57:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('56692AAE-3546-460F-871B-09D1BE4A1C47', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('18-10-2011 11:11:29.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('568E760C-6D8A-49E9-BDDA-49114B3AB0B8', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('08-05-2012 10:14:21.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5723BD5B-4C62-4377-A319-1E4A1BF5DE32', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-03-2013 22:36:53.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('575BCE37-83AD-4144-B205-3BD62210542E', '001|è°ƒè¯•', '192.168.1.110', to_timestamp('09-02-2012 09:05:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('576045F8-5D5F-46CA-8460-9F4A9CBD67A1', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 21:39:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('57AC4C5F-9543-4036-90B8-6C907EB93EFF', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('02-02-2012 10:56:42.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('57D8D2AB-02AE-43D3-A05C-3ED09991AA1E', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('07-05-2012 14:18:06.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('57ECA128-2A4C-4434-B758-7B95EF2F8715', 'anonymous|æœå¨Ÿä¸½', '192.168.1.103', to_timestamp('14-09-2012 14:49:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('58641A3B-445D-44BA-8E54-C01E8C3B807A', 'anonymous|', '192.168.1.112', to_timestamp('23-03-2012 16:44:21.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('58740EF0-5121-4807-8DC5-742A4C7E03F7', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('29-08-2011 23:04:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5885DC82-06E2-4799-B4C9-37B1D8234D79', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('11-09-2012 15:31:37.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('58D90853-EDD2-4EB9-82D8-C58FF51EEDC9', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('28-08-2011 10:34:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('59BFAAF4-D1E7-4903-9BAA-05A3515C075D', '001|è°ƒè¯•', '192.168.1.102', to_timestamp('24-09-2011 10:19:58.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('59EEEBC1-07D7-49C1-90A2-EA2DD1438CCF', 'anonymous|', '192.168.1.105', to_timestamp('17-04-2012 09:44:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('59F83FF6-3887-46FB-A5D4-B8F4A646427B', 'anonymous|', '192.168.1.101', to_timestamp('31-08-2012 09:58:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5A9D62F4-618C-4195-AC9E-BFC6B07A266D', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('28-08-2011 21:35:54.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5AAE780B-C129-4B2B-9C82-825135AC2617', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('19-10-2012 13:31:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5AC30ABC-D217-474F-A183-B12AE32EA6F4', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('07-10-2011 17:26:08.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5C35B59D-138A-4004-B1CD-46004075AF7D', '001|è°ƒè¯•', '192.168.1.103', to_timestamp('19-10-2012 09:29:10.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5C633327-8966-493F-B0C0-DD259FDF66FB', '001|è°ƒè¯•', '192.168.1.114', to_timestamp('17-05-2012 11:05:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5C63543A-9CA7-447C-A406-96CD9EC7A14C', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('05-10-2011 00:05:40.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5C6F4C47-E9DE-4E63-AFA6-9D3FC94254DA', 'anonymous|ç”°ç‡•', '192.168.1.103', to_timestamp('10-09-2012 09:53:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 300 records committed...
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5CA623D4-2520-4D6C-911E-706BDB8BB91B', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('26-09-2011 01:28:58.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5CBCE1AA-4470-4BC7-940D-30A27EAC4BE4', '001|è°ƒè¯•', '192.168.1.112', to_timestamp('21-05-2012 09:52:25.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5CC8C4C3-D2BD-4D97-89A4-F58858534B6A', '001|è°ƒè¯•', '192.168.1.106', to_timestamp('05-05-2012 09:33:44.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5CD97648-C89A-4626-87AF-FB98E5A8FFB8', 'anonymous|æœå¨Ÿä¸½', '192.168.1.117', to_timestamp('16-02-2012 09:40:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5DA297A1-2F72-4898-98B6-CFC0E45734FF', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('14-09-2011 22:08:53.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5DBBE7B5-3712-4566-83EC-73E31BE4DA3F', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('27-08-2011 22:44:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5DF01839-9A88-4C55-911C-F31B74CB66DE', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('01-10-2011 20:52:04.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5E79F544-4613-4202-882C-A4643D8576F4', '001|è°ƒè¯•', '127.0.0.1', to_timestamp('28-08-2011 14:21:04.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5FC5091C-9B41-4B2D-AE02-FA34E25CB6CC', '001|è°ƒè¯•', '192.168.1.115', to_timestamp('02-02-2012 11:42:50.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into LOGIN_LOG_P (LOGIN_LOG_ID, LOGIN_NAME, IP_ADDRESS, LOGIN_TIME)
values ('5FF1CD33-99C7-443F-9FB6-68419532CF07', '001|è°ƒè¯•', '192.168.1.104', to_timestamp('02-11-2012 09:33:42.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 310 records loaded
prompt Loading ONLINE_T...
insert into ONLINE_T (A1)
values ('00');
insert into ONLINE_T (A1)
values ('01');
insert into ONLINE_T (A1)
values ('02');
insert into ONLINE_T (A1)
values ('03');
insert into ONLINE_T (A1)
values ('04');
insert into ONLINE_T (A1)
values ('05');
insert into ONLINE_T (A1)
values ('06');
insert into ONLINE_T (A1)
values ('07');
insert into ONLINE_T (A1)
values ('08');
insert into ONLINE_T (A1)
values ('09');
insert into ONLINE_T (A1)
values ('10');
insert into ONLINE_T (A1)
values ('11');
insert into ONLINE_T (A1)
values ('12');
insert into ONLINE_T (A1)
values ('13');
insert into ONLINE_T (A1)
values ('14');
insert into ONLINE_T (A1)
values ('15');
insert into ONLINE_T (A1)
values ('16');
insert into ONLINE_T (A1)
values ('17');
insert into ONLINE_T (A1)
values ('18');
insert into ONLINE_T (A1)
values ('19');
insert into ONLINE_T (A1)
values ('20');
insert into ONLINE_T (A1)
values ('21');
insert into ONLINE_T (A1)
values ('22');
insert into ONLINE_T (A1)
values ('23');
commit;
prompt 24 records loaded
prompt Loading PACKING_LIST_C...
insert into PACKING_LIST_C (PACKING_LIST_ID, SELLER, BUYER, INVOICE_NO, INVOICE_DATE, MARKS, DESCRIPTIONS, EXPORT_IDS, EXPORT_NOS, STATE, CREATE_BY, CREATE_DEPT, CREATE_TIME)
values ('6853e58d-e8d1-4b37-9985-7bc364b1f4c4', '22', '12', '12', to_timestamp('17-02-2020 13:45:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '12', '12', 'd3693d03-38af-490c-aba4-470782b3f0ce|7992db4d-2833-4bfb-a6fd-bc17fb163ac4', '11JK1080|11JK1078', 1, null, null, null);
commit;
prompt 1 records loaded
prompt Loading SYS_CODE_B...
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('01', '系统代码', '-1', 'root', 0, 0, 1, null, null, 0, '1', null, to_timestamp('11-03-2010 09:34:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('11-03-2010 09:34:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('0101', '人员级别', '01', '系统代码', 1, 0, 0, null, null, 1, null, '001', to_timestamp('16-07-2011 07:43:41.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010102', '管理员', '0101', '人员级别', 2, 1, 0, null, null, 1, null, '001', to_timestamp('16-07-2011 07:44:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010103', '总经理', '0101', '人员级别', 2, 1, 0, null, null, 2, null, '001', to_timestamp('16-07-2011 07:44:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010104', '部门经理', '0101', '人员级别', 2, 1, 0, null, null, 3, null, '001', to_timestamp('16-07-2011 07:44:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '001', to_timestamp('16-07-2011 07:44:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010105', '组长', '0101', '人员级别', 2, 1, 0, null, null, 4, null, '001', to_timestamp('16-07-2011 07:44:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010106', '员工', '0101', '人员级别', 2, 1, 0, null, null, 5, null, '001', to_timestamp('16-07-2011 07:44:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('0102', '栏目', '01', '系统代码', 1, 0, 0, null, null, 2, null, '001', to_timestamp('05-08-2011 15:21:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010202', '新闻报道', '0102', '栏目', 2, 1, 0, null, null, 1, null, '001', to_timestamp('05-08-2011 15:24:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010203', '通知公告', '0102', '栏目', 2, 1, 0, null, null, 2, null, '001', to_timestamp('05-08-2011 15:24:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010204', '公司制度', '0102', '栏目', 2, 1, 0, null, null, 3, null, '001', to_timestamp('05-08-2011 15:24:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010205', '行业报道', '0102', '栏目', 2, 1, 0, null, null, 4, null, '001', to_timestamp('05-08-2011 15:24:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010206', '大事记', '0102', '栏目', 2, 1, 0, null, null, 5, null, '001', to_timestamp('05-08-2011 15:24:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('0103', '厂家类型', '01', '系统代码', 1, 0, 1, null, null, 3, null, '001', to_timestamp('05-08-2011 15:21:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '001', to_timestamp('04-10-2011 08:13:04.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010302', '玻璃', '0103', '厂家类型', 2, 1, 1, null, null, 1, null, '001', to_timestamp('18-08-2011 16:10:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '001', to_timestamp('04-10-2011 08:14:20.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010303', '彩盒', '0103', '厂家类型', 2, 1, 1, null, null, 2, null, '001', to_timestamp('18-08-2011 16:10:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '001', to_timestamp('04-10-2011 08:14:20.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010304', 'PVC', '0103', '厂家类型', 2, 1, 1, null, null, 3, null, '001', to_timestamp('20-01-2012 15:16:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010305', '花纸', '0103', '厂家类型', 2, 1, 1, null, null, 4, null, '001', to_timestamp('20-01-2012 15:16:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010306', '保丽龙', '0103', '厂家类型', 2, 1, 1, null, null, 5, null, '001', to_timestamp('20-01-2012 15:16:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010307', '电镀', '0103', '厂家类型', 2, 1, 1, null, null, 6, null, '001', to_timestamp('20-01-2012 15:16:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010308', '水龙头', '0103', '厂家类型', 2, 1, 1, null, null, 7, null, '001', to_timestamp('20-01-2012 15:16:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010309', '蜡', '0103', '厂家类型', 2, 1, 1, null, null, 8, null, '001', to_timestamp('09-11-2012 11:59:26.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('0104', '附件类型', '01', '系统代码', 1, 0, 1, null, null, 4, null, '001', to_timestamp('04-10-2011 08:13:04.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010402', '彩盒', '0104', '附件类型', 2, 1, 1, null, null, 1, '1', '001', to_timestamp('04-10-2011 08:14:10.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010403', '花纸', '0104', '附件类型', 2, 1, 1, null, null, 2, '1', '001', to_timestamp('04-10-2011 08:14:10.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010404', '保丽龙', '0104', '附件类型', 2, 1, 1, null, null, 3, '1', '001', to_timestamp('04-10-2011 08:14:10.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010405', '电镀', '0104', '附件类型', 2, 1, 1, null, null, 4, '1', '001', to_timestamp('04-10-2011 08:14:11.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('26-11-2011 13:08:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010407', 'PVC', '0104', '附件类型', 2, 1, 0, null, null, 6, '1', '001', to_timestamp('06-12-2011 12:54:52.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010408', '喷头', '0104', '附件类型', 2, 1, 0, null, null, 7, '1', '001', to_timestamp('06-12-2011 12:54:52.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('010409', '不锈钢勺子', '0104', '附件类型', 2, 1, 0, null, null, 8, '1', '001', to_timestamp('01-04-2012 14:24:24.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('01-04-2012 14:24:24.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('a', '系统代码', '-1', 'root', 0, 0, 1, null, null, 0, '1', null, to_timestamp('11-03-2010 09:34:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, to_timestamp('11-03-2010 09:34:38.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_CODE_B (SYS_CODE_ID, NAME, PARENT_ID, PARENT_NAME, LAYER_NUM, IS_LEAF, QUOTE_NUM, CNOTE, ICO, ORDER_NO, STATE, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME)
values ('b', '人员级别', '01', '系统代码', 1, 0, 0, null, null, 1, null, '001', to_timestamp('16-07-2011 07:43:41.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, null);
commit;
prompt 32 records loaded
prompt Loading USER_LOGIN_C...
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('c6f18c54-93d6-4dbd-b464-fcada2a0fd0d', '张三', '123456', 'zhangsan2@luojia.com', '销售部', to_timestamp('25-02-2020 22:20:17.855000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('01-02-1990 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('b61a4fbe-73cc-4f0f-9f65-2e20438be37f', '张三', '1', 'zs', '人事部', to_timestamp('08-02-2020 13:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('26-02-2020 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('84671781-f0a4-4274-8b3e-fe1175c72023', '王五', '123456', 'wangwu3@luojia.com', '销售部', to_timestamp('07-10-2015 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('07-10-2001 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('c746d4b4-b843-449c-aa0b-776eec43d1ac', '赵柳柳', '123', 'zhaoliuliu@luojia.com', '行政部', to_timestamp('08-10-2019 13:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('25-02-1993 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('94ab4b0a-dca6-49e2-b5ec-6d5046ff3b29', '程浩伟', '1', 'haoweic@luojia.com', '人事部', to_timestamp('08-02-2020 13:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-02-1997 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('2e45a714-7262-4e01-a4ae-fa256511727d', '张三', '1', 'zhangsan@luojia.com', '销售部', to_timestamp('08-02-2020 13:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('07-10-2001 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('970ec3a4-88da-4486-aaf9-a70870ed2483', '李四', '1', 'lisi@luojia.com', '商务部', to_timestamp('08-02-2020 13:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('26-03-1997 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('508728ec-8087-4339-8261-bf79e1ba462a', '王五', '1', 'wangwu@luojia.com', '人事部', to_timestamp('08-08-2019 13:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('07-10-2001 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('8b81bd3a-5b4f-47da-ab82-00aef7a51815', '赵六', '1', 'zhaoliu@luojia.com', '客服部', to_timestamp('01-12-2019 09:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('07-10-2001 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into USER_LOGIN_C (USER_ID, USERNAME, PASSWORD, EMAIL, DEPARTMENT, CREATE_TIME, BIRTHDAY)
values ('11fa02d7-059a-46d0-89ae-6f3554bccb9e', '王五', '123456', 'wangwu2@luojia.com', '销售部', to_timestamp('26-10-2019 09:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('07-10-2001 00:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 10 records loaded
prompt Enabling triggers for CONTRACT_C...
alter table CONTRACT_C enable all triggers;
prompt Enabling triggers for CONTRACT_HIS_C...
alter table CONTRACT_HIS_C enable all triggers;
prompt Enabling triggers for CONTRACT_PRODUCT_C...
alter table CONTRACT_PRODUCT_C enable all triggers;
prompt Enabling triggers for CONTRACT_PRODUCT_HIS_C...
alter table CONTRACT_PRODUCT_HIS_C enable all triggers;
prompt Enabling triggers for EXPORT_C...
alter table EXPORT_C enable all triggers;
prompt Enabling triggers for EXPORT_PRODUCT_C...
alter table EXPORT_PRODUCT_C enable all triggers;
prompt Enabling triggers for EXT_CPRODUCT_C...
alter table EXT_CPRODUCT_C enable all triggers;
prompt Enabling triggers for EXT_CPRODUCT_HIS_C...
alter table EXT_CPRODUCT_HIS_C enable all triggers;
prompt Enabling triggers for EXT_EPRODUCT_C...
alter table EXT_EPRODUCT_C enable all triggers;
prompt Enabling triggers for FACTORY_C...
alter table FACTORY_C enable all triggers;
prompt Enabling triggers for LOGIN_LOG_P...
alter table LOGIN_LOG_P enable all triggers;
prompt Enabling triggers for ONLINE_T...
alter table ONLINE_T enable all triggers;
prompt Enabling triggers for PACKING_LIST_C...
alter table PACKING_LIST_C enable all triggers;
prompt Enabling triggers for SYS_CODE_B...
alter table SYS_CODE_B enable all triggers;
prompt Enabling triggers for USER_LOGIN_C...
alter table USER_LOGIN_C enable all triggers;
set feedback on
set define on
prompt Done.
