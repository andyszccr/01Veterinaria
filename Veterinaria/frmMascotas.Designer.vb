<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMascotas
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmMascotas))
        Me.msnMenu = New System.Windows.Forms.MenuStrip()
        Me.VolverAlMenuPrincipalToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.txtId = New System.Windows.Forms.TextBox()
        Me.lblID = New System.Windows.Forms.Label()
        Me.lblnamepet = New System.Windows.Forms.Label()
        Me.lblraza = New System.Windows.Forms.Label()
        Me.lblpeso = New System.Windows.Forms.Label()
        Me.lblfecha = New System.Windows.Forms.Label()
        Me.txtpeso = New System.Windows.Forms.TextBox()
        Me.txtraza = New System.Windows.Forms.TextBox()
        Me.txtnamepet = New System.Windows.Forms.TextBox()
        Me.btnregistrar = New System.Windows.Forms.Button()
        Me.dgvmascota = New System.Windows.Forms.DataGridView()
        Me.clid = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.clnamepet = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.cltype = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.clraza = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.clpeso = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.clfecha = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.clsalud = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.txttipo = New System.Windows.Forms.TextBox()
        Me.lbltipo = New System.Windows.Forms.Label()
        Me.gbdatos = New System.Windows.Forms.GroupBox()
        Me.txtfecha = New System.Windows.Forms.TextBox()
        Me.txtsalud = New System.Windows.Forms.TextBox()
        Me.lblsalud = New System.Windows.Forms.Label()
        Me.msnMenu.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.dgvmascota, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gbdatos.SuspendLayout()
        Me.SuspendLayout()
        '
        'msnMenu
        '
        Me.msnMenu.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.msnMenu.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.msnMenu.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VolverAlMenuPrincipalToolStripMenuItem})
        Me.msnMenu.Location = New System.Drawing.Point(0, 0)
        Me.msnMenu.Name = "msnMenu"
        Me.msnMenu.Size = New System.Drawing.Size(1031, 28)
        Me.msnMenu.TabIndex = 0
        Me.msnMenu.Text = "MenuStrip1"
        '
        'VolverAlMenuPrincipalToolStripMenuItem
        '
        Me.VolverAlMenuPrincipalToolStripMenuItem.Name = "VolverAlMenuPrincipalToolStripMenuItem"
        Me.VolverAlMenuPrincipalToolStripMenuItem.Size = New System.Drawing.Size(183, 24)
        Me.VolverAlMenuPrincipalToolStripMenuItem.Text = "Volver al menu principal"
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Image = Global.Veterinaria.My.Resources.Resources.imagen21
        Me.PictureBox1.Location = New System.Drawing.Point(0, 28)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(1031, 563)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 1
        Me.PictureBox1.TabStop = False
        '
        'txtId
        '
        Me.txtId.Location = New System.Drawing.Point(112, 26)
        Me.txtId.Name = "txtId"
        Me.txtId.Size = New System.Drawing.Size(246, 22)
        Me.txtId.TabIndex = 2
        '
        'lblID
        '
        Me.lblID.AutoSize = True
        Me.lblID.Location = New System.Drawing.Point(16, 29)
        Me.lblID.Name = "lblID"
        Me.lblID.Size = New System.Drawing.Size(90, 17)
        Me.lblID.TabIndex = 3
        Me.lblID.Text = "identificacion"
        '
        'lblnamepet
        '
        Me.lblnamepet.AutoSize = True
        Me.lblnamepet.Location = New System.Drawing.Point(16, 69)
        Me.lblnamepet.Name = "lblnamepet"
        Me.lblnamepet.Size = New System.Drawing.Size(148, 17)
        Me.lblnamepet.TabIndex = 4
        Me.lblnamepet.Text = "nombre de la mascota"
        '
        'lblraza
        '
        Me.lblraza.AutoSize = True
        Me.lblraza.Location = New System.Drawing.Point(16, 127)
        Me.lblraza.Name = "lblraza"
        Me.lblraza.Size = New System.Drawing.Size(36, 17)
        Me.lblraza.TabIndex = 5
        Me.lblraza.Text = "raza"
        '
        'lblpeso
        '
        Me.lblpeso.AutoSize = True
        Me.lblpeso.Location = New System.Drawing.Point(16, 155)
        Me.lblpeso.Name = "lblpeso"
        Me.lblpeso.Size = New System.Drawing.Size(39, 17)
        Me.lblpeso.TabIndex = 6
        Me.lblpeso.Text = "peso"
        '
        'lblfecha
        '
        Me.lblfecha.AutoSize = True
        Me.lblfecha.Location = New System.Drawing.Point(16, 191)
        Me.lblfecha.Name = "lblfecha"
        Me.lblfecha.Size = New System.Drawing.Size(135, 17)
        Me.lblfecha.TabIndex = 8
        Me.lblfecha.Text = "fecha de nacimiento"
        '
        'txtpeso
        '
        Me.txtpeso.Location = New System.Drawing.Point(61, 150)
        Me.txtpeso.Name = "txtpeso"
        Me.txtpeso.Size = New System.Drawing.Size(297, 22)
        Me.txtpeso.TabIndex = 9
        '
        'txtraza
        '
        Me.txtraza.Location = New System.Drawing.Point(80, 122)
        Me.txtraza.Name = "txtraza"
        Me.txtraza.Size = New System.Drawing.Size(278, 22)
        Me.txtraza.TabIndex = 10
        '
        'txtnamepet
        '
        Me.txtnamepet.Location = New System.Drawing.Point(166, 64)
        Me.txtnamepet.Name = "txtnamepet"
        Me.txtnamepet.Size = New System.Drawing.Size(192, 22)
        Me.txtnamepet.TabIndex = 11
        '
        'btnregistrar
        '
        Me.btnregistrar.ForeColor = System.Drawing.SystemColors.ButtonHighlight
        Me.btnregistrar.Image = Global.Veterinaria.My.Resources.Resources.guardar
        Me.btnregistrar.Location = New System.Drawing.Point(231, 252)
        Me.btnregistrar.Name = "btnregistrar"
        Me.btnregistrar.Size = New System.Drawing.Size(127, 29)
        Me.btnregistrar.TabIndex = 14
        Me.btnregistrar.Text = "registrar"
        Me.btnregistrar.UseVisualStyleBackColor = True
        '
        'dgvmascota
        '
        Me.dgvmascota.AllowUserToDeleteRows = False
        Me.dgvmascota.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill
        Me.dgvmascota.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvmascota.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.clid, Me.clnamepet, Me.cltype, Me.clraza, Me.clpeso, Me.clfecha, Me.clsalud})
        Me.dgvmascota.Location = New System.Drawing.Point(22, 429)
        Me.dgvmascota.Name = "dgvmascota"
        Me.dgvmascota.ReadOnly = True
        Me.dgvmascota.RowHeadersWidth = 51
        Me.dgvmascota.RowTemplate.Height = 24
        Me.dgvmascota.Size = New System.Drawing.Size(931, 150)
        Me.dgvmascota.TabIndex = 15
        '
        'clid
        '
        Me.clid.HeaderText = "identidad"
        Me.clid.MinimumWidth = 6
        Me.clid.Name = "clid"
        Me.clid.ReadOnly = True
        '
        'clnamepet
        '
        Me.clnamepet.HeaderText = "nombre de la mascota"
        Me.clnamepet.MinimumWidth = 6
        Me.clnamepet.Name = "clnamepet"
        Me.clnamepet.ReadOnly = True
        '
        'cltype
        '
        Me.cltype.HeaderText = "tipo de mascota"
        Me.cltype.MinimumWidth = 6
        Me.cltype.Name = "cltype"
        Me.cltype.ReadOnly = True
        '
        'clraza
        '
        Me.clraza.HeaderText = "raza"
        Me.clraza.MinimumWidth = 6
        Me.clraza.Name = "clraza"
        Me.clraza.ReadOnly = True
        '
        'clpeso
        '
        Me.clpeso.HeaderText = "peso"
        Me.clpeso.MinimumWidth = 6
        Me.clpeso.Name = "clpeso"
        Me.clpeso.ReadOnly = True
        '
        'clfecha
        '
        Me.clfecha.HeaderText = "fecha de nacimiento"
        Me.clfecha.MinimumWidth = 6
        Me.clfecha.Name = "clfecha"
        Me.clfecha.ReadOnly = True
        '
        'clsalud
        '
        Me.clsalud.HeaderText = "salud de mascota"
        Me.clsalud.MinimumWidth = 6
        Me.clsalud.Name = "clsalud"
        Me.clsalud.ReadOnly = True
        '
        'txttipo
        '
        Me.txttipo.Location = New System.Drawing.Point(124, 94)
        Me.txttipo.Name = "txttipo"
        Me.txttipo.Size = New System.Drawing.Size(234, 22)
        Me.txttipo.TabIndex = 16
        '
        'lbltipo
        '
        Me.lbltipo.AutoSize = True
        Me.lbltipo.Location = New System.Drawing.Point(16, 99)
        Me.lbltipo.Name = "lbltipo"
        Me.lbltipo.Size = New System.Drawing.Size(108, 17)
        Me.lbltipo.TabIndex = 17
        Me.lbltipo.Text = "tipo de mascota"
        '
        'gbdatos
        '
        Me.gbdatos.Controls.Add(Me.txtfecha)
        Me.gbdatos.Controls.Add(Me.txtsalud)
        Me.gbdatos.Controls.Add(Me.lblsalud)
        Me.gbdatos.Controls.Add(Me.lblID)
        Me.gbdatos.Controls.Add(Me.lbltipo)
        Me.gbdatos.Controls.Add(Me.txtId)
        Me.gbdatos.Controls.Add(Me.lblfecha)
        Me.gbdatos.Controls.Add(Me.txtpeso)
        Me.gbdatos.Controls.Add(Me.lblpeso)
        Me.gbdatos.Controls.Add(Me.txtraza)
        Me.gbdatos.Controls.Add(Me.txttipo)
        Me.gbdatos.Controls.Add(Me.btnregistrar)
        Me.gbdatos.Controls.Add(Me.lblraza)
        Me.gbdatos.Controls.Add(Me.txtnamepet)
        Me.gbdatos.Controls.Add(Me.lblnamepet)
        Me.gbdatos.Location = New System.Drawing.Point(12, 42)
        Me.gbdatos.Name = "gbdatos"
        Me.gbdatos.Size = New System.Drawing.Size(387, 294)
        Me.gbdatos.TabIndex = 18
        Me.gbdatos.TabStop = False
        Me.gbdatos.Text = "datos de mascota"
        '
        'txtfecha
        '
        Me.txtfecha.Location = New System.Drawing.Point(157, 186)
        Me.txtfecha.Name = "txtfecha"
        Me.txtfecha.Size = New System.Drawing.Size(201, 22)
        Me.txtfecha.TabIndex = 20
        '
        'txtsalud
        '
        Me.txtsalud.Location = New System.Drawing.Point(61, 224)
        Me.txtsalud.Name = "txtsalud"
        Me.txtsalud.Size = New System.Drawing.Size(297, 22)
        Me.txtsalud.TabIndex = 19
        '
        'lblsalud
        '
        Me.lblsalud.AutoSize = True
        Me.lblsalud.Location = New System.Drawing.Point(16, 224)
        Me.lblsalud.Name = "lblsalud"
        Me.lblsalud.Size = New System.Drawing.Size(42, 17)
        Me.lblsalud.TabIndex = 18
        Me.lblsalud.Text = "salud"
        '
        'frmMascotas
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.ClientSize = New System.Drawing.Size(1031, 591)
        Me.ControlBox = False
        Me.Controls.Add(Me.gbdatos)
        Me.Controls.Add(Me.dgvmascota)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.msnMenu)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MainMenuStrip = Me.msnMenu
        Me.Name = "frmMascotas"
        Me.Text = "Macotas"
        Me.msnMenu.ResumeLayout(False)
        Me.msnMenu.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.dgvmascota, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gbdatos.ResumeLayout(False)
        Me.gbdatos.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents msnMenu As MenuStrip
    Friend WithEvents VolverAlMenuPrincipalToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents txtId As TextBox
    Friend WithEvents lblID As Label
    Friend WithEvents lblnamepet As Label
    Friend WithEvents lblraza As Label
    Friend WithEvents lblpeso As Label
    Friend WithEvents lblfecha As Label
    Friend WithEvents txtpeso As TextBox
    Friend WithEvents txtraza As TextBox
    Friend WithEvents txtnamepet As TextBox
    Friend WithEvents btnregistrar As Button
    Friend WithEvents dgvmascota As DataGridView
    Friend WithEvents txttipo As TextBox
    Friend WithEvents lbltipo As Label
    Friend WithEvents gbdatos As GroupBox
    Friend WithEvents txtsalud As TextBox
    Friend WithEvents lblsalud As Label
    Friend WithEvents txtfecha As TextBox
    Friend WithEvents clid As DataGridViewTextBoxColumn
    Friend WithEvents clnamepet As DataGridViewTextBoxColumn
    Friend WithEvents cltype As DataGridViewTextBoxColumn
    Friend WithEvents clraza As DataGridViewTextBoxColumn
    Friend WithEvents clpeso As DataGridViewTextBoxColumn
    Friend WithEvents clfecha As DataGridViewTextBoxColumn
    Friend WithEvents clsalud As DataGridViewTextBoxColumn
End Class
