object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Manejando hilos'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbNumHilos: TLabel
    Left = 592
    Top = 29
    Width = 113
    Height = 13
    Caption = 'N'#250'mero de hilos:'
  end
  object RejillaHilos: TStringGrid
    Left = 24
    Top = 72
    Width = 753
    Height = 497
    ColCount = 3
    DefaultColWidth = 200
    FixedCols = 0
    TabOrder = 0
  end
  object btLanzarHilo: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Lanzar hilo'
    TabOrder = 1
    OnClick = btLanzarHiloClick
  end
  object TimerGrafico: TTimer
    Interval = 100
    OnTimer = TimerGraficoTimer
    Left = 744
    Top = 16
  end
end
