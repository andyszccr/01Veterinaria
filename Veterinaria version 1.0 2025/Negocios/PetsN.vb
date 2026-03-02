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

Public Class PetsN
    Private cmdMascotas As SqlCommand = New SqlCommand()
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
#Region "Mantenimiento de Mascotas"
    Public Function mantenimientoPets(ByVal obje As PetsE, ByVal vlaccion As String) As String
        Try
            Dim accion As String = ""
            cmdMascotas.Connection = Conexion.AbrirConexion()
            cmdMascotas = New SqlCommand("SPCatalogoPets", Conexion.Conexion)
            cmdMascotas.CommandType = CommandType.StoredProcedure
            cmdMascotas.Parameters.Add(New SqlParameter("@RaceCode", obje._PetCode))
            cmdMascotas.Parameters.Add(New SqlParameter("@RaceName", obje._PetName))
            cmdMascotas.Parameters.Add(New SqlParameter("@RaceName", obje._PetAge))
            cmdMascotas.Parameters.Add(New SqlParameter("@RaceCreate", obje._PetCreate))
            cmdMascotas.Parameters.Add(New SqlParameter("@RaceUpdate", obje._PetUpdate))
            cmdMascotas.Parameters.Add(New SqlParameter("@RaceDelete", obje._PetDelete))
            cmdMascotas.Parameters.Add(New SqlParameter("@RaceStatus", obje._PetStatus))
            cmdMascotas.Parameters.Add(New SqlParameter("@RaceStatus", obje._PetID))
            cmdMascotas.Parameters.Add(New SqlParameter("@RaceStatus", obje._UserID))
            cmdMascotas.Parameters.Add("@accion", SqlDbType.VarChar, 50).Value = vlaccion
            cmdMascotas.Parameters("@accion").Direction = ParameterDirection.InputOutput
            If Conexion.Conexion.State = ConnectionState.Open Then Conexion.CerrarConexion()
            Conexion.AbrirConexion()
            cmdMascotas.ExecuteNonQuery()
            accion = cmdMascotas.Parameters("@accion").Value.ToString()
            Conexion.CerrarConexion()
            Return accion
        Catch ex As Exception
            Console.WriteLine(ex.Message)
            Throw New Exception("Error en el modulo de Razas")
        End Try
    End Function
#End Region


End Class
