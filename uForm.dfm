object formPrincipal: TformPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Criptografia '
  ClientHeight = 187
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblBreve: TLabel
    Left = 473
    Top = 156
    Width = 177
    Height = 22
    Caption = 'Mais implementadas em breve*'
  end
  object edtEntrada: TLabeledEdit
    Left = 8
    Top = 32
    Width = 657
    Height = 23
    EditLabel.Width = 43
    EditLabel.Height = 15
    EditLabel.Caption = 'Entrada:'
    MaxLength = 100
    TabOrder = 0
    Text = ''
  end
  object edtSaida: TLabeledEdit
    Left = 10
    Top = 80
    Width = 657
    Height = 23
    EditLabel.Width = 31
    EditLabel.Height = 15
    EditLabel.Caption = 'Saida:'
    MaxLength = 100
    ReadOnly = True
    TabOrder = 1
    Text = ''
  end
  object edtChave: TLabeledEdit
    Left = 8
    Top = 126
    Width = 105
    Height = 23
    EditLabel.Width = 81
    EditLabel.Height = 15
    EditLabel.Caption = 'Chave (Inteiro):'
    NumbersOnly = True
    TabOrder = 2
    Text = ''
  end
  object btnCriptografar: TButton
    Left = 119
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Criptografar'
    TabOrder = 3
    OnClick = btnCriptografarClick
  end
  object btnDescriptografar: TButton
    Left = 215
    Top = 125
    Width = 90
    Height = 25
    Caption = 'Descriptografar'
    TabOrder = 4
    OnClick = btnDescriptografarClick
  end
  object rgpMetodo: TRadioGroup
    Left = 336
    Top = 109
    Width = 331
    Height = 73
    Caption = 'M'#233'todo de Criptografia'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'C'#233'sar'
      'Permuta'
      'Vigenere')
    TabOrder = 5
    OnClick = rgpMetodoClick
  end
end
