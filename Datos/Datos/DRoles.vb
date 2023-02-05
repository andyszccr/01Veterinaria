
Imports System.Data.SqlClient
Imports Entidades.ERoles

Public Class DRoles
    Private Conexion As DConexionDB = New DConexionDB()
    Private cmdRol As SqlCommand = New SqlCommand()
    Private LeerFilas As SqlDataReader
    Private Roles As Entidades.ERoles = New Entidades.ERoles()

    '***********************************************************************************************
    Public Function D_mantenimiento_Clientes(ByVal obje As Entidades.ERoles) As String
        Dim accion As String
        'validacion de datos
        Try

            cmdRol.Connection = Conexion.AbrirConexion()
            cmdRol = New SqlCommand("SPMantenimientoRoles", Conexion.Conexion)
            cmdRol.CommandType = CommandType.StoredProcedure
            cmdRol.Parameters.Add(New SqlParameter("@CodigoRol", obje._CodigoRol))
            cmdRol.Parameters.Add(New SqlParameter("@PrimerApellido", obje._Rol))
            cmdRol.Parameters.Add("@accion", SqlDbType.VarChar, 50).Value = obje._Accion
            cmdRol.Parameters("@accion").Direction = ParameterDirection.InputOutput
            If Conexion.Conexion.State = ConnectionState.Open Then Conexion.CerrarConexion()
            Conexion.AbrirConexion()
            cmdRol.ExecuteNonQuery()
            accion = cmdRol.Parameters("@accion").Value.ToString()
            Conexion.CerrarConexion()
            Return accion
        Catch ex As Exception
            accion = ""
            Return accion
        End Try
    End Function
    '**********************************************************************************************
    Public Function ListarClientes() As DataTable
        Dim Tabla As DataTable = New DataTable()
        'validacion de datos
        Try
            cmdRol.Connection = Conexion.AbrirConexion()
            cmdRol.CommandText = "SeleccionoRol"
            cmdRol.CommandType = CommandType.StoredProcedure
            LeerFilas = cmdRol.ExecuteReader()
            Tabla.Load(LeerFilas)
            LeerFilas.Close()
            Conexion.CerrarConexion()
            Return Tabla
        Catch ex As Exception
            Tabla = Nothing
            Return Tabla
        End Try
    End Function
    '**********************************************************************************************
    Public Function ValidacionRoles() As Boolean
        Dim value As Boolean = False

        'condicion de la longitud de rol
        If Not (Roles._Rol.Length > 150) Then
            MsgBox("Es extenso el rol que deseas agregar")
            Return value = True
        End If

        'condicion de la longitud de rol
        If String.IsNullOrEmpty(Roles._Rol) Or Roles._Rol = "" Then
            MsgBox("eL Rol no puede quedar vacio")
            Return value = True
        End If

        value = False
        Return value
    End Function
    '**********************************************************************************************
End Class
