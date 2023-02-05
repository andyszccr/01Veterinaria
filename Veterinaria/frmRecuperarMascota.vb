Imports Negocios
Public Class frmRecuperarMascota
    Dim datos As New BLL
    Private Sub btnbuscar_Click(sender As Object, e As EventArgs) Handles btnbuscar.Click
        Try


            'un for para que recorra las fila del data grid view 
            For I = 0 To dgvmascotas.Rows().Count - 1


                'for each por cada celda en las filas del data grid view 
                For Each CELDA In dgvmascotas.Rows(I).Cells 'RECORRE LAS CELDAS DE CADA FILA

                    'condicion del dato a buscar para sacar los datos del cliente 
                    If CELDA.VALUE = txtbuscar.Text Then

                        'se leccion la celda a funcionar 
                        dgvmascotas.CurrentCell = CELDA 'SELECCIONA LA CELDA


                        'si el dato de la cedula es igual al que se escogio entonces
                        If txtbuscar.Text = dgvmascotas.CurrentCell.Value Then


                            txtId.Text = dgvmascotas.CurrentCell.Value

                            txtnamepet.Text = dgvmascotas.Rows(I).Cells(1).Value

                            txttipo.Text = dgvmascotas.Rows(I).Cells(2).Value

                            txtraza.Text = dgvmascotas.Rows(I).Cells(3).Value

                            txtpeso.Text = dgvmascotas.Rows(I).Cells(4).Value

                            txtfecha.Text = dgvmascotas.Rows(I).Cells(5).Value

                            txtsalud.Text = dgvmascotas.Rows(I).Cells(6).Value



                        End If

                        Exit Sub 'CUANDO LA ENCUENTRA SALE DE LOS 2 BUCLES
                    End If
                Next
            Next

            MsgBox("DATO NO ENCONTRADO") 'SI HA LLEGADO HASTA AQUI ES QUE NO HA ENCONTRADO EL DATO
        Catch ex As Exception
            'EN CASO DE ERROR MUESTRA UN DATO ERRONEO EN MENSAJE 
            MessageBox.Show("error al buscar los datos en el data grid view", "Error", MessageBoxButtons.OK, MessageBoxIcon.Information)
            Exit Sub
        End Try
    End Sub

    Private Sub AbrirToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AbrirToolStripMenuItem.Click
        'validacion de datos 
        Try
            'ruta donde se encuntra el archivo 
            Dim ruta As String = "C:\Users\andre\Documents\Programacion II\frontEnd\Veterinaria\bin\Debug\Maascotas.xml"

            'se abre el archivo 
            ofdabrir.FileName = ruta

            'metodo
            datos.tablas2()

            'se agrega los datos en el data 
            dgvmascotas.DataSource = datos.datatable2
        Catch ex As Exception
            'en caso de error muestra errorf 
            MessageBox.Show("Error de datos, al cargarse", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub

    Private Sub VolverAlMenuPrincipalToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles VolverAlMenuPrincipalToolStripMenuItem.Click

        Me.Hide()

        frmMenu.Show()

    End Sub
End Class