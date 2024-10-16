Public Class Generales
#Region "Variables"
    Private accion As String
    Private msj As String
    Private msjAccion As String
    Private nombre As String
    Private email As String
    Private version As String
    Private FechaCreate As DateTime
    Private FechaUpate As DateTime
    Private FechaDelete As DateTime
#End Region

#Region "Propiedades"
    Public Property _accion As String
        Get
            Return accion
        End Get
        Set(ByVal value As String)
            accion = value
        End Set
    End Property

    'creado el 16-09-2024
    'Variable para capturar los mensajes
    Public Property _msj As String
        Get
            Return msj
        End Get
        Set(value As String)
            msj = value
        End Set
    End Property

    Public Property _nombre As String
        Get
            Return nombre
        End Get
        Set(value As String)
            nombre = value
        End Set
    End Property

    Public Property _email As String
        Get
            Return email
        End Get
        Set(value As String)
            email = value
        End Set
    End Property

    Public Property _version As String
        Get
            Return version
        End Get
        Set(value As String)
            version = value
        End Set
    End Property

    Public Property _msjAccion As String
        Get
            Return msjAccion
        End Get
        Set(value As String)
            msjAccion = value
        End Set
    End Property

    Public Property _FechaCreate As DateTime
        Get
            Return FechaCreate
        End Get
        Set(value As Date)
            FechaCreate = value
        End Set
    End Property

    Public Property _FechaUpate As DateTime
        Get
            Return FechaUpate
        End Get
        Set(value As Date)
            FechaUpate = value
        End Set
    End Property

    Public Property _FechaDelete As DateTime
        Get
            Return FechaDelete
        End Get
        Set(value As Date)
            FechaDelete = value
        End Set
    End Property
#End Region
End Class
