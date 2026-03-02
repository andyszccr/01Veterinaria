Public Class RolesE
#Region "Variables"
    Private RoleID As Integer
    Private RoleCode As String
    Private RoleName As String
    Private RoleCreate As DateTime
    Private RoleUpdate As DateTime
    Private RoleDelete As DateTime
    Private RoleStatus As Boolean
#End Region

#Region "Propiedades"
    Public Property _RoleID As Integer
        Get
            Return RoleID
        End Get
        Set(ByVal value As Integer)
            RoleID = value
        End Set
    End Property

    Public Property _RoleCode As String
        Get
            Return RoleCode
        End Get
        Set(ByVal value As String)
            RoleCode = value
        End Set
    End Property

    Public Property _RoleName As String
        Get
            Return RoleName
        End Get
        Set(ByVal value As String)
            RoleName = value
        End Set
    End Property

    Public Property _RoleCreate As DateTime
        Get
            Return RoleCreate
        End Get
        Set(ByVal value As DateTime)
            RoleCreate = value
        End Set
    End Property

    Public Property _RoleUpdate As DateTime
        Get
            Return RoleUpdate
        End Get
        Set(ByVal value As DateTime)
            RoleUpdate = value
        End Set
    End Property

    Public Property _RoleDelete As DateTime
        Get
            Return RoleDelete
        End Get
        Set(ByVal value As DateTime)
            RoleDelete = value
        End Set
    End Property

    Public Property _RoleStatus As Boolean
        Get
            Return RoleStatus
        End Get
        Set(ByVal value As Boolean)
            RoleStatus = value
        End Set
    End Property
#End Region
End Class
