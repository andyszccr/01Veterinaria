<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmAcercaDE
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.btnVolver = New System.Windows.Forms.Button()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.lblnombre = New System.Windows.Forms.Label()
        Me.lblcorreo = New System.Windows.Forms.Label()
        Me.lblVersion = New System.Windows.Forms.Label()
        Me.lblfecha = New System.Windows.Forms.Label()
        Me.txtname = New System.Windows.Forms.TextBox()
        Me.TextBox2 = New System.Windows.Forms.TextBox()
        Me.TextBox3 = New System.Windows.Forms.TextBox()
        Me.txtemail = New System.Windows.Forms.TextBox()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'btnVolver
        '
        Me.btnVolver.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.btnVolver.Location = New System.Drawing.Point(125, 350)
        Me.btnVolver.Name = "btnVolver"
        Me.btnVolver.Size = New System.Drawing.Size(173, 43)
        Me.btnVolver.TabIndex = 0
        Me.btnVolver.Text = "Volver al Menu Principal"
        Me.btnVolver.UseVisualStyleBackColor = False
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Image = Global.Veterinaria.My.Resources.Resources.programador1
        Me.PictureBox1.Location = New System.Drawing.Point(0, 0)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(422, 405)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 1
        Me.PictureBox1.TabStop = False
        '
        'lblnombre
        '
        Me.lblnombre.AutoSize = True
        Me.lblnombre.Location = New System.Drawing.Point(25, 41)
        Me.lblnombre.Name = "lblnombre"
        Me.lblnombre.Size = New System.Drawing.Size(90, 17)
        Me.lblnombre.TabIndex = 2
        Me.lblnombre.Text = "programador"
        '
        'lblcorreo
        '
        Me.lblcorreo.AutoSize = True
        Me.lblcorreo.Location = New System.Drawing.Point(25, 101)
        Me.lblcorreo.Name = "lblcorreo"
        Me.lblcorreo.Size = New System.Drawing.Size(41, 17)
        Me.lblcorreo.TabIndex = 3
        Me.lblcorreo.Text = "email"
        '
        'lblVersion
        '
        Me.lblVersion.AutoSize = True
        Me.lblVersion.Location = New System.Drawing.Point(25, 158)
        Me.lblVersion.Name = "lblVersion"
        Me.lblVersion.Size = New System.Drawing.Size(56, 17)
        Me.lblVersion.TabIndex = 4
        Me.lblVersion.Text = "Version"
        '
        'lblfecha
        '
        Me.lblfecha.AutoSize = True
        Me.lblfecha.Location = New System.Drawing.Point(25, 213)
        Me.lblfecha.Name = "lblfecha"
        Me.lblfecha.Size = New System.Drawing.Size(121, 17)
        Me.lblfecha.TabIndex = 5
        Me.lblfecha.Text = "fecha de creacion"
        '
        'txtname
        '
        Me.txtname.Enabled = False
        Me.txtname.Location = New System.Drawing.Point(125, 38)
        Me.txtname.Name = "txtname"
        Me.txtname.Size = New System.Drawing.Size(150, 22)
        Me.txtname.TabIndex = 6
        Me.txtname.Text = "Andrey Sanchez Zuñiga"
        Me.txtname.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'TextBox2
        '
        Me.TextBox2.Enabled = False
        Me.TextBox2.Location = New System.Drawing.Point(145, 210)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(130, 22)
        Me.TextBox2.TabIndex = 7
        Me.TextBox2.Text = "11/11/2019"
        '
        'TextBox3
        '
        Me.TextBox3.Enabled = False
        Me.TextBox3.Location = New System.Drawing.Point(87, 155)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(188, 22)
        Me.TextBox3.TabIndex = 8
        Me.TextBox3.Text = "Version 1.0"
        '
        'txtemail
        '
        Me.txtemail.Enabled = False
        Me.txtemail.Location = New System.Drawing.Point(72, 101)
        Me.txtemail.Name = "txtemail"
        Me.txtemail.Size = New System.Drawing.Size(203, 22)
        Me.txtemail.TabIndex = 9
        Me.txtemail.Text = "andrey.sanchez30@hotmail.com"
        '
        'frmAcercaDE
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(422, 405)
        Me.Controls.Add(Me.txtemail)
        Me.Controls.Add(Me.TextBox3)
        Me.Controls.Add(Me.TextBox2)
        Me.Controls.Add(Me.txtname)
        Me.Controls.Add(Me.lblfecha)
        Me.Controls.Add(Me.lblVersion)
        Me.Controls.Add(Me.lblcorreo)
        Me.Controls.Add(Me.lblnombre)
        Me.Controls.Add(Me.btnVolver)
        Me.Controls.Add(Me.PictureBox1)
        Me.Name = "frmAcercaDE"
        Me.Text = "frmAcercaDE"
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents btnVolver As Button
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents lblnombre As Label
    Friend WithEvents lblcorreo As Label
    Friend WithEvents lblVersion As Label
    Friend WithEvents lblfecha As Label
    Friend WithEvents txtname As TextBox
    Friend WithEvents TextBox2 As TextBox
    Friend WithEvents TextBox3 As TextBox
    Friend WithEvents txtemail As TextBox
End Class
