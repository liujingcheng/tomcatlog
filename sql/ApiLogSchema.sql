USE [APIItemLog]
GO
/****** Object:  Table [dbo].[Business_ErrorLog_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_ErrorLog_tb](
	[LogId] [nvarchar](50) NOT NULL,
	[ItemId] [nvarchar](50) NULL,
	[Module] [nvarchar](50) NULL,
	[Times] [int] NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_Business_ErrorLog_tb_Status]  DEFAULT ((0)),
	[UserId] [nvarchar](50) NULL,
	[RequestURL] [nvarchar](max) NULL,
	[RemoteIp] [nvarchar](50) NULL,
	[RequestPara] [nvarchar](max) NULL,
	[ClassName] [nvarchar](200) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[CreatedOn] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[LogType] [int] NOT NULL CONSTRAINT [DF_Business_ErrorLog_tb_LogType]  DEFAULT ((1)),
	[CustomSort] [int] NULL CONSTRAINT [DF_Business_ErrorLog_tb_CustomSort]  DEFAULT ((0)),
	[Tag] [nvarchar](500) NULL,
	[Extend1] [nvarchar](500) NULL,
	[Extend2] [nvarchar](500) NULL,
	[Extend3] [nvarchar](500) NULL,
	[Extend4] [nvarchar](500) NULL,
	[Extend5] [nvarchar](500) NULL,
	[Extend6] [int] NULL,
	[Extend7] [int] NULL,
	[Extend8] [int] NULL,
 CONSTRAINT [PK_Business_Log_tb] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_Item_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_Item_tb](
	[ItemId] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartTime] [nvarchar](50) NULL,
	[Remark] [nvarchar](max) NULL,
	[IsOff] [int] NOT NULL CONSTRAINT [DF_Business_Item_tb_IsOff]  DEFAULT ((0)),
	[SecretKey] [nvarchar](50) NULL,
	[CreatedOn] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Business_Item_tb] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_ItemUser_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_ItemUser_tb](
	[Id] [nvarchar](50) NOT NULL,
	[ItemId] [nvarchar](50) NULL,
	[UserId] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[CreatedOn] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Business_ItemUser_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_LogSchedule_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_LogSchedule_tb](
	[LogScheduleId] [nvarchar](50) NOT NULL,
	[LogId] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[NewStatus] [int] NULL,
	[Type] [int] NULL,
	[Remark] [nvarchar](500) NULL,
	[UserId] [nvarchar](50) NULL,
	[CreatedOn] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Business_LogSchedule_tb] PRIMARY KEY CLUSTERED 
(
	[LogScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_ParamCode_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_ParamCode_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](10) NULL,
 CONSTRAINT [PK_Business_ParamCode_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_ParamValue_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_ParamValue_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[Remark] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_Permission_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_Permission_tb](
	[PermissionId] [nvarchar](50) NOT NULL,
	[Program] [nvarchar](50) NULL,
	[Menu] [nvarchar](50) NULL,
	[SubMenu] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[Url] [nvarchar](100) NULL,
	[OrderBy] [int] NULL,
 CONSTRAINT [PK_Business_Permission_tb] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_PermissionRole_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_PermissionRole_tb](
	[RpId] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](50) NULL,
	[PermissionId] [nvarchar](50) NULL,
	[CreatedOn] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Business_PermissionRole_tb] PRIMARY KEY CLUSTERED 
(
	[RpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_Role_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_Role_tb](
	[RoleId] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[CreatedOn] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Business_Role_tb] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_User_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_User_tb](
	[UserId] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[PassWord] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[WeiXin] [nvarchar](50) NULL,
	[IsLocked] [int] NULL,
	[IsDelete] [bit] NULL,
	[CreatedOn] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Business_User_tb] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_UserRole_tb]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_UserRole_tb](
	[UrId] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](50) NULL,
	[UserId] [nvarchar](50) NULL,
	[CreatedOn] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Business_UserRole_tb] PRIMARY KEY CLUSTERED 
(
	[UrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogForJ]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogForJ](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[LogTime] [datetime] NULL,
	[LogLevel] [smallint] NULL,
	[Message] [varchar](max) NULL,
	[FileName] [nvarchar](1000) NULL,
	[Line] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_LogForJ] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TomcatAccess]    Script Date: 2018/2/9 22:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TomcatAccess](
	[TomcatAccessId] [nvarchar](32) NOT NULL,
	[Ip] [nvarchar](50) NULL,
	[RequestTime] [datetime] NULL,
	[Concurrency] [int] NULL CONSTRAINT [DF_TomcatAccess_Concurrency]  DEFAULT ((1)),
	[RequestUrl] [nvarchar](1000) NULL,
	[ResponseStatus] [nchar](10) NULL,
	[ResponseDataSize] [bigint] NULL,
	[Duration] [float] NULL,
	[FileName] [nvarchar](1000) NULL,
	[Line] [int] NULL,
 CONSTRAINT [PK_TomcatAccess] PRIMARY KEY CLUSTERED 
(
	[TomcatAccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Business_LogSchedule_tb] ADD  CONSTRAINT [DF_Business_LogSchedule_tb_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Business_ErrorLog_tb]  WITH CHECK ADD  CONSTRAINT [FK_Business_ErrorLog_tb_Business_Item_tb] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Business_Item_tb] ([ItemId])
GO
ALTER TABLE [dbo].[Business_ErrorLog_tb] CHECK CONSTRAINT [FK_Business_ErrorLog_tb_Business_Item_tb]
GO
ALTER TABLE [dbo].[Business_ErrorLog_tb]  WITH CHECK ADD  CONSTRAINT [FK_Business_ErrorLog_tb_Business_User_tb] FOREIGN KEY([UserId])
REFERENCES [dbo].[Business_User_tb] ([UserId])
GO
ALTER TABLE [dbo].[Business_ErrorLog_tb] CHECK CONSTRAINT [FK_Business_ErrorLog_tb_Business_User_tb]
GO
ALTER TABLE [dbo].[Business_ItemUser_tb]  WITH CHECK ADD  CONSTRAINT [FK_Business_ItemUser_tb_Business_Item_tb] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Business_Item_tb] ([ItemId])
GO
ALTER TABLE [dbo].[Business_ItemUser_tb] CHECK CONSTRAINT [FK_Business_ItemUser_tb_Business_Item_tb]
GO
ALTER TABLE [dbo].[Business_ItemUser_tb]  WITH CHECK ADD  CONSTRAINT [FK_Business_ItemUser_tb_Business_User_tb] FOREIGN KEY([UserId])
REFERENCES [dbo].[Business_User_tb] ([UserId])
GO
ALTER TABLE [dbo].[Business_ItemUser_tb] CHECK CONSTRAINT [FK_Business_ItemUser_tb_Business_User_tb]
GO
ALTER TABLE [dbo].[Business_LogSchedule_tb]  WITH CHECK ADD  CONSTRAINT [FK_Business_LogSchedule_tb_Business_Log_tb] FOREIGN KEY([LogId])
REFERENCES [dbo].[Business_ErrorLog_tb] ([LogId])
GO
ALTER TABLE [dbo].[Business_LogSchedule_tb] CHECK CONSTRAINT [FK_Business_LogSchedule_tb_Business_Log_tb]
GO
ALTER TABLE [dbo].[Business_LogSchedule_tb]  WITH CHECK ADD  CONSTRAINT [FK_Business_LogSchedule_tb_Business_User_tb] FOREIGN KEY([UserId])
REFERENCES [dbo].[Business_User_tb] ([UserId])
GO
ALTER TABLE [dbo].[Business_LogSchedule_tb] CHECK CONSTRAINT [FK_Business_LogSchedule_tb_Business_User_tb]
GO
ALTER TABLE [dbo].[Business_UserRole_tb]  WITH CHECK ADD  CONSTRAINT [FK_Business_UserRole_tb_Business_Role_tb] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Business_Role_tb] ([RoleId])
GO
ALTER TABLE [dbo].[Business_UserRole_tb] CHECK CONSTRAINT [FK_Business_UserRole_tb_Business_Role_tb]
GO
ALTER TABLE [dbo].[Business_UserRole_tb]  WITH CHECK ADD  CONSTRAINT [FK_Business_UserRole_tb_Business_User_tb] FOREIGN KEY([UserId])
REFERENCES [dbo].[Business_User_tb] ([UserId])
GO
ALTER TABLE [dbo].[Business_UserRole_tb] CHECK CONSTRAINT [FK_Business_UserRole_tb_Business_User_tb]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'LogId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id（可以有多个项目）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Module'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出现次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Times'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数表LS001' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'RequestURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求Ip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'RemoteIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'RequestPara'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误消息（含异常堆栈）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'StackTrace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志类别（1 严重错误 2 警告 3 日常运维信息 4 特定追踪信息）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'LogType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义排序字段（出于某个问题定位需要可设定其值方便特定排序）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'CustomSort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签（可用于一些需做特殊标记的场景）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Extend1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Extend2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Extend3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Extend4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Extend5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Extend6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Extend7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ErrorLog_tb', @level2type=N'COLUMN',@level2name=N'Extend8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0启用，1禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Item_tb', @level2type=N'COLUMN',@level2name=N'IsOff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密钥,用于错误日志插入的安全验证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Item_tb', @level2type=N'COLUMN',@level2name=N'SecretKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Item_tb', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Item_tb', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Item_tb', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Item_tb', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0项目经理、1开发人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ItemUser_tb', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ItemUser_tb', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ItemUser_tb', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ItemUser_tb', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ItemUser_tb', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投诉进度Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'LogScheduleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投诉信息Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'LogId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投诉状态，0待复核，1商家建档，2开始和解，3提出和解意见，4副部长分派，5区分派，6开始调解，7填写调解意见，8建议仲裁，9开始仲裁，10仲裁结果填写，11消费者评价，12结案，-1无效投诉,-2重复投诉，-3投诉主体找不到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理后的状态，对应投诉状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'NewStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1、处理日志，2、合并，3、只分派处理人，4、标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_LogSchedule_tb', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ParamCode_tb', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ParamCode_tb', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ParamCode_tb', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统参数名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ParamValue_tb', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统参数值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_ParamValue_tb', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Permission_tb', @level2type=N'COLUMN',@level2name=N'Program'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Permission_tb', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Permission_tb', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Permission_tb', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PermissionId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_PermissionRole_tb', @level2type=N'COLUMN',@level2name=N'PermissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_PermissionRole_tb', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_PermissionRole_tb', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_PermissionRole_tb', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_PermissionRole_tb', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RoleId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Role_tb', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Role_tb', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Role_tb', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Role_tb', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Role_tb', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Role_tb', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_Role_tb', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UserId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'PassWord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已锁定,0正常，1锁定，2休假' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'IsLocked'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可以被删除，true可以删除。false不能被删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_User_tb', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UrId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_UserRole_tb', @level2type=N'COLUMN',@level2name=N'UrId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RoleId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_UserRole_tb', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UserId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_UserRole_tb', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_UserRole_tb', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_UserRole_tb', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_UserRole_tb', @level2type=N'COLUMN',@level2name=N'ModifiedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Business_UserRole_tb', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogForJ', @level2type=N'COLUMN',@level2name=N'LogId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogForJ', @level2type=N'COLUMN',@level2name=N'LogTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志等级(0:Fatal 3:Error 4:Warn 5:Info 6:Debug 7:Trace)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogForJ', @level2type=N'COLUMN',@level2name=N'LogLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogForJ', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogForJ', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'行号（来自文件的第几行，并发的以首条记录行号为准）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogForJ', @level2type=N'COLUMN',@level2name=N'Line'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogForJ', @level2type=N'COLUMN',@level2name=N'CreatedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'TomcatAccessId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求的Ip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'Ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求起始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'RequestTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'并发次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'Concurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求的Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'RequestUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'响应状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'ResponseStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'响应数据包大小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'ResponseDataSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'持续时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'Duration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'行号（来自文件的第几行，并发的以首条记录行号为准）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess', @level2type=N'COLUMN',@level2name=N'Line'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tomcat访问日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TomcatAccess'
GO
