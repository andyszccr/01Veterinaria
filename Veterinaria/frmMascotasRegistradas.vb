Imports Negocios
Public Class frmMascotasRegistradas
    Dim datos As New BLL
    Private Sub AbrirArchivoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AbrirArchivoToolStripMenuItem.Click
        'validacion de datos 

        'validacion de datos 
        Try
            Dim ruta As String = "C:\Users\andre\Documents\Programacion II\frontEnd\Veterinaria\bin\Debug\Maascotas.xml"

            ofdabrir.FileName = ruta

            'metodo para cargar 
            datos.tablas2()

            dgvmascotas.DataSource = datos.datatable2

        Catch ex As Exception

        End Try
        'ruta



    End Sub

    Private Sub VolverAlMenuPrincipalToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles VolverAlMenuPrincipalToolStripMenuItem.Click

        'esconde la pantalla
        Me.Hide()
        'vuelve al menu 
        frmMenu.Show()

    End Sub

    Private Sub btndelete_Click(sender As Object, e As EventArgs)
        'validacion de datos 
        Try


            datos.idnodo = txtcedula.Text.ToString

            datos.eliminarXmlDueños()

        Catch ex As Exception
            MsgBox("error de borrar datos ")
        End Try
    End Sub


End Class