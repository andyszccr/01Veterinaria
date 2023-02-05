<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMenu
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmMenu))
        Me.mnsMenu = New System.Windows.Forms.MenuStrip()
        Me.ClientesRegistradostsmns = New System.Windows.Forms.ToolStripMenuItem()
        Me.ClientesNuevostmns = New System.Windows.Forms.ToolStripMenuItem()
        Me.MacotasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.Opcionestmns = New System.Windows.Forms.ToolStripMenuItem()
        Me.RecuperarInformaciónTmns = New System.Windows.Forms.ToolStripMenuItem()
        Me.AcercaDeTmns = New System.Windows.Forms.ToolStripMenuItem()
        Me.SalirTmns = New System.Windows.Forms.ToolStripMenuItem()
        Me.lblmain = New System.Windows.Forms.Label()
        Me.RecupararInformacionMascotasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MascotasRegistradosToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.mnsMenu.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'mnsMenu
        '
        Me.mnsMenu.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.mnsMenu.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.mnsMenu.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ClientesRegistradostsmns, Me.ClientesNuevostmns, Me.MacotasToolStripMenuItem, Me.MascotasRegistradosToolStripMenuItem, Me.Opcionestmns, Me.AcercaDeTmns, Me.SalirTmns})
        Me.mnsMenu.Location = New System.Drawing.Point(0, 0)
        Me.mnsMenu.Name = "mnsMenu"
        Me.mnsMenu.Size = New System.Drawing.Size(1067, 28)
        Me.mnsMenu.TabIndex = 0
        Me.mnsMenu.Text = "MenuStrip1"
        '
        'ClientesRegistradostsmns
        '
        Me.ClientesRegistradostsmns.ImageTransparentColor = System.Drawing.SystemColors.ActiveCaption
        Me.ClientesRegistradostsmns.Name = "ClientesRegistradostsmns"
        Me.ClientesRegistradostsmns.Size = New System.Drawing.Size(157, 24)
        Me.ClientesRegistradostsmns.Text = "Clientes Registrados"
        '
        'ClientesNuevostmns
        '
        Me.ClientesNuevostmns.Name = "ClientesNuevostmns"
        Me.ClientesNuevostmns.Size = New System.Drawing.Size(128, 24)
        Me.ClientesNuevostmns.Text = "Clientes Nuevos"
        '
        'MacotasToolStripMenuItem
        '
        Me.MacotasToolStripMenuItem.Name = "MacotasToolStripMenuItem"
        Me.MacotasToolStripMenuItem.Size = New System.Drawing.Size(79, 24)
        Me.MacotasToolStripMenuItem.Text = "Macotas"
        '
        'Opcionestmns
        '
        Me.Opcionestmns.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.RecuperarInformaciónTmns, Me.RecupararInformacionMascotasToolStripMenuItem})
        Me.Opcionestmns.Name = "Opcionestmns"
        Me.Opcionestmns.Size = New System.Drawing.Size(85, 24)
        Me.Opcionestmns.Text = "Opciones"
        '
        'RecuperarInformaciónTmns
        '
        Me.RecuperarInformaciónTmns.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.RecuperarInformaciónTmns.Name = "RecuperarInformaciónTmns"
        Me.RecuperarInformaciónTmns.Size = New System.Drawing.Size(309, 26)
        Me.RecuperarInformaciónTmns.Text = "Recuperar Información Clientes"
        '
        'AcercaDeTmns
        '
        Me.AcercaDeTmns.Name = "AcercaDeTmns"
        Me.AcercaDeTmns.Size = New System.Drawing.Size(89, 24)
        Me.AcercaDeTmns.Text = "Acerca de"
        '
        'SalirTmns
        '
        Me.SalirTmns.Name = "SalirTmns"
        Me.SalirTmns.Size = New System.Drawing.Size(52, 24)
        Me.SalirTmns.Text = "Salir"
        '
        'lblmain
        '
        Me.lblmain.AutoSize = True
        Me.lblmain.Font = New System.Drawing.Font("Comic Sans MS", 20.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblmain.ForeColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(0, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.lblmain.Location = New System.Drawing.Point(637, 53)
        Me.lblmain.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lblmain.Name = "lblmain"
        Me.lblmain.Size = New System.Drawing.Size(365, 94)
        Me.lblmain.TabIndex = 2
        Me.lblmain.Text = """Cuidamos gran parte " & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "de su  tesoro canino""."
        '
        'RecupararInformacionMascotasToolStripMenuItem
        '
        Me.RecupararInformacionMascotasToolStripMenuItem.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.RecupararInformacionMascotasToolStripMenuItem.Name = "RecupararInformacionMascotasToolStripMenuItem"
        Me.RecupararInformacionMascotasToolStripMenuItem.Size = New System.Drawing.Size(309, 26)
        Me.RecupararInformacionMascotasToolStripMenuItem.Text = "Recuparar Informacion Mascotas"
        '
        'MascotasRegistradosToolStripMenuItem
        '
        Me.MascotasRegistradosToolStripMenuItem.Name = "MascotasRegistradosToolStripMenuItem"
        Me.MascotasRegistradosToolStripMenuItem.Size = New System.Drawing.Size(167, 24)
        Me.MascotasRegistradosToolStripMenuItem.Text = "Mascotas Registrados"
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Image = Global.Veterinaria.My.Resources.Resources.ImagenMenu
        Me.PictureBox1.Location = New System.Drawing.Point(0, 28)
        Me.PictureBox1.Margin = New System.Windows.Forms.Padding(4)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(1067, 526)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 1
        Me.PictureBox1.TabStop = False
        '
        'frmMenu
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1067, 554)
        Me.ControlBox = False
        Me.Controls.Add(Me.lblmain)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.mnsMenu)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MainMenuStrip = Me.mnsMenu
        Me.Margin = New System.Windows.Forms.Padding(4)
        Me.Name = "frmMenu"
        Me.Text = "Veterinaria (Menu Principal)"
        Me.mnsMenu.ResumeLayout(False)
        Me.mnsMenu.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents mnsMenu As MenuStrip
    Friend WithEvents ClientesRegistradostsmns As ToolStripMenuItem
    Friend WithEvents ClientesNuevostmns As ToolStripMenuItem
    Friend WithEvents Opcionestmns As ToolStripMenuItem
    Friend WithEvents RecuperarInformaciónTmns As ToolStripMenuItem
    Friend WithEvents AcercaDeTmns As ToolStripMenuItem
    Friend WithEvents SalirTmns As ToolStripMenuItem
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents lblmain As Label
    Friend WithEvents MacotasToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents RecupararInformacionMascotasToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents MascotasRegistradosToolStripMenuItem As ToolStripMenuItem
End Class
