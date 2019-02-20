/*
Navicat SQL Server Data Transfer

Source Server         : 192.168.1.11
Source Server Version : 105000
Source Host           : 192.168.1.11:1433
Source Database       : hd_car
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 105000
File Encoding         : 65001

Date: 2019-02-20 09:06:42
*/


-- ----------------------------
-- Table structure for annual
-- ----------------------------
DROP TABLE [dbo].[annual]
GO
CREATE TABLE [dbo].[annual] (
[id] varchar(50) NOT NULL ,
[annualTime] datetime NULL ,
[annualCosts] float(53) NULL ,
[handlePerson] nvarchar(255) NULL ,
[adminOffice] nvarchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'annual', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'年检记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'年检记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'annual', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'annual', 
'COLUMN', N'annualTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'年检时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'annualTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'年检时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'annualTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'annual', 
'COLUMN', N'annualCosts')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'年检费用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'annualCosts'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'年检费用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'annualCosts'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'annual', 
'COLUMN', N'handlePerson')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经手人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'handlePerson'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经手人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'handlePerson'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'annual', 
'COLUMN', N'adminOffice')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车管所'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'adminOffice'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车管所'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'annual'
, @level2type = 'COLUMN', @level2name = N'adminOffice'
GO

-- ----------------------------
-- Records of annual
-- ----------------------------

-- ----------------------------
-- Table structure for archives
-- ----------------------------
DROP TABLE [dbo].[archives]
GO
CREATE TABLE [dbo].[archives] (
[id] varchar(50) NOT NULL ,
[licensePlate] varchar(255) NULL ,
[category] varchar(255) NULL ,
[principal] varchar(255) NULL ,
[principalPhone] varchar(255) NULL ,
[imei] varchar(255) NULL ,
[model] varchar(255) NULL ,
[phone] varchar(255) NULL ,
[produceTime] datetime NULL ,
[endTime] datetime NULL ,
[state] int NULL DEFAULT ((0)) ,
[acc] int NULL DEFAULT ((0)) ,
[electricity] float(53) NULL DEFAULT ((100)) ,
[locationType] varchar(255) NULL DEFAULT ('LBS') ,
[locationTime] datetime NULL ,
[longitude] numeric(20,15) NULL ,
[latitude] numeric(20,15) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆档案'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆档案'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'licensePlate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'licensePlate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'licensePlate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'category')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'功能类别（运输车、压路机、刮平机、洒水车、湿扫车、路灯维修车）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'category'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'功能类别（运输车、压路机、刮平机、洒水车、湿扫车、路灯维修车）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'category'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'principal')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆负责人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'principal'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆负责人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'principal'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'principalPhone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'负责人电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'principalPhone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'负责人电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'principalPhone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'model')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'型号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'model'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'型号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'model'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'produceTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出厂时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'produceTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出厂时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'produceTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'endTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'到期时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'endTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'到期时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'endTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'state')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态（0-离线，1-在线）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'state'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态（0-离线，1-在线）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'state'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'acc')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否发动（0-未发动，1-已发动）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'acc'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否发动（0-未发动，1-已发动）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'acc'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'electricity')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'electricity'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'electricity'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'locationType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'定位方式'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'locationType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'定位方式'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'locationType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'locationTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'定位时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'locationTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'定位时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'locationTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'archives', 
'COLUMN', N'latitude')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'latitude'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'archives'
, @level2type = 'COLUMN', @level2name = N'latitude'
GO

-- ----------------------------
-- Records of archives
-- ----------------------------
INSERT INTO [dbo].[archives] ([id], [licensePlate], [category], [principal], [principalPhone], [imei], [model], [phone], [produceTime], [endTime], [state], [acc], [electricity], [locationType], [locationTime], [longitude], [latitude]) VALUES (N'00a782da-8401-4979-b126-1f6a527002fb', N'苏ETV162', N'运输车', N'李正达', N'15850050896', N'a8hgd454h24123124g', N'iphone6s', N'15850050896', N'2016-10-05 00:00:00.000', N'2018-10-11 00:00:00.000', N'0', N'0', N'100', N'LBS', N'2018-10-31 15:49:38.000', N'120.856083000000000', N'31.717059000000000')
GO
GO
INSERT INTO [dbo].[archives] ([id], [licensePlate], [category], [principal], [principalPhone], [imei], [model], [phone], [produceTime], [endTime], [state], [acc], [electricity], [locationType], [locationTime], [longitude], [latitude]) VALUES (N'954344af-922f-4af7-be3d-fe949a800bcc', N'苏E6Y02J', N'洒水车', N'乔宏', N'18225545312', N'a8h23124h24123124g', N'Android', N'18225545312', N'2018-03-01 00:00:00.000', N'2020-11-25 00:00:00.000', N'0', N'0', N'100', N'LBS', N'2018-10-31 17:49:46.000', N'120.872121000000000', N'31.609103000000000')
GO
GO

