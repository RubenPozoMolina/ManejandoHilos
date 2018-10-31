unit UnHiloPrincipal;

interface

uses
  System.Classes,
  System.Generics.Collections
  ;

type
  THiloPrincipal = class(TThread)
  private
    FHilos: TObjectList<TThread>;
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(pThread: TThread);
    procedure Delete(pIndex: Integer);
    function Count: Integer;
    function GetItem(pIndex: Integer): TThread;
  end;

implementation

{ THiloPrincipal }

procedure THiloPrincipal.Add(pThread: TThread);
begin
  FHilos.Add(pThread);
end;

function THiloPrincipal.Count: Integer;
begin
  Result := FHilos.Count;
end;

constructor THiloPrincipal.Create;
begin
  inherited Create(True);
  FHilos := TObjectList<TThread>.Create;
end;

procedure THiloPrincipal.Delete(pIndex: Integer);
begin
  FHilos.Delete(pIndex);
end;

destructor THiloPrincipal.Destroy;
begin
  FHilos.Free;
  inherited;
end;

procedure THiloPrincipal.Execute;
begin
  inherited;
  while not Terminated do
    begin

    end;
end;

function THiloPrincipal.GetItem(pIndex: Integer): TThread;
begin
  Result := FHilos[pIndex];
end;

end.
