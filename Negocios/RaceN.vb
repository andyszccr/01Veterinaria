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


    Public Function mantenimientoRazas(ByVal obje As RaceE, ByVal vlaccion As String) As String
        Dim accion As String = ""
        cmdRaza.Connection = Conexion.AbrirConexion()
        cmdRaza = New SqlCommand("SPMantenimientoProductos", Conexion.Conexion)
        cmdRaza.CommandType = CommandType.StoredProcedure
        cmdRaza.Parameters.Add(New SqlParameter("@CodigoProducto", obje._RaceCode))
        cmdRaza.Parameters.Add(New SqlParameter("@NombreArticulo", obje._RaceName))
        cmdRaza.Parameters.Add(New SqlParameter("@Presentacion", obje._RaceCreate))
        cmdRaza.Parameters.Add(New SqlParameter("@DetalleProducto", obje._RaceUpdate))
        cmdRaza.Parameters.Add(New SqlParameter("@Precio", obje._RaceDelete))
        cmdRaza.Parameters.Add("@accion", SqlDbType.VarChar, 50).Value = vlaccion
        cmdRaza.Parameters("@accion").Direction = ParameterDirection.InputOutput
        If Conexion.Conexion.State = ConnectionState.Open Then Conexion.CerrarConexion()
        Conexion.AbrirConexion()
        cmdRaza.ExecuteNonQuery()
        accion = cmdRaza.Parameters("@accion").Value.ToString()
        Conexion.CerrarConexion()
        Return accion
    End Function
End Class

