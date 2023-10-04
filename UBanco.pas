unit UBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaPadrao01, sSkinManager, UCrpeClasses, UCrpe32, DB, ADODB,
  sNomeStored, sChamaLocalizar, sEnter, Buttons, sSpeedButton, ExtCtrls, sPanel,
  sComboBox, sCombo_Box, StdCtrls, Grids, DBGrids, Mask, sMaskEdit, sEdit_Text,
  sCheckBox, sCheck_Box, sScrollBox, sFrameBar, ComCtrls;

type
  TFBanco = class(TFTelaPadrao01)
    edtID_Cliente: TsEdit_Text;
    edtNome: TsEdit_Text;
    sEdit_Text3: TsEdit_Text;
    sEdit_Text4: TsEdit_Text;
    sEdit_Text5: TsEdit_Text;
    sEdit_Text6: TsEdit_Text;
    sEdit_Text7: TsEdit_Text;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    btnGerar_Extrato: TButton;
    DS_Extrato: TDataSource;
    SP_Extrato: TADOStoredProc;
    sEdit_Text1: TsEdit_Text;
    Button1: TButton;
    Label11: TLabel;
    ComboBox1: TComboBox;
    procedure btnGerar_ExtratoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBanco: TFBanco;

implementation

{$R *.dfm}

procedure TFBanco.btnGerar_ExtratoClick(Sender: TObject);
begin
  inherited;
  SP_Extrato.Close;
  SP_Extrato.ProcedureName:= 'STB_INFO_POR_CONTA_CORRENTE_CAIO';
  SP_Extrato.Parameters.Refresh;
  SP_Extrato.Parameters.ParamByName('@NUMERO_CC').Value := sEdit_Text6.Text;
  SP_Extrato.Open;
end;


procedure TFBanco.Button1Click(Sender: TObject);
begin
  inherited;
  Sp_Stored.Close;  // fechar conexao caso tenha algo rodando
  Sp_Stored.ProcedureName := 'STB_MOVIMENTACAO_CAIO';
  Sp_Stored.Parameters.Refresh;
  Sp_Stored.Parameters.ParamByName('@TIPO_TRANSACAO').Value := ComboBox1.Text;
  Sp_Stored.Parameters.ParamByName('@VALOR').Value := sEdit_Text1.Text;
  Sp_Stored.Parameters.ParamByName('@NUMERO_CONTA').Value := sEdit_Text6.Text;
  Sp_Stored.ExecProc;

  btnGerar_ExtratoClick(sender);

end;

end.
