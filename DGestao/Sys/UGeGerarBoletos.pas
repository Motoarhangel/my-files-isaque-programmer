unit UGeGerarBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, StdCtrls, Buttons, ImgList, Grids,
  DBGrids, DB, IBCustomDataSet, IBQuery, Mask, DBCtrls, DBClient, Provider,
  ComObj, IBUpdateSQL, IBTable, IBSQL, UGrPadrao;

type
  TfrmGeGerarBoleto = class(TfrmGrPadrao)
    pnlGuias: TPanel;
    tlbBotoes: TToolBar;
    pgcGuias: TPageControl;
    tbsClientes: TTabSheet;
    tbsTitulos: TTabSheet;
    Bevel1: TBevel;
    ImgList: TImageList;
    Bevel2: TBevel;
    dbgDados: TDBGrid;
    IbQryClientes: TIBQuery;
    IbQryClientesCNPJ: TIBStringField;
    IbQryClientesINSCEST: TIBStringField;
    IbQryClientesNOME: TIBStringField;
    IbQryClientesFONE: TIBStringField;
    IbQryClientesBAIRRO: TIBStringField;
    IbQryClientesCIDADE: TIBStringField;
    IbQryClientesUF: TIBStringField;
    IbQryClientesCEP: TIBStringField;
    IbQryClientesEMAIL: TIBStringField;
    DtsClientes: TDataSource;
    Bevel3: TBevel;
    pnlFiltros: TPanel;
    grpBxFiltro: TGroupBox;
    Label1: TLabel;
    btnFiltrar: TSpeedButton;
    edtFiltrar: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbNome: TDBEdit;
    Label3: TLabel;
    dbCPF: TDBEdit;
    dbEndereco: TDBEdit;
    Label4: TLabel;
    dbBairro: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbFone: TDBEdit;
    Label7: TLabel;
    dbEmail: TDBEdit;
    Label8: TLabel;
    dbCidade: TDBEdit;
    Label9: TLabel;
    dbUF: TDBEdit;
    Label10: TLabel;
    dbCEP: TDBEdit;
    Bevel4: TBevel;
    Bevel5: TBevel;
    btnFechar: TBitBtn;
    Shape1: TShape;
    Label11: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    dbgTitulos: TDBGrid;
    Bevel8: TBevel;
    IbQryTitulos: TIBQuery;
    DtsTitulos: TDataSource;
    pnlBoleto: TPanel;
    Bevel9: TBevel;
    DspTitulos: TDataSetProvider;
    CdsTitulos: TClientDataSet;
    CdsTitulosPARCELA: TSmallintField;
    CdsTitulosCODBANCO: TIntegerField;
    CdsTitulosNOSSONUMERO: TStringField;
    CdsTitulosCNPJ: TStringField;
    CdsTitulosTIPPAG: TStringField;
    CdsTitulosDTEMISS: TDateField;
    CdsTitulosDTVENC: TDateField;
    CdsTitulosVALORREC: TBCDField;
    CdsTitulosPERCENTJUROS: TBCDField;
    CdsTitulosPERCENTMULTA: TBCDField;
    CdsTitulosPERCENTDESCONTO: TBCDField;
    CdsTitulosVALORRECTOT: TBCDField;
    CdsTitulosVALORSALDO: TBCDField;
    btnGerarBoleto: TBitBtn;
    lbltDemonstrativo: TLabel;
    lbltMsgInstrucoes: TLabel;
    lblbBanco: TLabel;
    cmbBanco: TComboBox;
    IbUpdBancos: TIBUpdateSQL;
    IbTblBancos: TIBTable;
    IbTblBancosBCO_COD: TSmallintField;
    IbTblBancosBCO_CARTEIRA: TIBStringField;
    IbTblBancosBCO_NOME: TIBStringField;
    IbTblBancosBCO_AGENCIA: TIBStringField;
    IbTblBancosBCO_CC: TIBStringField;
    IbTblBancosBCO_CHAVE: TIBStringField;
    CdsTitulosDATAPROCESSOBOLETO: TDateField;
    edtMsgInstrucoes: TEdit;
    edtDemonstrativo: TEdit;
    UpdateLanc: TIBSQL;
    IbUpdTitulos: TIBUpdateSQL;
    IbTblBancosBCO_NOSSO_NUM_INICIO: TIBStringField;
    IbTblBancosBCO_NOSSO_NUM_FINAL: TIBStringField;
    IbTblBancosBCO_NOSSO_NUM_PROXIMO: TIBStringField;
    CdsTitulosGERAR: TStringField;
    IbTblBancosBCO_CONFG_1: TIBStringField;
    IbTblBancosBCO_CONFG_2: TIBStringField;
    IbTblBancosBCO_SEQUENCIAL_REM: TIntegerField;
    IbTblBancosBCO_DIRETORIO_REMESSA: TIBStringField;
    IbTblBancosBCO_DIRETORIO_RETORNO: TIBStringField;
    CdsTitulosANOLANC: TSmallintField;
    CdsTitulosNUMLANC: TIntegerField;
    CdsTitulosANOVENDA: TSmallintField;
    CdsTitulosNUMVENDA: TIntegerField;
    IbQryClientesENDER: TIBStringField;
    procedure edtFiltrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure DtsClientesDataChange(Sender: TObject; Field: TField);
    procedure pgcGuiasChange(Sender: TObject);
    procedure dbgTitulosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarBoletoClick(Sender: TObject);
    procedure cmbBancoChange(Sender: TObject);
    procedure DspTitulosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgTitulosDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CobreBemX : Variant;
    procedure CarregarBancos;
    procedure GravarBoletosGerados;
    procedure UpdateTitulo( iAno : Smallint; iLancamento : Int64; iBanco : Integer; sNossoNumero : String; Data : TDateTime );

    function CarregarTitulos( cnpj : String ) : Boolean;
    function DefinirCedente( Banco, Carteira : Integer; var Objeto : Variant ) : Boolean;
    function InserirBoleto( var Objeto : Variant ) : Boolean;
  public
    { Public declarations }
  end;

