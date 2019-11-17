unit frmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, ExtCtrls, uVeiculo,
  Generics.Collections;

type
  TfrmVeiculo = class(TForm)

    lbModeloVeiculo: TLabel;
    lbTipo: TLabel;
    Label1: TLabel;
    cbxTipo: TComboBox;
    rdCambio: TRadioGroup;
    ckbCores: TCheckListBox;
    btnCriarVeiculo: TButton;
    btnAcelerar: TButton;
    btnFrear: TBitBtn;
    btnEstacionar: TButton;
    mmVeiculo: TMemo;
    edtModeloVeiculo: TEdit;

    procedure cbxTipoChange(Sender: TObject);
    procedure btnCriarVeiculoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAcelerarClick(Sender: TObject);
    procedure btnFrearClick(Sender: TObject);
    procedure btnEstacionarClick(Sender: TObject);
  private
    veiculo: TVeiculo;
  public
    { Public declarations }
    function cores(): String;
    function criarVeiculo(criarNovoVeiculo: TVeiculo): TObjectList<TVeiculo>;
  end;

var
  frmVeiculo: TfrmVeiculo;
  veiculoCriado: Boolean;
  listaVeiculoCriado: TObjectList<TVeiculo>;

implementation

{$R *.dfm}

procedure TfrmVeiculo.btnAcelerarClick(Sender: TObject);
begin
  if veiculoCriado = True then
  begin
    mmVeiculo.Lines.Add(veiculo.acelerar());
  end
  else
    MessageDlg('Veiculo ainda não criado.', mtInformation, [mbOK], 0);
  edtModeloVeiculo.SetFocus;
  Abort;
end;

procedure TfrmVeiculo.btnCriarVeiculoClick(Sender: TObject);
begin
  // Validação da obrigatóriedade do campo modelo
  if edtModeloVeiculo.Text = '' then
  begin
    MessageDlg('Campo modelo obrigatório', mtInformation, [mbOK], 0);
    edtModeloVeiculo.SetFocus;
    Abort;
  end
  else if cbxTipo.ItemIndex = -1 then
  begin
    MessageDlg('Campo Tipo obrigatório', mtInformation, [mbOK], 0);
    // Manter o foco no campo cbxTipo
    cbxTipo.SetFocus;
    Abort;
  end
  else if rdCambio.ItemIndex = -1 then
  begin
    MessageDlg('Campo Câmbio obrigatório para esse tipo de veículo',
      mtInformation, [mbOK], 0);
    rdCambio.SetFocus;
    Abort;
  end;

  veiculo := TVeiculo.creat(TTipoEnum(cbxTipo.ItemIndex),
    edtModeloVeiculo.Text, rdCambio.Items[rdCambio.ItemIndex], cores());

  veiculoCriado := True;
  mmVeiculo.Lines.Clear;
  mmVeiculo.Lines.Add(veiculo.ToString());
  criarVeiculo(veiculo);

end;

procedure TfrmVeiculo.btnEstacionarClick(Sender: TObject);
begin
  if veiculoCriado = True then
  begin
    mmVeiculo.Lines.Add(veiculo.estacionar());
  end
  else
    MessageDlg('Veiculo ainda não criado', mtInformation, [mbOK], 0);
  edtModeloVeiculo.SetFocus;
  Abort;
end;

procedure TfrmVeiculo.btnFrearClick(Sender: TObject);
begin
  if veiculoCriado = True then
  begin
    mmVeiculo.Lines.Add(veiculo.frear());
  end
  else
    MessageDlg('Veiculo ainda não criado', mtInformation, [mbOK], 0);
  edtModeloVeiculo.SetFocus;
  Abort;
end;

procedure TfrmVeiculo.cbxTipoChange(Sender: TObject);
begin
  if cbxTipo.ItemIndex = 0 then
  begin
    TRadioGroup(rdCambio.Components[0]).Enabled := False;
    TRadioGroup(rdCambio.Components[1]).Enabled := True;
    TRadioGroup(rdCambio.Components[2]).Enabled := True;
  end;
  if cbxTipo.ItemIndex <> 0 then
  begin
    TRadioGroup(rdCambio.Components[0]).Enabled := True;
    TRadioGroup(rdCambio.Components[1]).Enabled := False;
    TRadioGroup(rdCambio.Components[2]).Enabled := False;
    TRadioGroup(rdCambio.Components[0]).SetFocus;
  end;
end;

function TfrmVeiculo.cores(): String;
var
  contador: Integer;
  cores: String;
begin
  cores := '';

  for contador := 0 to ckbCores.Count - 1 do
  begin
    if ckbCores.Checked[contador] then
      cores := cores + ',' + ckbCores.Items[contador];
  end;

  if cores <> '' then
    Delete(cores, 1, 1);

  Result := cores;
end;

function TfrmVeiculo.criarVeiculo(criarNovoVeiculo: TVeiculo)
  : TObjectList<TVeiculo>;
var
  I: Integer;
begin
  listaVeiculoCriado.Add(criarNovoVeiculo);
  Result := listaVeiculoCriado;

end;

procedure TfrmVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(veiculo) then
    FreeAndNil(veiculo);
end;

end.
