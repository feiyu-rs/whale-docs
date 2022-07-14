/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2022-07-14 21:15:14                          */
/*==============================================================*/


/*==============================================================*/
/* Table: account                                               */
/*==============================================================*/
create table account (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   user_id              INT8                 not null,
   name                 VARCHAR(15)          not null,
   icon                 TEXT                 not null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__account__id primary key (id)
);

comment on table account is
'账户表';

comment on column account.id is
'id';

comment on column account.user_id is
'用户表id';

comment on column account.name is
'名称';

comment on column account.icon is
'账户图标Icon';

comment on column account.status is
'状态(0:正常,1:已删除)';

comment on column account.create_time is
'创建时间';

comment on column account.update_time is
'更新时间';

/*==============================================================*/
/* Table: account_detail                                        */
/*==============================================================*/
create table account_detail (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   account_id           INT8                 not null,
   name                 VARCHAR(15)          not null,
   balance              DECIMAL(18,6)        not null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__account_detail__id primary key (id)
);

comment on table account_detail is
'账户详情表';

comment on column account_detail.id is
'id';

comment on column account_detail.account_id is
'账户表id';

comment on column account_detail.name is
'名称';

comment on column account_detail.balance is
'余额';

comment on column account_detail.status is
'状态(0:正常,1:已删除)';

comment on column account_detail.create_time is
'创建时间';

comment on column account_detail.update_time is
'更新时间';

/*==============================================================*/
/* Table: budget                                                */
/*==============================================================*/
create table budget (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   user_id              INT8                 not null,
   month_budget_amount  DECIMAL(18,6)        null,
   day_budget_amount    DECIMAL(18,6)        null,
   budget_start_day     INT2                 null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__budget__id primary key (id)
);

comment on table budget is
'预算表';

comment on column budget.id is
'id';

comment on column budget.user_id is
'用户表id';

comment on column budget.month_budget_amount is
'月预算金额';

comment on column budget.day_budget_amount is
'日预算金额';

comment on column budget.budget_start_day is
'预算起始日期[日期格式:dd]';

comment on column budget.status is
'状态(0:正常,1:已删除)';

comment on column budget.create_time is
'创建时间';

comment on column budget.update_time is
'更新时间';

/*==============================================================*/
/* Table: ledger                                                */
/*==============================================================*/
create table ledger (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   name                 VARCHAR(100)         not null,
   synopsis             VARCHAR(200)         null,
   theme_color          VARCHAR(50)          null,
   cover_image          TEXT                 null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__ledger__id primary key (id)
);

comment on table ledger is
'账本表';

comment on column ledger.id is
'id';

comment on column ledger.name is
'名称';

comment on column ledger.synopsis is
'简介';

comment on column ledger.theme_color is
'主题颜色';

comment on column ledger.cover_image is
'封面图片';

comment on column ledger.status is
'状态(0:正常,1:已删除)';

comment on column ledger.create_time is
'创建时间';

comment on column ledger.update_time is
'更新时间';

/*==============================================================*/
/* Table: mid_user_ledger                                       */
/*==============================================================*/
create table mid_user_ledger (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   user_id              INT8                 not null,
   ledger_id            INT8                 not null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__mid_user_ledger__id primary key (id),
   constraint uk__mid_user_ledger__user_id__ledger_id unique (user_id, ledger_id)
);

comment on table mid_user_ledger is
'用户账本中间表';

comment on column mid_user_ledger.id is
'id';

comment on column mid_user_ledger.user_id is
'用户表id';

comment on column mid_user_ledger.ledger_id is
'账本表id';

comment on column mid_user_ledger.status is
'状态(0:正常,1:已删除)';

comment on column mid_user_ledger.create_time is
'创建时间';

comment on column mid_user_ledger.update_time is
'更新时间';

/*==============================================================*/
/* Table: record                                                */
/*==============================================================*/
create table record (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   user_category_id     INT8                 not null,
   name                 VARCHAR(100)         not null,
   amount               DECIMAL(18,6)        not null,
   record_type          INT2                 not null,
   remark               VARCHAR(200)         null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__record__id primary key (id)
);

