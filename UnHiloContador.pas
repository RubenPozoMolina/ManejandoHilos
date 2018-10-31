unit UnHiloContador;

interface

uses
  System.Classes,
  System.Generics.Collections
  ;

type
  THiloContador = class(TThread)
  private
    FTiempoEspera: Integer;
    FLista: TList<Integer>;
  protected
    procedure Execute; override;
  public
    constructor Create(pTiempoEspera: Integer);
    destructor Destroy; override;
    function Count: Integer;
  end;

implementation


{ THiloContador }

function THiloContador.Count: Integer;
begin
  Result := FLista.Count;
end;

constructor THiloContador.Create(pTiempoEspera: Integer);
begin
  inherited Create(True);
  FTiempoEspera := pTiempoEspera;
  FLista := TList<Integer>.Create;
end;

destructor THiloContador.Destroy;
begin
  FLista.Free;
  inherited;
end;

procedure THiloContador.Execute;
begin
  inherited;
  while not Terminated do
  begin
    Sleep(FTiempoEspera);
    FLista.Add(Random(100));
  end;
end;

end.
