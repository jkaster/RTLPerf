object FormPerfTest: TFormPerfTest
  Left = 0
  Top = 0
  Caption = 'RTL Performance Comparison'
  ClientHeight = 220
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    507
    220)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 49
    Height = 13
    Caption = '# of fields'
  end
  object Label3: TLabel
    Left = 35
    Top = 51
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object ButtonRun: TButton
    Left = 168
    Top = 46
    Width = 75
    Height = 25
    Caption = '&Run'
    TabOrder = 0
    OnClick = ButtonRunClick
  end
  object Iterations: TEdit
    Left = 72
    Top = 48
    Width = 90
    Height = 21
    TabOrder = 1
    Text = '1000'
  end
  object Fields: TEdit
    Left = 72
    Top = 16
    Width = 90
    Height = 21
    TabOrder = 2
    Text = '100'
  end
  object Timings: TRichEdit
    Left = 16
    Top = 77
    Width = 483
    Height = 135
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Timings')
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
    Zoom = 100
  end
  object TestData: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
  end
end