comment on table record is
'详情表';

comment on column record.id is
'id';

comment on column record.user_category_id is
'用户类别表id';

comment on column record.name is
'名称';

comment on column record.amount is
'金额';

comment on column record.record_type is
'详情类型(0:支出,1:收入)';

comment on column record.remark is
'备注';

comment on column record.status is
'状态(0:正常,1:已删除)';

comment on column record.create_time is
'创建时间';

comment on column record.update_time is
'更新时间';

/*==============================================================*/
/* Table: sys_category                                          */
/*==============================================================*/
create table sys_category (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   classification_name  VARCHAR(100)         not null,
   name                 VARCHAR(100)         not null,
   icon                 TEXT                 not null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__sys_category__id primary key (id)
);

comment on table sys_category is
'系统类别表';

comment on column sys_category.id is
'id';

comment on column sys_category.classification_name is
'分类名';

comment on column sys_category.name is
'类别名';

comment on column sys_category.icon is
'类别图标Icon';

comment on column sys_category.status is
'状态(0:正常,1:已删除)';

comment on column sys_category.create_time is
'创建时间';

comment on column sys_category.update_time is
'更新时间';

/*==============================================================*/
/* Table: team                                                  */
/*==============================================================*/
create table team (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   user_id              INT8                 not null,
   team_user_id         INT8                 not null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__team__id primary key (id)
);

comment on table team is
'成员表';

comment on column team.id is
'id';

comment on column team.user_id is
'用户表id';

comment on column team.team_user_id is
'成员id{关联的用户表id}';

comment on column team.status is
'状态(0:正常,1:已删除)';

comment on column team.create_time is
'创建时间';

comment on column team.update_time is
'更新时间';

/*==============================================================*/
/* Table: "user"                                                */
/*==============================================================*/
create table "user" (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   name                 VARCHAR(100)         not null,
   gender               INT2                 null,
   avatar               TEXT                 null,
   email                VARCHAR(100)         null,
   phone                VARCHAR(100)         null,
   signature            VARCHAR(200)         null,
   password             VARCHAR(512)         not null,
   salt                 VARCHAR(256)         not null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__user_id primary key (id),
   constraint uk__user__name unique (name)
);

comment on table "user" is
'用户表';

comment on column "user".id is
'id';

comment on column "user".name is
'用户名';

comment on column "user".gender is
'性别(0:未知(默认),1:男,2:女,3:保密)';

comment on column "user".avatar is
'头像';

comment on column "user".email is
'邮箱';

comment on column "user".phone is
'手机号码';

comment on column "user".signature is
'签名';

comment on column "user".password is
'密码';

comment on column "user".salt is
'盐';

comment on column "user".status is
'状态(0:正常(默认),1:已删除)';

comment on column "user".create_time is
'创建时间';

comment on column "user".update_time is
'更新时间';

/*==============================================================*/
/* Table: user_category                                         */
/*==============================================================*/
create table user_category (
   id                   INT8 GENERATED ALWAYS AS IDENTITY not null,
   ledger_id            INT8                 not null,
   classification_name  VARCHAR(100)         not null,
   name                 VARCHAR(100)         not null,
   icon                 TEXT                 not null,
   status               INT2                 not null,
   create_time          TIMESTAMP WITH TIME ZONE not null,
   update_time          TIMESTAMP WITH TIME ZONE not null,
   constraint pk__user_category__id primary key (id)
);

comment on table user_category is
'用户类别表';

comment on column user_category.id is
'id';

comment on column user_category.ledger_id is
'账本表id';

comment on column user_category.classification_name is
'分类名';

comment on column user_category.name is
'类别名';

comment on column user_category.icon is
'类别图标Icon';

comment on column user_category.status is
'状态(0:正常,1:已删除)';

comment on column user_category.create_time is
'创建时间';

comment on column user_category.update_time is
'更新时间';

