namespace SendMeAGrib;

interface

uses
  Foundation;

type

  Email = public class
  public
    property &To:String read private write;
    property Subject:String;
    constructor;
  end;
  
  Animation = public enum (None,OneDay, TwoDay, ThreeDay, FourDay, FiveDay);

  GMNEmailBuilder = public class
  private
  protected
  public
    constructor;
    
    method Build:Email;
    property SelectedAnimation:Animation;
    property Region:String;
    property &Repeat:Boolean;
    property RepeatTimes:Integer;
    property Times:Boolean;
    property TimesOfForecast:String;
  end;

implementation

constructor GMNEmailBuilder;
begin
  self.SelectedAnimation := Animation.None;
end;

constructor Email;
begin
  inherited;
  self.To :='gmngrib@globalmarinenet.net';
end;

method GMNEmailBuilder.Build: Email;
begin

  var built := new Email;
  
  var subject := '';
  
  if(self.Repeat)then
  begin
    subject := NSString.stringWithFormat('%dtimes ',self.RepeatTimes);
  end;
  
  subject := subject + Region;
  
  if(SelectedAnimation <> Animation.None)then
  begin
    case SelectedAnimation of
      Animation.OneDay: subject := subject + ' 1day';
      Animation.TwoDay: subject := subject + ' 2day';
      Animation.ThreeDay: subject := subject + ' 3day';
      Animation.FourDay: subject := subject + ' 4day';
      Animation.FiveDay: subject := subject + ' 5day';
    end;
  end
  else
  begin
    if(Times)then
    begin
      subject := NSString.stringWithFormat('%@ %@',subject,self.TimesOfForecast);
    end;
  end;
  
  built.Subject := subject;
  
  exit built;
end;

end.
