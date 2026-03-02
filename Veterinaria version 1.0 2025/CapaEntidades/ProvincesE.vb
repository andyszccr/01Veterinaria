Public Class ProvincesE
#Region "variables"
    Private ProvinceID As Integer
    Private ProvinceCode As String
    Private ProvinceName As String
    Private ProvinceCreate As DateTime
    Private ProvinceUpdate As DateTime
    Private ProvinceDelete As DateTime
    Private ProvinceStatus As Boolean
#End Region

#Region "Propiedades"
    Public Property _ProvinceID As Integer
        Get
            Return ProvinceID
        End Get
        Set(ByVal value As Integer)
            ProvinceID = value
        End Set
    End Property



    Public Property _ProvinceCode As String
        Get
            Return ProvinceCode
        End Get
        Set(ByVal value As String)
            ProvinceCode = value
        End Set
    End Property



    Public Property _ProvinceName As String
        Get
            Return ProvinceName
        End Get
        Set(ByVal value As String)
            ProvinceName = value
        End Set
    End Property



    Public Property _ProvinceCreate As DateTime
        Get
            Return ProvinceCreate
        End Get
        Set(ByVal value As DateTime)
            ProvinceCreate = value
        End Set
    End Property



    Public Property _ProvinceUpdate As DateTime
        Get
            Return ProvinceUpdate
        End Get
        Set(ByVal value As DateTime)
            ProvinceUpdate = value
        End Set
    End Property



    Public Property _ProvinceDelete As DateTime
        Get
            Return ProvinceDelete
        End Get
        Set(ByVal value As DateTime)
            ProvinceDelete = value
        End Set
    End Property



    Public Property _ProvinceStatus As Boolean
        Get
            Return ProvinceStatus
        End Get
        Set(ByVal value As Boolean)
            ProvinceStatus = value
        End Set
    End Property
#End Region

End Class
