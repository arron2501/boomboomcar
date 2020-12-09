unit Utama;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, animasi;

type

  { TFormUtama }
  thread = class(TThread)
    private
      isEnabled, isEnabled2: Boolean;
    public
      Constructor Create(CreateSuspended: Boolean);
      procedure Test;
      procedure Test2;
    protected
      procedure Execute; override;
  end;

  TFormUtama = class(TForm)
    ButtonSecThread: TButton;
    ButtonForm2: TButton;
    ButtonStart: TButton;
    ButtonMessage: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo: TMemo;
    Memo2: TMemo;
    procedure ButtonForm2Click(Sender: TObject);
    procedure ButtonSecThreadClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonMessageClick(Sender: TObject);
  private

  public

  end;

var
  FormUtama: TFormUtama;
  th: thread;
  x, s: integer;

implementation

{$R *.lfm}

{ thread }

Constructor thread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := True;
end;

procedure thread.Execute;
begin
  while isEnabled = True do
  begin
    FormUtama.Memo.Lines.Add('Memo1 Thread ID : ' + inttostr(ThreadID));
    FormUtama.Memo.Lines.Add('==============');
    for x := 1 to 10000 do
    begin
      Synchronize(@Test);
      Sleep(1000);
    end;
  end;

  while isEnabled2 = True do
  begin
    FormUtama.Memo2.Lines.Add('Memo2 Thread ID : ' + inttostr(ThreadID));
    FormUtama.Memo2.Lines.Add('==============');
    for s := 1 to 10000 do
    begin
      Synchronize(@Test2);
      Sleep(1000);
    end;
  end;
end;

procedure thread.Test;
begin
  FormUtama.Memo.Lines.Add('Memo1 looping ke - ' + inttostr(x));
  FormUtama.Caption := ('Clock: ' + FormatDateTime('hh:mm:ss', Now));
end;

procedure thread.Test2;
begin
  FormUtama.Memo2.Lines.Add('Memo2 looping ke - ' + inttostr(s));
end;

procedure TFormUtama.ButtonStartClick(Sender: TObject);
begin
  ButtonStart.Enabled := False;
  ButtonStart.Caption := ('Running...');
  th := thread.Create(False);
  th.isEnabled := True;
  th.Priority := tpIdle;
  th.Start;
end;

procedure TFormUtama.ButtonForm2Click(Sender: TObject);
begin
  FormAnimasi := TFormAnimasi.Create(Self);
  FormAnimasi.Caption := ('Mini Game - Thread ID : ' + inttostr(ThreadID));
  FormAnimasi.Show;
end;

procedure TFormUtama.ButtonSecThreadClick(Sender: TObject);
begin
  ButtonSecThread.Enabled := False;
  ButtonSecThread.Caption := ('Running...');
  th := thread.Create(False);
  th.isEnabled2 := True;
  th.Priority := tpIdle;
  th.Start;
end;

procedure TFormUtama.ButtonMessageClick(Sender: TObject);
begin
  ShowMessage('Tanpa menggunakan thread, kita tidak bisa menjalankan proses lain selama Memo1 atau Memo2 sedang menampilkan outputnya' + sLineBreak + sLineBreak + 'Klik OK untuk menampilkan pesan berikutnya...');
  ShowMessage('Karena kita harus menunggu proses Memo1 atau Memo2 selesai terlebih dahulu, barulah kita bisa menjalankan proses yang lain' + sLineBreak + sLineBreak + 'Klik OK untuk menampilkan pesan berikutnya...');
  ShowMessage('Sedangkan, dengan menggunakan thread, maka kita dapat menjalankan seluruh proses secara bersamaan tanpa harus menunggu proses lain selesai terlebih dahulu' + sLineBreak + sLineBreak + 'Klik OK untuk menampilkan pesan berikutnya...');
  ShowMessage('Karena dengan menggunakan thread, sistem akan membagi resource perangkat kita untuk dapat menjalankan seluruh proses' + sLineBreak + sLineBreak + 'Klik OK untuk menampilkan pesan berikutnya...');
  ShowMessage('Berbeda dengan tidak menggunakan thread, dimana satu proses menggunakan seluruh resource, maka dari itu kita harus menunggu proses tersebut selesai terlebih dahulu untuk menjalankan proses yang lain' + sLineBreak + sLineBreak + 'Klik OK untuk menampilkan pesan berikutnya...');
  ShowMessage('Terima kasih...' + sLineBreak + sLineBreak + 'Thread ID : ' + inttostr(ThreadID));
end;

end.

