Public Class frmMenu
    Private Sub ClientesRegistradostsmns_Click(sender As Object, e As EventArgs) Handles ClientesRegistradostsmns.Click
        'se esconde el menu principal
        Me.Hide()



        'se muestra la pantalla de clientes registrados
        frmClientesRegistrados.Show()
    End Sub

    Private Sub AcercaDeTmns_Click(sender As Object, e As EventArgs) Handles AcercaDeTmns.Click
        'se esconde la pantalla de menu
        Me.Hide()

        'se muestra la pantalla de Acerca DE 
        frmAcercaDE.Show()
    End Sub

    Private Sub RecuperarInformaciónTmns_Click(sender As Object, e As EventArgs) Handles RecuperarInformaciónTmns.Click
        'se esconde la pantalla de menu
        Me.Hide()

        'se muestra la pantalla de recuperar datos 
        lblcelular.Show()
    End Sub



    Private Sub SalirTmns_Click(sender As Object, e As EventArgs) Handles SalirTmns.Click

        Me.Enabled = False
        mnsMenu.Enabled = False

        'condicion en caso de que de desee salir 
        If MsgBox("¿Desea salir del sistema de veterinaria?", vbYesNo + vbQuestion, "salir del programa") = vbYes Then
            Me.Close()
            End
        Else
            'en caso de que no desee salir sehabilitan los campos 
            Me.Enabled = True
            mnsMenu.Enabled = True
        End If

    End Sub

    Private Sub ClientesNuevostmns_Click(sender As Object, e As EventArgs) Handles ClientesNuevostmns.Click
        'se esconde la pantalla
        Me.Hide()

        'vuelve al menu principal
        frmClientesNuevos.Show()

    End Sub

    Private Sub MacotasToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles MacotasToolStripMenuItem.Click
        'se esconde la pantalla de menu
        Me.Hide()

        'se muestra la pantalla de datos gardados
        frmMascotas.Show()
    End Sub

    Private Sub Opcionestmns_Click(sender As Object, e As EventArgs) Handles Opcionestmns.Click

    End Sub

    Private Sub RecupararInformacionMascotasToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RecupararInformacionMascotasToolStripMenuItem.Click
        'se esconde la pantalla
        Me.Hide()

        frmRecuperarMascota.Show()

    End Sub

    Private Sub MascotasRegistradosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles MascotasRegistradosToolStripMenuItem.Click
        'se esconde la pantalla
        Me.Hide()

        frmMascotasRegistradas.Show()


    End Sub
End Class
