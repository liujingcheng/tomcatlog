
GO

/****** Object:  Table [dbo].[LogForJ]    Script Date: 05/11/2017 14:38:56 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
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


