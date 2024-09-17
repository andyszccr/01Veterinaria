Public Class MedicineE
#Region "Variables"
    Private MedicineID As Integer
    Private MedicineCode As String
    Private MedicineName As String
    Private MedicineCreate As DateTime
    Private MedicineUpdate As DateTime
    Private MedicineDelete As DateTime
    Private MedicineStatus As Boolean
#End Region

#Region "Propiedades"
    Public Property _MedicineID As Integer
        Get
            Return MedicineID
        End Get
        Set(ByVal value As Integer)
            MedicineID = value
        End Set
    End Property


    Public Property _MedicineCode As String
        Get
            Return MedicineCode
        End Get
        Set(ByVal value As String)
            MedicineCode = value
        End Set
    End Property

    Public Property _MedicineName As String
        Get
            Return MedicineName
        End Get
        Set(ByVal value As String)
            MedicineName = value
        End Set
    End Property

    Public Property _MedicineCreate As DateTime
        Get
            Return MedicineCreate
        End Get
        Set(ByVal value As DateTime)
            MedicineCreate = value
        End Set
    End Property

    Public Property _MedicineUpdate As DateTime
        Get
            Return MedicineUpdate
        End Get
        Set(ByVal value As DateTime)
            MedicineUpdate = value
        End Set
    End Property

    Public Property _MedicineDelete As DateTime
        Get
            Return MedicineDelete
        End Get
        Set(ByVal value As DateTime)
            MedicineDelete = value
        End Set
    End Property

    Public Property _MedicineStatus As Boolean
        Get
            Return MedicineStatus
        End Get
        Set(ByVal value As Boolean)
            MedicineStatus = value
        End Set
    End Property
#End Region

End Class
