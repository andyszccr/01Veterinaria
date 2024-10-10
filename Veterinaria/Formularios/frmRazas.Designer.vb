<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class frmRazas
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmRazas))
        Me.btnCerrar = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txtCodigo = New System.Windows.Forms.TextBox()
        Me.gvRazas = New System.Windows.Forms.DataGridView()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.rbInactivo = New System.Windows.Forms.RadioButton()
        Me.rbActivo = New System.Windows.Forms.RadioButton()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.btnExport = New System.Windows.Forms.Button()
        Me.btnDelete = New System.Windows.Forms.Button()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.BtnAdd = New System.Windows.Forms.Button()
        Me.btnNew = New System.Windows.Forms.Button()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.txtRaza = New System.Windows.Forms.TextBox()
        CType(Me.gvRazas, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnCerrar
        '
        Me.btnCerrar.AutoSize = True
        Me.btnCerrar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnCerrar.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnCerrar.ForeColor = System.Drawing.Color.DimGray
        Me.btnCerrar.Location = New System.Drawing.Point(11, 4)
        Me.btnCerrar.Name = "btnCerrar"
        Me.btnCerrar.Size = New System.Drawing.Size(20, 20)
        Me.btnCerrar.TabIndex = 1
        Me.btnCerrar.Text = "X"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.Color.Gray
        Me.Label1.Location = New System.Drawing.Point(400, 4)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(164, 25)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "Modulo de Razas"
        Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'txtCodigo
        '
        Me.txtCodigo.Enabled = False
        Me.txtCodigo.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtCodigo.Location = New System.Drawing.Point(21, 131)
        Me.txtCodigo.Name = "txtCodigo"
        Me.txtCodigo.Size = New System.Drawing.Size(350, 22)
        Me.txtCodigo.TabIndex = 16
        '
        'gvRazas
        '
        Me.gvRazas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.gvRazas.Location = New System.Drawing.Point(15, 471)
        Me.gvRazas.Name = "gvRazas"
        Me.gvRazas.Size = New System.Drawing.Size(905, 172)
        Me.gvRazas.TabIndex = 17
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.Color.White
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.Color.DimGray
        Me.Label2.Location = New System.Drawing.Point(18, 99)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(109, 17)
        Me.Label2.TabIndex = 18
        Me.Label2.Text = "Codigo de Raza"
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.Color.White
        Me.GroupBox1.Controls.Add(Me.GroupBox3)
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.txtRaza)
        Me.GroupBox1.Controls.Add(Me.txtCodigo)
        Me.GroupBox1.Location = New System.Drawing.Point(15, 42)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(905, 398)
        Me.GroupBox1.TabIndex = 19
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Datos de Raza"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.rbInactivo)
        Me.GroupBox3.Controls.Add(Me.rbActivo)
        Me.GroupBox3.Location = New System.Drawing.Point(469, 109)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(332, 114)
        Me.GroupBox3.TabIndex = 22
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Estado"
        '
        'rbInactivo
        '
        Me.rbInactivo.AutoSize = True
        Me.rbInactivo.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!)
        Me.rbInactivo.Location = New System.Drawing.Point(38, 76)
        Me.rbInactivo.Name = "rbInactivo"
        Me.rbInactivo.Size = New System.Drawing.Size(74, 21)
        Me.rbInactivo.TabIndex = 1
        Me.rbInactivo.TabStop = True
        Me.rbInactivo.Text = "Inactivo"
        Me.rbInactivo.UseVisualStyleBackColor = True
        '
        'rbActivo
        '
        Me.rbActivo.AutoSize = True
        Me.rbActivo.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!)
        Me.rbActivo.Location = New System.Drawing.Point(38, 31)
        Me.rbActivo.Name = "rbActivo"
        Me.rbActivo.Size = New System.Drawing.Size(64, 21)
        Me.rbActivo.TabIndex = 0
        Me.rbActivo.TabStop = True
        Me.rbActivo.Text = "Activo"
        Me.rbActivo.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.btnExport)
        Me.GroupBox2.Controls.Add(Me.btnDelete)
        Me.GroupBox2.Controls.Add(Me.Button1)
        Me.GroupBox2.Controls.Add(Me.BtnAdd)
        Me.GroupBox2.Controls.Add(Me.btnNew)
        Me.GroupBox2.Location = New System.Drawing.Point(21, 272)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(846, 91)
        Me.GroupBox2.TabIndex = 20
        Me.GroupBox2.TabStop = False
        '
        'btnExport
        '
        Me.btnExport.Image = CType(resources.GetObject("btnExport.Image"), System.Drawing.Image)
        Me.btnExport.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnExport.Location = New System.Drawing.Point(671, 33)
        Me.btnExport.Name = "btnExport"
        Me.btnExport.Size = New System.Drawing.Size(158, 43)
        Me.btnExport.TabIndex = 8
        Me.btnExport.Text = "Exportar"
        Me.btnExport.UseVisualStyleBackColor = True
        '
        'btnDelete
        '
        Me.btnDelete.Image = CType(resources.GetObject("btnDelete.Image"), System.Drawing.Image)
        Me.btnDelete.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnDelete.Location = New System.Drawing.Point(507, 33)
        Me.btnDelete.Name = "btnDelete"
        Me.btnDelete.Size = New System.Drawing.Size(158, 43)
        Me.btnDelete.TabIndex = 7
        Me.btnDelete.Text = "Agregar"
        Me.btnDelete.UseVisualStyleBackColor = True
        '
        'Button1
        '
        Me.Button1.Image = CType(resources.GetObject("Button1.Image"), System.Drawing.Image)
        Me.Button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.Button1.Location = New System.Drawing.Point(343, 33)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(158, 43)
        Me.Button1.TabIndex = 6
        Me.Button1.Text = "Agregar"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'BtnAdd
        '
        Me.BtnAdd.Image = CType(resources.GetObject("BtnAdd.Image"), System.Drawing.Image)
        Me.BtnAdd.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BtnAdd.Location = New System.Drawing.Point(179, 33)
        Me.BtnAdd.Name = "BtnAdd"
        Me.BtnAdd.Size = New System.Drawing.Size(158, 43)
        Me.BtnAdd.TabIndex = 5
        Me.BtnAdd.Text = "Agregar"
        Me.BtnAdd.UseVisualStyleBackColor = True
        '
        'btnNew
        '
        Me.btnNew.Image = CType(resources.GetObject("btnNew.Image"), System.Drawing.Image)
        Me.btnNew.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnNew.Location = New System.Drawing.Point(15, 33)
        Me.btnNew.Name = "btnNew"
        Me.btnNew.Size = New System.Drawing.Size(158, 43)
        Me.btnNew.TabIndex = 0
        Me.btnNew.Text = "Nuevo"
        Me.btnNew.UseVisualStyleBackColor = True
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.BackColor = System.Drawing.Color.White
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.ForeColor = System.Drawing.Color.DimGray
        Me.Label4.Location = New System.Drawing.Point(18, 169)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(41, 17)
        Me.Label4.TabIndex = 21
        Me.Label4.Text = "Raza"
        '
        'txtRaza
        '
        Me.txtRaza.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!)
        Me.txtRaza.Location = New System.Drawing.Point(21, 201)
        Me.txtRaza.Name = "txtRaza"
        Me.txtRaza.Size = New System.Drawing.Size(350, 22)
        Me.txtRaza.TabIndex = 20
        '
        'frmRazas
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1103, 729)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.gvRazas)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btnCerrar)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Name = "frmRazas"
        Me.Text = "frmRazas"
        CType(Me.gvRazas, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents btnCerrar As Label
    Friend WithEvents Label1 As Label
    Friend WithEvents txtCodigo As TextBox
    Friend WithEvents gvRazas As DataGridView
    Friend WithEvents Label2 As Label
    Friend WithEvents GroupBox1 As GroupBox
    Friend WithEvents Label4 As Label
    Friend WithEvents txtRaza As TextBox
    Friend WithEvents GroupBox2 As GroupBox
    Friend WithEvents btnNew As Button
    Friend WithEvents BtnAdd As Button
    Friend WithEvents btnDelete As Button
    Friend WithEvents Button1 As Button
    Friend WithEvents btnExport As Button
    Friend WithEvents GroupBox3 As GroupBox
    Friend WithEvents rbInactivo As RadioButton
    Friend WithEvents rbActivo As RadioButton
End Class
