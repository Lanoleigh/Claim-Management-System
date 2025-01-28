USE [CMS]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 2025/01/28 10:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[claim_ID] [varchar](8) NOT NULL,
	[fk_lecturer_id] [nvarchar](450) NOT NULL,
	[fk_staff_id] [nvarchar](450) NOT NULL,
	[claim_amount] [float] NULL,
	[hours_Worked] [float] NULL,
	[dateOfClaim] [date] NULL,
	[description] [varchar](50) NULL,
	[status] [varchar](10) NULL,
	[FilePath] [varchar](90) NULL,
PRIMARY KEY CLUSTERED 
(
	[claim_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD FOREIGN KEY([fk_lecturer_id])
REFERENCES [dbo].[Lecturers] ([Id])
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD FOREIGN KEY([fk_staff_id])
REFERENCES [dbo].[Staff] ([Id])
GO
