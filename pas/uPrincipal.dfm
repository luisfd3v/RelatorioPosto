object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas - Vendedor'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object gbColaborador: TGroupBox
    Left = 8
    Top = 8
    Width = 784
    Height = 113
    TabOrder = 0
    object lblColaborador: TLabel
      Left = 16
      Top = 14
      Width = 153
      Height = 17
      Caption = 'Colaborador Selecionado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbl: TLabel
      Left = 16
      Top = 47
      Width = 64
      Height = 17
      Caption = 'Data In'#237'cio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 76
      Width = 54
      Height = 17
      Caption = 'Data Fim:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object dtpDataInicio: TDateTimePicker
      Left = 184
      Top = 43
      Width = 370
      Height = 23
      Date = 45925.000000000000000000
      Time = 0.705005497686215700
      TabOrder = 0
    end
    object dtpDataFim: TDateTimePicker
      Left = 184
      Top = 72
      Width = 370
      Height = 23
      Date = 45925.000000000000000000
      Time = 0.705005497686215700
      TabOrder = 1
    end
    object btnTrocarColaborador: TButton
      Left = 650
      Top = 12
      Width = 123
      Height = 25
      Caption = 'Trocar Colaborador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      StyleElements = [seFont, seBorder]
    end
    object btnFiltrar: TButton
      Left = 560
      Top = 42
      Width = 75
      Height = 54
      Caption = 'Filtrar'
      TabOrder = 3
      StyleElements = [seFont, seBorder]
    end
  end
end
