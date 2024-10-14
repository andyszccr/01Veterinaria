Imports Negocios
Imports System.IO
Public Class lblcelular

    Dim datos As New BLL




    Private Sub btnbuscar_Click(sender As Object, e As EventArgs) Handles btnbuscar.Click
        'validacion de DATOS 
        Try


            'un for para que recorra las fila del data grid view 
            For I = 0 To dgvClienteRegistrado.Rows().Count - 1


                'for each por cada celda en las filas del data grid view 
                For Each CELDA In dgvClienteRegistrado.Rows(I).Cells 'RECORRE LAS CELDAS DE CADA FILA

                    'condicion del dato a buscar para sacar los datos del cliente 
                    If CELDA.VALUE = txtbuscar.Text Then

                        'se leccion la celda a funcionar 
                        dgvClienteRegistrado.CurrentCell = CELDA 'SELECCIONA LA CELDA


                        'si el dato de la cedula es igual al que se escogio entonces
                        If txtbuscar.Text = dgvClienteRegistrado.CurrentCell.Value Then



                            txtId.Text = dgvClienteRegistrado.CurrentCell.Value

                            txtname.Text = dgvClienteRegistrado.Rows(I).Cells(1).Value

                            txtlastname.Text = dgvClienteRegistrado.Rows(I).Cells(2).Value

                            txtaddress.Text = dgvClienteRegistrado.Rows(I).Cells(3).Value

                            txtcelular.Text = dgvClienteRegistrado.Rows(I).Cells(4).Value

                            txtemail.Text = dgvClienteRegistrado.Rows(I).Cells(5).Value


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

    Private Sub MostrarDatosParaRecuperarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles MostrarDatosParaRecuperarToolStripMenuItem.Click
        'variable de tipo string igual al de la casilla de tipo text box 


        'si se abre el archivo mostrando el dialogo entonces 


        Dim ruta = "C:\Users\andre\Documents\Programacion II\frontEnd\Veterinaria\bin\Debug\Dueños.xml"

            ofdAbrir.FileName = ruta

            datos.tablas()

            dgvClienteRegistrado.DataSource = datos.datatable


        'mensaje que se lleno la tabla compeltamente

    End Sub

    Private Sub VolverAlMenuPrincipalToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles VolverAlMenuPrincipalToolStripMenuItem.Click
        Me.Hide()

        'frmMenu.Show()
    End Sub

    Private Sub btnmodificar_Click(sender As Object, e As EventArgs) 
        'validacion de datos 
        Try

            dgvClienteRegistrado.BeginEdit(True)

            If MsgBox("¿Desea guardar cambios?", vbYesNo + vbQuestion, "Salir del programa") = vbYes Then

                'metodo para crear el xml
                datos.escribirDueñosXML()

            End If

        Catch ex As Exception
            'error de mensaje 
            MessageBox.Show("Error de datos para modificar", "Error de modificar", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
End Class