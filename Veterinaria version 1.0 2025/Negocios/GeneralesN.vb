Imports System.Data.SqlClient
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq
Imports System.Text
Imports System.Threading.Tasks
Imports Datos
Imports System.Data.Sql
Imports Entidades
Public Class GeneralesN

    Dim generales As New Generales

#Region "Metodos Generales"
    Public Function FechaCreate(ByVal accion As String) As DateTime
        Select Case accion
            Case "1"
                generales._FechaCreate = DateTime.Now
        End Select

        Return generales._FechaCreate
    End Function


    Public Function FechaUpdate(ByVal accion As String) As DateTime
        Select Case accion
            Case "1"
                generales._FechaUpate = Convert.ToDateTime("01-01-1900")
            Case "2"
                generales._FechaUpate = DateTime.Now
        End Select

        Return generales._FechaUpate
    End Function




    'Metodo General para las fechas cuando se ingresen un dato le guarde la fecha
    Public Function FechaDelete(ByVal accion As String) As DateTime
        Select Case accion
            Case "1"
                generales._FechaDelete = Convert.ToDateTime("01-01-1900")
            Case "2"
                generales._FechaDelete = Convert.ToDateTime("01-01-1900")
            Case Else
                generales._FechaDelete = DateTime.Now
        End Select

        Return generales._FechaDelete
    End Function
#End Region


End Class
