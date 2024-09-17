Public Class UsersE
#Region "Variables"
    Private UserID As Integer
    Private UserCode As String
    Private UserName As String
    Private UserLastName As String
    Private UserPhone As Integer
    Private UserUpdate As DateTime
    Private UserCreate As DateTime
    Private UserDelete As DateTime
    Private UserStatus As Boolean
    Private ProvinceID As Integer
#End Region

#Region "Propiedades"
    Public Property _UserID As Integer
        Get
            Return UserID
        End Get
        Set(ByVal value As Integer)
            UserID = value
        End Set
    End Property



    Public Property _UserCode As String
        Get
            Return UserCode
        End Get
        Set(ByVal value As String)
            UserCode = value
        End Set
    End Property



    Public Property _UserName As String
        Get
            Return UserName
        End Get
        Set(ByVal value As String)
            UserName = value
        End Set
    End Property



    Public Property _UserLastName As String
        Get
            Return UserLastName
        End Get
        Set(ByVal value As String)
            UserLastName = value
        End Set
    End Property

    Private RoleID As Integer

    Public Property _RoleID As Integer
        Get
            Return RoleID
        End Get
        Set(ByVal value As Integer)
            RoleID = value
        End Set
    End Property

    Private UserEmail As String

    Public Property _UserEmail As String
        Get
            Return UserEmail
        End Get
        Set(ByVal value As String)
            UserEmail = value
        End Set
    End Property



    Public Property _UserPhone As Integer
        Get
            Return UserPhone
        End Get
        Set(ByVal value As Integer)
            UserPhone = value
        End Set
    End Property

    Private Useraddress As String

    Public Property _Useraddress As String
        Get
            Return Useraddress
        End Get
        Set(ByVal value As String)
            Useraddress = value
        End Set
    End Property



    Public Property _UserCreate As DateTime
        Get
            Return UserCreate
        End Get
        Set(ByVal value As DateTime)
            UserCreate = value
        End Set
    End Property



    Public Property _UserUpdate As DateTime
        Get
            Return UserUpdate
        End Get
        Set(ByVal value As DateTime)
            UserUpdate = value
        End Set
    End Property



    Public Property _UserDelete As DateTime
        Get
            Return UserDelete
        End Get
        Set(ByVal value As DateTime)
            UserDelete = value
        End Set
    End Property



    Public Property _UserStatus As Boolean
        Get
            Return UserStatus
        End Get
        Set(ByVal value As Boolean)
            UserStatus = value
        End Set
    End Property



    Public Property _ProvinceID As Integer
        Get
            Return ProvinceID
        End Get
        Set(ByVal value As Integer)
            ProvinceID = value
        End Set
    End Property
#End Region

End Class
