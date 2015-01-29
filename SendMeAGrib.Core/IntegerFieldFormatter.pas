namespace SendMeAGrib;

interface

uses
  Foundation;

type

  NumericLimit = public enum (None, LengthLimit,MinMaxLimit);

  IntegerFieldFormatter = public class(NSNumberFormatter)
  private
  protected
  public
    method isPartialStringValid(var partialStringPtr: Foundation.NSString) proposedSelectedRange(proposedSelRangePtr: Foundation.NSRangePointer) originalString(origString: Foundation.NSString) originalSelectedRange(origSelRange: Foundation.NSRange) errorDescription(var error: Foundation.NSString): rtl.BOOL; override;
    
    method initWithMaximumLength(length:Integer):id;
    method initWithMaximum(max:Integer) andMinimum(min:Integer):id;
    
    property MaximumLength:Integer;
    
    property MinValue:Integer;
    property MaxValue:Integer;
    
    property Limit:NumericLimit read private write;
    
    method numberFromString(string: NSString): NSNumber; override;
  
  end;

implementation

method IntegerFieldFormatter.initWithMaximumLength(length:Integer):id;
begin
  self := inherited init;
  if(assigned(self))then
  begin
    self.Limit := NumericLimit.LengthLimit;
    self.MaximumLength := length;
  end;
  exit self;
end;

method IntegerFieldFormatter.initWithMaximum(max:Integer) andMinimum(min:Integer):id;
begin
  self := inherited init;
  if(assigned(self))then
  begin
    self.Limit := NumericLimit.MinMaxLimit;
    self.MinValue := min;
    self.MaxValue := max;
  end;
  exit self;
end;

method IntegerFieldFormatter.numberFromString(string: NSString): NSNumber;
begin

  if(not assigned(string))then
  begin
    exit nil;
  end;
  
  if(Limit = NumericLimit.LengthLimit)then
  begin
    if string.length > self.MaximumLength then
    begin
      exit nil;
    end;
  end;
  
  var value := inherited.numberFromString(string);
  
  if(assigned(value))then
  begin
  
    if(Limit = NumericLimit.MinMaxLimit)then
    begin
      if((value.integerValue < MinValue)or(value.integerValue > MaxValue))then
      begin
        exit nil;
      end;
    end;
  end;
  
  exit value;
end;


method IntegerFieldFormatter.isPartialStringValid(var partialStringPtr: Foundation.NSString) proposedSelectedRange(proposedSelRangePtr: Foundation.NSRangePointer) originalString(origString: Foundation.NSString) originalSelectedRange(origSelRange: Foundation.NSRange) errorDescription(var error: Foundation.NSString): rtl.BOOL;
begin
  NSLog('%@',partialStringPtr);
  var nValue := self.numberFromString(partialStringPtr);
  exit iif(assigned(nValue), true, false);
end;

end.