-- ----------------------------
-- Table structure for insurance
-- ----------------------------
DROP TABLE [dbo].[insurance]
GO
CREATE TABLE [dbo].[insurance] (
[id] varchar(50) NOT NULL ,
[insTime] datetime NULL ,
[insAmount1] float(53) NULL ,
[insNo] varchar(255) NULL ,
[insAmount2] float(53) NULL ,
[insCo] nvarchar(255) NULL ,
[endTime] datetime NULL ,
[handlePerson] nvarchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'insurance', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'保险记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'保险记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'insurance', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'insurance', 
'COLUMN', N'insTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'投保日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'投保日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'insurance', 
'COLUMN', N'insAmount1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'投保金额'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insAmount1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'投保金额'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insAmount1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'insurance', 
'COLUMN', N'insNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'保单号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'保单号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'insurance', 
'COLUMN', N'insAmount2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'保险金额'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insAmount2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'保险金额'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insAmount2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'insurance', 
'COLUMN', N'insCo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'保险公司'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insCo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'保险公司'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'insCo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'insurance', 
'COLUMN', N'endTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'到期时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'endTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'到期时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'endTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'insurance', 
'COLUMN', N'handlePerson')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经手人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'handlePerson'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经手人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'insurance'
, @level2type = 'COLUMN', @level2name = N'handlePerson'
GO

-- ----------------------------
-- Records of insurance
-- ----------------------------

-- ----------------------------
-- Table structure for maintain
-- ----------------------------
DROP TABLE [dbo].[maintain]
GO
CREATE TABLE [dbo].[maintain] (
[id] varchar(50) NOT NULL ,
[maintainReason] nvarchar(255) NULL ,
[maintainCosts] float(53) NULL ,
[handlePerson] nvarchar(255) NULL ,
[maintainOrgan] nvarchar(255) NULL ,
[sendTime] datetime NULL ,
[getTime] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'maintain', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'维修记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'维修记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'maintain', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'maintain', 
'COLUMN', N'maintainReason')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'维修原因'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'maintainReason'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'维修原因'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'maintainReason'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'maintain', 
'COLUMN', N'maintainCosts')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'维修费用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'maintainCosts'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'维修费用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'maintainCosts'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'maintain', 
'COLUMN', N'handlePerson')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经手人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'handlePerson'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经手人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'handlePerson'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'maintain', 
'COLUMN', N'maintainOrgan')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'维修单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'maintainOrgan'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'维修单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'maintainOrgan'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'maintain', 
'COLUMN', N'sendTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'送修时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'sendTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'送修时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'sendTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'maintain', 
'COLUMN', N'getTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'取回时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'getTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'取回时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'maintain'
, @level2type = 'COLUMN', @level2name = N'getTime'
GO

-- ----------------------------
-- Records of maintain
-- ----------------------------
INSERT INTO [dbo].[maintain] ([id], [maintainReason], [maintainCosts], [handlePerson], [maintainOrgan], [sendTime], [getTime]) VALUES (N'e1377dfb-6cba-4cf4-bb66-834b25e680b9', N'火花石损坏', N'98', N'乔红', N'常熟通润汽车零部件股份有限公司', N'2018-08-09 00:00:00.000', N'2018-08-10 00:00:00.000')
GO
GO

-- ----------------------------
-- Table structure for oiling
-- ----------------------------
DROP TABLE [dbo].[oiling]
GO
CREATE TABLE [dbo].[oiling] (
[id] varchar(50) NOT NULL ,
[oilQuantity] float(53) NULL ,
[unitPrice] float(53) NULL ,
[totalPrice] float(53) NULL ,
[oilStation] nvarchar(255) NULL ,
[handlePerson] nvarchar(255) NULL ,
[oilTime] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'oiling', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'加油记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'加油记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'oiling', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'oiling', 
'COLUMN', N'oilQuantity')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'加油量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'oilQuantity'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'加油量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'oilQuantity'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'oiling', 
'COLUMN', N'unitPrice')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'单价'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'unitPrice'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'单价'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'unitPrice'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'oiling', 
'COLUMN', N'totalPrice')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'金额'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'totalPrice'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'金额'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'totalPrice'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'oiling', 
'COLUMN', N'oilStation')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'加油站'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'oilStation'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'加油站'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'oilStation'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'oiling', 
'COLUMN', N'handlePerson')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经手人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'handlePerson'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经手人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'handlePerson'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'oiling', 
'COLUMN', N'oilTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'加油时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'oilTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'加油时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'oiling'
, @level2type = 'COLUMN', @level2name = N'oilTime'
GO

