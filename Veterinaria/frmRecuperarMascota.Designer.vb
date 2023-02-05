<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmRecuperarMascota
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmRecuperarMascota))
        Me.dgvmascotas = New System.Windows.Forms.DataGridView()
        Me.txtfecha = New System.Windows.Forms.TextBox()
        Me.txtsalud = New System.Windows.Forms.TextBox()
        Me.lblsalud = New System.Windows.Forms.Label()
        Me.lblID = New System.Windows.Forms.Label()
        Me.lbltipo = New System.Windows.Forms.Label()
        Me.txtId = New System.Windows.Forms.TextBox()
        Me.lblfecha = New System.Windows.Forms.Label()
        Me.txtpeso = New System.Windows.Forms.TextBox()
        Me.lblpeso = New System.Windows.Forms.Label()
        Me.txtraza = New System.Windows.Forms.TextBox()
        Me.txttipo = New System.Windows.Forms.TextBox()
        Me.lblraza = New System.Windows.Forms.Label()
        Me.txtnamepet = New System.Windows.Forms.TextBox()
        Me.lblnamepet = New System.Windows.Forms.Label()
        Me.mnsMenu = New System.Windows.Forms.MenuStrip()
        Me.VolverAlMenuPrincipalToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AbrirToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.btnbuscar = New System.Windows.Forms.Button()
        Me.ofdabrir = New System.Windows.Forms.OpenFileDialog()
        Me.lblbuscar = New System.Windows.Forms.Label()
        Me.txtbuscar = New System.Windows.Forms.TextBox()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.laldato = New System.Windows.Forms.Label()
        CType(Me.dgvmascotas, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.mnsMenu.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'dgvmascotas
        '
        Me.dgvmascotas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvmascotas.Location = New System.Drawing.Point(24, 314)
        Me.dgvmascotas.Name = "dgvmascotas"
        Me.dgvmascotas.RowHeadersWidth = 51
        Me.dgvmascotas.RowTemplate.Height = 24
        Me.dgvmascotas.Size = New System.Drawing.Size(729, 150)
        Me.dgvmascotas.TabIndex = 6
        '
        'txtfecha
        '
        Me.txtfecha.Location = New System.Drawing.Point(178, 239)
        Me.txtfecha.Name = "txtfecha"
        Me.txtfecha.Size = New System.Drawing.Size(201, 22)
        Me.txtfecha.TabIndex = 34
        '
        'txtsalud
        '
        Me.txtsalud.Location = New System.Drawing.Point(82, 275)
        Me.txtsalud.Name = "txtsalud"
        Me.txtsalud.Size = New System.Drawing.Size(297, 22)
        Me.txtsalud.TabIndex = 33
        '
        'lblsalud
        '
        Me.lblsalud.AutoSize = True
        Me.lblsalud.Location = New System.Drawing.Point(32, 280)
        Me.lblsalud.Name = "lblsalud"
        Me.lblsalud.Size = New System.Drawing.Size(42, 17)
        Me.lblsalud.TabIndex = 32
        Me.lblsalud.Text = "salud"
        '
        'lblID
        '
        Me.lblID.AutoSize = True
        Me.lblID.Location = New System.Drawing.Point(32, 86)
        Me.lblID.Name = "lblID"
        Me.lblID.Size = New System.Drawing.Size(90, 17)
        Me.lblID.TabIndex = 22
        Me.lblID.Text = "identificacion"
        '
        'lbltipo
        '
        Me.lbltipo.AutoSize = True
        Me.lbltipo.Location = New System.Drawing.Point(32, 145)
        Me.lbltipo.Name = "lbltipo"
        Me.lbltipo.Size = New System.Drawing.Size(108, 17)
        Me.lbltipo.TabIndex = 31
        Me.lbltipo.Text = "tipo de mascota"
        '
        'txtId
        '
        Me.txtId.Location = New System.Drawing.Point(133, 81)
        Me.txtId.Name = "txtId"
        Me.txtId.Size = New System.Drawing.Size(246, 22)
        Me.txtId.TabIndex = 21
        '
        'lblfecha
        '
        Me.lblfecha.AutoSize = True
        Me.lblfecha.Location = New System.Drawing.Point(32, 244)
        Me.lblfecha.Name = "lblfecha"
        Me.lblfecha.Size = New System.Drawing.Size(135, 17)
        Me.lblfecha.TabIndex = 26
        Me.lblfecha.Text = "fecha de nacimiento"
        '
        'txtpeso
        '
        Me.txtpeso.Location = New System.Drawing.Point(82, 209)
        Me.txtpeso.Name = "txtpeso"
        Me.txtpeso.Size = New System.Drawing.Size(297, 22)
        Me.txtpeso.TabIndex = 27
        '
        'lblpeso
        '
        Me.lblpeso.AutoSize = True
        Me.lblpeso.Location = New System.Drawing.Point(35, 214)
        Me.lblpeso.Name = "lblpeso"
        Me.lblpeso.Size = New System.Drawing.Size(39, 17)
        Me.lblpeso.TabIndex = 25
        Me.lblpeso.Text = "peso"
        '
        'txtraza
        '
        Me.txtraza.Location = New System.Drawing.Point(101, 177)
        Me.txtraza.Name = "txtraza"
        Me.txtraza.Size = New System.Drawing.Size(278, 22)
        Me.txtraza.TabIndex = 28
        '
        'txttipo
        '
        Me.txttipo.Location = New System.Drawing.Point(145, 145)
        Me.txttipo.Name = "txttipo"
        Me.txttipo.Size = New System.Drawing.Size(234, 22)
        Me.txttipo.TabIndex = 30
        '
        'lblraza
        '
        Me.lblraza.AutoSize = True
        Me.lblraza.Location = New System.Drawing.Point(32, 182)
        Me.lblraza.Name = "lblraza"
        Me.lblraza.Size = New System.Drawing.Size(36, 17)
        Me.lblraza.TabIndex = 24
        Me.lblraza.Text = "raza"
        '
        'txtnamepet
        '
        Me.txtnamepet.Location = New System.Drawing.Point(187, 114)
        Me.txtnamepet.Name = "txtnamepet"
        Me.txtnamepet.Size = New System.Drawing.Size(192, 22)
        Me.txtnamepet.TabIndex = 29
        '
        'lblnamepet
        '
        Me.lblnamepet.AutoSize = True
        Me.lblnamepet.Location = New System.Drawing.Point(33, 119)
        Me.lblnamepet.Name = "lblnamepet"
        Me.lblnamepet.Size = New System.Drawing.Size(148, 17)
        Me.lblnamepet.TabIndex = 23
        Me.lblnamepet.Text = "nombre de la mascota"
        '
        'mnsMenu
        '
        Me.mnsMenu.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.mnsMenu.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.mnsMenu.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VolverAlMenuPrincipalToolStripMenuItem, Me.AbrirToolStripMenuItem})
        Me.mnsMenu.Location = New System.Drawing.Point(0, 0)
        Me.mnsMenu.Name = "mnsMenu"
        Me.mnsMenu.Size = New System.Drawing.Size(800, 28)
        Me.mnsMenu.TabIndex = 35
        Me.mnsMenu.Text = "MenuStrip1"
        '
        'VolverAlMenuPrincipalToolStripMenuItem
        '
        Me.VolverAlMenuPrincipalToolStripMenuItem.Name = "VolverAlMenuPrincipalToolStripMenuItem"
        Me.VolverAlMenuPrincipalToolStripMenuItem.Size = New System.Drawing.Size(187, 24)
        Me.VolverAlMenuPrincipalToolStripMenuItem.Text = "Volver al menu principal "
        '
        'AbrirToolStripMenuItem
        '
        Me.AbrirToolStripMenuItem.Name = "AbrirToolStripMenuItem"
        Me.AbrirToolStripMenuItem.Size = New System.Drawing.Size(60, 24)
        Me.AbrirToolStripMenuItem.Text = "Abrir "
        '
        'btnbuscar
        '
        Me.btnbuscar.Image = Global.Veterinaria.My.Resources.Resources.iamgen
        Me.btnbuscar.Location = New System.Drawing.Point(288, 46)
        Me.btnbuscar.Name = "btnbuscar"
        Me.btnbuscar.Size = New System.Drawing.Size(91, 26)
        Me.btnbuscar.TabIndex = 36
        Me.btnbuscar.Text = "Buscar"
        Me.btnbuscar.UseVisualStyleBackColor = True
        '
        'ofdabrir
        '
        Me.ofdabrir.FileName = "OpenFileDialog1"
        '
        'lblbuscar
        '
        Me.lblbuscar.AutoSize = True
        Me.lblbuscar.Location = New System.Drawing.Point(35, 51)
        Me.lblbuscar.Name = "lblbuscar"
        Me.lblbuscar.Size = New System.Drawing.Size(51, 17)
        Me.lblbuscar.TabIndex = 38
        Me.lblbuscar.Text = "buscar"
        '
        'txtbuscar
        '
        Me.txtbuscar.Location = New System.Drawing.Point(101, 48)
        Me.txtbuscar.Name = "txtbuscar"
        Me.txtbuscar.Size = New System.Drawing.Size(150, 22)
        Me.txtbuscar.TabIndex = 37
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Image = Global.Veterinaria.My.Resources.Resources.imagen21
        Me.PictureBox1.Location = New System.Drawing.Point(0, 0)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(800, 509)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 39
        Me.PictureBox1.TabStop = False
        '
        'laldato
        '
        Me.laldato.AutoSize = True
        Me.laldato.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.laldato.Location = New System.Drawing.Point(527, 86)
        Me.laldato.Name = "laldato"
        Me.laldato.Size = New System.Drawing.Size(242, 50)
        Me.laldato.TabIndex = 40
        Me.laldato.Text = "Digite el numero de cedula" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & " para encontrar sus datos " & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10)
        '
        'frmRecuperarMascota
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.ClientSize = New System.Drawing.Size(800, 509)
        Me.ControlBox = False
        Me.Controls.Add(Me.laldato)
        Me.Controls.Add(Me.lblbuscar)
        Me.Controls.Add(Me.txtbuscar)
        Me.Controls.Add(Me.btnbuscar)
        Me.Controls.Add(Me.txtfecha)
        Me.Controls.Add(Me.txtsalud)
        Me.Controls.Add(Me.lblsalud)
        Me.Controls.Add(Me.lblID)
        Me.Controls.Add(Me.lbltipo)
        Me.Controls.Add(Me.txtId)
        Me.Controls.Add(Me.lblfecha)
        Me.Controls.Add(Me.txtpeso)
        Me.Controls.Add(Me.lblpeso)
        Me.Controls.Add(Me.txtraza)
        Me.Controls.Add(Me.txttipo)
        Me.Controls.Add(Me.lblraza)
        Me.Controls.Add(Me.txtnamepet)
        Me.Controls.Add(Me.lblnamepet)
        Me.Controls.Add(Me.dgvmascotas)
        Me.Controls.Add(Me.mnsMenu)
        Me.Controls.Add(Me.PictureBox1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MainMenuStrip = Me.mnsMenu
        Me.Name = "frmRecuperarMascota"
        Me.Text = "recuparar informacion de mascota"
        CType(Me.dgvmascotas, System.ComponentModel.ISupportInitialize).EndInit()
        Me.mnsMenu.ResumeLayout(False)
        Me.mnsMenu.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents dgvmascotas As DataGridView
    Friend WithEvents txtfecha As TextBox
    Friend WithEvents txtsalud As TextBox
    Friend WithEvents lblsalud As Label
    Friend WithEvents lblID As Label
    Friend WithEvents lbltipo As Label
    Friend WithEvents txtId As TextBox
    Friend WithEvents lblfecha As Label
    Friend WithEvents txtpeso As TextBox
    Friend WithEvents lblpeso As Label
    Friend WithEvents txtraza As TextBox
    Friend WithEvents txttipo As TextBox
    Friend WithEvents lblraza As Label
    Friend WithEvents txtnamepet As TextBox
    Friend WithEvents lblnamepet As Label
    Friend WithEvents mnsMenu As MenuStrip
    Friend WithEvents VolverAlMenuPrincipalToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents AbrirToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents btnbuscar As Button
    Friend WithEvents ofdabrir As OpenFileDialog
    Friend WithEvents lblbuscar As Label
    Friend WithEvents txtbuscar As TextBox
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents laldato As Label
End Class
