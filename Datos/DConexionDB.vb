Imports System.Data.SqlClient

Public Class DConexionDB
    Private Shared CadenaConexion As String = "Data Source=bXNzcWwtMTA5NTA5LTAuY2xvdWRjbHVzdGVycy5uZXQsMTAyOTE=;Initial Catalog=PedidosFusionFloral;User ID=QW5kcmV5c3pjcg==;Password=QWRtaW4yMDIz;"
    Public Conexion As SqlConnection = New SqlConnection(CadenaConexion)
    '*********************************************************************************
    Public Function AbrirConexion() As SqlConnection
        If Conexion.State = ConnectionState.Closed Then Conexion.Open()
        Return Conexion
    End Function
    '*********************************************************************************
    Public Function CerrarConexion() As SqlConnection
        If Conexion.State = ConnectionState.Open Then Conexion.Close()
        Return Conexion
    End Function
    '*********************************************************************************
End Class
