Imports Entidades
Imports Datos

Public Class GeneralesN

    Dim generales As New Generales

#Region "Metodos Generales"
    'Metodo General para las fechas cuando se ingresen un dato le guarde la fecha
    Public Sub FechasGenerales(ByVal accion As String)
        Select Case accion
            Case "1"
                generales._FechaCreate = Date.Now
                generales._FechaUpate = Nothing
                generales._FechaDelete = Nothing
            Case "2"
                generales._FechaUpate = Date.Now
            Case Else
                generales._FechaDelete = Date.Now
        End Select
    End Sub
#End Region


End Class