var
  frmGeGerarBoleto : TfrmGeGerarBoleto;

const
  feeSMTPBoletoHTML              = $00000000;
  feeSMTPMensagemBoletoHTMLAnexo = $00000001;
  feeSMTPMensagemBoletoPDFAnexo  = $00000002;
  feeSMTPMensagemLinhaDigitavelURLCobreBemECommerce = $00000003;
  feeSMTPMensagemURLCobreBemECommerce = $00000004;
  feeSMTPMensagemLinhaDigitavel       = $00000005;
  feeOutlookBoletoHTML                = $00000006;
  feeOutlookMensagemBoletoHTMLAnexo   = $00000007;
  feeOutlookMensagemBoletoPDFAnexo    = $00000008;
  feeOutlookMensagemLinhaDigitavelURLCobreBemECommerce = $00000009;
  feeOutlookMensagemURLCobreBemECommerce = $0000000A;
  feeOutlookMensagemLinhaDigitavel       = $0000000B;
  scpExecutar = $00000000;
  scpOK       = $00000001;
  scpInvalido = $00000002;
  scpErro     = $00000003;

  procedure GerarBoleto(const AOwer : TComponent); overload;
  procedure GerarBoleto(const AOwer : TComponent; const NomeCliente, CNPJ : String); overload;
//  function ReImprimirBoleto(Cnjp : String; Lancamento : Int64; Banco : Integer) : Boolean;

implementation

uses UDMBusiness, StrUtils;

{$R *.dfm}

procedure GerarBoleto(const AOwer : TComponent);
var
  f : TfrmGeGerarBoleto;
begin
  try
    f := TfrmGeGerarBoleto.Create(AOwer);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure GerarBoleto(const AOwer : TComponent; const NomeCliente, CNPJ : String); overload;
var
  f : TfrmGeGerarBoleto;
