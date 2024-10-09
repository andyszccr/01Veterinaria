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

Public Class RaceN
    Private cmdRaza As SqlCommand = New SqlCommand()
    Private Conexion As ConexionSQL = New ConexionSQL()
    Private LeerFilas As SqlDataReader

    ''' <summary>
    ''' Metodo para mantenimiento de Razas
    ''' 1. Opcion 1 crear
    ''' 2. Opcion 2 modificar
    ''' 3. Opcion 3 Eliminar
    ''' </summary>
    ''' <param name="obje"></param>
    ''' <param name="vlaccion"></param>
    ''' <returns></returns>
#Region "Mantenimiento de Razas"
    Public Function mantenimientoRazas(ByVal obje As RaceE, ByVal vlaccion As String) As String
        Try
            Dim accion As String = ""
            cmdRaza.Connection = Conexion.AbrirConexion()
            cmdRaza = New SqlCommand("SPCatalogoRazas", Conexion.Conexion)
            cmdRaza.CommandType = CommandType.StoredProcedure
            cmdRaza.Parameters.Add(New SqlParameter("@RaceCode", obje._RaceCode))
            cmdRaza.Parameters.Add(New SqlParameter("@RaceName", obje._RaceName))
            cmdRaza.Parameters.Add(New SqlParameter("@RaceCreate", obje._RaceCreate))
            cmdRaza.Parameters.Add(New SqlParameter("@RaceUpdate", obje._RaceUpdate))
            cmdRaza.Parameters.Add(New SqlParameter("@RaceDelete", obje._RaceDelete))
            cmdRaza.Parameters.Add(New SqlParameter("@RaceStatus", obje._RaceStatus))
            cmdRaza.Parameters.Add("@accion", SqlDbType.VarChar, 50).Value = vlaccion
            cmdRaza.Parameters("@accion").Direction = ParameterDirection.InputOutput
            If Conexion.Conexion.State = ConnectionState.Open Then Conexion.CerrarConexion()
            Conexion.AbrirConexion()
            cmdRaza.ExecuteNonQuery()
            accion = cmdRaza.Parameters("@accion").Value.ToString()
            Conexion.CerrarConexion()
            Return accion
        Catch ex As Exception
            Console.WriteLine(ex.Message)
            Throw New Exception("Error en el modulo de Razas")
        End Try
    End Function
#End Region


End Class

