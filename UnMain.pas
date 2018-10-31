unit UnMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  UnHiloPrincipal
  ;

type
  TFrmMain = class(TForm)
    TimerGrafico: TTimer;
    RejillaHilos: TStringGrid;
    btLanzarHilo: TButton;
    lbNumHilos: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLanzarHiloClick(Sender: TObject);
    procedure TimerGraficoTimer(Sender: TObject);
  private
  { Private declarations }
    FHiloPrincipal: THiloPrincipal;
    procedure ActualizaGrid;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  UnHiloContador
  ;

procedure TFrmMain.ActualizaGrid;
var
  iteradorHilos: Integer;
  hiloContador: THiloContador;
begin
  RejillaHilos.Cells[0,0] := 'Id Hilo';
  RejillaHilos.Cells[1,0] := 'Estado';
  RejillaHilos.Cells[2,0] := 'Número de elementos';
  RejillaHilos.RowCount := FHiloPrincipal.Count + 1;
  for iteradorHilos := 0 to FHiloPrincipal.Count - 1 do
  begin
    hiloContador := THiloContador(FHiloPrincipal.GetItem(iteradorHilos));
    RejillaHilos.Cells[0,iteradorHilos + 1] := hiloContador.ThreadID.ToString;
    if hiloContador.Started then
      RejillaHilos.Cells[1,iteradorHilos + 1] := 'Started'
    else
      RejillaHilos.Cells[1,iteradorHilos + 1] := 'Stopped';
    RejillaHilos.Cells[2,iteradorHilos + 1] := hiloContador.Count.ToString;
  end;  
end;

procedure TFrmMain.btLanzarHiloClick(Sender: TObject);
var
  hiloContador : THiloContador;
begin
  hiloContador := THiloContador.Create(Random(1000));
  hiloContador.Start;
  FHiloPrincipal.Add(hiloContador);
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FHiloPrincipal.Terminate;
  FHiloPrincipal.WaitFor;
  FHiloPrincipal.Free;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FHiloPrincipal := THiloPrincipal.Create;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  FHiloPrincipal.Start;
end;

procedure TFrmMain.TimerGraficoTimer(Sender: TObject);
begin
 lbNumHilos.Caption := 'Número de hilos:' + FHiloPrincipal.Count.ToString;
 ActualizaGrid;
end;

end.
