unit Animasi;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  LCLType, LCLIntf, Windows, MMSystem;

type
  { TFormAnimasi }

  TFormAnimasi = class(TForm)
    Bomb3: TImage;
    Bomb2: TImage;
    Car: TImage;
    Bomb: TImage;
    GameOver: TImage;
    Copyright: TLabel;
    THiScore: TLabel;
    HiScore: TLabel;
    ScoreLabel: TLabel;
    PauseGame: TImage;
    StartGame: TImage;
    ExitGame: TImage;
    Background: TImage;
    Utama: TTimer;
    MobilKiri: TTimer;
    MobilKanan: TTimer;
    SpeedBomb: TTimer;
    TPaused: TLabel;
    procedure ExitGameClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word);
    procedure FormKeyUp(Sender: TObject; var Key: Word);
    procedure FormShow(Sender: TObject);
    procedure PauseGameClick(Sender: TObject);
    procedure StartGameClick(Sender: TObject);
    procedure UtamaTimer(Sender: TObject);
    procedure MobilKiriTimer(Sender: TObject);
    procedure MobilKananTimer(Sender: TObject);
    procedure SpeedBombTimer(Sender: TObject);
  private

  public

  end;

var
  FormAnimasi: TFormAnimasi;
  Gambar, Score, HighScore, Paused, Offside, Boom : integer;

implementation

{$R *.lfm}

{ TFormAnimasi }

