object frmVeiculo: TfrmVeiculo
  Left = 0
  Top = 0
  Caption = 'Ve'#237'culo'
  ClientHeight = 260
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbModeloVeiculo: TLabel
    Left = 15
    Top = 18
    Width = 70
    Height = 13
    Caption = 'Modelo Veiculo'
  end
  object lbTipo: TLabel
    Left = 126
    Top = 18
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label1: TLabel
    Left = 380
    Top = 18
    Width = 28
    Height = 13
    Caption = 'Cores'
  end
  object cbxTipo: TComboBox
    Left = 126
    Top = 37
    Width = 145
    Height = 21
    TabOrder = 0
    OnChange = cbxTipoChange
    Items.Strings = (
      'Carro'
      'Moto'
      'Caminh'#227'o')
  end
  object rdCambio: TRadioGroup
    Left = 277
    Top = 37
    Width = 97
    Height = 70
    Caption = 'Cambio'
    Items.Strings = (
      'N'#227'o se aplica'
      'Manual'
      'Autom'#225'tico')
    TabOrder = 1
  end
  object ckbCores: TCheckListBox
    Left = 372
    Top = 37
    Width = 209
    Height = 70
    ItemHeight = 13
    Items.Strings = (
      'Branco'
      'Preto'
      'Prata'
      'Amarelo'
      'Vermelho'
      'Azul'
      'Verde')
    TabOrder = 2
  end
  object btnCriarVeiculo: TButton
    Left = 15
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Criar Veiculo'
    TabOrder = 3
    OnClick = btnCriarVeiculoClick
  end
  object btnAcelerar: TButton
    Left = 15
    Top = 113
    Width = 75
    Height = 25
    Caption = 'Acelerar'
    TabOrder = 4
    OnClick = btnAcelerarClick
  end
  object btnFrear: TBitBtn
    Left = 15
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Frear'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = btnFrearClick
  end
  object btnEstacionar: TButton
    Left = 15
    Top = 177
    Width = 75
    Height = 25
    Caption = 'Estacionar'
    TabOrder = 6
    OnClick = btnEstacionarClick
  end
  object mmVeiculo: TMemo
    Left = 277
    Top = 113
    Width = 304
    Height = 139
    TabOrder = 7
  end
  object edtModeloVeiculo: TEdit
    Left = 15
    Top = 37
    Width = 105
    Height = 21
    TabOrder = 8
  end
end
