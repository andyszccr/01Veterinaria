Public Class ERoles
    Private IdRol As Integer
    Private CodigoRol As String
    Private Rol As String
    Private accion As String

    '------------------------------------------------
    'property de IdRol
    Public Property _IdRol As Integer
        Get
            'se le devuelve un valor
            Return IdRol
        End Get
        Set(value As Integer)
            IdRol = value
        End Set
    End Property
    '--------------------------------------------------
    'property de Codigo de Rol
    Public Property _CodigoRol As String
        Get
            'se le devuelve un valor
            Return CodigoRol
        End Get
        Set(value As String)
            CodigoRol = value
        End Set
    End Property
    '--------------------------------------------------
    'property de Rol
    Public Property _Rol As String
        Get
            'se le devuelve un valor
            Return Rol
        End Get
        Set(value As String)
            Rol = value
        End Set
    End Property
    '--------------------------------------------------
    'property de Rol
    Public Property _Accion As String
        Get
            'se le devuelve un valor
            Return accion
        End Get
        Set(value As String)
            accion = value
        End Set
    End Property
    '--------------------------------------------------
End Class
