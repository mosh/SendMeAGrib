namespace SendMeAGrib;

interface

uses
  MailCore.*,
  Foundation;

type

  Mailer = public class
  private
    property hostName:String;
    property port:Integer;
    property username:String;
    property password:String;
  protected
  public
    method Send(sendTo:Email);
    constructor (hostName:String) withPort(port:Integer) withUsername(username:String) withPassword(password:String);
    
    property SentBlock:block (sent:Boolean);
    
  end;

implementation

constructor Mailer(hostName: String) withPort(port: Integer) withUsername(username: String) withPassword(password: String);
begin
  inherited constructor;
  self.hostName := hostName;
  self.port := port;
  self.username := username;
  self.password := password;
end;


method Mailer.Send(sendTo:Email);
begin
  var smtpSession := new MCOSMTPSession;
  smtpSession.hostname := self.hostName;
  smtpSession.port := self.port;
  smtpSession.username := self.username;
  smtpSession.password := self.password;
  smtpSession.connectionType := MCOConnectionType.MCOConnectionTypeTLS;
  
  var fromAddress := MCOAddress.addressWithMailbox(self.username);
  var toAddress := MCOAddress.addressWithMailbox(sendTo.To);
  
  var builder := new MCOMessageBuilder;
  builder.header.from := fromAddress;

  var toArray := NSArray.arrayWithObject(toAddress);
  builder.header.to := toArray;
  builder.header.subject := sendTo.Subject;

  var data := builder.data;

  var operation := smtpSession.sendOperationWithData(data);
  operation.start(method(error:NSError) begin
      if(assigned(error))then
      begin
        NSLog('Error');
        if(assigned(SentBlock))then
        begin
          SentBlock(false);
        end;
      end
      else
      begin
        NSLog('Sent');
        if(assigned(SentBlock))then
        begin
          SentBlock(true);
        end;
      end;
    
    end);
  

end;

end.
