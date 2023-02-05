Public Class frmAcercaDE
    Private Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click

        'se esconde la pantalla
        Me.Hide()

        'vuelve al menu principal
        frmMenu.Show()
    End Sub
End Class