inherited frmGeFormaPagto: TfrmGeFormaPagto
  Left = 553
  Top = 269
  ActiveControl = dbCodigo
  Caption = 'Tabela de Formas de Pagamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcGuias: TPageControl
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited dbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRI'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACRESCIMO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Lkp_ContaCorrente'
            Width = 250
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        inherited grpBxFiltro: TGroupBox
          Left = 392
          Width = 322
          inherited lbltFiltrar: TLabel
            Width = 107
            Caption = 'Forma Pagamento:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 277
          end
          inherited edtFiltrar: TEdit
            Left = 120
            Width = 153
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 105
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 105
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lblAcrescimo: TLabel [2]
          Left = 344
          Top = 24
          Width = 66
          Height = 13
          Caption = '% Acr'#233'scimo:'
        end
        object lblContaCorrente: TLabel [3]
          Left = 448
          Top = 24
          Width = 79
          Height = 13
          Caption = 'Conta Corrente:'
          FocusControl = dbContaCorrente
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 249
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRI'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbAcrescimo: TDBEdit
          Left = 344
          Top = 40
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ACRESCIMO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dbContaCorrente: TDBLookupComboBox
          Left = 448
          Top = 40
          Width = 249
          Height = 21
          DataField = 'CONTA_CORRENTE'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsContaCorrente
          ParentFont = False
          TabOrder = 3
        end
        object dbcDecrementarLimite: TDBCheckBox
          Left = 16
          Top = 72
          Width = 425
          Height = 17
          Caption = 'Forma de Pagamento DECREMENTA Limite de Cr'#233'dito do Cliente'
          DataField = 'DEBITAR_LIMITE_CLIENTE'
          DataSource = DtSrcTabela
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    p.Cod'
      '  , p.Descri'
      '  , p.Acrescimo'
      '  , p.Conta_corrente'
      '  , p.Debitar_limite_cliente'
      'from TBFORMPAGTO p')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_GRUPOPRODUTO_COD'
    object IbDtstTabelaCOD: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'TBFORMPAGTO.COD'
      Required = True
    end
    object IbDtstTabelaDESCRI: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRI'
      Origin = 'TBFORMPAGTO.DESCRI'
      Size = 30
    end
    object IbDtstTabelaACRESCIMO: TFloatField
      DisplayLabel = '% Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      Origin = 'TBFORMPAGTO.ACRESCIMO'
      DisplayFormat = ',0.00'
    end
    object IbDtstTabelaCONTA_CORRENTE: TIntegerField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'CONTA_CORRENTE'
      Origin = 'TBFORMPAGTO.CONTA_CORRENTE'
    end
    object IbDtstTabelaDEBITAR_LIMITE_CLIENTE: TSmallintField
      FieldName = 'DEBITAR_LIMITE_CLIENTE'
      Origin = 'TBFORMPAGTO.DEBITAR_LIMITE_CLIENTE'
      Required = True
    end
    object IbDtstTabelaLkp_ContaCorrente: TStringField
      DisplayLabel = 'Conta Corrente'
      FieldKind = fkLookup
      FieldName = 'Lkp_ContaCorrente'
      LookupDataSet = tblContaCorrente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CONTA_CORRENTE'
      ProviderFlags = []
      Size = 50
      Lookup = True
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  DESCRI,'
      '  ACRESCIMO,'
      '  CONTA_CORRENTE,'
      '  DEBITAR_LIMITE_CLIENTE'
      'from TBFORMPAGTO '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBFORMPAGTO'
      'set'
      '  COD = :COD,'
      '  DESCRI = :DESCRI,'
      '  ACRESCIMO = :ACRESCIMO,'
      '  CONTA_CORRENTE = :CONTA_CORRENTE,'
      '  DEBITAR_LIMITE_CLIENTE = :DEBITAR_LIMITE_CLIENTE'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBFORMPAGTO'
      
        '  (COD, DESCRI, ACRESCIMO, CONTA_CORRENTE, DEBITAR_LIMITE_CLIENT' +
        'E)'
      'values'
      
        '  (:COD, :DESCRI, :ACRESCIMO, :CONTA_CORRENTE, :DEBITAR_LIMITE_C' +
        'LIENTE)')
    DeleteSQL.Strings = (
      'delete from TBFORMPAGTO'
      'where'
      '  COD = :OLD_COD')
  end
  object tblContaCorrente: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TIPO'
        DataType = ftSmallint
      end
      item
        Name = 'CONTA_BANCO_BOLETO'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_TBCONTA_CORRENTE'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'FK_TBCONTA_CORRENTE_BANCO'
        Fields = 'CONTA_BANCO_BOLETO'
      end>
    StoreDefs = True
    TableName = 'TBCONTA_CORRENTE'
    TableTypes = [ttView]
    Left = 656
    Top = 40
  end
  object dtsContaCorrente: TDataSource
    DataSet = tblContaCorrente
    Left = 688
    Top = 40
  end
end
