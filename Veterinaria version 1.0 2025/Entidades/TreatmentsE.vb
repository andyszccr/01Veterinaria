Public Class TreatmentsE
#Region "variables"
    Private TreatmentID As Integer
    Private TreatmentCode As String
    Private TreatmentName As String
    Private TreatmentAge As Integer
    Private TreatmentCreate As DateTime
    Private TreatmentUpdate As DateTime
    Private TreatmentDelete As DateTime
    Private TreatmentStatus As Boolean
    Private MedicineID As Integer
#End Region

#Region "Propiedades"
    Public Property _TreatmentID As Integer
        Get
            Return TreatmentID
        End Get
        Set(ByVal value As Integer)
            TreatmentID = value
        End Set
    End Property

    Public Property _TreatmentCode As String
        Get
            Return TreatmentCode
        End Get
        Set(ByVal value As String)
            TreatmentCode = value
        End Set
    End Property

    Public Property _TreatmentName As String
        Get
            Return TreatmentName
        End Get
        Set(ByVal value As String)
            TreatmentName = value
        End Set
    End Property

    Public Property _TreatmentAge As Integer
        Get
            Return TreatmentAge
        End Get
        Set(ByVal value As Integer)
            TreatmentAge = value
        End Set
    End Property

    Public Property _TreatmentCreate As DateTime
        Get
            Return TreatmentCreate
        End Get
        Set(ByVal value As DateTime)
            TreatmentCreate = value
        End Set
    End Property

    Public Property _TreatmentUpdate As DateTime
        Get
            Return TreatmentUpdate
        End Get
        Set(ByVal value As DateTime)
            TreatmentUpdate = value
        End Set
    End Property

    Public Property _TreatmentDelete As DateTime
        Get
            Return TreatmentDelete
        End Get
        Set(ByVal value As DateTime)
            TreatmentDelete = value
        End Set
    End Property


    Public Property _TreatmentStatus As Boolean
        Get
            Return TreatmentStatus
        End Get
        Set(ByVal value As Boolean)
            TreatmentStatus = value
        End Set
    End Property

    Private PetID As Integer

    Public Property _PetID As Integer
        Get
            Return PetID
        End Get
        Set(ByVal value As Integer)
            PetID = value
        End Set
    End Property

    Public Property _MedicineID As Integer
        Get
            Return MedicineID
        End Get
        Set(ByVal value As Integer)
            MedicineID = value
        End Set
    End Property
#End Region

End Class
