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

Public Class RolesN
    Private cmdRoles As SqlCommand = New SqlCommand()
    Private Conexion As ConexionSQL = New ConexionSQL()
    Private LeerFilas As SqlDataReader

    Public Function VistaRoles() As DataTable
        Dim dt As DataTable = New DataTable()
        Dim conection As Object

        'validacion de datos
        Try
            cmdRoles.Connection = Conexion.AbrirConexion()
            cmdRoles = New SqlCommand("SPViewRoles", Conexion.Conexion)
            cmdRoles.CommandType = CommandType.StoredProcedure
            Dim da As SqlDataAdapter = New SqlDataAdapter(cmdRoles)
            da.Fill(dt)
            Conexion.CerrarConexion()
        Catch ex As Exception
            dt = Nothing
            Console.WriteLine("Error: " + ex.Message)
        End Try


        Return dt
    End Function


    ''' <summary>
    ''' Metodo para mantenimiento de Roles
    ''' 1. Opcion 1 crear
    ''' 2. Opcion 2 modificar
    ''' 3. Opcion 3 Eliminar
    ''' </summary>
    ''' <param name="obje"></param>
    ''' <param name="vlaccion"></param>
    ''' <returns></returns>
#Region "Mantenimiento de Razas"
    Public Function mantenimientoRoles(ByVal obje As RolesE, ByVal vlaccion As String) As String
        Try
            Dim accion As String = ""
            cmdRoles.Connection = Conexion.AbrirConexion()
            cmdRoles = New SqlCommand("SPCatalogoRoles", Conexion.Conexion)
            cmdRoles.CommandType = CommandType.StoredProcedure
            cmdRoles.Parameters.Add(New SqlParameter("@RoleCode", obje._RoleCode))
            cmdRoles.Parameters.Add(New SqlParameter("@RoleName", obje._RoleName))
            cmdRoles.Parameters.Add(New SqlParameter("@RoleCreate", obje._RoleCreate))
            cmdRoles.Parameters.Add(New SqlParameter("@RoleUpdate", obje._RoleUpdate))
            cmdRoles.Parameters.Add(New SqlParameter("@RoleDelete", obje._RoleDelete))
            cmdRoles.Parameters.Add(New SqlParameter("@RoleStatus", obje._RoleStatus))
            cmdRoles.Parameters.Add("@accion", SqlDbType.VarChar, 50).Value = vlaccion
            cmdRoles.Parameters("@accion").Direction = ParameterDirection.InputOutput
            If Conexion.Conexion.State = ConnectionState.Open Then Conexion.CerrarConexion()
            Conexion.AbrirConexion()
            cmdRoles.ExecuteNonQuery()
            accion = cmdRoles.Parameters("@accion").Value.ToString()
            Conexion.CerrarConexion()
            Return accion
        Catch ex As Exception
            Console.WriteLine(ex.Message)
            Throw New Exception("Error en el modulo de Roles")
        End Try
    End Function
#End Region
End Class






