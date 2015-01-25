namespace SendMeAGrib;

interface

uses
  Foundation;

type

  IntegerFieldFormatter = public class(NSNumberFormatter)
  private
  protected
  public
    method isPartialStringValid(var partialStringPtr: Foundation.NSString) proposedSelectedRange(proposedSelRangePtr: Foundation.NSRangePointer) originalString(origString: Foundation.NSString) originalSelectedRange(origSelRange: Foundation.NSRange) errorDescription(var error: Foundation.NSString): rtl.BOOL; override;
    
    method initWithMaximumLength(length:Integer):id;
    
    property MaximumLength:Integer;
  
  end;

implementation

method IntegerFieldFormatter.initWithMaximumLength(length:Integer):id;
begin
  self := inherited init;
  if(assigned(self))then
  begin
    self.MaximumLength := length;
  end;
  exit self;
end;

method IntegerFieldFormatter.isPartialStringValid(var partialStringPtr: Foundation.NSString) proposedSelectedRange(proposedSelRangePtr: Foundation.NSRangePointer) originalString(origString: Foundation.NSString) originalSelectedRange(origSelRange: Foundation.NSRange) errorDescription(var error: Foundation.NSString): rtl.BOOL;
begin
  NSLog('%@',partialStringPtr);
  if partialStringPtr.length() > self.MaximumLength then
  begin
    exit false;
  end;
  var nValue := self.numberFromString(partialStringPtr);
  if(not assigned(nValue))then
  begin
    exit false;
  end;
  exit true;
end;

end.
