//  Import of libMailCore-ios ()
//  Frameworks:
//  Targets: armv7, armv7s, arm64
//  Dep fx:rtl, Foundation
//  Dep libs:MailCore-ios, ctemplate-ios, etpan-ios, uchardet-ios, xml2, sasl2, iconv, tidy, z, c++
namespace ;

interface

type
  MailCore.MailCore.UChar = public UChar;

  MailCore.MailCore.__Global = public class
  public
    class var MCLogEnabled: Int32;
    class method MCLogInternal(user: ^AnsiChar; filename: ^AnsiChar; line: UInt32; dumpStack: Int32; format: ^AnsiChar; params Param5: uint16_t);
    class method MCAssertInternal(filename: ^AnsiChar; line: UInt32; cond: Int32; condString: ^AnsiChar);
    class var MCORangeEmpty: MailCore.MailCore.MCORange;
    class method MCORangeMake(location: uint64_t; length: uint64_t): MailCore.MailCore.MCORange;
    class method MCORangeRemoveRange(range1: MailCore.MailCore.MCORange; range2: MailCore.MailCore.MCORange): MailCore.MailCore.MCOIndexSet;
    class method MCORangeUnion(range1: MailCore.MailCore.MCORange; range2: MailCore.MailCore.MCORange): MailCore.MailCore.MCOIndexSet;
    class method MCORangeIntersection(range1: MailCore.MailCore.MCORange; range2: MailCore.MailCore.MCORange): MailCore.MailCore.MCORange;
    class method MCORangeHasIntersection(range1: MailCore.MailCore.MCORange; range2: MailCore.MailCore.MCORange): BOOL;
    class method MCORangeLeftBound(range: MailCore.MailCore.MCORange): uint64_t;
    class method MCORangeRightBound(range: MailCore.MailCore.MCORange): uint64_t;
    class method MCORangeToString(range: MailCore.MailCore.MCORange): NSString;
    class method MCORangeFromString(rangeString: NSString): MailCore.MailCore.MCORange;
    class const MCOIMAPNamespacePersonal: Void;
    class const MCOIMAPNamespaceOther: Void;
    class const MCOIMAPNamespaceShared: Void;
    class const MCOErrorDomain: Void;
    class method MCO_NATIVE_INSTANCE: uint16_t;
  end;

  MailCore.MailCore.mailimap = public mailimap;

  MailCore.MailCore.mailpop3 = public mailpop3;

  MailCore.MailCore.mailsmtp = public mailsmtp;

  MailCore.MailCore.newsnntp = public newsnntp;

  MailCore.MailCore.UDateFormat = public UDateFormat;

  MailCore.MailCore.MCOAbstractMessage = public class(NSObject)
  public
    property header: MailCore.MailCore.MCOMessageHeader read write;
    method partForContentID(contentID: NSString): MailCore.MailCore.MCOAbstractPart;
    method partForUniqueID(uniqueID: NSString): MailCore.MailCore.MCOAbstractPart;
    method attachments: NSArray;
    method htmlInlineAttachments: NSArray;
    method requiredPartsForRendering: NSArray;
  end;

  MailCore.MailCore.MCOPartType = public enum (
    MCOPartTypeSingle,
    Single,
    MCOPartTypeMessage,
    Message,
    MCOPartTypeMultipartMixed,
    MultipartMixed,
    MCOPartTypeMultipartRelated,
    MultipartRelated,
    MCOPartTypeMultipartAlternative,
    MultipartAlternative,
    MCOPartTypeMultipartSigned,
    MultipartSigned
  );

  MailCore.MailCore.MCOAbstractPart = public class(NSObject)
  public
    property partType: MailCore.MailCore.MCOPartType read write;
    property filename: NSString read write;
    property mimeType: NSString read write;
    property charset: NSString read write;
    property uniqueID: NSString read write;
    property contentID: NSString read write;
    property contentLocation: NSString read write;
    property contentDescription: NSString read write;
    property inlineAttachment: BOOL read write;
    method partForContentID(contentID: NSString): MailCore.MailCore.MCOAbstractPart;
    method partForUniqueID(uniqueID: NSString): MailCore.MailCore.MCOAbstractPart;
    method decodedStringForData(data: NSData): NSString;
    method setContentTypeParameterValue(value: NSString) forName(name: NSString);
    method removeContentTypeParameterForName(name: NSString);
    method contentTypeParameterValueForName(name: NSString): NSString;
    method allContentTypeParametersNames: NSArray;
  end;

  MailCore.MailCore.MCOAbstractMessagePart = public class(MailCore.MailCore.MCOAbstractPart)
  public
    property header: MailCore.MailCore.MCOMessageHeader read write;
    property mainPart: MailCore.MailCore.MCOAbstractPart read write;
  end;

  MailCore.MailCore.MCOAbstractMultipart = public class(MailCore.MailCore.MCOAbstractPart)
  public
    property parts: NSArray read write;
  end;

  MailCore.MailCore.MCOAddress = public class(NSObject)
  public
    class method addressWithDisplayName(displayName: NSString) mailbox(mailbox: NSString): MailCore.MailCore.MCOAddress;
    class method addressWithMailbox(mailbox: NSString): MailCore.MailCore.MCOAddress;
    class method addressWithRFC822String(RFC822String: NSString): MailCore.MailCore.MCOAddress;
    class method addressWithNonEncodedRFC822String(nonEncodedRFC822String: NSString): MailCore.MailCore.MCOAddress;
    class method addressesWithRFC822String(string: NSString): NSArray;
    class method addressesWithNonEncodedRFC822String(string: NSString): NSArray;
    property displayName: NSString read write;
    property mailbox: NSString read write;
    method RFC822String: NSString;
    method nonEncodedRFC822String: NSString;
  end;

  //  Extension methods for MailCore.MailCore.MCOAddressCategory
  extension method NSArray.mco_RFC822StringForAddresses: NSString;
  extension method NSArray.mco_nonEncodedRFC822StringForAddresses: NSString;

