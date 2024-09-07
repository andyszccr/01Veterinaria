Public Class Generales
#Region "Variables"
    Private accion As String
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
#End Region
End Class