procedure TFormAnimasi.UtamaTimer(Sender: TObject);
begin
  if Gambar = 0 then
     Background.Picture.LoadFromFile('0.jpg')
  else if Gambar = 1 then
     Background.Picture.LoadFromFile('1.jpg')
  else if Gambar = 2 then
     Background.Picture.LoadFromFile('2.jpg')
  else if Gambar = 3 then
     Background.Picture.LoadFromFile('3.jpg')
  else if Gambar = 4 then
     Background.Picture.LoadFromFile('4.jpg')
  else if Gambar = 5 then
     Background.Picture.LoadFromFile('5.jpg')
  else if Gambar = 6 then
     Background.Picture.LoadFromFile('6.jpg')
  else if Gambar = 7 then
     Background.Picture.LoadFromFile('7.jpg')
  else if Gambar = 8 then
     Background.Picture.LoadFromFile('8.jpg')
  else if Gambar = 9 then
     Background.Picture.LoadFromFile('9.jpg')
  else if Gambar = 10 then
     Background.Picture.LoadFromFile('10.jpg')
  else if Gambar = 11 then
     Background.Picture.LoadFromFile('11.jpg')
  else if Gambar = 12 then
     Background.Picture.LoadFromFile('12.jpg')
  else if Gambar = 13 then
     Background.Picture.LoadFromFile('13.jpg')
  else if Gambar = 14 then
     Background.Picture.LoadFromFile('14.jpg')
  else if Gambar = 15 then
     Background.Picture.LoadFromFile('15.jpg')
  else if Gambar = 16 then
     Background.Picture.LoadFromFile('16.jpg')
  else if Gambar = 17 then
     Background.Picture.LoadFromFile('17.jpg')
  else if Gambar = 18 then
     Background.Picture.LoadFromFile('18.jpg')
  else if Gambar = 19 then
     Background.Picture.LoadFromFile('19.jpg')
  else if Gambar = 20 then
     Background.Picture.LoadFromFile('20.jpg')
  else if Gambar = 21 then
     Background.Picture.LoadFromFile('21.jpg')
  else if Gambar = 22 then
     Background.Picture.LoadFromFile('22.jpg')
  else if Gambar = 23 then
     Background.Picture.LoadFromFile('23.jpg')
  else if Gambar = 24 then
     Background.Picture.LoadFromFile('24.jpg')
  else if Gambar = 25 then
     Background.Picture.LoadFromFile('25.jpg')
  else if Gambar = 26 then
     Background.Picture.LoadFromFile('26.jpg')
  else if Gambar = 27 then
     Background.Picture.LoadFromFile('27.jpg')
  else if Gambar = 28 then
     Background.Picture.LoadFromFile('28.jpg');
  if Gambar = 28 then
     Gambar := 0
  else
      inc(Gambar);

  if Car.Left = 460 then
  begin
     Utama.Enabled := FALSE;
     MobilKiri.Enabled := FALSE;
     MobilKanan.Enabled := FALSE;
     SpeedBomb.Enabled := FALSE;
     Bomb.Visible := FALSE;
     Bomb2.Visible := FALSE;
     Bomb3.Visible := FALSE;
     ShowMessage('OFFSIDE !!!');
     Bomb.Left := random(450);
     Bomb.Top := 40;
     Bomb2.Left := random(450);
     Bomb2.Top := 8;
     Bomb3.Left := random(450);
     Bomb3.Top := -14;
     Offside := 1;
     HighScore := Score;
     Score := 0;
     ScoreLabel.Visible := FALSE;
     Car.Visible := FALSE;
     StartGameClick(Sender);
  end;
  if Car.Left = -160 then
  begin
     Utama.Enabled := FALSE;
     MobilKiri.Enabled := FALSE;
     MobilKanan.Enabled := FALSE;
     SpeedBomb.Enabled := FALSE;
     Bomb.Visible := FALSE;
     Bomb2.Visible := FALSE;
     Bomb3.Visible := FALSE;
     ShowMessage('OFFSIDE !!!');
     Bomb.Left := random(450);
     Bomb.Top := 40;
     Bomb2.Left := random(450);
     Bomb2.Top := 8;
     Bomb3.Left := random(450);
     Bomb3.Top := -14;
     Offside := 1;
     HighScore := Score;
     Score := 0;
     ScoreLabel.Visible := FALSE;
     Car.Visible := FALSE;
     StartGameClick(Sender);
  end;

  if (Bomb.Top > Car.Top) and (Bomb.Top < Car.Top + 320) then
  if (Bomb.Left > Car.Left) and (Bomb.Left < Car.Left + 160) then
  begin
     Car.Visible := FALSE;
     Bomb.Visible := FALSE;
     Bomb2.Visible := FALSE;
     Bomb3.Visible := FALSE;
     Utama.Enabled := FALSE;
     MobilKiri.Enabled := FALSE;
     MobilKanan.Enabled := FALSE;
     SpeedBomb.Enabled := FALSE;
     Bomb.Left := random(450);
     Bomb.Top := 40;
     Bomb2.Left := random(450);
     Bomb2.Top := 8;
     Bomb3.Left := random(450);
     Bomb3.Top := -14;
     Boom := 1;
     HighScore := Score;
     Score := 0;
     ScoreLabel.Visible := FALSE;
     StartGameClick(Sender);
  end;

  if (Bomb2.Top > Car.Top) and (Bomb2.Top < Car.Top + 320) then
  if (Bomb2.Left > Car.Left) and (Bomb2.Left < Car.Left + 160) then
  begin
     Car.Visible := FALSE;
     Bomb.Visible := FALSE;
     Bomb2.Visible := FALSE;
     Bomb3.Visible := FALSE;
     Utama.Enabled := FALSE;
     MobilKiri.Enabled := FALSE;
     MobilKanan.Enabled := FALSE;
     SpeedBomb.Enabled := FALSE;
     Bomb.Left := random(450);
     Bomb.Top := 40;
     Bomb2.Left := random(450);
     Bomb2.Top := 8;
     Bomb3.Left := random(450);
     Bomb3.Top := -14;
     Boom := 1;
     HighScore := Score;
     Score := 0;
     ScoreLabel.Visible := FALSE;
     StartGameClick(Sender);
  end;

  if (Bomb3.Top > Car.Top) and (Bomb3.Top < Car.Top + 320) then
  if (Bomb3.Left > Car.Left) and (Bomb3.Left < Car.Left + 160) then
  begin
     Car.Visible := FALSE;
     Bomb.Visible := FALSE;
     Bomb2.Visible := FALSE;
     Bomb3.Visible := FALSE;
     Utama.Enabled := FALSE;
     MobilKiri.Enabled := FALSE;
     MobilKanan.Enabled := FALSE;
     SpeedBomb.Enabled := FALSE;
     Bomb.Left := random(450);
     Bomb.Top := 40;
     Bomb2.Left := random(450);
     Bomb2.Top := 8;
     Bomb3.Left := random(450);
     Bomb3.Top := -14;
     Boom := 1;
     HighScore := Score;
     Score := 0;
     ScoreLabel.Visible := FALSE;
     StartGameClick(Sender);
  end;

  if Bomb.Top > 500 then
  begin
     Bomb.Left := random(450);
     Bomb.Top := 40;
     inc(Score);
     ScoreLabel.Caption := IntToStr(Score);
  end;

  if Bomb2.Top > 500 then
  begin
     Bomb2.Left := random(450);
     Bomb2.Top := 8;
     inc(Score);
     ScoreLabel.Caption := IntToStr(Score);
  end;

  if Bomb3.Top > 500 then
  begin
     Bomb3.Left := random(450);
     Bomb3.Top := -14;
     inc(Score);
     ScoreLabel.Caption := IntToStr(Score);
  end;

end;

procedure TFormAnimasi.MobilKiriTimer(Sender: TObject);
begin
  if StartGame.Visible = FALSE then
     Car.Left := Car.Left - 10;
end;