type
  MailCore.MailCore.MCOConnectionType = public enum (
    MCOConnectionTypeClear,
    Clear,
    MCOConnectionTypeStartTLS,
    StartTLS,
    MCOConnectionTypeTLS,
    TLS
  );

  MailCore.MailCore.MCOAuthType = public enum (
    MCOAuthTypeSASLNone,
    SASLNone,
    MCOAuthTypeSASLCRAMMD5,
    SASLCRAMMD5,
    MCOAuthTypeSASLPlain,
    SASLPlain,
    MCOAuthTypeSASLGSSAPI,
    SASLGSSAPI,
    MCOAuthTypeSASLDIGESTMD5,
    SASLDIGESTMD5,
    MCOAuthTypeSASLLogin,
    SASLLogin,
    MCOAuthTypeSASLSRP,
    SASLSRP,
    MCOAuthTypeSASLNTLM,
    SASLNTLM,
    MCOAuthTypeSASLKerberosV4,
    SASLKerberosV4,
    MCOAuthTypeXOAuth2,
    XOAuth2,
    MCOAuthTypeXOAuth2Outlook,
    XOAuth2Outlook
  );

  MailCore.MailCore.MCOIMAPFolderFlag = public enum (
    MCOIMAPFolderFlagNone,
    None,
    MCOIMAPFolderFlagMarked,
    Marked,
    MCOIMAPFolderFlagUnmarked,
    Unmarked,
    MCOIMAPFolderFlagNoSelect,
    NoSelect,
    MCOIMAPFolderFlagNoInferiors,
    NoInferiors,
    MCOIMAPFolderFlagInbox,
    Inbox,
    MCOIMAPFolderFlagSentMail,
    SentMail,
    MCOIMAPFolderFlagStarred,
    Starred,
    MCOIMAPFolderFlagAllMail,
    AllMail,
    MCOIMAPFolderFlagTrash,
    Trash,
    MCOIMAPFolderFlagDrafts,
    Drafts,
    MCOIMAPFolderFlagSpam,
    Spam,
    MCOIMAPFolderFlagImportant,
    Important,
    MCOIMAPFolderFlagArchive,
    Archive,
    MCOIMAPFolderFlagAll,
    All,
    MCOIMAPFolderFlagJunk,
    Junk,
    MCOIMAPFolderFlagFlagged,
    Flagged,
    MCOIMAPFolderFlagFolderTypeMask,
    FolderTypeMask
  );

  MailCore.MailCore.MCOMessageFlag = public enum (
    MCOMessageFlagNone,
    None,
    MCOMessageFlagSeen,
    Seen,
    MCOMessageFlagAnswered,
    Answered,
    MCOMessageFlagFlagged,
    Flagged,
    MCOMessageFlagDeleted,
    Deleted,
    MCOMessageFlagDraft,
    Draft,
    MCOMessageFlagMDNSent,
    MDNSent,
    MCOMessageFlagForwarded,
    Forwarded,
    MCOMessageFlagSubmitPending,
    SubmitPending,
    MCOMessageFlagSubmitted,
    Submitted
  );

  MailCore.MailCore.MCOEncoding = public enum (
    MCOEncoding7Bit,
    7Bit,
    MCOEncoding8Bit,
    8Bit,
    MCOEncodingBinary,
    Binary,
    MCOEncodingBase64,
    Base64,
    MCOEncodingQuotedPrintable,
    QuotedPrintable,
    MCOEncodingOther,
    Other,
    MCOEncodingUUEncode,
    UUEncode
  );

  MailCore.MailCore.MCOIMAPMessagesRequestKind = public enum (
    MCOIMAPMessagesRequestKindUid,
    Uid,
    MCOIMAPMessagesRequestKindFlags,
    &Flags,
    MCOIMAPMessagesRequestKindHeaders,
    Headers,
    MCOIMAPMessagesRequestKindStructure,
    Structure,
    MCOIMAPMessagesRequestKindInternalDate,
    InternalDate,
    MCOIMAPMessagesRequestKindFullHeaders,
    FullHeaders,
    MCOIMAPMessagesRequestKindHeaderSubject,
    HeaderSubject,
    MCOIMAPMessagesRequestKindGmailLabels,
    GmailLabels,
    MCOIMAPMessagesRequestKindGmailMessageID,
    GmailMessageID,
    MCOIMAPMessagesRequestKindGmailThreadID,
    GmailThreadID,
    MCOIMAPMessagesRequestKindExtraHeaders,
    ExtraHeaders,
    MCOIMAPMessagesRequestKindSize,
    Size
  );

  MailCore.MailCore.MCOIMAPStoreFlagsRequestKind = public enum (
    MCOIMAPStoreFlagsRequestKindAdd,
    &Add,
    MCOIMAPStoreFlagsRequestKindRemove,
    &Remove,
    MCOIMAPStoreFlagsRequestKindSet,
    &Set
  );

  MailCore.MailCore.MCOIMAPSearchKind = public enum (
    MCOIMAPSearchKindAll,
    All,
    MCOIMAPSearchKindNone,
    None,
    MCOIMAPSearchKindFrom,
    &From,
    MCOIMAPSearchKindTo,
    &To,
    MCOIMAPSearchKindCc,
    Cc,
    MCOIMAPSearchKindBcc,
    Bcc,
    MCOIMAPSearchKindRecipient,
    Recipient,
    MCOIMAPSearchKindSubject,
    Subject,
    MCOIMAPSearchKindContent,
    Content,
    MCOIMAPSearchKindBody,
    Body,
    MCOIMAPSearchKindUids,
    Uids,
    MCOIMAPSearchKindHeader,
    Header,
    MCOIMAPSearchKindRead,
    &Read,
    MCOIMAPSearchKindUnread,
    Unread,
    MCOIMAPSearchKindFlagged,
    Flagged,
    MCOIMAPSearchKindUnflagged,
    Unflagged,
    MCOIMAPSearchKindAnswered,
    Answered,
    MCOIMAPSearchKindUnanswered,
    Unanswered,
    MCOIMAPSearchKindDraft,
    Draft,
    MCOIMAPSearchKindUndraft,
    Undraft,
    MCOIMAPSearchKindDeleted,
    Deleted,
    MCOIMAPSearchKindSpam,
    Spam,
    MCOIMAPSearchKindBeforeDate,
    BeforeDate,
    MCOIMAPSearchKindOnDate,
    OnDate,
    MCOIMAPSearchKindSinceDate,
    SinceDate,
    MCOIMAPSearchKindBeforeReceivedDate,
    BeforeReceivedDate,
    MCOIMAPSearchKindOnReceivedDate,
    OnReceivedDate,
    MCOIMAPSearchKindSinceReceivedDate,
    SinceReceivedDate,
    MCOIMAPSearchKindSizeLarger,
    SizeLarger,
    MCOIMAPSearchKindSizeSmaller,
    SizeSmaller,
    MCOIMAPSearchGmailThreadID,
    MCOIMAPSearchGmailMessageID,
    MCOIMAPSearchGmailRaw,
    MCOIMAPSearchKindOr,
    &Or,
    MCOIMAPSearchKindAnd,
    &And,
    MCOIMAPSearchKindNot,
    &Not
  );

  MailCore.MailCore.MCOIMAPCapability = public enum (
    MCOIMAPCapabilityACL,
    ACL,
    MCOIMAPCapabilityBinary,
    Binary,
    MCOIMAPCapabilityCatenate,
    Catenate,
    MCOIMAPCapabilityChildren,
    Children,
    MCOIMAPCapabilityCompressDeflate,
    CompressDeflate,
    MCOIMAPCapabilityCondstore,
    Condstore,
    MCOIMAPCapabilityEnable,
    Enable,
    MCOIMAPCapabilityIdle,
    Idle,
    MCOIMAPCapabilityId,
    Id,
    MCOIMAPCapabilityLiteralPlus,
    LiteralPlus,
    MCOIMAPCapabilityMultiAppend,
    MultiAppend,
    MCOIMAPCapabilityNamespace,
    &Namespace,
    MCOIMAPCapabilityQResync,
    QResync,
    MCOIMAPCapabilityQuota,
    Quota,
    MCOIMAPCapabilitySort,
    Sort,
    MCOIMAPCapabilityStartTLS,
    StartTLS,
    MCOIMAPCapabilityThreadOrderedSubject,
    ThreadOrderedSubject,
    MCOIMAPCapabilityThreadReferences,
    ThreadReferences,
    MCOIMAPCapabilityUIDPlus,
    UIDPlus,
    MCOIMAPCapabilityUnselect,
    Unselect,
    MCOIMAPCapabilityXList,
    XList,
    MCOIMAPCapabilityAuthAnonymous,
    AuthAnonymous,
    MCOIMAPCapabilityAuthCRAMMD5,
    AuthCRAMMD5,
    MCOIMAPCapabilityAuthDigestMD5,
    AuthDigestMD5,
    MCOIMAPCapabilityAuthExternal,
    AuthExternal,
    MCOIMAPCapabilityAuthGSSAPI,
    AuthGSSAPI,
    MCOIMAPCapabilityAuthKerberosV4,
    AuthKerberosV4,
    MCOIMAPCapabilityAuthLogin,
    AuthLogin,
    MCOIMAPCapabilityAuthNTLM,
    AuthNTLM,
    MCOIMAPCapabilityAuthOTP,
    AuthOTP,
    MCOIMAPCapabilityAuthPlain,
    AuthPlain,
    MCOIMAPCapabilityAuthSKey,
    AuthSKey,
    MCOIMAPCapabilityAuthSRP,
    AuthSRP,
    MCOIMAPCapabilityXOAuth2,
    XOAuth2,
    MCOIMAPCapabilityGmail,
    Gmail
  );

  MailCore.MailCore.MCOErrorCode = public enum (
    MCOErrorNone,
    MCOErrorConnection,
    MCOErrorTLSNotAvailable,
    MCOErrorParse,
    MCOErrorCertificate,
    MCOErrorAuthentication,
    MCOErrorGmailIMAPNotEnabled,
    MCOErrorGmailExceededBandwidthLimit,
    MCOErrorGmailTooManySimultaneousConnections,
    MCOErrorMobileMeMoved,
    MCOErrorYahooUnavailable,
    MCOErrorNonExistantFolder,
    MCOErrorRename,
    MCOErrorDelete,
    MCOErrorCreate,
    MCOErrorSubscribe,
    MCOErrorAppend,
    MCOErrorCopy,
    MCOErrorExpunge,
    MCOErrorFetch,
    MCOErrorIdle,
    MCOErrorIdentity,
    MCOErrorNamespace,
    MCOErrorStore,
    MCOErrorCapability,
    MCOErrorStartTLSNotAvailable,
    MCOErrorSendMessageIllegalAttachment,
    MCOErrorStorageLimit,
    MCOErrorSendMessageNotAllowed,
    MCOErrorNeedsConnectToWebmail,
    MCOErrorSendMessage,
    MCOErrorAuthenticationRequired,
    MCOErrorFetchMessageList,
    MCOErrorDeleteMessage,
    MCOErrorInvalidAccount,
    MCOErrorFile,
    MCOErrorCompression,
    MCOErrorNoSender,
    MCOErrorNoRecipient,
    MCOErrorNoop,
    MCOErrorGmailApplicationSpecificPasswordRequired,
    MCOErrorServerDate,
    MCOErrorCodeCount,
    Count
  );

  MailCore.MailCore.MCOConnectionLogType = public enum (
    MCOConnectionLogTypeReceived,
    Received,
    MCOConnectionLogTypeSent,
    Sent,
    MCOConnectionLogTypeSentPrivate,
    SentPrivate,
    MCOConnectionLogTypeErrorParse,
    ErrorParse,
    MCOConnectionLogTypeErrorReceived,
    ErrorReceived,
    MCOConnectionLogTypeErrorSent,
    ErrorSent
  );

  MailCore.MailCore.MCOConnectionLogger = public method (connectionID: ^Void; &type: MailCore.MailCore.MCOConnectionLogType; data: NSData);

  MailCore.MailCore.MCOOperationQueueRunningChangeBlock = public method ;

  MailCore.MailCore.MCOMessageHeader = public class(NSObject)
  public
    property messageID: NSString read write;
    property messageIDAutoGenerated: BOOL read;
    property references: NSArray read write;
    property inReplyTo: NSArray read write;
    property date: NSDate read write;
    property receivedDate: NSDate read write;
    property sender: MailCore.MailCore.MCOAddress read write;
    property &from: MailCore.MailCore.MCOAddress read write;
    property &to: NSArray read write;
    property cc: NSArray read write;
    property bcc: NSArray read write;
    property replyTo: NSArray read write;
    property subject: NSString read write;
    property userAgent: NSString read write;
    class method headerWithData(data: NSData): MailCore.MailCore.MCOMessageHeader;
    method initWithData(data: NSData): id;
    method setExtraHeaderValue(value: NSString) forName(name: NSString);
    method removeExtraHeaderForName(name: NSString);
    method extraHeaderValueForName(name: NSString): NSString;
    method allExtraHeadersNames: NSArray;
    method extractedSubject: NSString;
    method partialExtractedSubject: NSString;
    method importHeadersData(data: NSData);
    method replyHeaderWithExcludedRecipients(excludedRecipients: NSArray): MailCore.MailCore.MCOMessageHeader;
    method replyAllHeaderWithExcludedRecipients(excludedRecipients: NSArray): MailCore.MailCore.MCOMessageHeader;
    method forwardHeader: MailCore.MailCore.MCOMessageHeader;
  end;

  MailCore.MailCore.IMCOHTMLRendererDelegate = public interface
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) canPreviewPart(part: MailCore.MailCore.MCOAbstractPart): BOOL;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) shouldShowPart(part: MailCore.MailCore.MCOAbstractPart): BOOL;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) templateValuesForHeader(header: MailCore.MailCore.MCOMessageHeader): NSDictionary;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) templateValuesForPart(part: MailCore.MailCore.MCOAbstractPart): NSDictionary;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) templateForMainHeader(header: MailCore.MailCore.MCOMessageHeader): NSString;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) templateForImage(header: MailCore.MailCore.MCOAbstractPart): NSString;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) templateForAttachment(part: MailCore.MailCore.MCOAbstractPart): NSString;
    method MCOAbstractMessage_templateForMessage(msg: MailCore.MailCore.MCOAbstractMessage): NSString;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) templateForEmbeddedMessage(part: MailCore.MailCore.MCOAbstractMessagePart): NSString;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) templateForEmbeddedMessageHeader(header: MailCore.MailCore.MCOMessageHeader): NSString;
    method MCOAbstractMessage_templateForAttachmentSeparator(msg: MailCore.MailCore.MCOAbstractMessage): NSString;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) cleanHTMLForPart(html: NSString): NSString;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) filterHTMLForPart(html: NSString): NSString;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) filterHTMLForMessage(html: NSString): NSString;
  end;

  MailCore.MailCore.IMCOHTMLRendererIMAPDelegate = public interface
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) dataForIMAPPart(part: MailCore.MailCore.MCOIMAPPart) folder(folder: NSString): NSData;
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) prefetchAttachmentIMAPPart(part: MailCore.MailCore.MCOIMAPPart) folder(folder: NSString);
    method MCOAbstractMessage(msg: MailCore.MailCore.MCOAbstractMessage) prefetchImageIMAPPart(part: MailCore.MailCore.MCOIMAPPart) folder(folder: NSString);
  end;

  MailCore.MailCore.MCOAttachment = public class(MailCore.MailCore.MCOAbstractPart)
  public
    class method mimeTypeForFilename(filename: NSString): NSString;
    class method attachmentWithContentsOfFile(filename: NSString): MailCore.MailCore.MCOAttachment;
    class method attachmentWithData(data: NSData) filename(filename: NSString): MailCore.MailCore.MCOAttachment;
    class method attachmentWithHTMLString(htmlString: NSString): MailCore.MailCore.MCOAttachment;
    class method attachmentWithRFC822Message(messageData: NSData): MailCore.MailCore.MCOAttachment;
    class method attachmentWithText(text: NSString): MailCore.MailCore.MCOAttachment;
    property data: NSData read write;
    method decodedString: NSString;
  end;

  MailCore.MailCore.MCOIMAPSession = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property username: NSString read write;
    property password: NSString read write;
    property OAuth2Token: NSString read write;
    property authType: MailCore.MailCore.MCOAuthType read write;
    property connectionType: MailCore.MailCore.MCOConnectionType read write;
    property timeout: NSTimeInterval read write;
    property checkCertificateEnabled: BOOL read write;
    property voIPEnabled: BOOL read write;
    property defaultNamespace: MailCore.MailCore.MCOIMAPNamespace read write;
    property clientIdentity: MailCore.MailCore.MCOIMAPIdentity read;
    property serverIdentity: MailCore.MailCore.MCOIMAPIdentity read;
    property gmailUserDisplayName: NSString read;
    property allowsFolderConcurrentAccessEnabled: BOOL read write;
    property maximumConnections: UInt32 read write;
    property connectionLogger: MailCore.MailCore.MCOConnectionLogger read write;
    property dispatchQueue: dispatch_queue_t read write;
    property operationQueueRunning: BOOL read;
    property operationQueueRunningChangeBlock: MailCore.MailCore.MCOOperationQueueRunningChangeBlock read write;
    method cancelAllOperations;
    method folderInfoOperation(folder: NSString): MailCore.MailCore.MCOIMAPFolderInfoOperation;
    method folderStatusOperation(folder: NSString): MailCore.MailCore.MCOIMAPFolderStatusOperation;
    method fetchSubscribedFoldersOperation: MailCore.MailCore.MCOIMAPFetchFoldersOperation;
    method fetchAllFoldersOperation: MailCore.MailCore.MCOIMAPFetchFoldersOperation;
    method renameFolderOperation(folder: NSString) otherName(otherName: NSString): MailCore.MailCore.MCOIMAPOperation;
    method deleteFolderOperation(folder: NSString): MailCore.MailCore.MCOIMAPOperation;
    method createFolderOperation(folder: NSString): MailCore.MailCore.MCOIMAPOperation;
    method subscribeFolderOperation(folder: NSString): MailCore.MailCore.MCOIMAPOperation;
    method unsubscribeFolderOperation(folder: NSString): MailCore.MailCore.MCOIMAPOperation;
    method expungeOperation(folder: NSString): MailCore.MailCore.MCOIMAPOperation;
    method appendMessageOperationWithFolder(folder: NSString) messageData(messageData: NSData) &flags(&flags: MailCore.MailCore.MCOMessageFlag): MailCore.MailCore.MCOIMAPAppendMessageOperation;
    method appendMessageOperationWithFolder(folder: NSString) messageData(messageData: NSData) &flags(&flags: MailCore.MailCore.MCOMessageFlag) customFlags(customFlags: NSArray): MailCore.MailCore.MCOIMAPAppendMessageOperation;
    method copyMessagesOperationWithFolder(folder: NSString) uids(uids: MailCore.MailCore.MCOIndexSet) destFolder(destFolder: NSString): MailCore.MailCore.MCOIMAPCopyMessagesOperation;
    method storeFlagsOperationWithFolder(folder: NSString) uids(uids: MailCore.MailCore.MCOIndexSet) kind(kind: MailCore.MailCore.MCOIMAPStoreFlagsRequestKind) &flags(&flags: MailCore.MailCore.MCOMessageFlag): MailCore.MailCore.MCOIMAPOperation;
    method storeFlagsOperationWithFolder(folder: NSString) numbers(numbers: MailCore.MailCore.MCOIndexSet) kind(kind: MailCore.MailCore.MCOIMAPStoreFlagsRequestKind) &flags(&flags: MailCore.MailCore.MCOMessageFlag): MailCore.MailCore.MCOIMAPOperation;
    method storeFlagsOperationWithFolder(folder: NSString) uids(uids: MailCore.MailCore.MCOIndexSet) kind(kind: MailCore.MailCore.MCOIMAPStoreFlagsRequestKind) &flags(&flags: MailCore.MailCore.MCOMessageFlag) customFlags(customFlags: NSArray): MailCore.MailCore.MCOIMAPOperation;
    method storeFlagsOperationWithFolder(folder: NSString) numbers(numbers: MailCore.MailCore.MCOIndexSet) kind(kind: MailCore.MailCore.MCOIMAPStoreFlagsRequestKind) &flags(&flags: MailCore.MailCore.MCOMessageFlag) customFlags(customFlags: NSArray): MailCore.MailCore.MCOIMAPOperation;
    method storeLabelsOperationWithFolder(folder: NSString) numbers(numbers: MailCore.MailCore.MCOIndexSet) kind(kind: MailCore.MailCore.MCOIMAPStoreFlagsRequestKind) labels(labels: NSArray): MailCore.MailCore.MCOIMAPOperation;
    method storeLabelsOperationWithFolder(folder: NSString) uids(uids: MailCore.MailCore.MCOIndexSet) kind(kind: MailCore.MailCore.MCOIMAPStoreFlagsRequestKind) labels(labels: NSArray): MailCore.MailCore.MCOIMAPOperation;
    method fetchMessagesByUIDOperationWithFolder(folder: NSString) requestKind(requestKind: MailCore.MailCore.MCOIMAPMessagesRequestKind) uids(uids: MailCore.MailCore.MCOIndexSet): MailCore.MailCore.MCOIMAPFetchMessagesOperation;
    method fetchMessagesOperationWithFolder(folder: NSString) requestKind(requestKind: MailCore.MailCore.MCOIMAPMessagesRequestKind) uids(uids: MailCore.MailCore.MCOIndexSet): MailCore.MailCore.MCOIMAPFetchMessagesOperation;
    method fetchMessagesByNumberOperationWithFolder(folder: NSString) requestKind(requestKind: MailCore.MailCore.MCOIMAPMessagesRequestKind) numbers(numbers: MailCore.MailCore.MCOIndexSet): MailCore.MailCore.MCOIMAPFetchMessagesOperation;
    method syncMessagesByUIDWithFolder(folder: NSString) requestKind(requestKind: MailCore.MailCore.MCOIMAPMessagesRequestKind) uids(uids: MailCore.MailCore.MCOIndexSet) modSeq(modSeq: uint64_t): MailCore.MailCore.MCOIMAPFetchMessagesOperation;
    method syncMessagesWithFolder(folder: NSString) requestKind(requestKind: MailCore.MailCore.MCOIMAPMessagesRequestKind) uids(uids: MailCore.MailCore.MCOIndexSet) modSeq(modSeq: uint64_t): MailCore.MailCore.MCOIMAPFetchMessagesOperation;
    method fetchMessageByUIDOperationWithFolder(folder: NSString) uid(uid: uint32_t) urgent(urgent: BOOL): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageByUIDOperationWithFolder(folder: NSString) uid(uid: uint32_t): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageOperationWithFolder(folder: NSString) uid(uid: uint32_t) urgent(urgent: BOOL): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageOperationWithFolder(folder: NSString) uid(uid: uint32_t): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageOperationWithFolder(folder: NSString) number(number: uint32_t) urgent(urgent: BOOL): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageOperationWithFolder(folder: NSString) number(number: uint32_t): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchParsedMessageOperationWithFolder(folder: NSString) uid(uid: uint32_t) urgent(urgent: BOOL): MailCore.MailCore.MCOIMAPFetchParsedContentOperation;
    method fetchParsedMessageOperationWithFolder(folder: NSString) uid(uid: uint32_t): MailCore.MailCore.MCOIMAPFetchParsedContentOperation;
    method fetchParsedMessageOperationWithFolder(folder: NSString) number(number: uint32_t) urgent(urgent: BOOL): MailCore.MailCore.MCOIMAPFetchParsedContentOperation;
    method fetchParsedMessageOperationWithFolder(folder: NSString) number(number: uint32_t): MailCore.MailCore.MCOIMAPFetchParsedContentOperation;
    method fetchMessageAttachmentByUIDOperationWithFolder(folder: NSString) uid(uid: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MailCore.MCOEncoding) urgent(urgent: BOOL): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentByUIDOperationWithFolder(folder: NSString) uid(uid: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MailCore.MCOEncoding): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentOperationWithFolder(folder: NSString) uid(uid: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MailCore.MCOEncoding) urgent(urgent: BOOL): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentOperationWithFolder(folder: NSString) uid(uid: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MailCore.MCOEncoding): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentOperationWithFolder(folder: NSString) number(number: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MailCore.MCOEncoding) urgent(urgent: BOOL): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentOperationWithFolder(folder: NSString) number(number: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MailCore.MCOEncoding): MailCore.MailCore.MCOIMAPFetchContentOperation;
    method idleOperationWithFolder(folder: NSString) lastKnownUID(lastKnownUID: uint32_t): MailCore.MailCore.MCOIMAPIdleOperation;
    method fetchNamespaceOperation: MailCore.MailCore.MCOIMAPFetchNamespaceOperation;
    method identityOperationWithClientIdentity(identity: MailCore.MailCore.MCOIMAPIdentity): MailCore.MailCore.MCOIMAPIdentityOperation;
    method connectOperation: MailCore.MailCore.MCOIMAPOperation;
    method noopOperation: MailCore.MailCore.MCOIMAPOperation;
    method checkAccountOperation: MailCore.MailCore.MCOIMAPOperation;
    method capabilityOperation: MailCore.MailCore.MCOIMAPCapabilityOperation;
    method quotaOperation: MailCore.MailCore.MCOIMAPQuotaOperation;
    method searchOperationWithFolder(folder: NSString) kind(kind: MailCore.MailCore.MCOIMAPSearchKind) searchString(searchString: NSString): MailCore.MailCore.MCOIMAPSearchOperation;
    method searchExpressionOperationWithFolder(folder: NSString) expression(expression: MailCore.MailCore.MCOIMAPSearchExpression): MailCore.MailCore.MCOIMAPSearchOperation;
    method htmlRenderingOperationWithMessage(message: MailCore.MailCore.MCOIMAPMessage) folder(folder: NSString): MailCore.MailCore.MCOIMAPMessageRenderingOperation;
    method htmlBodyRenderingOperationWithMessage(message: MailCore.MailCore.MCOIMAPMessage) folder(folder: NSString): MailCore.MailCore.MCOIMAPMessageRenderingOperation;
    method plainTextRenderingOperationWithMessage(message: MailCore.MailCore.MCOIMAPMessage) folder(folder: NSString): MailCore.MailCore.MCOIMAPMessageRenderingOperation;
    method plainTextBodyRenderingOperationWithMessage(message: MailCore.MailCore.MCOIMAPMessage) folder(folder: NSString) stripWhitespace(stripWhitespace: BOOL): MailCore.MailCore.MCOIMAPMessageRenderingOperation;
    method plainTextBodyRenderingOperationWithMessage(message: MailCore.MailCore.MCOIMAPMessage) folder(folder: NSString): MailCore.MailCore.MCOIMAPMessageRenderingOperation;
    method disconnectOperation: MailCore.MailCore.MCOIMAPOperation;
  end;

  MailCore.MailCore.MCOOperation = public class(NSObject)
  public
    property isCancelled: BOOL read;
    property shouldRunWhenCancelled: BOOL read write;
    property callbackDispatchQueue: dispatch_queue_t read write;
    method operationCompleted;
    method cancel;
  end;

  MailCore.MailCore.MCOIMAPBaseOperationProgressBlock = public method (current: UInt32; maximum: UInt32);

  MailCore.MailCore.MCOIMAPBaseOperationItemProgressBlock = public method (current: UInt32);

  MailCore.MailCore.MCOIMAPBaseOperation = public class(MailCore.MailCore.MCOOperation)
  public
    property urgent: BOOL read write;
    method bodyProgress(current: UInt32) maximum(maximum: UInt32);
    method itemProgress(current: UInt32) maximum(maximum: UInt32);
  end;

  MailCore.MailCore.MCOIMAPOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MailCore.MCOIMAPFetchFoldersOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; folders: NSArray));
  end;

  MailCore.MailCore.MCOIMAPFolder = public class(NSObject)
  public
    property path: NSString read write;
    property delimiter: AnsiChar read write;
    property &flags: MailCore.MailCore.MCOIMAPFolderFlag read write;
  end;

  MailCore.MailCore.MCOIMAPMessage = public class(MailCore.MailCore.MCOAbstractMessage)
  public
    property uid: uint32_t read write;
    property sequenceNumber: uint32_t read write;
    property size: uint32_t read write;
    property &flags: MailCore.MailCore.MCOMessageFlag read write;
    property originalFlags: MailCore.MailCore.MCOMessageFlag read write;
    property customFlags: NSArray read write;
    property modSeqValue: uint64_t read write;
    property mainPart: MailCore.MailCore.MCOAbstractPart read write;
    property gmailLabels: NSArray read write;
    property gmailMessageID: uint64_t read write;
    property gmailThreadID: uint64_t read write;
    method partForPartID(partID: NSString): MailCore.MailCore.MCOAbstractPart;
    method htmlRenderingWithFolder(folder: NSString) &delegate(&delegate: MailCore.MailCore.IMCOHTMLRendererIMAPDelegate): NSString;
  end;

  MailCore.MailCore.MCOIMAPMessagePart = public class(MailCore.MailCore.MCOAbstractMessagePart)
  public
    property partID: NSString read write;
  end;

  MailCore.MailCore.MCOIMAPMultipart = public class(MailCore.MailCore.MCOAbstractMultipart)
  public
    property partID: NSString read write;
  end;

  MailCore.MailCore.MCOIMAPNamespace = public class(NSObject)
  public
    class method namespaceWithPrefix(prefix: NSString) delimiter(delimiter: AnsiChar): MailCore.MailCore.MCOIMAPNamespace;
    method mainPrefix: NSString;
    method mainDelimiter: AnsiChar;
    method prefixes: NSArray;
    method pathForComponents(components: NSArray): NSString;
    method pathForComponents(components: NSArray) prefix(prefix: NSString): NSString;
    method componentsFromPath(path: NSString): NSArray;
    method containsFolderPath(path: NSString): BOOL;
  end;

  MailCore.MailCore.MCOIMAPNamespaceItem = public class(NSObject)
  public
    property prefix: NSString read write;
    property delimiter: AnsiChar read write;
    method pathForComponents(components: NSArray): NSString;
    method componentsForPath(path: NSString): NSArray;
    method containsFolder(folder: NSString): BOOL;
  end;

  MailCore.MailCore.MCOIMAPIdentity = public class(NSObject)
  public
    class method identityWithVendor(vendor: NSString) name(name: NSString) version(version: NSString): MailCore.MailCore.MCOIMAPIdentity;
    property vendor: NSString read write;
    property name: NSString read write;
    property version: NSString read write;
    method allInfoKeys: NSArray;
    method infoForKey(key: NSString): NSString;
    method setInfo(value: NSString) forKey(key: NSString);
    method removeAllInfos;
  end;

  MailCore.MailCore.MCOIMAPPart = public class(MailCore.MailCore.MCOAbstractPart)
  public
    property partID: NSString read write;
    property size: UInt32 read write;
    property encoding: MailCore.MailCore.MCOEncoding read write;
    method decodedSize: UInt32;
  end;

  MailCore.MailCore.MCOIMAPFolderInfoOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; info: MailCore.MailCore.MCOIMAPFolderInfo));
  end;

  MailCore.MailCore.MCOIMAPFolderInfo = public class(NSObject)
  public
    class method info: MailCore.MailCore.MCOIMAPFolderInfo;
    property uidNext: uint32_t read write;
    property uidValidity: uint32_t read write;
    property modSequenceValue: uint64_t read write;
    property messageCount: Int32 read write;
    property firstUnseenUid: uint32_t read write;
    property allowsNewPermanentFlags: BOOL read write;
  end;

  MailCore.MailCore.MCOIMAPFolderStatusOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; status: MailCore.MailCore.MCOIMAPFolderStatus));
  end;

  MailCore.MailCore.MCOIMAPFolderStatus = public class(NSObject)
  public
    property uidNext: uint32_t read write;
    property uidValidity: uint32_t read write;
    property recentCount: uint32_t read write;
    property unseenCount: uint32_t read write;
    property messageCount: uint32_t read write;
    property highestModSeqValue: uint64_t read write;
  end;

  MailCore.MailCore.MCOIMAPAppendMessageOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    property date: time_t read write;
    property progress: MailCore.MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; createdUID: uint32_t));
  end;

  MailCore.MailCore.MCOIMAPCopyMessagesOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; uidMapping: NSDictionary));
  end;

  MailCore.MailCore.MCOIMAPFetchMessagesOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    property progress: MailCore.MailCore.MCOIMAPBaseOperationItemProgressBlock read write;
    property extraHeaders: NSArray read write;
    method start(completionBlock: method (error: NSError; messages: NSArray; vanishedMessages: MailCore.MailCore.MCOIndexSet));
  end;

  MailCore.MailCore.MCOIMAPFetchContentOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    property progress: MailCore.MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; data: NSData));
  end;

  MailCore.MailCore.MCOIMAPFetchParsedContentOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    property progress: MailCore.MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; parser: MailCore.MailCore.MCOMessageParser));
  end;

  MailCore.MailCore.MCOIMAPSearchOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; searchResult: MailCore.MailCore.MCOIndexSet));
  end;

  MailCore.MailCore.MCOIMAPIdleOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method interruptIdle;
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MailCore.MCOIMAPFetchNamespaceOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; namespaces: NSDictionary));
  end;

  MailCore.MailCore.MCOIMAPIdentityOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; serverIdentity: NSDictionary));
  end;

  MailCore.MailCore.MCOIMAPCapabilityOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; capabilities: MailCore.MailCore.MCOIndexSet));
  end;

  MailCore.MailCore.MCOIMAPQuotaOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; usage: NSUInteger; limit: NSUInteger));
  end;

  MailCore.MailCore.MCORange = public record
  public
    var location: uint64_t;
    var length: uint64_t;
  end;

  MailCore.MailCore.MCOIndexSet = public class(NSObject)
  public
    class method indexSet: MailCore.MailCore.MCOIndexSet;
    class method indexSetWithRange(range: MailCore.MailCore.MCORange): MailCore.MailCore.MCOIndexSet;
    class method indexSetWithIndex(idx: uint64_t): MailCore.MailCore.MCOIndexSet;
    method count: UInt32;
    method addIndex(idx: uint64_t);
    method removeIndex(idx: uint64_t);
    method containsIndex(idx: uint64_t): BOOL;
    method addRange(range: MailCore.MailCore.MCORange);
    method removeRange(range: MailCore.MailCore.MCORange);
    method intersectsRange(range: MailCore.MailCore.MCORange);
    method addIndexSet(indexSet: MailCore.MailCore.MCOIndexSet);
    method removeIndexSet(indexSet: MailCore.MailCore.MCOIndexSet);
    method intersectsIndexSet(indexSet: MailCore.MailCore.MCOIndexSet);
    method allRanges: ^MailCore.MailCore.MCORange;
    method rangesCount: UInt32;
    method enumerateIndexes(&block: method (idx: uint64_t));
    method nsIndexSet: NSIndexSet;
  end;

  MailCore.MailCore.MCOIMAPSearchExpression = public class(NSObject)
  public
    class method searchAll: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchFrom(value: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchRecipient(value: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchTo(value: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchCc(value: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchBcc(value: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchSubject(value: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchContent(value: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchBody(value: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchUIDs(uids: MailCore.MailCore.MCOIndexSet): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchHeader(header: NSString) value(value: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchRead: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchUnread: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchFlagged: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchUnflagged: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchAnswered: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchUnanswered: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchDraft: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchUndraft: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchDeleted: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchSpam: MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchBeforeDate(date: NSDate): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchOnDate(date: NSDate): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchSinceDate(date: NSDate): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchBeforeReceivedDate(date: NSDate): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchOnReceivedDate(date: NSDate): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchSinceReceivedDate(date: NSDate): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchSizeLargerThan(size: uint32_t): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchSizeSmallerThan(size: uint32_t): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchGmailThreadID(number: uint64_t): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchGmailMessageID(number: uint64_t): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchGmailRaw(expr: NSString): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchAnd(expression: MailCore.MailCore.MCOIMAPSearchExpression) other(other: MailCore.MailCore.MCOIMAPSearchExpression): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchOr(expression: MailCore.MailCore.MCOIMAPSearchExpression) other(other: MailCore.MailCore.MCOIMAPSearchExpression): MailCore.MailCore.MCOIMAPSearchExpression;
    class method searchNot(expression: MailCore.MailCore.MCOIMAPSearchExpression): MailCore.MailCore.MCOIMAPSearchExpression;
  end;

  MailCore.MailCore.MCOIMAPMessageRenderingOperation = public class(MailCore.MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (htmlString: NSString; error: NSError));
  end;

  MailCore.MailCore.MCOMailProvider = public class(NSObject)
  public
    property identifier: NSString read write;
    method initWithInfo(info: NSDictionary): id;
    method imapServices: NSArray;
    method smtpServices: NSArray;
    method popServices: NSArray;
    method matchEmail(email: NSString): BOOL;
    method matchMX(hostname: NSString): BOOL;
    method sentMailFolderPath: NSString;
    method starredFolderPath: NSString;
    method allMailFolderPath: NSString;
    method trashFolderPath: NSString;
    method draftsFolderPath: NSString;
    method spamFolderPath: NSString;
    method importantFolderPath: NSString;
  end;

  MailCore.MailCore.MCOMailProvidersManager = public class(NSObject)
  public
    class method sharedManager: MailCore.MailCore.MCOMailProvidersManager;
    method providerForEmail(email: NSString): MailCore.MailCore.MCOMailProvider;
    method providerForMX(hostname: NSString): MailCore.MailCore.MCOMailProvider;
    method providerForIdentifier(identifier: NSString): MailCore.MailCore.MCOMailProvider;
    method registerProvidersWithFilename(filename: NSString);
  end;

  MailCore.MailCore.MCOMessageBuilder = public class(MailCore.MailCore.MCOAbstractMessage)
  public
    property htmlBody: NSString read write;
    property textBody: NSString read write;
    property attachments: NSArray read write;
    property relatedAttachments: NSArray read write;
    property boundaryPrefix: NSString read write;
    method addAttachment(attachment: MailCore.MailCore.MCOAttachment);
    method addRelatedAttachment(attachment: MailCore.MailCore.MCOAttachment);
    method data: NSData;
    method dataForEncryption: NSData;
    method openPGPSignedMessageDataWithSignatureData(signature: NSData): NSData;
    method openPGPEncryptedMessageDataWithEncryptedData(encryptedData: NSData): NSData;
    method htmlRenderingWithDelegate(&delegate: MailCore.MailCore.IMCOHTMLRendererDelegate): NSString;
    method htmlBodyRendering: NSString;
    method plainTextRendering: NSString;
    method plainTextBodyRendering: NSString;
    method plainTextBodyRenderingAndStripWhitespace(stripWhitespace: BOOL): NSString;
  end;

  MailCore.MailCore.MCOMessageParser = public class(MailCore.MailCore.MCOAbstractMessage)
  public
    class method messageParserWithData(data: NSData): MailCore.MailCore.MCOMessageParser;
    method initWithData(data: NSData): id;
    method dealloc;
    method mainPart: MailCore.MailCore.MCOAbstractPart;
    method data: NSData;
    method htmlRenderingWithDelegate(&delegate: MailCore.MailCore.IMCOHTMLRendererDelegate): NSString;
    method htmlBodyRendering: NSString;
    method plainTextRendering: NSString;
    method plainTextBodyRendering: NSString;
    method plainTextBodyRenderingAndStripWhitespace(stripWhitespace: BOOL): NSString;
  end;

  MailCore.MailCore.MCOMessagePart = public class(MailCore.MailCore.MCOAbstractMessagePart);

  MailCore.MailCore.MCOMultipart = public class(MailCore.MailCore.MCOAbstractMultipart);

  MailCore.MailCore.MCONNTPSession = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property username: NSString read write;
    property password: NSString read write;
    property connectionType: MailCore.MailCore.MCOConnectionType read write;
    property timeout: NSTimeInterval read write;
    property checkCertificateEnabled: BOOL read write;
    property connectionLogger: MailCore.MailCore.MCOConnectionLogger read write;
    property dispatchQueue: dispatch_queue_t read write;
    property operationQueueRunning: BOOL read;
    property operationQueueRunningChangeBlock: MailCore.MailCore.MCOOperationQueueRunningChangeBlock read write;
    method cancelAllOperations;
    method fetchAllArticlesOperation(&group: NSString): MailCore.MailCore.MCONNTPFetchAllArticlesOperation;
    method fetchHeaderOperationWithIndex(&index: UInt32) inGroup(&group: NSString): MailCore.MailCore.MCONNTPFetchHeaderOperation;
    method fetchOverviewOperationWithIndexes(indexes: MailCore.MailCore.MCOIndexSet) inGroup(&group: NSString): MailCore.MailCore.MCONNTPFetchOverviewOperation;
    method fetchArticleOperationWithIndex(&index: UInt32) inGroup(&group: NSString): MailCore.MailCore.MCONNTPFetchArticleOperation;
    method fetchArticleOperationWithMessageID(messageID: NSString) inGroup(&group: NSString): MailCore.MailCore.MCONNTPFetchArticleOperation;
    method fetchServerDateOperation: MailCore.MailCore.MCONNTPFetchServerTimeOperation;
    method listAllNewsgroupsOperation: MailCore.MailCore.MCONNTPListNewsgroupsOperation;
    method listDefaultNewsgroupsOperation: MailCore.MailCore.MCONNTPListNewsgroupsOperation;
    method disconnectOperation: MailCore.MailCore.MCONNTPOperation;
    method checkAccountOperation: MailCore.MailCore.MCONNTPOperation;
  end;

  MailCore.MailCore.MCONNTPOperation = public class(MailCore.MailCore.MCOOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MailCore.MCONNTPFetchHeaderOperation = public class(MailCore.MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; header: MailCore.MailCore.MCOMessageHeader));
  end;

  MailCore.MailCore.MCONNTPOperationProgressBlock = public method (current: UInt32; maximum: UInt32);

  MailCore.MailCore.MCONNTPFetchArticleOperation = public class(MailCore.MailCore.MCONNTPOperation)
  public
    property progress: MailCore.MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; messageData: NSData));
  end;

  MailCore.MailCore.MCONNTPFetchAllArticlesOperation = public class(MailCore.MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; articles: MailCore.MailCore.MCOIndexSet));
  end;

  MailCore.MailCore.MCONNTPListNewsgroupsOperation = public class(MailCore.MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; messages: NSArray));
  end;

  MailCore.MailCore.MCONNTPFetchOverviewOperation = public class(MailCore.MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; messages: NSArray));
  end;

  MailCore.MailCore.MCONNTPFetchServerTimeOperation = public class(MailCore.MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; date: NSDate));
  end;

  MailCore.MailCore.MCONNTPGroupInfo = public class(NSObject)
  public
    property name: NSString read write;
    property messageCount: UInt32 read write;
  end;

  MailCore.MailCore.MCONNTPDisconnectOperation = public class(NSObject);

  MailCore.MailCore.MCONetService = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property connectionType: MailCore.MailCore.MCOConnectionType read write;
    class method serviceWithInfo(info: NSDictionary): MailCore.MailCore.MCONetService;
    method initWithInfo(info: NSDictionary): id;
    method info: NSDictionary;
    method hostnameWithEmail(email: NSString): NSString;
  end;

  MailCore.MailCore.MCOObjectWrapper = public class(NSObject);

  MailCore.MailCore.MCOPOPSession = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property username: NSString read write;
    property password: NSString read write;
    property authType: MailCore.MailCore.MCOAuthType read write;
    property connectionType: MailCore.MailCore.MCOConnectionType read write;
    property timeout: NSTimeInterval read write;
    property checkCertificateEnabled: BOOL read write;
    property connectionLogger: MailCore.MailCore.MCOConnectionLogger read write;
    property dispatchQueue: dispatch_queue_t read write;
    property operationQueueRunning: BOOL read;
    property operationQueueRunningChangeBlock: MailCore.MailCore.MCOOperationQueueRunningChangeBlock read write;
    method cancelAllOperations;
    method fetchMessagesOperation: MailCore.MailCore.MCOPOPFetchMessagesOperation;
    method fetchHeaderOperationWithIndex(&index: UInt32): MailCore.MailCore.MCOPOPFetchHeaderOperation;
    method fetchMessageOperationWithIndex(&index: UInt32): MailCore.MailCore.MCOPOPFetchMessageOperation;
    method deleteMessagesOperationWithIndexes(indexes: MailCore.MailCore.MCOIndexSet): MailCore.MailCore.MCOPOPOperation;
    method disconnectOperation: MailCore.MailCore.MCOPOPOperation;
    method checkAccountOperation: MailCore.MailCore.MCOPOPOperation;
    method noopOperation: MailCore.MailCore.MCOPOPOperation;
  end;

  MailCore.MailCore.MCOPOPOperation = public class(MailCore.MailCore.MCOOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MailCore.MCOPOPFetchHeaderOperation = public class(MailCore.MailCore.MCOPOPOperation)
  public
    method start(completionBlock: method (error: NSError; header: MailCore.MailCore.MCOMessageHeader));
  end;

  MailCore.MailCore.MCOPOPOperationProgressBlock = public method (current: UInt32; maximum: UInt32);

  MailCore.MailCore.MCOPOPFetchMessageOperation = public class(MailCore.MailCore.MCOPOPOperation)
  public
    property progress: MailCore.MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; messageData: NSData));
  end;

  MailCore.MailCore.MCOPOPFetchMessagesOperation = public class(MailCore.MailCore.MCOPOPOperation)
  public
    method start(completionBlock: method (error: NSError; messages: NSArray));
  end;

  MailCore.MailCore.MCOPOPMessageInfo = public class(NSObject)
  public
    property &index: UInt32 read write;
    property size: UInt32 read write;
    property uid: NSString read write;
  end;

  MailCore.MailCore.MCOPOPNoopOperation = public class(MailCore.MailCore.MCOPOPOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MailCore.MCOSMTPSession = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property username: NSString read write;
    property password: NSString read write;
    property OAuth2Token: NSString read write;
    property authType: MailCore.MailCore.MCOAuthType read write;
    property connectionType: MailCore.MailCore.MCOConnectionType read write;
    property timeout: NSTimeInterval read write;
    property checkCertificateEnabled: BOOL read write;
    property useHeloIPEnabled: BOOL read write;
    property connectionLogger: MailCore.MailCore.MCOConnectionLogger read write;
    property dispatchQueue: dispatch_queue_t read write;
    property operationQueueRunning: BOOL read;
    property operationQueueRunningChangeBlock: MailCore.MailCore.MCOOperationQueueRunningChangeBlock read write;
    method cancelAllOperations;
    method loginOperation: MailCore.MailCore.MCOSMTPOperation;
    method sendOperationWithData(messageData: NSData): MailCore.MailCore.MCOSMTPSendOperation;
    method sendOperationWithData(messageData: NSData) &from(&from: MailCore.MailCore.MCOAddress) recipients(recipients: NSArray): MailCore.MailCore.MCOSMTPSendOperation;
    method checkAccountOperationWithFrom(&from: MailCore.MailCore.MCOAddress): MailCore.MailCore.MCOSMTPOperation;
    method noopOperation: MailCore.MailCore.MCOSMTPOperation;
  end;

  MailCore.MailCore.MCOSMTPOperation = public class(MailCore.MailCore.MCOOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MailCore.MCOSMTPOperationProgressBlock = public method (current: UInt32; maximum: UInt32);

  MailCore.MailCore.MCOSMTPSendOperation = public class(MailCore.MailCore.MCOSMTPOperation)
  public
    property progress: MailCore.MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MailCore.MCOSMTPLoginOperation = public class(MailCore.MailCore.MCOSMTPOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  //  Extension methods for MailCore.MailCore.NSString_MCOCategory
  extension method NSString.mco_flattenHTML: NSString;
  extension method NSString.mco_flattenHTMLAndShowBlockquote(showBlockquote: BOOL): NSString;
  extension method NSString.mco_flattenHTMLAndShowBlockquote(showBlockquote: BOOL) showLink(showLink: BOOL): NSString;
  extension method NSString.mco_htmlEncodedString: NSString;
  extension method NSString.mco_cleanedHTMLString: NSString;
  extension method NSString.mco_strippedWhitespace: NSString;

  //  Extension methods for MailCore.MailCore.NSIndexSet_MCOCategory
  extension method NSIndexSet.mcoIndexSet: MailCore.MailCore.MCOIndexSet;

implementation

end.
