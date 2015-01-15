//  Import of libMailCore ()
//  Frameworks:
//  Targets: x86_64
//  Dep fx:rtl, Foundation
//  Dep libs:MailCore, ctemplate, etpan, uchardet, xml2, sasl2, iconv, tidy, crypto, ssl, z, c++
namespace ;

interface

type
  MailCore.UChar = public UChar;

  MailCore.__Global = public class
  public
    class var MCLogEnabled: Int32;
    class method MCLogInternal(user: ^AnsiChar; filename: ^AnsiChar; line: UInt32; dumpStack: Int32; format: ^AnsiChar; params Param5: uint16_t);
    class method MCAssertInternal(filename: ^AnsiChar; line: UInt32; cond: Int32; condString: ^AnsiChar);
    class var MCORangeEmpty: MailCore.MCORange;
    class method MCORangeMake(location: uint64_t; length: uint64_t): MailCore.MCORange;
    class method MCORangeRemoveRange(range1: MailCore.MCORange; range2: MailCore.MCORange): MailCore.MCOIndexSet;
    class method MCORangeUnion(range1: MailCore.MCORange; range2: MailCore.MCORange): MailCore.MCOIndexSet;
    class method MCORangeIntersection(range1: MailCore.MCORange; range2: MailCore.MCORange): MailCore.MCORange;
    class method MCORangeHasIntersection(range1: MailCore.MCORange; range2: MailCore.MCORange): BOOL;
    class method MCORangeLeftBound(range: MailCore.MCORange): uint64_t;
    class method MCORangeRightBound(range: MailCore.MCORange): uint64_t;
    class method MCORangeToString(range: MailCore.MCORange): NSString;
    class method MCORangeFromString(rangeString: NSString): MailCore.MCORange;
    class const MCOIMAPNamespacePersonal: Void;
    class const MCOIMAPNamespaceOther: Void;
    class const MCOIMAPNamespaceShared: Void;
    class const MCOErrorDomain: Void;
    class method MCO_NATIVE_INSTANCE: uint16_t;
  end;

  MailCore.mailimap = public mailimap;

  MailCore.mailpop3 = public mailpop3;

  MailCore.mailsmtp = public mailsmtp;

  MailCore.newsnntp = public newsnntp;

  MailCore.UDateFormat = public UDateFormat;

  MailCore.MCOAbstractMessage = public class(NSObject)
  public
    property header: MailCore.MCOMessageHeader read write;
    method partForContentID(contentID: NSString): MailCore.MCOAbstractPart;
    method partForUniqueID(uniqueID: NSString): MailCore.MCOAbstractPart;
    method attachments: NSArray;
    method htmlInlineAttachments: NSArray;
    method requiredPartsForRendering: NSArray;
  end;

  MailCore.MCOPartType = public enum (
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

  MailCore.MCOAbstractPart = public class(NSObject)
  public
    property partType: MailCore.MCOPartType read write;
    property filename: NSString read write;
    property mimeType: NSString read write;
    property charset: NSString read write;
    property uniqueID: NSString read write;
    property contentID: NSString read write;
    property contentLocation: NSString read write;
    property contentDescription: NSString read write;
    property inlineAttachment: BOOL read write;
    method partForContentID(contentID: NSString): MailCore.MCOAbstractPart;
    method partForUniqueID(uniqueID: NSString): MailCore.MCOAbstractPart;
    method decodedStringForData(data: NSData): NSString;
    method setContentTypeParameterValue(value: NSString) forName(name: NSString);
    method removeContentTypeParameterForName(name: NSString);
    method contentTypeParameterValueForName(name: NSString): NSString;
    method allContentTypeParametersNames: NSArray;
  end;

  MailCore.MCOAbstractMessagePart = public class(MailCore.MCOAbstractPart)
  public
    property header: MailCore.MCOMessageHeader read write;
    property mainPart: MailCore.MCOAbstractPart read write;
  end;

  MailCore.MCOAbstractMultipart = public class(MailCore.MCOAbstractPart)
  public
    property parts: NSArray read write;
  end;

  MailCore.MCOAddress = public class(NSObject)
  public
    class method addressWithDisplayName(displayName: NSString) mailbox(mailbox: NSString): MailCore.MCOAddress;
    class method addressWithMailbox(mailbox: NSString): MailCore.MCOAddress;
    class method addressWithRFC822String(RFC822String: NSString): MailCore.MCOAddress;
    class method addressWithNonEncodedRFC822String(nonEncodedRFC822String: NSString): MailCore.MCOAddress;
    class method addressesWithRFC822String(string: NSString): NSArray;
    class method addressesWithNonEncodedRFC822String(string: NSString): NSArray;
    property displayName: NSString read write;
    property mailbox: NSString read write;
    method RFC822String: NSString;
    method nonEncodedRFC822String: NSString;
  end;

  //  Extension methods for MailCore.MCOAddressCategory
  extension method NSArray.mco_RFC822StringForAddresses: NSString;
  extension method NSArray.mco_nonEncodedRFC822StringForAddresses: NSString;

type
  MailCore.MCOConnectionType = public enum (
    MCOConnectionTypeClear,
    Clear,
    MCOConnectionTypeStartTLS,
    StartTLS,
    MCOConnectionTypeTLS,
    TLS
  );

  MailCore.MCOAuthType = public enum (
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

  MailCore.MCOIMAPFolderFlag = public enum (
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

  MailCore.MCOMessageFlag = public enum (
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

  MailCore.MCOEncoding = public enum (
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

  MailCore.MCOIMAPMessagesRequestKind = public enum (
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

  MailCore.MCOIMAPStoreFlagsRequestKind = public enum (
    MCOIMAPStoreFlagsRequestKindAdd,
    &Add,
    MCOIMAPStoreFlagsRequestKindRemove,
    &Remove,
    MCOIMAPStoreFlagsRequestKindSet,
    &Set
  );

  MailCore.MCOIMAPSearchKind = public enum (
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

  MailCore.MCOIMAPCapability = public enum (
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

  MailCore.MCOErrorCode = public enum (
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

  MailCore.MCOConnectionLogType = public enum (
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

  MailCore.MCOConnectionLogger = public method (connectionID: ^Void; &type: MailCore.MCOConnectionLogType; data: NSData);

  MailCore.MCOOperationQueueRunningChangeBlock = public method ;

  MailCore.MCOMessageHeader = public class(NSObject)
  public
    property messageID: NSString read write;
    property messageIDAutoGenerated: BOOL read;
    property references: NSArray read write;
    property inReplyTo: NSArray read write;
    property date: NSDate read write;
    property receivedDate: NSDate read write;
    property sender: MailCore.MCOAddress read write;
    property &from: MailCore.MCOAddress read write;
    property &to: NSArray read write;
    property cc: NSArray read write;
    property bcc: NSArray read write;
    property replyTo: NSArray read write;
    property subject: NSString read write;
    property userAgent: NSString read write;
    class method headerWithData(data: NSData): MailCore.MCOMessageHeader;
    method initWithData(data: NSData): id;
    method setExtraHeaderValue(value: NSString) forName(name: NSString);
    method removeExtraHeaderForName(name: NSString);
    method extraHeaderValueForName(name: NSString): NSString;
    method allExtraHeadersNames: NSArray;
    method extractedSubject: NSString;
    method partialExtractedSubject: NSString;
    method importHeadersData(data: NSData);
    method replyHeaderWithExcludedRecipients(excludedRecipients: NSArray): MailCore.MCOMessageHeader;
    method replyAllHeaderWithExcludedRecipients(excludedRecipients: NSArray): MailCore.MCOMessageHeader;
    method forwardHeader: MailCore.MCOMessageHeader;
  end;

  MailCore.IMCOHTMLRendererDelegate = public interface
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) canPreviewPart(part: MailCore.MCOAbstractPart): BOOL;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) shouldShowPart(part: MailCore.MCOAbstractPart): BOOL;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) templateValuesForHeader(header: MailCore.MCOMessageHeader): NSDictionary;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) templateValuesForPart(part: MailCore.MCOAbstractPart): NSDictionary;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) templateForMainHeader(header: MailCore.MCOMessageHeader): NSString;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) templateForImage(header: MailCore.MCOAbstractPart): NSString;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) templateForAttachment(part: MailCore.MCOAbstractPart): NSString;
    method MCOAbstractMessage_templateForMessage(msg: MailCore.MCOAbstractMessage): NSString;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) templateForEmbeddedMessage(part: MailCore.MCOAbstractMessagePart): NSString;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) templateForEmbeddedMessageHeader(header: MailCore.MCOMessageHeader): NSString;
    method MCOAbstractMessage_templateForAttachmentSeparator(msg: MailCore.MCOAbstractMessage): NSString;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) cleanHTMLForPart(html: NSString): NSString;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) filterHTMLForPart(html: NSString): NSString;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) filterHTMLForMessage(html: NSString): NSString;
  end;

  MailCore.IMCOHTMLRendererIMAPDelegate = public interface
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) dataForIMAPPart(part: MailCore.MCOIMAPPart) folder(folder: NSString): NSData;
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) prefetchAttachmentIMAPPart(part: MailCore.MCOIMAPPart) folder(folder: NSString);
    method MCOAbstractMessage(msg: MailCore.MCOAbstractMessage) prefetchImageIMAPPart(part: MailCore.MCOIMAPPart) folder(folder: NSString);
  end;

  MailCore.MCOAttachment = public class(MailCore.MCOAbstractPart)
  public
    class method mimeTypeForFilename(filename: NSString): NSString;
    class method attachmentWithContentsOfFile(filename: NSString): MailCore.MCOAttachment;
    class method attachmentWithData(data: NSData) filename(filename: NSString): MailCore.MCOAttachment;
    class method attachmentWithHTMLString(htmlString: NSString): MailCore.MCOAttachment;
    class method attachmentWithRFC822Message(messageData: NSData): MailCore.MCOAttachment;
    class method attachmentWithText(text: NSString): MailCore.MCOAttachment;
    property data: NSData read write;
    method decodedString: NSString;
  end;

  MailCore.MCOIMAPSession = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property username: NSString read write;
    property password: NSString read write;
    property OAuth2Token: NSString read write;
    property authType: MailCore.MCOAuthType read write;
    property connectionType: MailCore.MCOConnectionType read write;
    property timeout: NSTimeInterval read write;
    property checkCertificateEnabled: BOOL read write;
    property voIPEnabled: BOOL read write;
    property defaultNamespace: MailCore.MCOIMAPNamespace read write;
    property clientIdentity: MailCore.MCOIMAPIdentity read;
    property serverIdentity: MailCore.MCOIMAPIdentity read;
    property gmailUserDisplayName: NSString read;
    property allowsFolderConcurrentAccessEnabled: BOOL read write;
    property maximumConnections: UInt32 read write;
    property connectionLogger: MailCore.MCOConnectionLogger read write;
    property dispatchQueue: dispatch_queue_t read write;
    property operationQueueRunning: BOOL read;
    property operationQueueRunningChangeBlock: MailCore.MCOOperationQueueRunningChangeBlock read write;
    method cancelAllOperations;
    method folderInfoOperation(folder: NSString): MailCore.MCOIMAPFolderInfoOperation;
    method folderStatusOperation(folder: NSString): MailCore.MCOIMAPFolderStatusOperation;
    method fetchSubscribedFoldersOperation: MailCore.MCOIMAPFetchFoldersOperation;
    method fetchAllFoldersOperation: MailCore.MCOIMAPFetchFoldersOperation;
    method renameFolderOperation(folder: NSString) otherName(otherName: NSString): MailCore.MCOIMAPOperation;
    method deleteFolderOperation(folder: NSString): MailCore.MCOIMAPOperation;
    method createFolderOperation(folder: NSString): MailCore.MCOIMAPOperation;
    method subscribeFolderOperation(folder: NSString): MailCore.MCOIMAPOperation;
    method unsubscribeFolderOperation(folder: NSString): MailCore.MCOIMAPOperation;
    method expungeOperation(folder: NSString): MailCore.MCOIMAPOperation;
    method appendMessageOperationWithFolder(folder: NSString) messageData(messageData: NSData) &flags(&flags: MailCore.MCOMessageFlag): MailCore.MCOIMAPAppendMessageOperation;
    method appendMessageOperationWithFolder(folder: NSString) messageData(messageData: NSData) &flags(&flags: MailCore.MCOMessageFlag) customFlags(customFlags: NSArray): MailCore.MCOIMAPAppendMessageOperation;
    method copyMessagesOperationWithFolder(folder: NSString) uids(uids: MailCore.MCOIndexSet) destFolder(destFolder: NSString): MailCore.MCOIMAPCopyMessagesOperation;
    method storeFlagsOperationWithFolder(folder: NSString) uids(uids: MailCore.MCOIndexSet) kind(kind: MailCore.MCOIMAPStoreFlagsRequestKind) &flags(&flags: MailCore.MCOMessageFlag): MailCore.MCOIMAPOperation;
    method storeFlagsOperationWithFolder(folder: NSString) numbers(numbers: MailCore.MCOIndexSet) kind(kind: MailCore.MCOIMAPStoreFlagsRequestKind) &flags(&flags: MailCore.MCOMessageFlag): MailCore.MCOIMAPOperation;
    method storeFlagsOperationWithFolder(folder: NSString) uids(uids: MailCore.MCOIndexSet) kind(kind: MailCore.MCOIMAPStoreFlagsRequestKind) &flags(&flags: MailCore.MCOMessageFlag) customFlags(customFlags: NSArray): MailCore.MCOIMAPOperation;
    method storeFlagsOperationWithFolder(folder: NSString) numbers(numbers: MailCore.MCOIndexSet) kind(kind: MailCore.MCOIMAPStoreFlagsRequestKind) &flags(&flags: MailCore.MCOMessageFlag) customFlags(customFlags: NSArray): MailCore.MCOIMAPOperation;
    method storeLabelsOperationWithFolder(folder: NSString) numbers(numbers: MailCore.MCOIndexSet) kind(kind: MailCore.MCOIMAPStoreFlagsRequestKind) labels(labels: NSArray): MailCore.MCOIMAPOperation;
    method storeLabelsOperationWithFolder(folder: NSString) uids(uids: MailCore.MCOIndexSet) kind(kind: MailCore.MCOIMAPStoreFlagsRequestKind) labels(labels: NSArray): MailCore.MCOIMAPOperation;
    method fetchMessagesByUIDOperationWithFolder(folder: NSString) requestKind(requestKind: MailCore.MCOIMAPMessagesRequestKind) uids(uids: MailCore.MCOIndexSet): MailCore.MCOIMAPFetchMessagesOperation;
    method fetchMessagesOperationWithFolder(folder: NSString) requestKind(requestKind: MailCore.MCOIMAPMessagesRequestKind) uids(uids: MailCore.MCOIndexSet): MailCore.MCOIMAPFetchMessagesOperation;
    method fetchMessagesByNumberOperationWithFolder(folder: NSString) requestKind(requestKind: MailCore.MCOIMAPMessagesRequestKind) numbers(numbers: MailCore.MCOIndexSet): MailCore.MCOIMAPFetchMessagesOperation;
    method syncMessagesByUIDWithFolder(folder: NSString) requestKind(requestKind: MailCore.MCOIMAPMessagesRequestKind) uids(uids: MailCore.MCOIndexSet) modSeq(modSeq: uint64_t): MailCore.MCOIMAPFetchMessagesOperation;
    method syncMessagesWithFolder(folder: NSString) requestKind(requestKind: MailCore.MCOIMAPMessagesRequestKind) uids(uids: MailCore.MCOIndexSet) modSeq(modSeq: uint64_t): MailCore.MCOIMAPFetchMessagesOperation;
    method fetchMessageByUIDOperationWithFolder(folder: NSString) uid(uid: uint32_t) urgent(urgent: BOOL): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageByUIDOperationWithFolder(folder: NSString) uid(uid: uint32_t): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageOperationWithFolder(folder: NSString) uid(uid: uint32_t) urgent(urgent: BOOL): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageOperationWithFolder(folder: NSString) uid(uid: uint32_t): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageOperationWithFolder(folder: NSString) number(number: uint32_t) urgent(urgent: BOOL): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageOperationWithFolder(folder: NSString) number(number: uint32_t): MailCore.MCOIMAPFetchContentOperation;
    method fetchParsedMessageOperationWithFolder(folder: NSString) uid(uid: uint32_t) urgent(urgent: BOOL): MailCore.MCOIMAPFetchParsedContentOperation;
    method fetchParsedMessageOperationWithFolder(folder: NSString) uid(uid: uint32_t): MailCore.MCOIMAPFetchParsedContentOperation;
    method fetchParsedMessageOperationWithFolder(folder: NSString) number(number: uint32_t) urgent(urgent: BOOL): MailCore.MCOIMAPFetchParsedContentOperation;
    method fetchParsedMessageOperationWithFolder(folder: NSString) number(number: uint32_t): MailCore.MCOIMAPFetchParsedContentOperation;
    method fetchMessageAttachmentByUIDOperationWithFolder(folder: NSString) uid(uid: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MCOEncoding) urgent(urgent: BOOL): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentByUIDOperationWithFolder(folder: NSString) uid(uid: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MCOEncoding): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentOperationWithFolder(folder: NSString) uid(uid: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MCOEncoding) urgent(urgent: BOOL): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentOperationWithFolder(folder: NSString) uid(uid: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MCOEncoding): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentOperationWithFolder(folder: NSString) number(number: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MCOEncoding) urgent(urgent: BOOL): MailCore.MCOIMAPFetchContentOperation;
    method fetchMessageAttachmentOperationWithFolder(folder: NSString) number(number: uint32_t) partID(partID: NSString) encoding(encoding: MailCore.MCOEncoding): MailCore.MCOIMAPFetchContentOperation;
    method idleOperationWithFolder(folder: NSString) lastKnownUID(lastKnownUID: uint32_t): MailCore.MCOIMAPIdleOperation;
    method fetchNamespaceOperation: MailCore.MCOIMAPFetchNamespaceOperation;
    method identityOperationWithClientIdentity(identity: MailCore.MCOIMAPIdentity): MailCore.MCOIMAPIdentityOperation;
    method connectOperation: MailCore.MCOIMAPOperation;
    method noopOperation: MailCore.MCOIMAPOperation;
    method checkAccountOperation: MailCore.MCOIMAPOperation;
    method capabilityOperation: MailCore.MCOIMAPCapabilityOperation;
    method quotaOperation: MailCore.MCOIMAPQuotaOperation;
    method searchOperationWithFolder(folder: NSString) kind(kind: MailCore.MCOIMAPSearchKind) searchString(searchString: NSString): MailCore.MCOIMAPSearchOperation;
    method searchExpressionOperationWithFolder(folder: NSString) expression(expression: MailCore.MCOIMAPSearchExpression): MailCore.MCOIMAPSearchOperation;
    method htmlRenderingOperationWithMessage(message: MailCore.MCOIMAPMessage) folder(folder: NSString): MailCore.MCOIMAPMessageRenderingOperation;
    method htmlBodyRenderingOperationWithMessage(message: MailCore.MCOIMAPMessage) folder(folder: NSString): MailCore.MCOIMAPMessageRenderingOperation;
    method plainTextRenderingOperationWithMessage(message: MailCore.MCOIMAPMessage) folder(folder: NSString): MailCore.MCOIMAPMessageRenderingOperation;
    method plainTextBodyRenderingOperationWithMessage(message: MailCore.MCOIMAPMessage) folder(folder: NSString) stripWhitespace(stripWhitespace: BOOL): MailCore.MCOIMAPMessageRenderingOperation;
    method plainTextBodyRenderingOperationWithMessage(message: MailCore.MCOIMAPMessage) folder(folder: NSString): MailCore.MCOIMAPMessageRenderingOperation;
    method disconnectOperation: MailCore.MCOIMAPOperation;
  end;

  MailCore.MCOOperation = public class(NSObject)
  public
    property isCancelled: BOOL read;
    property shouldRunWhenCancelled: BOOL read write;
    property callbackDispatchQueue: dispatch_queue_t read write;
    method operationCompleted;
    method cancel;
  end;

  MailCore.MCOIMAPBaseOperationProgressBlock = public method (current: UInt32; maximum: UInt32);

  MailCore.MCOIMAPBaseOperationItemProgressBlock = public method (current: UInt32);

  MailCore.MCOIMAPBaseOperation = public class(MailCore.MCOOperation)
  public
    property urgent: BOOL read write;
    method bodyProgress(current: UInt32) maximum(maximum: UInt32);
    method itemProgress(current: UInt32) maximum(maximum: UInt32);
  end;

  MailCore.MCOIMAPOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MCOIMAPFetchFoldersOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; folders: NSArray));
  end;

  MailCore.MCOIMAPFolder = public class(NSObject)
  public
    property path: NSString read write;
    property delimiter: AnsiChar read write;
    property &flags: MailCore.MCOIMAPFolderFlag read write;
  end;

  MailCore.MCOIMAPMessage = public class(MailCore.MCOAbstractMessage)
  public
    property uid: uint32_t read write;
    property sequenceNumber: uint32_t read write;
    property size: uint32_t read write;
    property &flags: MailCore.MCOMessageFlag read write;
    property originalFlags: MailCore.MCOMessageFlag read write;
    property customFlags: NSArray read write;
    property modSeqValue: uint64_t read write;
    property mainPart: MailCore.MCOAbstractPart read write;
    property gmailLabels: NSArray read write;
    property gmailMessageID: uint64_t read write;
    property gmailThreadID: uint64_t read write;
    method partForPartID(partID: NSString): MailCore.MCOAbstractPart;
    method htmlRenderingWithFolder(folder: NSString) &delegate(&delegate: MailCore.IMCOHTMLRendererIMAPDelegate): NSString;
  end;

  MailCore.MCOIMAPMessagePart = public class(MailCore.MCOAbstractMessagePart)
  public
    property partID: NSString read write;
  end;

  MailCore.MCOIMAPMultipart = public class(MailCore.MCOAbstractMultipart)
  public
    property partID: NSString read write;
  end;

  MailCore.MCOIMAPNamespace = public class(NSObject)
  public
    class method namespaceWithPrefix(prefix: NSString) delimiter(delimiter: AnsiChar): MailCore.MCOIMAPNamespace;
    method mainPrefix: NSString;
    method mainDelimiter: AnsiChar;
    method prefixes: NSArray;
    method pathForComponents(components: NSArray): NSString;
    method pathForComponents(components: NSArray) prefix(prefix: NSString): NSString;
    method componentsFromPath(path: NSString): NSArray;
    method containsFolderPath(path: NSString): BOOL;
  end;

  MailCore.MCOIMAPNamespaceItem = public class(NSObject)
  public
    property prefix: NSString read write;
    property delimiter: AnsiChar read write;
    method pathForComponents(components: NSArray): NSString;
    method componentsForPath(path: NSString): NSArray;
    method containsFolder(folder: NSString): BOOL;
  end;

  MailCore.MCOIMAPIdentity = public class(NSObject)
  public
    class method identityWithVendor(vendor: NSString) name(name: NSString) version(version: NSString): MailCore.MCOIMAPIdentity;
    property vendor: NSString read write;
    property name: NSString read write;
    property version: NSString read write;
    method allInfoKeys: NSArray;
    method infoForKey(key: NSString): NSString;
    method setInfo(value: NSString) forKey(key: NSString);
    method removeAllInfos;
  end;

  MailCore.MCOIMAPPart = public class(MailCore.MCOAbstractPart)
  public
    property partID: NSString read write;
    property size: UInt32 read write;
    property encoding: MailCore.MCOEncoding read write;
    method decodedSize: UInt32;
  end;

  MailCore.MCOIMAPFolderInfoOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; info: MailCore.MCOIMAPFolderInfo));
  end;

  MailCore.MCOIMAPFolderInfo = public class(NSObject)
  public
    class method info: MailCore.MCOIMAPFolderInfo;
    property uidNext: uint32_t read write;
    property uidValidity: uint32_t read write;
    property modSequenceValue: uint64_t read write;
    property messageCount: Int32 read write;
    property firstUnseenUid: uint32_t read write;
    property allowsNewPermanentFlags: BOOL read write;
  end;

  MailCore.MCOIMAPFolderStatusOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; status: MailCore.MCOIMAPFolderStatus));
  end;

  MailCore.MCOIMAPFolderStatus = public class(NSObject)
  public
    property uidNext: uint32_t read write;
    property uidValidity: uint32_t read write;
    property recentCount: uint32_t read write;
    property unseenCount: uint32_t read write;
    property messageCount: uint32_t read write;
    property highestModSeqValue: uint64_t read write;
  end;

  MailCore.MCOIMAPAppendMessageOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    property date: time_t read write;
    property progress: MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; createdUID: uint32_t));
  end;

  MailCore.MCOIMAPCopyMessagesOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; uidMapping: NSDictionary));
  end;

  MailCore.MCOIMAPFetchMessagesOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    property progress: MailCore.MCOIMAPBaseOperationItemProgressBlock read write;
    property extraHeaders: NSArray read write;
    method start(completionBlock: method (error: NSError; messages: NSArray; vanishedMessages: MailCore.MCOIndexSet));
  end;

  MailCore.MCOIMAPFetchContentOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    property progress: MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; data: NSData));
  end;

  MailCore.MCOIMAPFetchParsedContentOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    property progress: MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; parser: MailCore.MCOMessageParser));
  end;

  MailCore.MCOIMAPSearchOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; searchResult: MailCore.MCOIndexSet));
  end;

  MailCore.MCOIMAPIdleOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method interruptIdle;
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MCOIMAPFetchNamespaceOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; namespaces: NSDictionary));
  end;

  MailCore.MCOIMAPIdentityOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; serverIdentity: NSDictionary));
  end;

  MailCore.MCOIMAPCapabilityOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; capabilities: MailCore.MCOIndexSet));
  end;

  MailCore.MCOIMAPQuotaOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (error: NSError; usage: NSUInteger; limit: NSUInteger));
  end;

  MailCore.MCORange = public record
  public
    var location: uint64_t;
    var length: uint64_t;
  end;

  MailCore.MCOIndexSet = public class(NSObject)
  public
    class method indexSet: MailCore.MCOIndexSet;
    class method indexSetWithRange(range: MailCore.MCORange): MailCore.MCOIndexSet;
    class method indexSetWithIndex(idx: uint64_t): MailCore.MCOIndexSet;
    method count: UInt32;
    method addIndex(idx: uint64_t);
    method removeIndex(idx: uint64_t);
    method containsIndex(idx: uint64_t): BOOL;
    method addRange(range: MailCore.MCORange);
    method removeRange(range: MailCore.MCORange);
    method intersectsRange(range: MailCore.MCORange);
    method addIndexSet(indexSet: MailCore.MCOIndexSet);
    method removeIndexSet(indexSet: MailCore.MCOIndexSet);
    method intersectsIndexSet(indexSet: MailCore.MCOIndexSet);
    method allRanges: ^MailCore.MCORange;
    method rangesCount: UInt32;
    method enumerateIndexes(&block: method (idx: uint64_t));
    method nsIndexSet: NSIndexSet;
  end;

  MailCore.MCOIMAPSearchExpression = public class(NSObject)
  public
    class method searchAll: MailCore.MCOIMAPSearchExpression;
    class method searchFrom(value: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchRecipient(value: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchTo(value: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchCc(value: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchBcc(value: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchSubject(value: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchContent(value: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchBody(value: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchUIDs(uids: MailCore.MCOIndexSet): MailCore.MCOIMAPSearchExpression;
    class method searchHeader(header: NSString) value(value: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchRead: MailCore.MCOIMAPSearchExpression;
    class method searchUnread: MailCore.MCOIMAPSearchExpression;
    class method searchFlagged: MailCore.MCOIMAPSearchExpression;
    class method searchUnflagged: MailCore.MCOIMAPSearchExpression;
    class method searchAnswered: MailCore.MCOIMAPSearchExpression;
    class method searchUnanswered: MailCore.MCOIMAPSearchExpression;
    class method searchDraft: MailCore.MCOIMAPSearchExpression;
    class method searchUndraft: MailCore.MCOIMAPSearchExpression;
    class method searchDeleted: MailCore.MCOIMAPSearchExpression;
    class method searchSpam: MailCore.MCOIMAPSearchExpression;
    class method searchBeforeDate(date: NSDate): MailCore.MCOIMAPSearchExpression;
    class method searchOnDate(date: NSDate): MailCore.MCOIMAPSearchExpression;
    class method searchSinceDate(date: NSDate): MailCore.MCOIMAPSearchExpression;
    class method searchBeforeReceivedDate(date: NSDate): MailCore.MCOIMAPSearchExpression;
    class method searchOnReceivedDate(date: NSDate): MailCore.MCOIMAPSearchExpression;
    class method searchSinceReceivedDate(date: NSDate): MailCore.MCOIMAPSearchExpression;
    class method searchSizeLargerThan(size: uint32_t): MailCore.MCOIMAPSearchExpression;
    class method searchSizeSmallerThan(size: uint32_t): MailCore.MCOIMAPSearchExpression;
    class method searchGmailThreadID(number: uint64_t): MailCore.MCOIMAPSearchExpression;
    class method searchGmailMessageID(number: uint64_t): MailCore.MCOIMAPSearchExpression;
    class method searchGmailRaw(expr: NSString): MailCore.MCOIMAPSearchExpression;
    class method searchAnd(expression: MailCore.MCOIMAPSearchExpression) other(other: MailCore.MCOIMAPSearchExpression): MailCore.MCOIMAPSearchExpression;
    class method searchOr(expression: MailCore.MCOIMAPSearchExpression) other(other: MailCore.MCOIMAPSearchExpression): MailCore.MCOIMAPSearchExpression;
    class method searchNot(expression: MailCore.MCOIMAPSearchExpression): MailCore.MCOIMAPSearchExpression;
  end;

  MailCore.MCOIMAPMessageRenderingOperation = public class(MailCore.MCOIMAPBaseOperation)
  public
    method start(completionBlock: method (htmlString: NSString; error: NSError));
  end;

  MailCore.MCOMailProvider = public class(NSObject)
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

  MailCore.MCOMailProvidersManager = public class(NSObject)
  public
    class method sharedManager: MailCore.MCOMailProvidersManager;
    method providerForEmail(email: NSString): MailCore.MCOMailProvider;
    method providerForMX(hostname: NSString): MailCore.MCOMailProvider;
    method providerForIdentifier(identifier: NSString): MailCore.MCOMailProvider;
    method registerProvidersWithFilename(filename: NSString);
  end;

  MailCore.MCOMessageBuilder = public class(MailCore.MCOAbstractMessage)
  public
    property htmlBody: NSString read write;
    property textBody: NSString read write;
    property attachments: NSArray read write;
    property relatedAttachments: NSArray read write;
    property boundaryPrefix: NSString read write;
    method addAttachment(attachment: MailCore.MCOAttachment);
    method addRelatedAttachment(attachment: MailCore.MCOAttachment);
    method data: NSData;
    method dataForEncryption: NSData;
    method openPGPSignedMessageDataWithSignatureData(signature: NSData): NSData;
    method openPGPEncryptedMessageDataWithEncryptedData(encryptedData: NSData): NSData;
    method htmlRenderingWithDelegate(&delegate: MailCore.IMCOHTMLRendererDelegate): NSString;
    method htmlBodyRendering: NSString;
    method plainTextRendering: NSString;
    method plainTextBodyRendering: NSString;
    method plainTextBodyRenderingAndStripWhitespace(stripWhitespace: BOOL): NSString;
  end;

  MailCore.MCOMessageParser = public class(MailCore.MCOAbstractMessage)
  public
    class method messageParserWithData(data: NSData): MailCore.MCOMessageParser;
    method initWithData(data: NSData): id;
    method dealloc;
    method mainPart: MailCore.MCOAbstractPart;
    method data: NSData;
    method htmlRenderingWithDelegate(&delegate: MailCore.IMCOHTMLRendererDelegate): NSString;
    method htmlBodyRendering: NSString;
    method plainTextRendering: NSString;
    method plainTextBodyRendering: NSString;
    method plainTextBodyRenderingAndStripWhitespace(stripWhitespace: BOOL): NSString;
  end;

  MailCore.MCOMessagePart = public class(MailCore.MCOAbstractMessagePart);

  MailCore.MCOMultipart = public class(MailCore.MCOAbstractMultipart);

  MailCore.MCONNTPSession = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property username: NSString read write;
    property password: NSString read write;
    property connectionType: MailCore.MCOConnectionType read write;
    property timeout: NSTimeInterval read write;
    property checkCertificateEnabled: BOOL read write;
    property connectionLogger: MailCore.MCOConnectionLogger read write;
    property dispatchQueue: dispatch_queue_t read write;
    property operationQueueRunning: BOOL read;
    property operationQueueRunningChangeBlock: MailCore.MCOOperationQueueRunningChangeBlock read write;
    method cancelAllOperations;
    method fetchAllArticlesOperation(&group: NSString): MailCore.MCONNTPFetchAllArticlesOperation;
    method fetchHeaderOperationWithIndex(&index: UInt32) inGroup(&group: NSString): MailCore.MCONNTPFetchHeaderOperation;
    method fetchOverviewOperationWithIndexes(indexes: MailCore.MCOIndexSet) inGroup(&group: NSString): MailCore.MCONNTPFetchOverviewOperation;
    method fetchArticleOperationWithIndex(&index: UInt32) inGroup(&group: NSString): MailCore.MCONNTPFetchArticleOperation;
    method fetchArticleOperationWithMessageID(messageID: NSString) inGroup(&group: NSString): MailCore.MCONNTPFetchArticleOperation;
    method fetchServerDateOperation: MailCore.MCONNTPFetchServerTimeOperation;
    method listAllNewsgroupsOperation: MailCore.MCONNTPListNewsgroupsOperation;
    method listDefaultNewsgroupsOperation: MailCore.MCONNTPListNewsgroupsOperation;
    method disconnectOperation: MailCore.MCONNTPOperation;
    method checkAccountOperation: MailCore.MCONNTPOperation;
  end;

  MailCore.MCONNTPOperation = public class(MailCore.MCOOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MCONNTPFetchHeaderOperation = public class(MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; header: MailCore.MCOMessageHeader));
  end;

  MailCore.MCONNTPOperationProgressBlock = public method (current: UInt32; maximum: UInt32);

  MailCore.MCONNTPFetchArticleOperation = public class(MailCore.MCONNTPOperation)
  public
    property progress: MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; messageData: NSData));
  end;

  MailCore.MCONNTPFetchAllArticlesOperation = public class(MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; articles: MailCore.MCOIndexSet));
  end;

  MailCore.MCONNTPListNewsgroupsOperation = public class(MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; messages: NSArray));
  end;

  MailCore.MCONNTPFetchOverviewOperation = public class(MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; messages: NSArray));
  end;

  MailCore.MCONNTPFetchServerTimeOperation = public class(MailCore.MCONNTPOperation)
  public
    method start(completionBlock: method (error: NSError; date: NSDate));
  end;

  MailCore.MCONNTPGroupInfo = public class(NSObject)
  public
    property name: NSString read write;
    property messageCount: UInt32 read write;
  end;

  MailCore.MCONNTPDisconnectOperation = public class(NSObject);

  MailCore.MCONetService = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property connectionType: MailCore.MCOConnectionType read write;
    class method serviceWithInfo(info: NSDictionary): MailCore.MCONetService;
    method initWithInfo(info: NSDictionary): id;
    method info: NSDictionary;
    method hostnameWithEmail(email: NSString): NSString;
  end;

  MailCore.MCOObjectWrapper = public class(NSObject);

  MailCore.MCOPOPSession = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property username: NSString read write;
    property password: NSString read write;
    property authType: MailCore.MCOAuthType read write;
    property connectionType: MailCore.MCOConnectionType read write;
    property timeout: NSTimeInterval read write;
    property checkCertificateEnabled: BOOL read write;
    property connectionLogger: MailCore.MCOConnectionLogger read write;
    property dispatchQueue: dispatch_queue_t read write;
    property operationQueueRunning: BOOL read;
    property operationQueueRunningChangeBlock: MailCore.MCOOperationQueueRunningChangeBlock read write;
    method cancelAllOperations;
    method fetchMessagesOperation: MailCore.MCOPOPFetchMessagesOperation;
    method fetchHeaderOperationWithIndex(&index: UInt32): MailCore.MCOPOPFetchHeaderOperation;
    method fetchMessageOperationWithIndex(&index: UInt32): MailCore.MCOPOPFetchMessageOperation;
    method deleteMessagesOperationWithIndexes(indexes: MailCore.MCOIndexSet): MailCore.MCOPOPOperation;
    method disconnectOperation: MailCore.MCOPOPOperation;
    method checkAccountOperation: MailCore.MCOPOPOperation;
    method noopOperation: MailCore.MCOPOPOperation;
  end;

  MailCore.MCOPOPOperation = public class(MailCore.MCOOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MCOPOPFetchHeaderOperation = public class(MailCore.MCOPOPOperation)
  public
    method start(completionBlock: method (error: NSError; header: MailCore.MCOMessageHeader));
  end;

  MailCore.MCOPOPOperationProgressBlock = public method (current: UInt32; maximum: UInt32);

  MailCore.MCOPOPFetchMessageOperation = public class(MailCore.MCOPOPOperation)
  public
    property progress: MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError; messageData: NSData));
  end;

  MailCore.MCOPOPFetchMessagesOperation = public class(MailCore.MCOPOPOperation)
  public
    method start(completionBlock: method (error: NSError; messages: NSArray));
  end;

  MailCore.MCOPOPMessageInfo = public class(NSObject)
  public
    property &index: UInt32 read write;
    property size: UInt32 read write;
    property uid: NSString read write;
  end;

  MailCore.MCOPOPNoopOperation = public class(MailCore.MCOPOPOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MCOSMTPSession = public class(NSObject)
  public
    property hostname: NSString read write;
    property port: UInt32 read write;
    property username: NSString read write;
    property password: NSString read write;
    property OAuth2Token: NSString read write;
    property authType: MailCore.MCOAuthType read write;
    property connectionType: MailCore.MCOConnectionType read write;
    property timeout: NSTimeInterval read write;
    property checkCertificateEnabled: BOOL read write;
    property useHeloIPEnabled: BOOL read write;
    property connectionLogger: MailCore.MCOConnectionLogger read write;
    property dispatchQueue: dispatch_queue_t read write;
    property operationQueueRunning: BOOL read;
    property operationQueueRunningChangeBlock: MailCore.MCOOperationQueueRunningChangeBlock read write;
    method cancelAllOperations;
    method loginOperation: MailCore.MCOSMTPOperation;
    method sendOperationWithData(messageData: NSData): MailCore.MCOSMTPSendOperation;
    method sendOperationWithData(messageData: NSData) &from(&from: MailCore.MCOAddress) recipients(recipients: NSArray): MailCore.MCOSMTPSendOperation;
    method checkAccountOperationWithFrom(&from: MailCore.MCOAddress): MailCore.MCOSMTPOperation;
    method noopOperation: MailCore.MCOSMTPOperation;
  end;

  MailCore.MCOSMTPOperation = public class(MailCore.MCOOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MCOSMTPOperationProgressBlock = public method (current: UInt32; maximum: UInt32);

  MailCore.MCOSMTPSendOperation = public class(MailCore.MCOSMTPOperation)
  public
    property progress: MailCore.MCOIMAPBaseOperationProgressBlock read write;
    method start(completionBlock: method (error: NSError));
  end;

  MailCore.MCOSMTPLoginOperation = public class(MailCore.MCOSMTPOperation)
  public
    method start(completionBlock: method (error: NSError));
  end;

  //  Extension methods for MailCore.NSString_MCOCategory
  extension method NSString.mco_flattenHTML: NSString;
  extension method NSString.mco_flattenHTMLAndShowBlockquote(showBlockquote: BOOL): NSString;
  extension method NSString.mco_flattenHTMLAndShowBlockquote(showBlockquote: BOOL) showLink(showLink: BOOL): NSString;
  extension method NSString.mco_htmlEncodedString: NSString;
  extension method NSString.mco_cleanedHTMLString: NSString;
  extension method NSString.mco_strippedWhitespace: NSString;

  //  Extension methods for MailCore.NSIndexSet_MCOCategory
  extension method NSIndexSet.mcoIndexSet: MailCore.MCOIndexSet;

implementation

end.
