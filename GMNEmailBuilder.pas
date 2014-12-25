namespace MailCoreCocoaApplication;

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

  GMNEmailBuilder = public class
  private
  protected
  public
    method Build(key:String):Email;
  end;

implementation

constructor Email;
begin
  inherited;
  self.To :='gmngrib@globalmarinenet.net';
end;

method GMNEmailBuilder.Build(key: String): Email;
begin
  var built := new Email;
  built.Subject := key;
  
  exit built;
end;

end.