-- ----------------------------
-- Records of oiling
-- ----------------------------

-- ----------------------------
-- Table structure for track
-- ----------------------------
DROP TABLE [dbo].[track]
GO
CREATE TABLE [dbo].[track] (
[id] varchar(50) NOT NULL ,
[longitude] numeric(20,15) NULL ,
[latitude] numeric(20,15) NULL ,
[carId] varchar(50) NULL ,
[recordTime] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'track', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'轨迹追踪'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'轨迹追踪'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'track', 
'COLUMN', N'longitude')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
, @level2type = 'COLUMN', @level2name = N'longitude'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
, @level2type = 'COLUMN', @level2name = N'longitude'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'track', 
'COLUMN', N'latitude')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
, @level2type = 'COLUMN', @level2name = N'latitude'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
, @level2type = 'COLUMN', @level2name = N'latitude'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'track', 
'COLUMN', N'carId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
, @level2type = 'COLUMN', @level2name = N'carId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
, @level2type = 'COLUMN', @level2name = N'carId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'track', 
'COLUMN', N'recordTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'记录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
, @level2type = 'COLUMN', @level2name = N'recordTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'记录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'track'
, @level2type = 'COLUMN', @level2name = N'recordTime'
GO

-- ----------------------------
-- Records of track
-- ----------------------------
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'06e61089-1433-406d-ac4a-fd70d991f45a', N'120.773007000000000', N'31.609856000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:22.057')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'0931b2ce-9ef1-43fd-80b4-095fe2e0ae08', N'120.837685000000000', N'31.707966000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:25.767')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'0adaba55-55ae-40b2-8185-5f53dbee03ec', N'121.251050000000000', N'31.433045000000000', N'', N'2018-11-06 15:38:11.943')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'0eb3de12-06a8-40b3-9381-a5b55f30fd0e', N'120.897477000000000', N'31.735241000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:38.500')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'1384210d-00a9-4feb-a77a-9e3551cd589c', N'120.778182000000000', N'31.521493000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:33.707')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'1388eaed-6d51-4cdc-8b8a-b77c541e17a8', N'120.985151000000000', N'31.747524000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:09.617')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'1433c0be-2e38-4683-81f7-dcfffc6ff61b', N'120.773151000000000', N'31.606781000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:21.087')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'253b95b8-be52-484a-8aa7-56d12ecccb25', N'120.781775000000000', N'31.585128000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:09.307')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'2aab1d1e-3616-499e-b41c-85d248d15734', N'120.933409000000000', N'31.735241000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:48.853')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'2dee29f2-9fa2-45bb-bd57-f70925d0c593', N'120.981989000000000', N'31.748507000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:09.077')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'2ee2535b-0bf2-4f18-86fa-744b88e73e68', N'121.197008000000000', N'31.426143000000000', N'', N'2018-11-06 15:38:12.177')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'34067634-e13b-4acd-976f-19f2ab79d927', N'120.988313000000000', N'31.745805000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:10.383')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'34118e64-8506-42d5-b8ea-9c8dc36a2d67', N'121.214255000000000', N'31.461634000000000', N'', N'2018-11-06 15:38:11.000')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'35620826-ee9a-4b9b-a2fa-23074d1c76e2', N'120.979402000000000', N'31.749735000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:08.320')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'3594cc50-5863-4cc9-9ec5-adf3fd55915d', N'120.778038000000000', N'31.591526000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:11.843')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'36c988ac-b3b0-4575-ba26-7e9f94da987b', N'121.065927000000000', N'31.422199000000000', N'', N'2018-11-06 15:38:12.457')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'37010b5f-2b35-47e4-8589-634827a607ed', N'120.395575000000000', N'31.581806000000000', N'', N'2018-11-06 15:40:37.243')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'378e5c12-d654-405e-9237-34e01364aecb', N'120.772576000000000', N'31.616499000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:26.180')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'425158ad-2531-45f0-bc5b-bd3cf694387f', N'120.944620000000000', N'31.746050000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:55.947')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'49fa8809-d116-4408-b349-1585209b8e9a', N'121.117669000000000', N'31.497111000000000', N'', N'2018-11-06 15:38:14.057')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'4d52fb35-a813-4122-bf99-976887a8ee97', N'120.772864000000000', N'31.613055000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:24.933')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'4dac45e7-8a9e-4852-89d7-e7155eb302ce', N'120.774445000000000', N'31.520262000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:32.957')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'51f0b177-dba8-45dc-9717-cd5ad56ac31f', N'120.956405000000000', N'31.752437000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:02.143')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'52a391b0-b23c-4cbe-8112-cffb880c158c', N'120.845734000000000', N'31.712635000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:27.653')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'548003a2-b1df-451b-bda2-9a209c4f3a78', N'120.812676000000000', N'31.553501000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:43.843')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'54e3bd4e-67d5-4d30-b500-72cb625dbe25', N'120.937433000000000', N'31.739172000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:51.327')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'552c10f3-10f5-41ca-afa2-5bfd5964cd98', N'120.960430000000000', N'31.752929000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:04.990')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'55eab9e2-dea3-4f17-93ba-a005e45b03d6', N'120.773295000000000', N'31.603583000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:20.103')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'567caa37-bce2-4613-89ce-9652ea35abf4', N'120.879079000000000', N'31.730081000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:34.517')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'56a086e2-430c-43e9-8b66-560f2156a4b7', N'120.760934000000000', N'31.511396000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:29.337')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'56dd3e5f-b068-43d6-86ca-61c2a5aa05d1', N'120.818426000000000', N'31.697889000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:21.233')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'5ba79f85-3017-45f1-8c1a-7d3521f56a44', N'121.117669000000000', N'31.443890000000000', N'', N'2018-11-06 15:38:14.837')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'5c3eab0c-d05b-4207-aa45-e5224e6a6906', N'120.841710000000000', N'31.710669000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:26.607')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'5d1f97ab-15de-4b25-87ba-8e973016df1f', N'120.929959000000000', N'31.732784000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:47.813')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'5ef720e2-7eb1-4cf9-8e58-9f0b476c6000', N'120.785655000000000', N'31.527157000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:35.207')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'5fede9a0-d4d4-44f7-831f-cb7c08a54ab8', N'120.870455000000000', N'31.725659000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:32.847')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'61324cae-e888-42c0-8e4e-27ca263b9903', N'121.082024000000000', N'31.631012000000000', N'', N'2018-11-06 15:38:06.567')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'61a8e87a-5aca-473d-a904-de910f5914c9', N'120.765533000000000', N'31.514598000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:30.337')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'62184103-0ec9-4203-b6b0-81751563d5aa', N'121.131467000000000', N'31.571962000000000', N'', N'2018-11-06 15:38:07.503')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'629c8e99-0745-4d5e-8ff5-b6f9bc123bc8', N'120.866431000000000', N'31.722956000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:31.827')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'66661ef1-6182-4d5a-adec-da9577251251', N'120.795429000000000', N'31.553501000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:51.470')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'66c6e0ec-088c-49be-bdd1-8ed01945d118', N'120.964167000000000', N'31.752683000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:05.640')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'67551dac-19d2-40a7-88c9-ba108a3a04f2', N'120.361080000000000', N'31.622157000000000', N'', N'2018-11-06 15:40:33.687')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'68dfa66c-a8ba-4e7d-a87d-8e2cbab09aa8', N'120.882241000000000', N'31.731801000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:35.443')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'6da8b14a-ff32-473a-b24f-d06009af7ec4', N'120.976527000000000', N'31.751209000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:07.417')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'6db3551e-552d-4e3d-b22d-72b2f95e62c5', N'120.811814000000000', N'31.694202000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:19.477')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'706c9c3c-a88b-4305-b1bf-cab2e4bc34f4', N'120.799453000000000', N'31.552516000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:50.487')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'74ff6990-e373-463b-9bcc-8fee56ac5378', N'120.858957000000000', N'31.718041000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:30.147')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'75d965fd-a28c-4ebc-8412-dc70f2a616b6', N'120.770995000000000', N'31.517799000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:32.090')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'79640265-1444-4d3d-977f-4e57acd911e1', N'121.055578000000000', N'31.445862000000000', N'', N'2018-11-06 15:38:12.813')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'7b6a6927-da91-4139-ad69-4dc07348317f', N'121.054428000000000', N'31.497111000000000', N'', N'2018-11-06 15:38:13.113')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'7e62093a-b3cb-4895-aa1c-3c0e9e39c22e', N'120.388676000000000', N'31.947266000000000', N'', N'2018-11-06 15:38:14.107')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'7fb2bdad-b26d-4a85-9aa7-27fa7c01bafe', N'120.850621000000000', N'31.714601000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:28.360')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'84118151-5e61-42c4-be88-69f73a0de573', N'120.991475000000000', N'31.744822000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:11.580')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'864f77d4-6b9d-4129-aaba-95904b28fec8', N'120.920186000000000', N'31.730327000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:46.207')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'866ed1d1-472f-4020-b9c6-9c41749d0628', N'120.790830000000000', N'31.568516000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:55.543')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'8783ea66-7098-41df-b2c6-35902a20cdba', N'120.994350000000000', N'31.743103000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:12.510')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'87fd2ad7-f7e7-4db5-9530-4c9274789c2a', N'120.788817000000000', N'31.528634000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:35.943')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'89c13861-2f69-495f-b1ea-3dd1d31c414c', N'120.791405000000000', N'31.561378000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:53.860')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'8e854aa2-88f4-4466-aa6e-bea91809de1d', N'120.823025000000000', N'31.700101000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:22.200')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'8f6c8a23-de44-4cff-95ee-ce07d959c8cb', N'120.908975000000000', N'31.732538000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:41.417')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'921c8785-6a4f-4057-a0ea-c54c4f8a192b', N'120.874767000000000', N'31.727870000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:33.870')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'928f83a7-11fd-4962-a9b7-42e6a3e5f3f5', N'120.789824000000000', N'31.572085000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:02.980')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'99217ee7-119e-46e4-a60b-04098b5ffed5', N'120.802615000000000', N'31.541438000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:41.240')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'9a906c2a-7dad-4857-8f19-7a52d82b516f', N'120.890578000000000', N'31.734013000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:36.857')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'9ac6360f-8819-4744-b16e-0120ae1f8250', N'120.941458000000000', N'31.742366000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:54.200')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'9b731d1a-67ad-444d-9526-0d6caa4eac9f', N'120.805490000000000', N'31.545377000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:42.067')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'9c1a618f-01d1-4514-abb4-e4d94fd70f1d', N'120.403624000000000', N'31.569993000000000', N'', N'2018-11-06 15:40:37.963')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'9d33d9ea-5922-40aa-b9fe-b473cc4ec5e6', N'120.808652000000000', N'31.549316000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:42.987')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'a14ee58e-388d-441d-a796-d2e98a5d8379', N'120.973078000000000', N'31.751946000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:06.810')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'a3fd10d5-74cd-41ec-8d13-939a66f7d76b', N'120.952381000000000', N'31.750226000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:58.137')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'a518ce3a-1cb9-464a-bd1d-c5964c1aac07', N'120.862694000000000', N'31.720253000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:31.073')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'a86b59e1-2701-4555-ac00-0a08bf839208', N'121.064777000000000', N'31.522724000000000', N'', N'2018-11-06 15:38:13.397')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'aaff5717-ba8d-47fb-bcb1-bed8e82edf49', N'120.344983000000000', N'31.637898000000000', N'', N'2018-11-06 15:40:32.910')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'aec2fc28-ccb6-4014-900e-2aa4f4fdd667', N'120.967904000000000', N'31.752683000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:53:06.163')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'b3343164-47a3-4619-b3c5-824aa48dca6b', N'120.901788000000000', N'31.734750000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:39.500')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'b7872d40-e87a-47e5-9d91-87e31b529f4f', N'120.795429000000000', N'31.534051000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:37.547')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'b96e7057-c2ba-4a64-84fa-633dfd27c9e4', N'120.833373000000000', N'31.705017000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:24.613')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'bb760239-254d-4c71-b6db-764116579a22', N'120.886553000000000', N'31.732784000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:36.273')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'bc6ad423-eab3-4319-8c7a-c3ec71a13690', N'120.785224000000000', N'31.580575000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:06.903')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'be3c1b38-f2bc-4b48-a086-940907edd39a', N'120.827912000000000', N'31.701822000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:22.937')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'be49be22-4455-4a31-b8c9-24ab512ac61b', N'120.782206000000000', N'31.523463000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:34.437')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'c06db73a-a9fd-4c52-9d80-a8b88390f1f2', N'120.916161000000000', N'31.731801000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:45.487')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'c0c19a27-6d15-4ff5-91a4-db62c05a7b8a', N'120.755472000000000', N'31.506470000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:26.737')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'c14cf79c-790e-4ce6-9beb-b0e69b07948c', N'120.799166000000000', N'31.536760000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:39.073')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'c5a96574-59f7-4a7b-bdf0-55bf2cd9badf', N'120.772864000000000', N'31.620066000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:27.160')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'd5a1991f-1b25-40d3-904d-a27fa0055eed', N'120.779763000000000', N'31.588573000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:10.593')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'd7c71d58-5b9e-4bcf-bbf3-69fb7a618725', N'120.802615000000000', N'31.552516000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:49.520')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'd83afb0f-4a4e-4b1b-a33d-7dc8c752ce46', N'120.783212000000000', N'31.582544000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:08.037')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'd967f5ca-69d6-40e9-8f95-3311ff899921', N'120.775020000000000', N'31.597062000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:18.277')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'db3ddf93-bf97-433b-8d7e-8f1d466836e1', N'120.788530000000000', N'31.575653000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:04.640')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'dc7aec68-d246-4fa4-ae25-9d86df06b177', N'120.790255000000000', N'31.553993000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:52.523')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'dda41bbc-9630-485d-91bc-b42f29c26018', N'121.179760000000000', N'31.542422000000000', N'', N'2018-11-06 15:38:10.437')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'e10549f7-de14-423d-a254-9f906aad36e3', N'120.925935000000000', N'31.730327000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:46.900')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'e1492b4f-d32d-4d5e-94ab-495b5be96109', N'120.786805000000000', N'31.577868000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:05.703')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'e795cd74-fe29-4028-8ba2-935d63ddee18', N'120.948357000000000', N'31.748753000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:57.110')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'ed3b394d-fdb5-48fa-b46a-8a726a8d7371', N'120.792267000000000', N'31.531097000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 15:59:36.660')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'ed6f613f-af79-4354-a545-747ffa31860c', N'120.389826000000000', N'31.593618000000000', N'', N'2018-11-06 15:40:36.450')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'ee6bf1d5-e737-4e76-a0f5-4772a5939346', N'120.773870000000000', N'31.600138000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:19.240')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'f0942aa2-18d2-454d-8c9d-a7c9b559b13e', N'120.855220000000000', N'31.716321000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:29.437')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'f193cb07-167b-4030-af51-69ff84d11245', N'120.905813000000000', N'31.733275000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:40.540')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'f2f4e35f-c19d-4360-97aa-f318e9c455ea', N'120.776457000000000', N'31.594110000000000', N'954344af-922f-4af7-be3d-fe949a800bcc', N'2018-10-31 16:00:17.390')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'f389e479-79d8-4de7-a708-6e8d2747a6f8', N'121.283245000000000', N'31.456705000000000', N'', N'2018-11-06 15:38:11.457')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'f3cc823c-f36d-4fcc-8e89-85fc91b4037e', N'120.894602000000000', N'31.734995000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:37.777')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'f6aa7568-a361-462a-a851-69d678f46899', N'120.912712000000000', N'31.732538000000000', N'00a782da-8401-4979-b126-1f6a527002fb', N'2018-10-31 15:52:43.947')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'fa918f4b-4383-4ce7-b13d-789b09c73a91', N'120.371429000000000', N'31.610348000000000', N'', N'2018-11-06 15:40:34.410')
GO
GO
INSERT INTO [dbo].[track] ([id], [longitude], [latitude], [carId], [recordTime]) VALUES (N'ff3e3c1c-7430-4718-a8d7-6356c809b580', N'121.116519000000000', N'31.458677000000000', N'', N'2018-11-06 15:38:14.610')
GO
GO

-- ----------------------------
-- Indexes structure for table annual
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table annual
-- ----------------------------
ALTER TABLE [dbo].[annual] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table archives
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table archives
-- ----------------------------
ALTER TABLE [dbo].[archives] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table insurance
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table insurance
-- ----------------------------
ALTER TABLE [dbo].[insurance] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table maintain
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table maintain
-- ----------------------------
ALTER TABLE [dbo].[maintain] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table oiling
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table oiling
-- ----------------------------
ALTER TABLE [dbo].[oiling] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table track
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table track
-- ----------------------------
ALTER TABLE [dbo].[track] ADD PRIMARY KEY ([id])
GO
