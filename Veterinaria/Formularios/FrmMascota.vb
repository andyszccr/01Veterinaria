Imports Entidades
Imports Negocios


Public Class FrmMascota

    Dim vlPetN As PetsN
    Dim VlPetE As PetsE
    Dim GeneralesN As New GeneralesN


    Private Sub btnCerrar_Click(sender As Object, e As EventArgs) Handles btnCerrar.Click
        Me.Close()
    End Sub

    Private Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click

    End Sub

    Private Sub BtnAdd_Click(sender As Object, e As EventArgs) Handles BtnAdd.Click
        If (String.IsNullOrEmpty(txtMascota.Text)) Then
            MessageBox.Show("Campos sin completar, por favor llenar los datos", "Campos vacios", MessageBoxButtons.OK, MessageBoxIcon.Information)

        ElseIf (txtCodigo.Text <> "") Then
            'Pregunta si desea el siguiente dato. 
            If MessageBox.Show("¿Deseas registrar a " & txtMascota.Text & "?", "Mensaje", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = System.Windows.Forms.DialogResult.Yes Then

                'metodo para realizar con el 1 el insert en sql
                'mantenimiento("1")
            End If
        End If
    End Sub

    Private Sub btnModificar_Click(sender As Object, e As EventArgs) Handles btnModificar.Click

    End Sub

    Private Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click

    End Sub

    Private Sub btnExport_Click(sender As Object, e As EventArgs) Handles btnExport.Click

    End Sub

    Private Sub rbActivo_CheckedChanged(sender As Object, e As EventArgs) Handles rbActivo.CheckedChanged
        Estados()
    End Sub

    Private Sub rbInactivo_CheckedChanged(sender As Object, e As EventArgs) Handles rbInactivo.CheckedChanged
        Estados()
    End Sub

#Region "Metodos Generales"
    Private Sub mantenimiento(ByVal accion As String)
        'VlPetE._PetCode = txtCodigo.Text
        'VlPetE._RaceName = txtRaza.Text
        'vlGenerales._accion = accion
        'GeneralesN.FechasGenerales(accion)
        'VlPetE._PetCreate = vlGenerales._FechaCreate
        'VlPetE._PetUpdate = vlGenerales._FechaUpate
        'VlPetE._PetDelete = vlGenerales._FechaDelete
        'vlGenerales._msj = RazaN.mantenimientoRazas(vlRaza, vlGenerales._accion)
        'MessageBox.Show(vlGenerales._msj, "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub


    Private Sub Estados()
        If rbActivo.Checked Then
            rbInactivo.Checked = False
            VlPetE._PetStatus = rbActivo.Checked
        ElseIf rbInactivo.Checked Then
            rbActivo.Checked = False
            VlPetE._PetStatus = rbInactivo.Checked
        End If
    End Sub
#End Region

End Class