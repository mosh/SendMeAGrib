namespace SendMeAGrib;

interface

uses
  Sugar.*,
  Foundation;

type

  Settings = public class
  private
  protected
  public
    property Host:String;
    property Port:String;
    property Username:String;
    property Password:String;
    
    method restoreFromDefaults;
    method saveToDefaults;
    
  end;

implementation

method Settings.saveToDefaults;
begin
  var defaults := NSUserDefaults.standardUserDefaults;
  
  defaults.setObject(self.Host) forKey('Host');
  defaults.setObject(self.Port) forKey('Port');
  defaults.setObject(self.Username) forKey('Username');
  defaults.setObject(self.Password) forKey('Password');
  defaults.synchronize;
end;

method Settings.restoreFromDefaults;
begin
  var defaults := NSUserDefaults.standardUserDefaults;
  
  var value := defaults.stringForKey('Host');
  if(not String.IsNullOrEmpty(value))then
  begin
    self.Host := value;
  end;
  
  value := defaults.stringForKey('Port');
  if(not String.IsNullOrEmpty(value))then
  begin
    self.Port := value;
  end;
  value := defaults.stringForKey('Username');
  if(not String.IsNullOrEmpty(value))then
  begin
    self.Username := value;
  end;
  
  value := defaults.stringForKey('Password');
  if(not String.IsNullOrEmpty(value))then
  begin
    self.Password := value;
  end;

end;


end.
