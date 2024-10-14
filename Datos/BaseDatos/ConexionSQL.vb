Imports System.Data.SqlClient

Public Class ConexionSQL
    Private Shared CadenaConexion As String = "Data Source=Localhost;Initial Catalog=VeterinariaDB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True;"

    'Trust Server Certificate=True;"

    '   Private Shared CadenaConexion As String = "Initial Catalog=Northwind;" &
    '"Data Source=localhost;Integrated Security=SSPI;"

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
