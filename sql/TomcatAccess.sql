USE [APIItemLog]
GO

/****** Object:  Table [dbo].[TomcatAccess]    Script Date: 08/12/2016 16:33:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TomcatAccess](
	[TomcatAccessId] [nvarchar](32) NOT NULL,
	[Ip] [nvarchar](50) NULL,
	[RequestTime] [datetime] NULL,
	[Concurrency] [int] NULL,
	[RequestUrl] [nvarchar](1000) NULL,
	[ResponseStatus] [nchar](10) NULL,
	[ResponseDataSize] [bigint] NULL,
	[Duration] [float] NULL,
	[FileName] [nvarchar](1000) NULL,
	[Line] [int] NULL,
 CONSTRAINT [PK_TomcatAccess] PRIMARY KEY CLUSTERED 
(
	[TomcatAccessId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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

ALTER TABLE [dbo].[TomcatAccess] ADD  CONSTRAINT [DF_TomcatAccess_Concurrency]  DEFAULT ((1)) FOR [Concurrency]
GO

