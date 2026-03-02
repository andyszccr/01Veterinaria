Imports System.Data.SqlClient

Public Class ConexionSQL
    Private Shared CadenaConexion As String = "Data Source=bXNzcWwtMTA5NTA5LTAuY2xvdWRjbHVzdGVycy5uZXQsMTAyOTE=;Initial Catalog=PedidosFusionFloral;User ID=QW5kcmV5c3pjcg==;Password=QWRtaW4yMDIz;"
    Public Conexion As SqlConnection = New SqlConnection(CadenaConexion)
    '*********************************************************************************
    'metodo para abrir la conexion  de la base de datos. 
    Public Function AbrirConexion() As SqlConnection
        'validacion  de datos
        Try
            If Conexion.State = ConnectionState.Closed Then Conexion.Open()
            Return Conexion
        Catch ex As Exception
            'en caso de error mandamos un mensaje y cerramos la conexion
            Console.WriteLine(ex.Message.ToString())
            Conexion.Close()
        End Try

        Return Conexion
    End Function
    '*********************************************************************************
    'metodo para cerrar conexion de basede datos.  
    Public Function CerrarConexion() As SqlConnection

        If Conexion.State = ConnectionState.Open Then Conexion.Close()
        Return Conexion
    End Function
    '*********************************************************************************
End Class
