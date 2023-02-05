Imports Negocios
Public Class frmMascotas

    Dim datos As New BLL
    Private Sub VolverAlMenuPrincipalToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles VolverAlMenuPrincipalToolStripMenuItem.Click
        'se esconde la pantalla
        Me.Hide()

        'vuelve al menu principal
        frmMenu.Show()
    End Sub

    Private Sub btnregistrar_Click(sender As Object, e As EventArgs) Handles btnregistrar.Click
        ''validacion de datos 
        Try
            '    'si es numerico entonces

            If IsNumeric(txtId.Text) Then
                datos.ID = txtId.Text.ToString
            Else
                datos.ID = 0
        End If

        'si es numerico entonces 


        datos.namemascota = txtnamepet.Text.ToString
            datos.typemascota = txttipo.Text.ToString
            datos.petraza = txtraza.Text.ToString

            'si es numerico
            If IsNumeric(txtpeso.Text) Then
                datos.heightpeso = txtpeso.Text
            Else
                datos.heightpeso = 0
            End If

            datos.birthPet = txtfecha.Text.ToString
            datos.healthyPet = txtsalud.Text.ToString

            'valdiaciones de cada campo 
            datos.validacionCedula()
            datos.validacionNombreMascota()
            datos.validaciontipoMascota()
            datos.validacionRaza()
            datos.validacionPesoMascota()
            datos.validacionSalud()
            datos.validacionFechaNacimiento()




            'se agrega al data grid view
            dgvmascota.Rows.Add({Str(datos.ID), datos.namemascota, datos.typemascota, datos.petraza, Str(datos.heightpeso), datos.birthPet, datos.healthyPet})


            datos.escribirMascotasXML()


        'en caso de error muestre un dato 
        Catch ex As Exception
        MessageBox.Show("error en la pantalla de mascotas", "Error de datos", MessageBoxButtons.OK, MessageBoxIcon.Error)

        End Try

        'limpieza de los datos 
        txtId.Clear()
        txtnamepet.Clear()
        txtpeso.Clear()
        txtraza.Clear()
        txtsalud.Clear()
        txttipo.Clear()
        txtfecha.Clear()


    End Sub


End Class