begin
  try
    f := TfrmGeGerarBoleto.Create(AOwer);

    f.IbQryClientes.Close;
    f.IbQryClientes.ParamByName('nome').AsString := NomeCliente;
    f.IbQryClientes.Open;

    if ( f.IbQryClientes.Locate('CNPJ', CNPJ, []) ) then
      f.dbgDadosDblClick( f.dbgDados );

    f.ShowModal;
  finally
    f.Free;
  end;
end;

//function ReImprimirBoleto(Cnjp : String; Lancamento : Int64; Banco : Integer) : Boolean;
//var
//  f : TfrmGrGerarBoleto;
//begin
//  try
//
//    f := TfrmGrGerarBoleto.Create(Application);
//
//    with f do
//    begin
//      IbTblBancos.Open;
//      if ( IbTblBancos.Locate('BCO_COD', Banco, []) ) then
//      begin
//
//      end;
//    end;
//
//  finally
//    f.Free;
//  end;
//end;

procedure TfrmGeGerarBoleto.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnFiltrar.Click;
end;

procedure TfrmGeGerarBoleto.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 TDbGrid(Sender).Canvas.font.Color := clBlack;

 if gdSelected in State then
 with (Sender as TDBGrid).Canvas do
 begin
   Brush.Color :=  clMoneyGreen;
   FillRect(Rect);
   Font.Style  := [fsbold]
 end;

 TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGeGerarBoleto.btnFiltrarClick(Sender: TObject);
begin
  if ( Trim(edtFiltrar.Text) = EmptyStr ) then
    Application.MessageBox('Digite uma palavra-chave', 'Alerta!', MB_ICONWARNING)
  else
  with IbQryClientes do
  begin
    Close;
    ParamByName('nome').AsString := StringReplace( Trim(edtFiltrar.Text), ' ', '%', [rfReplaceAll] );
    Open;
    if ( not IsEmpty ) then
      dbgDados.SetFocus
    else
      edtFiltrar.SelectAll;
  end;
end;

