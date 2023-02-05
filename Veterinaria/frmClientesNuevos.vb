'se importa la libreria de capa negocios 
Imports Negocios
Imports System.Xml

Public Class frmClientesNuevos

    Dim datos As New BLL

    Private Sub btnRegistrar_Click(sender As Object, e As EventArgs) Handles btnRegistrar.Click
        ''validacion de datos 
        Try
            '-------------------------------------------
            ' si es numerico entonces 
            If IsNumeric(txtId.Text) Then
                datos.ID = Str(txtId.Text)
            Else
                datos.ID = 0
            End If
            '-------------------------------------------
            'nombre del cliente
            datos.name = txtname.Text.ToString
            '-------------------------------------------
            'primer apellido 
            datos.lastname = txtlastname1.Text.ToString
            '-------------------------------------------
            'direccion 
            datos.claddress = txtaddress.Text.ToString
            '-------------------------------------------
            'si es numerico
            If IsNumeric(txtcellphone.Text) Then
                datos.cellphone = txtcellphone.Text
            Else
                datos.cellphone = 0
            End If
            '--------------------------------------------
            'correo electronico 
            datos.email = txtemail.Text.ToString
            '---------------------------------------------
            'validaciones: 
            'de cedula
            datos.validacionCedula()
            'nombre
            datos.validacionNombre()
            'apellido
            datos.validacionapellido1()
            'direccion
            datos.validacionAddress()
            'telefono
            datos.validaciontelefono()
            'correo electronico
            datos.validacionEmail()
            '-----------------------------------------------

            'mensaje que los datos se han guardado correctamente 
            MessageBox.Show("se han regitrado los datos satisfactoriamente", "Datos Registrados", MessageBoxButtons.OK, MessageBoxIcon.Information)
            '--------------------------------------------------

            dgvCliente.Rows.Add({Str(datos.ID), datos.name, datos.lastname, datos.claddress, Str(datos.cellphone), datos.email})


            'metodo para crear el xml
            datos.escribirDueñosXML()





        Catch ex As Exception
            'mensaje de error 
            MessageBox.Show("error de datos al registrarse los datos", "error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

        'se limpian los datos una vez agregados en el data grid view
        txtId.Clear()
        txtname.Clear()
        txtlastname1.Clear()
        txtaddress.Clear()
        txtcellphone.Clear()
        txtemail.Clear()


    End Sub

    Private Sub VolverAlMenuPrincipalToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles VolverAlMenuPrincipalToolStripMenuItem.Click
        'vuelve al menu principal
        Me.Hide()

        'se muestra el menu principal
        frmMenu.Show()
    End Sub
    Private Sub frmClientesNuevos_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        txtruta.Enabled = False
    End Sub

End Class