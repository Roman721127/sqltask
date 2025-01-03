USE [master]
GO
/****** Object:  Database [School]    Script Date: 03.01.2025 21:09:34 ******/
CREATE DATABASE [School]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER02\MSSQL\DATA\School.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER02\MSSQL\DATA\School_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [School] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School] SET ARITHABORT OFF 
GO
ALTER DATABASE [School] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School] SET  DISABLE_BROKER 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School] SET RECOVERY FULL 
GO
ALTER DATABASE [School] SET  MULTI_USER 
GO
ALTER DATABASE [School] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [School] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'School', N'ON'
GO
ALTER DATABASE [School] SET QUERY_STORE = OFF
GO
USE [School]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[DatePaid] [date] NOT NULL,
	[PaymentType] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clubs]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clubs](
	[ClubID] [int] IDENTITY(1,1) NOT NULL,
	[ClubName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[TeacherID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClubMemberships]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClubMemberships](
	[MembershipID] [int] IDENTITY(1,1) NOT NULL,
	[ClubID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[DateJoined] [date] NOT NULL,
	[Role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MembershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students_History]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_History](
	[StudentID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](100) NULL,
	[ClassID] [int] NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Index [ix_Students_History]    Script Date: 03.01.2025 21:09:35 ******/
CREATE CLUSTERED INDEX [ix_Students_History] ON [dbo].[Students_History]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](100) NULL,
	[ClassID] [int] NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[Students_History])
)
GO
/****** Object:  Table [dbo].[Classes_History]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes_History](
	[ClassID] [int] NOT NULL,
	[GradeLevel] [int] NOT NULL,
	[ClassName] [nvarchar](50) NULL,
	[TeacherID] [int] NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Index [ix_Classes_History]    Script Date: 03.01.2025 21:09:35 ******/
CREATE CLUSTERED INDEX [ix_Classes_History] ON [dbo].[Classes_History]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] NOT NULL,
	[GradeLevel] [int] NOT NULL,
	[ClassName] [nvarchar](50) NULL,
	[TeacherID] [int] NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[Classes_History])
)
GO
/****** Object:  View [dbo].[View_StudentsInfo]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_StudentsInfo] AS
SELECT 
    s.FirstName + ' ' + s.LastName AS StudentName,
    c.GradeLevel AS Class,
    cl.ClubName AS Club,
    ISNULL(p.Amount, 0) AS PaymentAmount
FROM 
    Students s
JOIN 
    Classes c ON s.ClassID = c.ClassID
LEFT JOIN 
    ClubMemberships cm ON s.StudentID = cm.StudentID
LEFT JOIN 
    Clubs cl ON cm.ClubID = cl.ClubID
LEFT JOIN 
    Payments p ON s.StudentID = p.StudentID;
GO
/****** Object:  View [dbo].[View_StudentsWithoutPayment]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_StudentsWithoutPayment] AS
SELECT 
    s.FirstName + ' ' + s.LastName AS StudentName,
    c.GradeLevel AS Class
FROM 
    Students s
JOIN 
    Classes c ON s.ClassID = c.ClassID
LEFT JOIN 
    Payments p ON s.StudentID = p.StudentID
WHERE 
    p.PaymentID IS NULL;
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[ExamID] [int] NOT NULL,
	[ExamName] [nvarchar](50) NULL,
	[SubjectID] [int] NULL,
	[ExamDate] [date] NULL,
	[ExamTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamResults]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamResults](
	[ResultID] [int] NOT NULL,
	[ExamID] [int] NULL,
	[StudentID] [int] NULL,
	[Score] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_ExamResults]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ExamResults] AS
SELECT 
    s.FirstName + ' ' + s.LastName AS StudentName,
    e.ExamName,
    er.Score,
    e.ExamDate,
    e.ExamTime
FROM 
    Students s
JOIN 
    ExamResults er ON s.StudentID = er.StudentID
JOIN 
    Exams e ON er.ExamID = e.ExamID;
GO
/****** Object:  View [dbo].[View_LiteratureClubMembers]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_LiteratureClubMembers] AS
SELECT 
    s.FirstName + ' ' + s.LastName AS StudentName,
    cl.ClubName
FROM 
    Students s
JOIN 
    ClubMemberships cm ON s.StudentID = cm.StudentID
JOIN 
    Clubs cl ON cm.ClubID = cl.ClubID
WHERE 
    cl.ClubName = 'Художній гурток';
GO
/****** Object:  Table [dbo].[Teachers_History]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers_History](
	[TeacherID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Specialty] [nvarchar](50) NULL,
	[SubjectID] [int] NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Index [ix_Teachers_History]    Script Date: 03.01.2025 21:09:35 ******/
