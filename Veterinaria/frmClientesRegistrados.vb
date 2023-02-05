Imports System.IO
Imports System.Xml
Imports Negocios
Public Class frmClientesRegistrados

    Dim datos As New BLL
    Private Sub Menutmns_Click(sender As Object, e As EventArgs) Handles Menutmns.Click
        'vuelve al menu principal
        Me.Hide()


        'se muestra el menu principal
        frmMenu.Show()
    End Sub

    Private Sub DueñosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DueñosToolStripMenuItem.Click
        'validacion de datos para abrir el archivo
        Try
            'variable de tipo string igual al de la casilla de tipo text box 
            datos.ruta = txtruta.Text.ToString

            'si se abre el archivo mostrando el dialogo entonces 

            txtruta.Text = "C:\Users\andre\Documents\Programacion II\frontEnd\Veterinaria\bin\Debug\Dueños.xml"


        Catch ex As Exception
            MessageBox.Show("no se pudo abrir el archivo, revise la ruta de donde se abrio", "Error del archivo", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btnmostrar_Click(sender As Object, e As EventArgs) Handles btnmostrar.Click
        'validacion de datos


        Try


            datos.tablas()


            dgvClienteRegistrado.DataSource = datos.datatable

        Catch ex As Exception
            MessageBox.Show("error")
        End Try
    End Sub

    Private Sub MascotasToolStripMenuItem_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btnfix_Click(sender As Object, e As EventArgs)
        'validacion de datos 
        Try

            dgvClienteRegistrado.BeginEdit(True)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btndelete_Click(sender As Object, e As EventArgs) Handles btndelete.Click

        datos.idnodo = txtcedula.Text.ToString



        datos.eliminarXmlDueños()
    End Sub

    Private Sub gbDelete_Enter(sender As Object, e As EventArgs) Handles gbDelete.Enter

    End Sub
End Class