procedure TfrmGeGerarBoleto.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    pgcGuias.SelectNextPage(False);
  end
  else
  if ( Key in [' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TfrmGeGerarBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : if ( pgcGuias.ActivePageIndex <> 0 ) then
                begin
                  pgcGuias.ActivePageIndex := 0;
                  dbgDados.SetFocus;

                  pgcGuiasChange(Sender);
                end
                else
                if ( pgcGuias.ActivePageIndex = 0 ) then
                  btnFechar.Click;

  end;
  inherited;
end;

procedure TfrmGeGerarBoleto.FormCreate(Sender: TObject);
begin
  inherited;
  pgcGuias.ActivePageIndex := 0;
  CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
end;

procedure TfrmGeGerarBoleto.FormShow(Sender: TObject);
begin
  CarregarBancos;
  if ( pgcGuias.ActivePageIndex = 0 ) then
    edtFiltrar.SetFocus
  else
  if ( pgcGuias.ActivePageIndex = 1 ) then
    dbgTitulos.SetFocus;
end;

procedure TfrmGeGerarBoleto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

function TfrmGeGerarBoleto.CarregarTitulos(cnpj: String) : Boolean;
begin
  with CdsTitulos, Params do
  begin
    Filtered := False;

    Close;
    ParamByName('cnpj').AsString := cnpj;
    Open;

    Result := not IsEmpty;
  end;
end;

procedure TfrmGeGerarBoleto.DtsClientesDataChange(Sender: TObject;
  Field: TField);
begin
  CarregarTitulos( IbQryClientesCNPJ.AsString );
end;

procedure TfrmGeGerarBoleto.pgcGuiasChange(Sender: TObject);
begin
  try
    btnGerarBoleto.Enabled := ( pgcGuias.ActivePage = tbsTitulos ) and ( CdsTitulos.RecordCount > 0 );
  except
  end;
end;

procedure TfrmGeGerarBoleto.dbgTitulosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgTitulosDblClick(Sender);
end;

function TfrmGeGerarBoleto.DefinirCedente(Banco, Carteira : Integer; var Objeto: Variant): Boolean;
var
  sAppPath     ,
  sFileLisence : String;
begin
  try
    sAppPath     := ExtractFilePath(ParamStr(0));
    sFileLisence := sAppPath + BOLETO_LICENCAS + FormatFloat('000', Banco)  + '-' + FormatFloat('00', Carteira) + '.conf';

    if ( not FileExists(sFileLisence) ) then
      raise Exception.Create('Arquivo de licen�a ' + QuotedStr(sFileLisence) + ' n�o encontrado');

    // Par�metros obrigat�rios da conta corrente do Cedente

    Objeto.ArquivoLicenca         := sFileLisence; 
    Objeto.CodigoAgencia          := IbTblBancosBCO_AGENCIA.AsString;
    Objeto.NumeroContaCorrente    := IbTblBancosBCO_CC.AsString;
    Objeto.CodigoCedente          := IbTblBancosBCO_CHAVE.AsString;
    Objeto.InicioNossoNumero      := IbTblBancosBCO_NOSSO_NUM_INICIO.AsString;
    Objeto.FimNossoNumero         := IbTblBancosBCO_NOSSO_NUM_FINAL.AsString;
    Objeto.OutroDadoConfiguracao1 := Trim(IbTblBancosBCO_CONFG_1.AsString);
    Objeto.OutroDadoConfiguracao2 := Trim(IbTblBancosBCO_CONFG_2.AsString);

    if ( Trim(IbTblBancosBCO_NOSSO_NUM_PROXIMO.AsString) = EmptyStr ) then
      Objeto.ProximoNossoNumero  := '1'
    else
      Objeto.ProximoNossoNumero  := IbTblBancosBCO_NOSSO_NUM_PROXIMO.AsString;


    Objeto.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo            := sAppPath + BOLETO_ARQUIVO_LOGOTIPO;
    Objeto.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := sAppPath + BOLETO_IMAGENS;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar processo de gera��o de boletos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeGerarBoleto.btnGerarBoletoClick(Sender: TObject);
var
  IBanco    ,
  ICarteira : Integer;
begin
  if ( Application.MessageBox('Confirma a gera��o de boletos?','Gerar Boleto', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> ID_YES ) then
    Exit;

  if ( cmbBanco.ItemIndex < 0 ) then
  begin
    Application.MessageBox(PChar('Favor selecionar a entidade financeira para gera��o dos boletos.'), 'Alerta', MB_ICONWARNING);
    Exit;
  end;

  IBanco    := StrToIntDef( Copy(cmbBanco.Text, 1, 3), 0 );
  ICarteira := IbTblBancosBCO_CARTEIRA.AsInteger;

  if DefinirCedente( IBanco, ICarteira, CobreBemX ) then
  begin

    CdsTitulos.Filter   := 'GERAR = ' + QuotedStr('X');
    CdsTitulos.Filtered := True;

    if ( CdsTitulos.IsEmpty ) then
    begin
      CdsTitulos.Filtered := False;
      Application.MessageBox(PChar('N�o existem t�tulos selecionados para gera��o de boletos.'), 'Alerta', MB_ICONWARNING);
      dbgTitulos.SetFocus;
    end
    else
    begin

      if ( InserirBoleto( CobreBemX ) ) then
      begin
        CobreBemX.ImprimeBoletos;
        GravarBoletosGerados;
      end;

    end;

    CdsTitulos.Filtered := False;

    CdsTitulos.Close;
    CdsTitulos.Open;

  end;
end;

procedure TfrmGeGerarBoleto.CarregarBancos;
begin
  with IbTblBancos, cmbBanco do
  begin
    Close;
    Open;
    if ( not IsEmpty ) then
      Clear;

    while not Eof do
    begin
      Items.Add( FormatFloat('000', IbTblBancosBCO_COD.AsInteger) + ' - ' + IbTblBancosBCO_NOME.AsString );

      Next;
    end;

    First;

    cmbBanco.Tag       := IbTblBancosBCO_COD.AsInteger;
    cmbBanco.ItemIndex := 0;
  end;
end;

procedure TfrmGeGerarBoleto.cmbBancoChange(Sender: TObject);
begin
  if ( not IbTblBancos.Active ) then
    IbTblBancos.Open;

  if ( IbTblBancos.Locate('BCO_COD', StrToIntDef(Copy(cmbBanco.Text, 1, 3), 0), []) ) then
    cmbBanco.Tag := IbTblBancosBCO_COD.AsInteger;
end;

function TfrmGeGerarBoleto.InserirBoleto(var Objeto: Variant): Boolean;
var
  sAppPath   ,
  sDocumento : String;
  Boleto   ,
  EmailSacado : Variant;
begin
  try
    sAppPath := ExtractFilePath(ParamStr(0));

    Objeto.DocumentosCobranca.Clear;

    CdsTitulos.First;

    while not CdsTitulos.Eof do
    begin
      Boleto     := Objeto.DocumentosCobranca.Add;
      sDocumento := Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);

      Boleto.NumeroDocumento := sDocumento;
      Boleto.NomeSacado      := dbNome.Field.AsString;

      if Length(dbCPF.Field.AsString) > 11 then
        Boleto.CNPJSacado := dbCPF.Field.AsString
      else
        Boleto.CPFSacado  := dbCPF.Field.AsString;

      Boleto.EnderecoSacado := dbEndereco.Field.AsString;
      Boleto.BairroSacado   := dbBairro.Field.AsString;
      Boleto.CidadeSacado   := dbCidade.Field.AsString;
      Boleto.EstadoSacado   := dbUF.Field.AsString;
      Boleto.CepSacado      := dbCEP.Field.AsString;
      Boleto.DataDocumento  := FormatDateTime('dd/mm/yyyy', Date);

      if not CdsTitulosDTVENC.IsNull then
        Boleto.DataVencimento  := FormatDateTime('dd/mm/yyyy', CdsTitulosDTVENC.AsDateTime);

      Boleto.DataProcessamento := FormatDateTime('dd/mm/yyyy', Date);

      Boleto.ValorDocumento                := CdsTitulosVALORREC.AsFloat;
      Boleto.PercentualJurosDiaAtraso      := CdsTitulosPERCENTJUROS.AsFloat;
      Boleto.PercentualMultaAtraso         := CdsTitulosPERCENTMULTA.AsFloat;
      Boleto.PercentualDesconto            := CdsTitulosPERCENTDESCONTO.AsFloat;
      Boleto.ValorOutrosAcrescimos         := 0;
      Boleto.PadroesBoleto.Demonstrativo   := Trim(edtDemonstrativo.Text) + '<br><br>Venda No. ' +
                                              FormatFloat('0000', CdsTitulosANOLANC.AsInteger) + '/' +
                                              FormatFloat('##00000000', CdsTitulosNUMVENDA.AsInteger);
      Boleto.PadroesBoleto.InstrucoesCaixa := Trim(edtMsgInstrucoes.Text);

      EmailSacado          := Boleto.EnderecosEmailSacado.Add;
      EmailSacado.Nome     := Boleto.NomeSacado;
      EmailSacado.Endereco := dbEmail.Field.AsString;

      Boleto.ControleProcessamentoDocumento.Imprime      := scpExecutar;
      Boleto.ControleProcessamentoDocumento.EnviaEmail   := scpExecutar;
      Boleto.ControleProcessamentoDocumento.GravaRemessa := scpExecutar;

      if (Trim(CdsTitulosNOSSONUMERO.AsString) <> EmptyStr) then
      begin
        Boleto.NossoNumero := CdsTitulosNOSSONUMERO.AsString;

        if Length(CdsTitulosNOSSONUMERO.AsString) < (Objeto.MascaraNossoNumero + 1) then
          Boleto.CalculaDacNossoNumero := True;
      end;

      if Length(CdsTitulosNOSSONUMERO.AsString) < (Objeto.MascaraNossoNumero + 1) then
        Boleto.CalculaDacNossoNumero := True;

      CdsTitulos.Next;
    end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar gerar boletos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeGerarBoleto.GravarBoletosGerados;
var
  Ano  ,
  Lanc ,
  I    : Integer;
  N : String;
begin
  CdsTitulos.IndexFieldNames := 'ANOLANC;NUMLANC';

  for I := 0 to CobreBemX.DocumentosCobranca.Count - 1 do
  begin
    Ano  := 2000 + StrToInt( Copy(CobreBemX.DocumentosCobranca[I].NumeroDocumento, 1, 2));
    Lanc := StrToInt(Copy(CobreBemX.DocumentosCobranca[I].NumeroDocumento, 3, 8));

    if CdsTitulos.FindKey( [Ano, Lanc] ) then
      if ( CdsTitulosNOSSONUMERO.AsString <> CobreBemX.DocumentosCobranca[i].NossoNumero ) then
      begin
        CdsTitulos.Edit;
        CdsTitulosCODBANCO.Value    := IbTblBancosBCO_COD.Value;
        CdsTitulosNOSSONUMERO.Value := CobreBemX.DocumentosCobranca[i].NossoNumero;
        CdsTitulosDATAPROCESSOBOLETO.Value := GetDateTimeDB;
        CdsTitulos.Post;

        CommitTransaction;

        UpdateTitulo(CdsTitulosANOLANC.Value, CdsTitulosNUMLANC.Value, CdsTitulosCODBANCO.Value, CdsTitulosNOSSONUMERO.Value, GetDateTimeDB);
      end;
  end;

  cmbBancoChange(cmbBanco);

  if ( IbTblBancosBCO_NOSSO_NUM_PROXIMO.AsString <> CobreBemX.ProximoNossoNumero ) then
  begin
    IbTblBancos.Edit;
    IbTblBancosBCO_NOSSO_NUM_PROXIMO.AsString := RightStr( '000000' + CobreBemX.ProximoNossoNumero, 6 );
    IbTblBancos.Post;

    CommitTransaction;
  end;
end;

procedure TfrmGeGerarBoleto.DspTitulosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'TBCONTREC';
end;

procedure TfrmGeGerarBoleto.UpdateTitulo(iAno : Smallint; iLancamento: Int64; iBanco: Integer;
  sNossoNumero: String; Data: TDateTime);
var
  sSQL : TStringList;
begin
  try
    sSQL := TStringList.Create;

    sSQL.BeginUpdate;
    sSQL.Clear;
    sSQL.Add( ' Update TBCONTREC Set ' );
    sSQL.Add( '     nossonumero = ' + QuotedStr(sNossoNumero) );
    sSQL.Add( '   , codbanco    = ' + IntToStr(iBanco) );
    sSQL.Add( '   , dataprocessoboleto = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Data)) );
    sSQL.Add( ' where anolanc = '   + IntToStr(iAno) );
    sSQL.Add( '   and numlanc = '   + IntToStr(iLancamento) );
    sSQL.EndUpdate;

    with UpdateLanc, SQL  do
    begin
      Clear;
      AddStrings( sSQL );
      ExecQuery;

      CommitTransaction;
    end;
  finally
    sSQL.Free;
  end;
end;

procedure TfrmGeGerarBoleto.dbgDadosDblClick(Sender: TObject);
begin
  pgcGuias.SelectNextPage(False);
end;

procedure TfrmGeGerarBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := ( Application.MessageBox('Deseja abandonar processo de gera��o de boletos?','Fechar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

procedure TfrmGeGerarBoleto.dbgTitulosDblClick(Sender: TObject);
begin
  if ( not CdsTitulos.IsEmpty ) then
  begin
    CdsTitulos.Edit;
    if ( CdsTitulosGERAR.AsString = '.' ) then
      CdsTitulosGERAR.Value := 'X'
    else
      CdsTitulosGERAR.Value := '.';
    CdsTitulos.Post;
  end;
end;

procedure TfrmGeGerarBoleto.FormDestroy(Sender: TObject);
begin
  CobreBemX := Unassigned;
end;

end.