CREATE CLUSTERED INDEX [ix_Teachers_History] ON [dbo].[Teachers_History]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Specialty] [nvarchar](50) NULL,
	[SubjectID] [int] NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[Teachers_History])
)
GO
/****** Object:  View [dbo].[View_StudentsTeachers]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_StudentsTeachers] AS
SELECT 
    s.FirstName + ' ' + s.LastName AS StudentName,
    c.GradeLevel AS Class,
    t.FirstName + ' ' + t.LastName AS TeacherName
FROM 
    Students s
JOIN 
    Classes c ON s.ClassID = c.ClassID
JOIN 
    Teachers t ON c.TeacherID = t.TeacherID;
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
	[Notes] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassSchedule]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSchedule](
	[ScheduleID] [int] NOT NULL,
	[ClassID] [int] NULL,
	[SubjectID] [int] NULL,
	[TeacherID] [int] NULL,
	[DayOfWeek] [nvarchar](15) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] NOT NULL,
	[EventName] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[EventDate] [date] NULL,
	[Location] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[DateRecorded] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Library]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library](
	[BookID] [int] NOT NULL,
	[BookTitle] [nvarchar](100) NULL,
	[Author] [nvarchar](50) NULL,
	[YearPublished] [int] NULL,
	[Availability] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parents]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parents](
	[ParentID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[TeacherID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Classes] ADD  CONSTRAINT [DF_Classes_ValidFrom]  DEFAULT (sysutcdatetime()) FOR [ValidFrom]
GO
ALTER TABLE [dbo].[Classes] ADD  CONSTRAINT [DF_Classes_ValidTo]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [ValidTo]
GO
ALTER TABLE [dbo].[ClubMemberships] ADD  DEFAULT ('Member') FOR [Role]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_ValidFrom]  DEFAULT (sysutcdatetime()) FOR [ValidFrom]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_ValidTo]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [ValidTo]
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [DF_Teachers_ValidFrom]  DEFAULT (sysutcdatetime()) FOR [ValidFrom]
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [DF_Teachers_ValidTo]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [ValidTo]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Teacher]
GO
ALTER TABLE [dbo].[ClubMemberships]  WITH CHECK ADD  CONSTRAINT [FK_ClubMemberships_Clubs] FOREIGN KEY([ClubID])
REFERENCES [dbo].[Clubs] ([ClubID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClubMemberships] CHECK CONSTRAINT [FK_ClubMemberships_Clubs]
GO
ALTER TABLE [dbo].[ClubMemberships]  WITH CHECK ADD  CONSTRAINT [FK_ClubMemberships_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClubMemberships] CHECK CONSTRAINT [FK_ClubMemberships_Students]
GO
ALTER TABLE [dbo].[Clubs]  WITH CHECK ADD  CONSTRAINT [FK_Clubs_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Clubs] CHECK CONSTRAINT [FK_Clubs_Teachers]
GO
ALTER TABLE [dbo].[ExamResults]  WITH CHECK ADD FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exams] ([ExamID])
GO
ALTER TABLE [dbo].[ExamResults]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Teachers]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Subjects]
GO
/****** Object:  StoredProcedure [dbo].[sp_AssignGrade]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_AssignGrade]
    @StudentID INT,
    @SubjectID INT,
    @TeacherID INT,
    @Grade INT,
    @DateRecorded DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @StudentID IS NULL OR @SubjectID IS NULL OR @TeacherID IS NULL OR @Grade IS NULL
    BEGIN
        PRINT 'Необхідно вказати StudentID, SubjectID, TeacherID та Grade';
        RETURN;
    END;

    BEGIN TRY
        IF @DateRecorded IS NULL
        BEGIN
            SET @DateRecorded = GETDATE();
        END;

        EXEC dbo.sp_SetGrades 
            @GradeID = NULL,
            @StudentID = @StudentID,
            @SubjectID = @SubjectID,
            @TeacherID = @TeacherID,
            @Grade = @Grade,
            @DateRecorded = @DateRecorded;
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetClasses]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_GetClasses]
 @ClassID INT = NULL,
 @GradeLevel INT = NULL,
 @PageSize INT = 20,
 @PageNumber INT = 1,
 @SortColumn VARCHAR(128) = 'ClassID',
 @SortDirection BIT = 0
AS
IF @ClassID IS NOT NULL
AND NOT EXISTS (SELECT * FROM dbo.Classes WHERE ClassID = @ClassID)
BEGIN
    PRINT 'Incorrect value of @ClassID'
    RETURN
END

SELECT *
FROM dbo.Classes
WHERE 
    (@ClassID IS NULL OR ClassID = @ClassID) AND
    (@GradeLevel IS NULL OR GradeLevel = @GradeLevel)
ORDER BY 
    CASE 
        WHEN @SortDirection = 0 THEN 
            CASE @SortColumn
                WHEN 'ClassID' THEN CAST(ClassID AS NVARCHAR)
                WHEN 'GradeLevel' THEN CAST(GradeLevel AS NVARCHAR)
            END
    END ASC,
    CASE 
        WHEN @SortDirection = 1 THEN 
            CASE @SortColumn
                WHEN 'ClassID' THEN CAST(ClassID AS NVARCHAR)
                WHEN 'GradeLevel' THEN CAST(GradeLevel AS NVARCHAR)
            END
    END DESC
OFFSET (@PageNumber - 1) * @PageSize ROWS  
FETCH NEXT @PageSize ROWS ONLY;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudents]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_GetStudents]
    @StudentID INT = NULL,
    @Name NVARCHAR(50) = NULL,
    @ClassID INT = NULL,
    @PageSize INT = 10,
    @PageNumber INT = 1,
    @SortColumn NVARCHAR(50) = 'LastName', -- Можливі значення: FirstName, LastName
    @SortDirection BIT = 0 -- 0 - ASC, 1 - DESC
AS
BEGIN
    -- Перевірка на існування запису
    IF @StudentID IS NOT NULL AND NOT EXISTS (
        SELECT 1 FROM dbo.Students WHERE StudentID = @StudentID
    )
    BEGIN
        PRINT 'Неправильне значення для @StudentID'
        RETURN
    END

    -- Вибірка даних із фільтруванням, сортуванням та пагінацією
    SELECT 
        StudentID,
        FirstName,
        LastName,
        ClassID
    FROM dbo.Students
    WHERE 
        (@StudentID IS NULL OR StudentID = @StudentID) AND
        (@Name IS NULL OR 
            FirstName LIKE @Name + '%' OR 
            LastName LIKE @Name + '%') AND
        (@ClassID IS NULL OR ClassID = @ClassID)
    ORDER BY 
        CASE 
            WHEN @SortDirection = 0 THEN 
                CASE @SortColumn 
                    WHEN 'StudentID' THEN CAST(StudentID AS NVARCHAR) 
                    WHEN 'FirstName' THEN FirstName 
                    WHEN 'LastName' THEN LastName 
                END
        END ASC,
        CASE 
            WHEN @SortDirection = 1 THEN 
                CASE @SortColumn 
                    WHEN 'StudentID' THEN CAST(StudentID AS NVARCHAR) 
                    WHEN 'FirstName' THEN FirstName 
                    WHEN 'LastName' THEN LastName 
                END
        END DESC
    OFFSET (@PageNumber - 1) * @PageSize ROWS 
    FETCH NEXT @PageSize ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjects]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_GetSubjects]
 @SubjectID INT = NULL,
 @SubjectName NVARCHAR(50) = NULL,
 @PageSize INT = 20,
 @PageNumber INT = 1,
 @SortColumn VARCHAR(128) = 'SubjectID',
 @SortDirection BIT = 0
AS
IF @SubjectID IS NOT NULL
AND NOT EXISTS (SELECT * FROM dbo.Subjects WHERE SubjectID = @SubjectID)
BEGIN
    PRINT 'Incorrect value of @SubjectID'
    RETURN
END

SELECT *
FROM dbo.Subjects
WHERE 
    (@SubjectID IS NULL OR SubjectID = @SubjectID) AND
    (@SubjectName IS NULL OR SubjectName LIKE @SubjectName + '%')
ORDER BY 
    CASE 
        WHEN @SortDirection = 0 THEN 
            CASE @SortColumn
                WHEN 'SubjectID' THEN CAST(SubjectID AS NVARCHAR)
                WHEN 'SubjectName' THEN SubjectName
            END
    END ASC,
    CASE 
        WHEN @SortDirection = 1 THEN 
            CASE @SortColumn
                WHEN 'SubjectID' THEN CAST(SubjectID AS NVARCHAR)
                WHEN 'SubjectName' THEN SubjectName
            END
    END DESC
OFFSET (@PageNumber - 1) * @PageSize ROWS  
FETCH NEXT @PageSize ROWS ONLY;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeachers]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_GetTeachers]
 @TeacherID INT = NULL,
 @Name NVARCHAR(50) = NULL,
 @PageSize INT = 20,
 @PageNumber INT = 1,
 @SortColumn VARCHAR(128) = 'TeacherID',
 @SortDirection BIT = 0
AS
IF @TeacherID IS NOT NULL
AND NOT EXISTS (SELECT * FROM dbo.Teachers WHERE TeacherID = @TeacherID)
BEGIN
    PRINT 'Incorrect value of @TeacherID'
    RETURN
END

SELECT *
FROM dbo.Teachers
WHERE 
    (@TeacherID IS NULL OR TeacherID = @TeacherID) AND
    (@Name IS NULL OR 
        FirstName LIKE @Name + '%' OR 
        LastName LIKE @Name + '%')
ORDER BY 
    CASE 
        WHEN @SortDirection = 0 THEN 
            CASE @SortColumn
                WHEN 'TeacherID' THEN CAST(TeacherID AS NVARCHAR)
                WHEN 'FirstName' THEN FirstName
                WHEN 'LastName' THEN LastName
            END
    END ASC,
    CASE 
        WHEN @SortDirection = 1 THEN 
            CASE @SortColumn
                WHEN 'TeacherID' THEN CAST(TeacherID AS NVARCHAR)
                WHEN 'FirstName' THEN FirstName
                WHEN 'LastName' THEN LastName
            END
    END DESC
OFFSET (@PageNumber - 1) * @PageSize ROWS  
FETCH NEXT @PageSize ROWS ONLY;
GO
/****** Object:  StoredProcedure [dbo].[sp_SetAttendance]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetAttendance]
    @AttendanceID INT = NULL OUTPUT,
    @StudentID INT,
    @Date DATE,
    @Status NVARCHAR(50),
    @Notes NVARCHAR(255) = NULL
AS
BEGIN
    BEGIN TRY
        -- Перевірка обов'язкових параметрів
        IF @StudentID IS NULL OR @Date IS NULL OR @Status IS NULL
        BEGIN
            PRINT 'Необхідно вказати StudentID, Date та Status'
            RETURN
        END

        -- Якщо AttendanceID не передано, вставляємо новий запис
        IF @AttendanceID IS NULL
        BEGIN
            SET @AttendanceID = (
                SELECT ISNULL(MAX(AttendanceID), 0) + 1 FROM dbo.Attendance
            );

            INSERT INTO dbo.Attendance (AttendanceID, StudentID, Date, Status, Notes)
            VALUES (@AttendanceID, @StudentID, @Date, @Status, @Notes);
        END
        ELSE
        BEGIN
            -- Оновлюємо існуючий запис
            UPDATE dbo.Attendance
            SET StudentID = @StudentID,
                Date = @Date,
                Status = @Status,
                Notes = @Notes
            WHERE AttendanceID = @AttendanceID;

            -- Перевірка, чи існує запис із вказаним AttendanceID
            IF @@ROWCOUNT = 0
            BEGIN
                PRINT 'Запис з вказаним AttendanceID не знайдено'
                RETURN
            END
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SetClasses]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetClasses]
    @ClassID INT = NULL OUTPUT,
    @GradeLevel INT,
    @ClassName NVARCHAR(100),
    @TeacherID INT
AS
BEGIN
    BEGIN TRY
        -- Перевірка обов'язкових параметрів
        IF @GradeLevel IS NULL OR @ClassName IS NULL OR @TeacherID IS NULL
        BEGIN
            PRINT 'Необхідно вказати GradeLevel, ClassName та TeacherID';
            RETURN;
        END

        -- Якщо ClassID не передано, вставляємо новий запис
        IF @ClassID IS NULL
        BEGIN
            SET @ClassID = (
                SELECT ISNULL(MAX(ClassID), 0) + 1 FROM dbo.Classes
            );

            INSERT INTO dbo.Classes (ClassID, GradeLevel, ClassName, TeacherID)
            VALUES (@ClassID, @GradeLevel, @ClassName, @TeacherID);
        END
        ELSE
        BEGIN
            -- Оновлюємо існуючий запис
            UPDATE dbo.Classes
            SET GradeLevel = @GradeLevel,
                ClassName = @ClassName,
                TeacherID = @TeacherID
            WHERE ClassID = @ClassID;

            -- Перевірка, чи існує запис із вказаним ClassID
            IF @@ROWCOUNT = 0
            BEGIN
                PRINT 'Запис з вказаним ClassID не знайдено';
                RETURN;
            END
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SetClub]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetClub]
    @ClubID INT = NULL OUTPUT,
    @ClubName NVARCHAR(100),
    @Description NVARCHAR(MAX) = NULL,
    @TeacherID INT = NULL
AS
BEGIN
    IF @ClubName IS NULL
    BEGIN
        PRINT 'Invalid value for @ClubName'
        RETURN
    END

    BEGIN TRY
        IF @ClubID IS NULL
        BEGIN
            SET @ClubID = 1 + (SELECT ISNULL(MAX(ClubID), 0) FROM Club)

            INSERT INTO Club (ClubID, ClubName, Description, TeacherID)
            VALUES (@ClubID, @ClubName, @Description, @TeacherID)
        END
        ELSE
        BEGIN
            UPDATE Club
            SET ClubName = @ClubName,
                Description = ISNULL(@Description, Description),
                TeacherID = @TeacherID
            WHERE ClubID = @ClubID
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetClubMembership]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetClubMembership]
    @MembershipID INT = NULL OUTPUT,
    @ClubID INT,
    @StudentID INT,
    @DateJoined DATE = NULL,
    @Role NVARCHAR(50) = NULL
AS
BEGIN
    IF @ClubID IS NULL OR @StudentID IS NULL
    BEGIN
        PRINT 'Invalid value for @ClubID or @StudentID'
        RETURN
    END

    BEGIN TRY
        IF @MembershipID IS NULL
        BEGIN
            SET @MembershipID = 1 + (SELECT ISNULL(MAX(MembershipID), 0) FROM ClubMemberships)

            INSERT INTO ClubMemberships (MembershipID, ClubID, StudentID, DateJoined, Role)
            VALUES (@MembershipID, @ClubID, @StudentID, ISNULL(@DateJoined, GETDATE()), @Role)
        END
        ELSE
        BEGIN
            UPDATE ClubMemberships
            SET ClubID = @ClubID,
                StudentID = @StudentID,
                DateJoined = ISNULL(@DateJoined, DateJoined),
                Role = ISNULL(@Role, Role)
            WHERE MembershipID = @MembershipID
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetEvent]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetEvent]
    @EventID INT = NULL OUTPUT,
    @EventName NVARCHAR(100) = NULL,
    @Description NVARCHAR(255) = NULL,
    @EventDate DATE = NULL,
    @Location NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @EventName IS NULL
    BEGIN
        PRINT 'EventName cannot be NULL';
        RETURN;
    END

    BEGIN TRY
        IF @EventID IS NULL
        BEGIN
            SET @EventID = (SELECT ISNULL(MAX(EventID), 0) + 1 FROM dbo.Events);

            INSERT INTO dbo.Events (EventID, EventName, Description, EventDate, Location)
            VALUES (@EventID, @EventName, @Description, @EventDate, @Location);
        END
        ELSE
        BEGIN
            UPDATE dbo.Events
            SET EventName = ISNULL(@EventName, EventName),
                Description = ISNULL(@Description, Description),
                EventDate = ISNULL(@EventDate, EventDate),
                Location = ISNULL(@Location, Location)
            WHERE EventID = @EventID;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetExam]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetExam]
    @ExamID INT = NULL OUTPUT,
    @ExamName NVARCHAR(100) = NULL,
    @SubjectID INT = NULL,
    @ExamDate DATE = NULL,
    @ExamTime TIME(7) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @ExamName IS NULL OR @SubjectID IS NULL OR @ExamDate IS NULL OR @ExamTime IS NULL
    BEGIN
        PRINT 'ExamName, SubjectID, ExamDate та ExamTime не можуть бути NULL';
        RETURN;
    END

    BEGIN TRY
        IF @ExamID IS NULL
        BEGIN
            SET @ExamID = (SELECT ISNULL(MAX(ExamID), 0) + 1 FROM dbo.Exams);

            INSERT INTO dbo.Exams (ExamID, ExamName, SubjectID, ExamDate, ExamTime)
            VALUES (@ExamID, @ExamName, @SubjectID, @ExamDate, @ExamTime);
        END
        ELSE
        BEGIN
            UPDATE dbo.Exams
            SET ExamName = ISNULL(@ExamName, ExamName),
                SubjectID = ISNULL(@SubjectID, SubjectID),
                ExamDate = ISNULL(@ExamDate, ExamDate),
                ExamTime = ISNULL(@ExamTime, ExamTime)
            WHERE ExamID = @ExamID;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetExamResult]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetExamResult]
    @ResultID INT = NULL OUTPUT,
    @ExamID INT = NULL,
    @StudentID INT = NULL,
    @Score DECIMAL(4,2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @ExamID IS NULL OR @StudentID IS NULL
    BEGIN
        PRINT 'ExamID і StudentID не можуть бути NULL';
        RETURN;
    END

    BEGIN TRY
        IF @ResultID IS NULL
        BEGIN
            SET @ResultID = (SELECT ISNULL(MAX(ResultID), 0) + 1 FROM dbo.ExamResults);

            INSERT INTO dbo.ExamResults (ResultID, ExamID, StudentID, Score)
            VALUES (@ResultID, @ExamID, @StudentID, @Score);
        END
        ELSE
        BEGIN
            UPDATE dbo.ExamResults
            SET ExamID = ISNULL(@ExamID, ExamID),
                StudentID = ISNULL(@StudentID, StudentID),
                Score = ISNULL(@Score, Score)
            WHERE ResultID = @ResultID;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetGrade]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetGrade]
    @GradeID INT = NULL OUTPUT,
    @StudentID INT = NULL,
    @TeacherID INT = NULL,
    @SubjectID INT = NULL,
    @Grade DECIMAL(4, 2) = NULL,
    @DateRecorded DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @StudentID IS NULL OR @TeacherID IS NULL OR @SubjectID IS NULL OR @Grade IS NULL OR @DateRecorded IS NULL
    BEGIN
        PRINT 'StudentID, TeacherID, SubjectID, Grade та DateRecorded не можуть бути NULL';
        RETURN;
    END

    BEGIN TRY
        IF @GradeID IS NULL
        BEGIN
            SET @GradeID = (SELECT ISNULL(MAX(GradeID), 0) + 1 FROM dbo.Grades);

            INSERT INTO dbo.Grades (GradeID, StudentID, TeacherID, SubjectID, Grade, DateRecorded)
            VALUES (@GradeID, @StudentID, @TeacherID, @SubjectID, @Grade, @DateRecorded);
        END
        ELSE
        BEGIN
            UPDATE dbo.Grades
            SET StudentID = ISNULL(@StudentID, StudentID),
                TeacherID = ISNULL(@TeacherID, TeacherID),
                SubjectID = ISNULL(@SubjectID, SubjectID),
                Grade = ISNULL(@Grade, Grade),
                DateRecorded = ISNULL(@DateRecorded, DateRecorded)
            WHERE GradeID = @GradeID;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetLibrary]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetLibrary]
    @BookID INT = NULL OUTPUT,
    @BookTitle NVARCHAR(255) = NULL,
    @Author NVARCHAR(255) = NULL,
    @YearPublished INT = NULL,
    @Availability BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @BookTitle IS NULL OR @Author IS NULL OR @YearPublished IS NULL OR @Availability IS NULL
    BEGIN
        PRINT 'BookTitle, Author, YearPublished та Availability не можуть бути NULL';
        RETURN;
    END

    BEGIN TRY
        IF @BookID IS NULL
        BEGIN
            SET @BookID = (SELECT ISNULL(MAX(BookID), 0) + 1 FROM dbo.Library);

            INSERT INTO dbo.Library (BookID, BookTitle, Author, YearPublished, Availability)
            VALUES (@BookID, @BookTitle, @Author, @YearPublished, @Availability);
        END
        ELSE
        BEGIN
            UPDATE dbo.Library
            SET BookTitle = ISNULL(@BookTitle, BookTitle),
                Author = ISNULL(@Author, Author),
                YearPublished = ISNULL(@YearPublished, YearPublished),
                Availability = ISNULL(@Availability, Availability)
            WHERE BookID = @BookID;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetParents]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetParents]
    @ParentID INT = NULL OUTPUT,
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @Phone NVARCHAR(20) = NULL,
    @Email NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @FirstName IS NULL OR @LastName IS NULL OR @Phone IS NULL OR @Email IS NULL
    BEGIN
        PRINT 'FirstName, LastName, Phone та Email не можуть бути NULL';
        RETURN;
    END

    BEGIN TRY
        IF @ParentID IS NULL
        BEGIN
            SET @ParentID = (SELECT ISNULL(MAX(ParentID), 0) + 1 FROM dbo.Parents);

            INSERT INTO dbo.Parents (ParentID, FirstName, LastName, Phone, Email)
            VALUES (@ParentID, @FirstName, @LastName, @Phone, @Email);
        END
        ELSE
        BEGIN
            UPDATE dbo.Parents
            SET FirstName = ISNULL(@FirstName, FirstName),
                LastName = ISNULL(@LastName, LastName),
                Phone = ISNULL(@Phone, Phone),
                Email = ISNULL(@Email, Email)
            WHERE ParentID = @ParentID;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetPayment]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetPayment]
    @PaymentID INT = NULL OUTPUT,
    @StudentID INT = NULL,
    @Amount DECIMAL(10, 2) = NULL,
    @DatePaid DATE = NULL,
    @PaymentType NVARCHAR(50) = NULL
AS
BEGIN
    IF @StudentID IS NULL OR @Amount IS NULL OR @DatePaid IS NULL
    BEGIN
        PRINT 'Invalid values for @StudentID, @Amount, or @DatePaid'
        RETURN
    END

    BEGIN TRY
        IF @PaymentID IS NULL
        BEGIN
            -- Якщо PaymentID не вказано, створюємо новий
            SET @PaymentID = 1 + (SELECT TOP(1) PaymentID FROM dbo.Payments ORDER BY PaymentID DESC)

            INSERT dbo.Payments (PaymentID, StudentID, Amount, DatePaid, PaymentType)
            VALUES (@PaymentID, @StudentID, @Amount, @DatePaid, @PaymentType)
        END
        ELSE
        BEGIN
            -- Якщо PaymentID вказано, оновлюємо запис
            UPDATE dbo.Payments
            SET StudentID = ISNULL(@StudentID, StudentID),
                Amount = ISNULL(@Amount, Amount),
                DatePaid = ISNULL(@DatePaid, DatePaid),
                PaymentType = ISNULL(@PaymentType, PaymentType)
            WHERE PaymentID = @PaymentID
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetStudent]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetStudent]
    @StudentID INT = NULL OUTPUT,
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @ClassID INT = NULL
AS
BEGIN
    IF @FirstName IS NULL OR @LastName IS NULL
    BEGIN
        PRINT 'Invalid value of @FirstName or @LastName'
        RETURN
    END

    BEGIN TRY
        IF @StudentID IS NULL
        BEGIN
            SET @StudentID = 1 + (SELECT TOP(1) StudentID FROM dbo.Students ORDER BY StudentID DESC)

            INSERT INTO dbo.Students (StudentID, FirstName, LastName, ClassID)
            VALUES (@StudentID, @FirstName, @LastName, @ClassID)
        END
        ELSE
        BEGIN
            UPDATE dbo.Students
            SET FirstName = ISNULL(@FirstName, FirstName),
                LastName = ISNULL(@LastName, LastName),
                ClassID = ISNULL(@ClassID, ClassID)
            WHERE StudentID = @StudentID
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetSubjects]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetSubjects]
    @SubjectID INT = NULL OUTPUT,
    @SubjectName NVARCHAR(100) = NULL,
    @Description NVARCHAR(255) = NULL,
    @TeacherID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @SubjectName IS NULL OR @TeacherID IS NULL
    BEGIN
        PRINT 'SubjectName та TeacherID не можуть бути NULL';
        RETURN;
    END

    BEGIN TRY
        IF @SubjectID IS NULL
        BEGIN
            SET @SubjectID = (SELECT ISNULL(MAX(SubjectID), 0) + 1 FROM dbo.Subjects);

            INSERT INTO dbo.Subjects (SubjectID, SubjectName, Description, TeacherID)
            VALUES (@SubjectID, @SubjectName, @Description, @TeacherID);
        END
        ELSE
        BEGIN
            UPDATE dbo.Subjects
            SET SubjectName = ISNULL(@SubjectName, SubjectName),
                Description = ISNULL(@Description, Description),
                TeacherID = ISNULL(@TeacherID, TeacherID)
            WHERE SubjectID = @SubjectID;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SetTeacher]    Script Date: 03.01.2025 21:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_SetTeacher]
    @TeacherID INT = NULL OUTPUT,
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @SubjectID INT = NULL
AS
BEGIN
    IF @FirstName IS NULL OR @LastName IS NULL
    BEGIN
        PRINT 'Invalid value of @FirstName or @LastName'
        RETURN
    END

    BEGIN TRY
        IF @TeacherID IS NULL
        BEGIN
            SET @TeacherID = 1 + (SELECT TOP(1) TeacherID FROM dbo.Teachers ORDER BY TeacherID DESC)

            INSERT INTO dbo.Teachers (TeacherID, FirstName, LastName, SubjectID)
            VALUES (@TeacherID, @FirstName, @LastName, @SubjectID)
        END
        ELSE
        BEGIN
            UPDATE dbo.Teachers
            SET FirstName = ISNULL(@FirstName, FirstName),
                LastName = ISNULL(@LastName, LastName),
                SubjectID = ISNULL(@SubjectID, SubjectID)
            WHERE TeacherID = @TeacherID
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [School] SET  READ_WRITE 
GO
