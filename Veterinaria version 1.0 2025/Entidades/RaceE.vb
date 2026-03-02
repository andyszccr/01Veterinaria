Public Class RaceE
#Region "Variables"
    Private RaceCode As String
    Private RaceName As String
    Private RaceCreate As DateTime
    Private RaceUpdate As DateTime
    Private RaceDelete As DateTime
    Private RaceStatus As Boolean
#End Region

#Region "Propiedades"
    Public Property _RaceCode As String
        Get
            Return RaceCode
        End Get
        Set(ByVal value As String)
            RaceCode = value
        End Set
    End Property

    Public Property _RaceName As String
        Get
            Return RaceName
        End Get
        Set(ByVal value As String)
            RaceName = value
        End Set
    End Property


    Public Property _RaceCreate As DateTime
        Get
            Return RaceCreate
        End Get
        Set(ByVal value As DateTime)
            RaceCreate = value
        End Set
    End Property

    Public Property _RaceUpdate As DateTime
        Get
            Return RaceUpdate
        End Get
        Set(ByVal value As DateTime)
            RaceUpdate = value
        End Set
    End Property

    Public Property _RaceDelete As DateTime
        Get
            Return RaceDelete
        End Get
        Set(ByVal value As DateTime)
            RaceDelete = value
        End Set
    End Property

    Public Property _RaceStatus As Boolean
        Get
            Return RaceStatus
        End Get
        Set(ByVal value As Boolean)
            RaceStatus = value
        End Set
    End Property
#End Region

End Class
