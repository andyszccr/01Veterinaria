Public Class PetsE
#Region "Variables"
    Private PetID As Integer
    Private PetCode As String
    Private PetName As String
    Private PetCreate As DateTime
    Private PetUpdate As DateTime
    Private PetDelete As DateTime
    Private PetStatus As Boolean
    Private RaceID As Integer
    Private UserID As Integer
#End Region

#Region "Propiedades"
    Public Property _PetID As Integer
        Get
            Return PetID
        End Get
        Set(ByVal value As Integer)
            PetID = value
        End Set
    End Property

    Public Property _PetCode As String
        Get
            Return PetCode
        End Get
        Set(ByVal value As String)
            PetCode = value
        End Set
    End Property

    Public Property _PetName As String
        Get
            Return PetName
        End Get
        Set(ByVal value As String)
            PetName = value
        End Set
    End Property

    Private PetAge As Integer

    Public Property _PetAge As Integer
        Get
            Return PetAge
        End Get
        Set(ByVal value As Integer)
            PetAge = value
        End Set
    End Property

    Public Property _PetCreate As DateTime
        Get
            Return PetCreate
        End Get
        Set(ByVal value As DateTime)
            PetCreate = value
        End Set
    End Property

    Public Property _PetUpdate As DateTime
        Get
            Return PetUpdate
        End Get
        Set(ByVal value As DateTime)
            PetUpdate = value
        End Set
    End Property

    Public Property _PetDelete As DateTime
        Get
            Return PetDelete
        End Get
        Set(ByVal value As DateTime)
            PetDelete = value
        End Set
    End Property

    Public Property _PetStatus As Boolean
        Get
            Return PetStatus
        End Get
        Set(ByVal value As Boolean)
            PetStatus = value
        End Set
    End Property

    Public Property _RaceID As Integer
        Get
            Return RaceID
        End Get
        Set(ByVal value As Integer)
            RaceID = value
        End Set
    End Property

    Public Property _UserID As Integer
        Get
            Return UserID
        End Get
        Set(ByVal value As Integer)
            UserID = value
        End Set
    End Property
#End Region

End Class