procedure TFormAnimasi.MobilKananTimer(Sender: TObject);
begin
  if StartGame.Visible = FALSE then
     Car.Left := Car.Left + 10;
end;

procedure TFormAnimasi.SpeedBombTimer(Sender: TObject);
begin
  if StartGame.Visible = FALSE then
     Bomb.Top := Bomb.Top + 8;
  if StartGame.Visible = FALSE then
     Bomb2.Top := Bomb2.Top + 9;
  if StartGame.Visible = FALSE then
     Bomb3.Top := Bomb3.Top + 10;
end;

procedure TFormAnimasi.FormShow(Sender: TObject);
begin
  Gambar := 0;
  Offside := 0;
  Score := 0;
  Paused := 0;
  HighScore := Score;
  Boom := 0;
  Car.Visible := FALSE;
  Bomb.Visible := FALSE;
  Bomb2.Visible := FALSE;
  Bomb3.Visible := FALSE;
  PauseGame.Visible := FALSE;
  ScoreLabel.Visible := FALSE;
  THiScore.Visible := FALSE;
  HiScore.Visible := FALSE;
  Utama.Enabled := TRUE;
  sndPlaySound('main.wav',
  SND_NODEFAULT Or SND_ASYNC Or SND_LOOP);
end;

procedure TFormAnimasi.PauseGameClick(Sender: TObject);
begin
    Utama.Enabled := FALSE;
    StartGame.Visible := TRUE;
    ExitGame.Visible := TRUE;
    PauseGame.Visible := FALSE;
    TPaused.Visible := TRUE;
    Car.Visible := FALSE;
    Bomb.Visible := FALSE;
    Bomb2.Visible := FALSE;
    Bomb3.Visible := FALSE;
    sndPlaySound(nil, 0);
    Paused := 0;
end;

procedure TFormAnimasi.StartGameClick(Sender: TObject);
begin
  if (Paused = 0) and (Boom = 0) and (Offside = 0) then
  begin
    Car.Visible := TRUE;
    Bomb.Visible := TRUE;
    Bomb2.Visible := TRUE;
    Bomb3.Visible := TRUE;
    Utama.Enabled := TRUE;
    SpeedBomb.Enabled := TRUE;
    StartGame.Visible := FALSE;
    ExitGame.Visible := FALSE;
    PauseGame.Visible := TRUE;
    GameOver.Visible := FALSE;
    ScoreLabel.Caption := IntToStr (Score);
    ScoreLabel.Visible := TRUE;
    THiScore.Visible := FALSE;
    HiScore.Visible := FALSE;
    TPaused.Visible := FALSE;
    Copyright.Visible := FALSE;
    sndPlaySound('start.wav',
    SND_NODEFAULT Or SND_ASYNC Or SND_LOOP);
  end;
  if Boom = 1 then
  begin
    sndPlaySound(nil, 0);
    Utama.Enabled := TRUE;
    StartGame.Visible := TRUE;
    ExitGame.Visible := TRUE;
    PauseGame.Visible := FALSE;
    GameOver.Visible := TRUE;
    Car.Left := 320;
    Car.Left := 160;
    HiScore.Caption := IntToStr (HighScore);
    THiScore.Visible := TRUE;
    HiScore.Visible := TRUE;
    Score := 0;
    Boom := 0;
    sndPlaySound('end.wav',
    SND_NODEFAULT Or SND_ASYNC);
  end;
  if Offside = 1 then
  begin
    sndPlaySound(nil, 0);
    Utama.Enabled := TRUE;
    StartGame.Visible := TRUE;
    ExitGame.Visible := TRUE;
    PauseGame.Visible := FALSE;
    GameOver.Visible := TRUE;
    Car.Left := 320;
    Car.Left := 160;
    HiScore.Caption := IntToStr (HighScore);
    THiScore.Visible := TRUE;
    HiScore.Visible := TRUE;
    Score := 0;
    Offside := 0;
    sndPlaySound('end.wav',
    SND_NODEFAULT Or SND_ASYNC);
  end;
end;

procedure TFormAnimasi.ExitGameClick(Sender: TObject);
begin
  sndPlaySound(nil, 0);
  Close;
end;

procedure TFormAnimasi.FormKeyDown(Sender: TObject; var Key: Word);
begin
  if Key = VK_LEFT then
     MobilKiri.Enabled := TRUE;
  if Key = VK_RIGHT then
     MobilKanan.Enabled := TRUE;
end;

procedure TFormAnimasi.FormKeyUp(Sender: TObject; var Key: Word);
begin
  if Key = VK_LEFT then
     MobilKiri.Enabled := FALSE;
  if Key = VK_RIGHT then
     MobilKanan.Enabled := FALSE;
end;

end.
