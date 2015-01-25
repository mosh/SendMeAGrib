//  Import of libMailCore-ios ()
//  Frameworks:
//  Targets: armv7, armv7s, arm64
//  Dep fx:rtl, Foundation
//  Dep libs:MailCore-ios, ctemplate-ios, etpan-ios, uchardet-ios, xml2, sasl2, iconv, tidy, z, c++
using MailCore.MailCore.UChar = UChar;
using MailCore.MailCore.mailimap = mailimap;
using MailCore.MailCore.mailpop3 = mailpop3;
using MailCore.MailCore.mailsmtp = mailsmtp;
using MailCore.MailCore.newsnntp = newsnntp;
using MailCore.MailCore.UDateFormat = UDateFormat;

namespace 
{
    public class MailCore.MailCore.__Global
    {
        public static Int32 MCLogEnabled;

        public static void MCLogInternal(AnsiChar* user, AnsiChar* filename, UInt32 line, Int32 dumpStack, AnsiChar* format, params uint16_t Param5);
        public static void MCAssertInternal(AnsiChar* filename, UInt32 line, Int32 cond, AnsiChar* condString);

        public static MailCore.MailCore.MCORange MCORangeEmpty;

        public static MailCore.MailCore.MCORange MCORangeMake(uint64_t location, uint64_t length);
        public static MailCore.MailCore.MCOIndexSet MCORangeRemoveRange(MailCore.MailCore.MCORange range1, MailCore.MailCore.MCORange range2);
        public static MailCore.MailCore.MCOIndexSet MCORangeUnion(MailCore.MailCore.MCORange range1, MailCore.MailCore.MCORange range2);
        public static MailCore.MailCore.MCORange MCORangeIntersection(MailCore.MailCore.MCORange range1, MailCore.MailCore.MCORange range2);
        public static BOOL MCORangeHasIntersection(MailCore.MailCore.MCORange range1, MailCore.MailCore.MCORange range2);
        public static uint64_t MCORangeLeftBound(MailCore.MailCore.MCORange range);
        public static uint64_t MCORangeRightBound(MailCore.MailCore.MCORange range);
        public static NSString MCORangeToString(MailCore.MailCore.MCORange range);
        public static MailCore.MailCore.MCORange MCORangeFromString(NSString rangeString);

        public static const Void MCOIMAPNamespacePersonal;
        public static const Void MCOIMAPNamespaceOther;
        public static const Void MCOIMAPNamespaceShared;
        public static const Void MCOErrorDomain;

        public static uint16_t MCO_NATIVE_INSTANCE();
    }

    public class MailCore.MailCore.MCOAbstractMessage: NSObject
    {
        public MailCore.MailCore.MCOMessageHeader header { get; set; }
        public MailCore.MailCore.MCOAbstractPart partForContentID(NSString contentID);
        public MailCore.MailCore.MCOAbstractPart partForUniqueID(NSString uniqueID);
        public NSArray attachments();
        public NSArray htmlInlineAttachments();
        public NSArray requiredPartsForRendering();
    }

    public enum MailCore.MailCore.MCOPartType: NSInteger
    {
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
    }

    public class MailCore.MailCore.MCOAbstractPart: NSObject
    {
        public MailCore.MailCore.MCOPartType partType { get; set; }
        public NSString filename { get; set; }
        public NSString mimeType { get; set; }
        public NSString charset { get; set; }
        public NSString uniqueID { get; set; }
        public NSString contentID { get; set; }
        public NSString contentLocation { get; set; }
        public NSString contentDescription { get; set; }
        public BOOL inlineAttachment { get; set; }
        public MailCore.MailCore.MCOAbstractPart partForContentID(NSString contentID);
        public MailCore.MailCore.MCOAbstractPart partForUniqueID(NSString uniqueID);
        public NSString decodedStringForData(NSData data);
        public void setContentTypeParameterValue(NSString @value) forName(NSString name);
        public void removeContentTypeParameterForName(NSString name);
        public NSString contentTypeParameterValueForName(NSString name);
        public NSArray allContentTypeParametersNames();
    }

    public class MailCore.MailCore.MCOAbstractMessagePart: MailCore.MailCore.MCOAbstractPart
    {
        public MailCore.MailCore.MCOMessageHeader header { get; set; }
        public MailCore.MailCore.MCOAbstractPart mainPart { get; set; }
    }

    public class MailCore.MailCore.MCOAbstractMultipart: MailCore.MailCore.MCOAbstractPart
    {
        public NSArray parts { get; set; }
    }

    public class MailCore.MailCore.MCOAddress: NSObject
    {
        public static MailCore.MailCore.MCOAddress addressWithDisplayName(NSString displayName) mailbox(NSString mailbox);
        public static MailCore.MailCore.MCOAddress addressWithMailbox(NSString mailbox);
        public static MailCore.MailCore.MCOAddress addressWithRFC822String(NSString RFC822String);
        public static MailCore.MailCore.MCOAddress addressWithNonEncodedRFC822String(NSString nonEncodedRFC822String);
        public static NSArray addressesWithRFC822String(NSString @string);
        public static NSArray addressesWithNonEncodedRFC822String(NSString @string);

        public NSString displayName { get; set; }
        public NSString mailbox { get; set; }
        public NSString RFC822String();
        public NSString nonEncodedRFC822String();
    }

    //  Extension methods for MailCore.MailCore.MCOAddressCategory
    public static class MailCore.MailCore.MCOAddressCategory
    {
        public static NSString mco_RFC822StringForAddresses(this NSArray @this);
        public static NSString mco_nonEncodedRFC822StringForAddresses(this NSArray @this);
    }

    public enum MailCore.MailCore.MCOConnectionType: NSInteger
    {
        MCOConnectionTypeClear,
        Clear,
        MCOConnectionTypeStartTLS,
        StartTLS,
        MCOConnectionTypeTLS,
        TLS
    }

    public enum MailCore.MailCore.MCOAuthType: NSInteger
    {
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
    }

    public enum MailCore.MailCore.MCOIMAPFolderFlag: NSInteger
    {
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
    }

    public enum MailCore.MailCore.MCOMessageFlag: NSInteger
    {
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
    }

    public enum MailCore.MailCore.MCOEncoding: NSInteger
    {
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
    }

    public enum MailCore.MailCore.MCOIMAPMessagesRequestKind: NSInteger
    {
        MCOIMAPMessagesRequestKindUid,
        Uid,
        MCOIMAPMessagesRequestKindFlags,
        Flags,
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
    }

    public enum MailCore.MailCore.MCOIMAPStoreFlagsRequestKind: NSInteger
    {
        MCOIMAPStoreFlagsRequestKindAdd,
        Add,
        MCOIMAPStoreFlagsRequestKindRemove,
        Remove,
        MCOIMAPStoreFlagsRequestKindSet,
        Set
    }

    public enum MailCore.MailCore.MCOIMAPSearchKind: NSInteger
    {
        MCOIMAPSearchKindAll,
        All,
        MCOIMAPSearchKindNone,
        None,
        MCOIMAPSearchKindFrom,
        From,
        MCOIMAPSearchKindTo,
        To,
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
        Read,
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
        Or,
        MCOIMAPSearchKindAnd,
        And,
        MCOIMAPSearchKindNot,
        Not
    }

    public enum MailCore.MailCore.MCOIMAPCapability: NSInteger
    {
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
        Namespace,
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
    }

    public enum MailCore.MailCore.MCOErrorCode: NSInteger
    {
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
    }

    public enum MailCore.MailCore.MCOConnectionLogType: NSInteger
    {
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
    }

    public     public void (Void* connectionID, MailCore.MailCore.MCOConnectionLogType type, NSData data);

    public     public void ();

    public class MailCore.MailCore.MCOMessageHeader: NSObject
    {
        public NSString messageID { get; set; }
        public BOOL messageIDAutoGenerated { get; }
        public NSArray references { get; set; }
        public NSArray inReplyTo { get; set; }
        public NSDate date { get; set; }
        public NSDate receivedDate { get; set; }
        public MailCore.MailCore.MCOAddress sender { get; set; }
        public MailCore.MailCore.MCOAddress @from { get; set; }
        public NSArray to { get; set; }
        public NSArray cc { get; set; }
        public NSArray bcc { get; set; }
        public NSArray replyTo { get; set; }
        public NSString subject { get; set; }
        public NSString userAgent { get; set; }
        public static MailCore.MailCore.MCOMessageHeader headerWithData(NSData data);
        public id initWithData(NSData data);
        public void setExtraHeaderValue(NSString @value) forName(NSString name);
        public void removeExtraHeaderForName(NSString name);
        public NSString extraHeaderValueForName(NSString name);
        public NSArray allExtraHeadersNames();
        public NSString extractedSubject();
        public NSString partialExtractedSubject();
        public void importHeadersData(NSData data);
        public MailCore.MailCore.MCOMessageHeader replyHeaderWithExcludedRecipients(NSArray excludedRecipients);
        public MailCore.MailCore.MCOMessageHeader replyAllHeaderWithExcludedRecipients(NSArray excludedRecipients);
        public MailCore.MailCore.MCOMessageHeader forwardHeader();
    }

    public interface MailCore.MailCore.IMCOHTMLRendererDelegate
    {
        BOOL MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) canPreviewPart(MailCore.MailCore.MCOAbstractPart part);
        BOOL MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) shouldShowPart(MailCore.MailCore.MCOAbstractPart part);
        NSDictionary MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) templateValuesForHeader(MailCore.MailCore.MCOMessageHeader header);
        NSDictionary MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) templateValuesForPart(MailCore.MailCore.MCOAbstractPart part);
        NSString MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) templateForMainHeader(MailCore.MailCore.MCOMessageHeader header);
        NSString MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) templateForImage(MailCore.MailCore.MCOAbstractPart header);
        NSString MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) templateForAttachment(MailCore.MailCore.MCOAbstractPart part);
        NSString MCOAbstractMessage_templateForMessage(MailCore.MailCore.MCOAbstractMessage msg);
        NSString MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) templateForEmbeddedMessage(MailCore.MailCore.MCOAbstractMessagePart part);
        NSString MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) templateForEmbeddedMessageHeader(MailCore.MailCore.MCOMessageHeader header);
        NSString MCOAbstractMessage_templateForAttachmentSeparator(MailCore.MailCore.MCOAbstractMessage msg);
        NSString MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) cleanHTMLForPart(NSString html);
        NSString MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) filterHTMLForPart(NSString html);
        NSString MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) filterHTMLForMessage(NSString html);
    }

    public interface MailCore.MailCore.IMCOHTMLRendererIMAPDelegate
    {
        NSData MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) dataForIMAPPart(MailCore.MailCore.MCOIMAPPart part) folder(NSString folder);
        void MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) prefetchAttachmentIMAPPart(MailCore.MailCore.MCOIMAPPart part) folder(NSString folder);
        void MCOAbstractMessage(MailCore.MailCore.MCOAbstractMessage msg) prefetchImageIMAPPart(MailCore.MailCore.MCOIMAPPart part) folder(NSString folder);
    }

    public class MailCore.MailCore.MCOAttachment: MailCore.MailCore.MCOAbstractPart
    {
        public static NSString mimeTypeForFilename(NSString filename);
        public static MailCore.MailCore.MCOAttachment attachmentWithContentsOfFile(NSString filename);
        public static MailCore.MailCore.MCOAttachment attachmentWithData(NSData data) filename(NSString filename);
        public static MailCore.MailCore.MCOAttachment attachmentWithHTMLString(NSString htmlString);
        public static MailCore.MailCore.MCOAttachment attachmentWithRFC822Message(NSData messageData);
        public static MailCore.MailCore.MCOAttachment attachmentWithText(NSString text);

        public NSData data { get; set; }
        public NSString decodedString();
    }

    public class MailCore.MailCore.MCOIMAPSession: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public NSString username { get; set; }
        public NSString password { get; set; }
        public NSString OAuth2Token { get; set; }
        public MailCore.MailCore.MCOAuthType authType { get; set; }
        public MailCore.MailCore.MCOConnectionType connectionType { get; set; }
        public NSTimeInterval timeout { get; set; }
        public BOOL checkCertificateEnabled { get; set; }
        public BOOL voIPEnabled { get; set; }
        public MailCore.MailCore.MCOIMAPNamespace defaultNamespace { get; set; }
        public MailCore.MailCore.MCOIMAPIdentity clientIdentity { get; }
        public MailCore.MailCore.MCOIMAPIdentity serverIdentity { get; }
        public NSString gmailUserDisplayName { get; }
        public BOOL allowsFolderConcurrentAccessEnabled { get; set; }
        public UInt32 maximumConnections { get; set; }
        public MailCore.MailCore.MCOConnectionLogger connectionLogger { get; set; }
        public dispatch_queue_t dispatchQueue { get; set; }
        public BOOL operationQueueRunning { get; }
        public MailCore.MailCore.MCOOperationQueueRunningChangeBlock operationQueueRunningChangeBlock { get; set; }
        public void cancelAllOperations();
        public MailCore.MailCore.MCOIMAPFolderInfoOperation folderInfoOperation(NSString folder);
        public MailCore.MailCore.MCOIMAPFolderStatusOperation folderStatusOperation(NSString folder);
        public MailCore.MailCore.MCOIMAPFetchFoldersOperation fetchSubscribedFoldersOperation();
        public MailCore.MailCore.MCOIMAPFetchFoldersOperation fetchAllFoldersOperation();
        public MailCore.MailCore.MCOIMAPOperation renameFolderOperation(NSString folder) otherName(NSString otherName);
        public MailCore.MailCore.MCOIMAPOperation deleteFolderOperation(NSString folder);
        public MailCore.MailCore.MCOIMAPOperation createFolderOperation(NSString folder);
        public MailCore.MailCore.MCOIMAPOperation subscribeFolderOperation(NSString folder);
        public MailCore.MailCore.MCOIMAPOperation unsubscribeFolderOperation(NSString folder);
        public MailCore.MailCore.MCOIMAPOperation expungeOperation(NSString folder);
        public MailCore.MailCore.MCOIMAPAppendMessageOperation appendMessageOperationWithFolder(NSString folder) messageData(NSData messageData) flags(MailCore.MailCore.MCOMessageFlag flags);
        public MailCore.MailCore.MCOIMAPAppendMessageOperation appendMessageOperationWithFolder(NSString folder) messageData(NSData messageData) flags(MailCore.MailCore.MCOMessageFlag flags) customFlags(NSArray customFlags);
        public MailCore.MailCore.MCOIMAPCopyMessagesOperation copyMessagesOperationWithFolder(NSString folder) uids(MailCore.MailCore.MCOIndexSet uids) destFolder(NSString destFolder);
        public MailCore.MailCore.MCOIMAPOperation storeFlagsOperationWithFolder(NSString folder) uids(MailCore.MailCore.MCOIndexSet uids) kind(MailCore.MailCore.MCOIMAPStoreFlagsRequestKind kind) flags(MailCore.MailCore.MCOMessageFlag flags);
        public MailCore.MailCore.MCOIMAPOperation storeFlagsOperationWithFolder(NSString folder) numbers(MailCore.MailCore.MCOIndexSet numbers) kind(MailCore.MailCore.MCOIMAPStoreFlagsRequestKind kind) flags(MailCore.MailCore.MCOMessageFlag flags);
        public MailCore.MailCore.MCOIMAPOperation storeFlagsOperationWithFolder(NSString folder) uids(MailCore.MailCore.MCOIndexSet uids) kind(MailCore.MailCore.MCOIMAPStoreFlagsRequestKind kind) flags(MailCore.MailCore.MCOMessageFlag flags) customFlags(NSArray customFlags);
        public MailCore.MailCore.MCOIMAPOperation storeFlagsOperationWithFolder(NSString folder) numbers(MailCore.MailCore.MCOIndexSet numbers) kind(MailCore.MailCore.MCOIMAPStoreFlagsRequestKind kind) flags(MailCore.MailCore.MCOMessageFlag flags) customFlags(NSArray customFlags);
        public MailCore.MailCore.MCOIMAPOperation storeLabelsOperationWithFolder(NSString folder) numbers(MailCore.MailCore.MCOIndexSet numbers) kind(MailCore.MailCore.MCOIMAPStoreFlagsRequestKind kind) labels(NSArray labels);
        public MailCore.MailCore.MCOIMAPOperation storeLabelsOperationWithFolder(NSString folder) uids(MailCore.MailCore.MCOIndexSet uids) kind(MailCore.MailCore.MCOIMAPStoreFlagsRequestKind kind) labels(NSArray labels);
        public MailCore.MailCore.MCOIMAPFetchMessagesOperation fetchMessagesByUIDOperationWithFolder(NSString folder) requestKind(MailCore.MailCore.MCOIMAPMessagesRequestKind requestKind) uids(MailCore.MailCore.MCOIndexSet uids);
        public MailCore.MailCore.MCOIMAPFetchMessagesOperation fetchMessagesOperationWithFolder(NSString folder) requestKind(MailCore.MailCore.MCOIMAPMessagesRequestKind requestKind) uids(MailCore.MailCore.MCOIndexSet uids);
        public MailCore.MailCore.MCOIMAPFetchMessagesOperation fetchMessagesByNumberOperationWithFolder(NSString folder) requestKind(MailCore.MailCore.MCOIMAPMessagesRequestKind requestKind) numbers(MailCore.MailCore.MCOIndexSet numbers);
        public MailCore.MailCore.MCOIMAPFetchMessagesOperation syncMessagesByUIDWithFolder(NSString folder) requestKind(MailCore.MailCore.MCOIMAPMessagesRequestKind requestKind) uids(MailCore.MailCore.MCOIndexSet uids) modSeq(uint64_t modSeq);
        public MailCore.MailCore.MCOIMAPFetchMessagesOperation syncMessagesWithFolder(NSString folder) requestKind(MailCore.MailCore.MCOIMAPMessagesRequestKind requestKind) uids(MailCore.MailCore.MCOIndexSet uids) modSeq(uint64_t modSeq);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageByUIDOperationWithFolder(NSString folder) uid(uint32_t uid) urgent(BOOL urgent);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageByUIDOperationWithFolder(NSString folder) uid(uint32_t uid);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageOperationWithFolder(NSString folder) uid(uint32_t uid) urgent(BOOL urgent);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageOperationWithFolder(NSString folder) uid(uint32_t uid);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageOperationWithFolder(NSString folder) number(uint32_t number) urgent(BOOL urgent);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageOperationWithFolder(NSString folder) number(uint32_t number);
        public MailCore.MailCore.MCOIMAPFetchParsedContentOperation fetchParsedMessageOperationWithFolder(NSString folder) uid(uint32_t uid) urgent(BOOL urgent);
        public MailCore.MailCore.MCOIMAPFetchParsedContentOperation fetchParsedMessageOperationWithFolder(NSString folder) uid(uint32_t uid);
        public MailCore.MailCore.MCOIMAPFetchParsedContentOperation fetchParsedMessageOperationWithFolder(NSString folder) number(uint32_t number) urgent(BOOL urgent);
        public MailCore.MailCore.MCOIMAPFetchParsedContentOperation fetchParsedMessageOperationWithFolder(NSString folder) number(uint32_t number);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentByUIDOperationWithFolder(NSString folder) uid(uint32_t uid) partID(NSString partID) encoding(MailCore.MailCore.MCOEncoding encoding) urgent(BOOL urgent);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentByUIDOperationWithFolder(NSString folder) uid(uint32_t uid) partID(NSString partID) encoding(MailCore.MailCore.MCOEncoding encoding);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentOperationWithFolder(NSString folder) uid(uint32_t uid) partID(NSString partID) encoding(MailCore.MailCore.MCOEncoding encoding) urgent(BOOL urgent);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentOperationWithFolder(NSString folder) uid(uint32_t uid) partID(NSString partID) encoding(MailCore.MailCore.MCOEncoding encoding);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentOperationWithFolder(NSString folder) number(uint32_t number) partID(NSString partID) encoding(MailCore.MailCore.MCOEncoding encoding) urgent(BOOL urgent);
        public MailCore.MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentOperationWithFolder(NSString folder) number(uint32_t number) partID(NSString partID) encoding(MailCore.MailCore.MCOEncoding encoding);
        public MailCore.MailCore.MCOIMAPIdleOperation idleOperationWithFolder(NSString folder) lastKnownUID(uint32_t lastKnownUID);
        public MailCore.MailCore.MCOIMAPFetchNamespaceOperation fetchNamespaceOperation();
        public MailCore.MailCore.MCOIMAPIdentityOperation identityOperationWithClientIdentity(MailCore.MailCore.MCOIMAPIdentity identity);
        public MailCore.MailCore.MCOIMAPOperation connectOperation();
        public MailCore.MailCore.MCOIMAPOperation noopOperation();
        public MailCore.MailCore.MCOIMAPOperation checkAccountOperation();
        public MailCore.MailCore.MCOIMAPCapabilityOperation capabilityOperation();
        public MailCore.MailCore.MCOIMAPQuotaOperation quotaOperation();
        public MailCore.MailCore.MCOIMAPSearchOperation searchOperationWithFolder(NSString folder) kind(MailCore.MailCore.MCOIMAPSearchKind kind) searchString(NSString searchString);
        public MailCore.MailCore.MCOIMAPSearchOperation searchExpressionOperationWithFolder(NSString folder) expression(MailCore.MailCore.MCOIMAPSearchExpression expression);
        public MailCore.MailCore.MCOIMAPMessageRenderingOperation htmlRenderingOperationWithMessage(MailCore.MailCore.MCOIMAPMessage message) folder(NSString folder);
        public MailCore.MailCore.MCOIMAPMessageRenderingOperation htmlBodyRenderingOperationWithMessage(MailCore.MailCore.MCOIMAPMessage message) folder(NSString folder);
        public MailCore.MailCore.MCOIMAPMessageRenderingOperation plainTextRenderingOperationWithMessage(MailCore.MailCore.MCOIMAPMessage message) folder(NSString folder);
        public MailCore.MailCore.MCOIMAPMessageRenderingOperation plainTextBodyRenderingOperationWithMessage(MailCore.MailCore.MCOIMAPMessage message) folder(NSString folder) stripWhitespace(BOOL stripWhitespace);
        public MailCore.MailCore.MCOIMAPMessageRenderingOperation plainTextBodyRenderingOperationWithMessage(MailCore.MailCore.MCOIMAPMessage message) folder(NSString folder);
        public MailCore.MailCore.MCOIMAPOperation disconnectOperation();
    }

    public class MailCore.MailCore.MCOOperation: NSObject
    {
        public BOOL isCancelled { get; }
        public BOOL shouldRunWhenCancelled { get; set; }
        public dispatch_queue_t callbackDispatchQueue { get; set; }
        public void operationCompleted();
        public void cancel();
    }

    public     public void (UInt32 current, UInt32 maximum);

    public     public void (UInt32 current);

    public class MailCore.MailCore.MCOIMAPBaseOperation: MailCore.MailCore.MCOOperation
    {
        public BOOL urgent { get; set; }
        public void bodyProgress(UInt32 current) maximum(UInt32 maximum);
        public void itemProgress(UInt32 current) maximum(UInt32 maximum);
    }

    public class MailCore.MailCore.MCOIMAPOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPFetchFoldersOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSArray folders) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPFolder: NSObject
    {
        public NSString path { get; set; }
        public AnsiChar delimiter { get; set; }
        public MailCore.MailCore.MCOIMAPFolderFlag flags { get; set; }
    }

    public class MailCore.MailCore.MCOIMAPMessage: MailCore.MailCore.MCOAbstractMessage
    {
        public uint32_t uid { get; set; }
        public uint32_t sequenceNumber { get; set; }
        public uint32_t size { get; set; }
        public MailCore.MailCore.MCOMessageFlag flags { get; set; }
        public MailCore.MailCore.MCOMessageFlag originalFlags { get; set; }
        public NSArray customFlags { get; set; }
        public uint64_t modSeqValue { get; set; }
        public MailCore.MailCore.MCOAbstractPart mainPart { get; set; }
        public NSArray gmailLabels { get; set; }
        public uint64_t gmailMessageID { get; set; }
        public uint64_t gmailThreadID { get; set; }
        public MailCore.MailCore.MCOAbstractPart partForPartID(NSString partID);
        public NSString htmlRenderingWithFolder(NSString folder) @delegate(MailCore.MailCore.IMCOHTMLRendererIMAPDelegate @delegate);
    }

    public class MailCore.MailCore.MCOIMAPMessagePart: MailCore.MailCore.MCOAbstractMessagePart
    {
        public NSString partID { get; set; }
    }

    public class MailCore.MailCore.MCOIMAPMultipart: MailCore.MailCore.MCOAbstractMultipart
    {
        public NSString partID { get; set; }
    }

    public class MailCore.MailCore.MCOIMAPNamespace: NSObject
    {
        public static MailCore.MailCore.MCOIMAPNamespace namespaceWithPrefix(NSString prefix) delimiter(AnsiChar delimiter);
        public NSString mainPrefix();
        public AnsiChar mainDelimiter();
        public NSArray prefixes();
        public NSString pathForComponents(NSArray components);
        public NSString pathForComponents(NSArray components) prefix(NSString prefix);
        public NSArray componentsFromPath(NSString path);
        public BOOL containsFolderPath(NSString path);
    }

    public class MailCore.MailCore.MCOIMAPNamespaceItem: NSObject
    {
        public NSString prefix { get; set; }
        public AnsiChar delimiter { get; set; }
        public NSString pathForComponents(NSArray components);
        public NSArray componentsForPath(NSString path);
        public BOOL containsFolder(NSString folder);
    }

    public class MailCore.MailCore.MCOIMAPIdentity: NSObject
    {
        public static MailCore.MailCore.MCOIMAPIdentity identityWithVendor(NSString vendor) name(NSString name) version(NSString version);

        public NSString vendor { get; set; }
        public NSString name { get; set; }
        public NSString version { get; set; }
        public NSArray allInfoKeys();
        public NSString infoForKey(NSString key);
        public void setInfo(NSString @value) forKey(NSString key);
        public void removeAllInfos();
    }

    public class MailCore.MailCore.MCOIMAPPart: MailCore.MailCore.MCOAbstractPart
    {
        public NSString partID { get; set; }
        public UInt32 size { get; set; }
        public MailCore.MailCore.MCOEncoding encoding { get; set; }
        public UInt32 decodedSize();
    }

    public class MailCore.MailCore.MCOIMAPFolderInfoOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, MailCore.MailCore.MCOIMAPFolderInfo info) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPFolderInfo: NSObject
    {
        public static MailCore.MailCore.MCOIMAPFolderInfo info();

        public uint32_t uidNext { get; set; }
        public uint32_t uidValidity { get; set; }
        public uint64_t modSequenceValue { get; set; }
        public Int32 messageCount { get; set; }
        public uint32_t firstUnseenUid { get; set; }
        public BOOL allowsNewPermanentFlags { get; set; }
    }

    public class MailCore.MailCore.MCOIMAPFolderStatusOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, MailCore.MailCore.MCOIMAPFolderStatus status) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPFolderStatus: NSObject
    {
        public uint32_t uidNext { get; set; }
        public uint32_t uidValidity { get; set; }
        public uint32_t recentCount { get; set; }
        public uint32_t unseenCount { get; set; }
        public uint32_t messageCount { get; set; }
        public uint64_t highestModSeqValue { get; set; }
    }

    public class MailCore.MailCore.MCOIMAPAppendMessageOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public time_t date { get; set; }
        public MailCore.MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, uint32_t createdUID) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPCopyMessagesOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSDictionary uidMapping) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPFetchMessagesOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public MailCore.MailCore.MCOIMAPBaseOperationItemProgressBlock progress { get; set; }
        public NSArray extraHeaders { get; set; }
        public void start(        public void (NSError error, NSArray messages, MailCore.MailCore.MCOIndexSet vanishedMessages) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPFetchContentOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public MailCore.MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, NSData data) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPFetchParsedContentOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public MailCore.MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, MailCore.MailCore.MCOMessageParser parser) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPSearchOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, MailCore.MailCore.MCOIndexSet searchResult) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPIdleOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void interruptIdle();
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPFetchNamespaceOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSDictionary namespaces) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPIdentityOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSDictionary serverIdentity) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPCapabilityOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, MailCore.MailCore.MCOIndexSet capabilities) completionBlock);
    }

    public class MailCore.MailCore.MCOIMAPQuotaOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSUInteger usage, NSUInteger limit) completionBlock);
    }

    public struct MailCore.MailCore.MCORange
    {
        public uint64_t location;
        public uint64_t length;
    }

    public class MailCore.MailCore.MCOIndexSet: NSObject
    {
        public static MailCore.MailCore.MCOIndexSet indexSet();
        public static MailCore.MailCore.MCOIndexSet indexSetWithRange(MailCore.MailCore.MCORange range);
        public static MailCore.MailCore.MCOIndexSet indexSetWithIndex(uint64_t idx);
        public UInt32 count();
        public void addIndex(uint64_t idx);
        public void removeIndex(uint64_t idx);
        public BOOL containsIndex(uint64_t idx);
        public void addRange(MailCore.MailCore.MCORange range);
        public void removeRange(MailCore.MailCore.MCORange range);
        public void intersectsRange(MailCore.MailCore.MCORange range);
        public void addIndexSet(MailCore.MailCore.MCOIndexSet indexSet);
        public void removeIndexSet(MailCore.MailCore.MCOIndexSet indexSet);
        public void intersectsIndexSet(MailCore.MailCore.MCOIndexSet indexSet);
        public MailCore.MailCore.MCORange* allRanges();
        public UInt32 rangesCount();
        public void enumerateIndexes(        public void (uint64_t idx) block);
        public NSIndexSet nsIndexSet();
    }

    public class MailCore.MailCore.MCOIMAPSearchExpression: NSObject
    {
        public static MailCore.MailCore.MCOIMAPSearchExpression searchAll();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchFrom(NSString @value);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchRecipient(NSString @value);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchTo(NSString @value);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchCc(NSString @value);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchBcc(NSString @value);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchSubject(NSString @value);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchContent(NSString @value);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchBody(NSString @value);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchUIDs(MailCore.MailCore.MCOIndexSet uids);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchHeader(NSString header) @value(NSString @value);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchRead();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchUnread();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchFlagged();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchUnflagged();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchAnswered();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchUnanswered();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchDraft();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchUndraft();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchDeleted();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchSpam();
        public static MailCore.MailCore.MCOIMAPSearchExpression searchBeforeDate(NSDate date);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchOnDate(NSDate date);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchSinceDate(NSDate date);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchBeforeReceivedDate(NSDate date);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchOnReceivedDate(NSDate date);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchSinceReceivedDate(NSDate date);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchSizeLargerThan(uint32_t size);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchSizeSmallerThan(uint32_t size);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchGmailThreadID(uint64_t number);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchGmailMessageID(uint64_t number);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchGmailRaw(NSString expr);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchAnd(MailCore.MailCore.MCOIMAPSearchExpression expression) other(MailCore.MailCore.MCOIMAPSearchExpression other);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchOr(MailCore.MailCore.MCOIMAPSearchExpression expression) other(MailCore.MailCore.MCOIMAPSearchExpression other);
        public static MailCore.MailCore.MCOIMAPSearchExpression searchNot(MailCore.MailCore.MCOIMAPSearchExpression expression);
    }

    public class MailCore.MailCore.MCOIMAPMessageRenderingOperation: MailCore.MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSString htmlString, NSError error) completionBlock);
    }

    public class MailCore.MailCore.MCOMailProvider: NSObject
    {
        public NSString identifier { get; set; }
        public id initWithInfo(NSDictionary info);
        public NSArray imapServices();
        public NSArray smtpServices();
        public NSArray popServices();
        public BOOL matchEmail(NSString email);
        public BOOL matchMX(NSString hostname);
        public NSString sentMailFolderPath();
        public NSString starredFolderPath();
        public NSString allMailFolderPath();
        public NSString trashFolderPath();
        public NSString draftsFolderPath();
        public NSString spamFolderPath();
        public NSString importantFolderPath();
    }

    public class MailCore.MailCore.MCOMailProvidersManager: NSObject
    {
        public static MailCore.MailCore.MCOMailProvidersManager sharedManager();
        public MailCore.MailCore.MCOMailProvider providerForEmail(NSString email);
        public MailCore.MailCore.MCOMailProvider providerForMX(NSString hostname);
        public MailCore.MailCore.MCOMailProvider providerForIdentifier(NSString identifier);
        public void registerProvidersWithFilename(NSString filename);
    }

    public class MailCore.MailCore.MCOMessageBuilder: MailCore.MailCore.MCOAbstractMessage
    {
        public NSString htmlBody { get; set; }
        public NSString textBody { get; set; }
        public NSArray attachments { get; set; }
        public NSArray relatedAttachments { get; set; }
        public NSString boundaryPrefix { get; set; }
        public void addAttachment(MailCore.MailCore.MCOAttachment attachment);
        public void addRelatedAttachment(MailCore.MailCore.MCOAttachment attachment);
        public NSData data();
        public NSData dataForEncryption();
        public NSData openPGPSignedMessageDataWithSignatureData(NSData signature);
        public NSData openPGPEncryptedMessageDataWithEncryptedData(NSData encryptedData);
        public NSString htmlRenderingWithDelegate(MailCore.MailCore.IMCOHTMLRendererDelegate @delegate);
        public NSString htmlBodyRendering();
        public NSString plainTextRendering();
        public NSString plainTextBodyRendering();
        public NSString plainTextBodyRenderingAndStripWhitespace(BOOL stripWhitespace);
    }

    public class MailCore.MailCore.MCOMessageParser: MailCore.MailCore.MCOAbstractMessage
    {
        public static MailCore.MailCore.MCOMessageParser messageParserWithData(NSData data);
        public id initWithData(NSData data);
        public void dealloc();
        public MailCore.MailCore.MCOAbstractPart mainPart();
        public NSData data();
        public NSString htmlRenderingWithDelegate(MailCore.MailCore.IMCOHTMLRendererDelegate @delegate);
        public NSString htmlBodyRendering();
        public NSString plainTextRendering();
        public NSString plainTextBodyRendering();
        public NSString plainTextBodyRenderingAndStripWhitespace(BOOL stripWhitespace);
    }

    public class MailCore.MailCore.MCOMessagePart: MailCore.MailCore.MCOAbstractMessagePart {}

    public class MailCore.MailCore.MCOMultipart: MailCore.MailCore.MCOAbstractMultipart {}

    public class MailCore.MailCore.MCONNTPSession: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public NSString username { get; set; }
        public NSString password { get; set; }
        public MailCore.MailCore.MCOConnectionType connectionType { get; set; }
        public NSTimeInterval timeout { get; set; }
        public BOOL checkCertificateEnabled { get; set; }
        public MailCore.MailCore.MCOConnectionLogger connectionLogger { get; set; }
        public dispatch_queue_t dispatchQueue { get; set; }
        public BOOL operationQueueRunning { get; }
        public MailCore.MailCore.MCOOperationQueueRunningChangeBlock operationQueueRunningChangeBlock { get; set; }
        public void cancelAllOperations();
        public MailCore.MailCore.MCONNTPFetchAllArticlesOperation fetchAllArticlesOperation(NSString @group);
        public MailCore.MailCore.MCONNTPFetchHeaderOperation fetchHeaderOperationWithIndex(UInt32 index) inGroup(NSString @group);
        public MailCore.MailCore.MCONNTPFetchOverviewOperation fetchOverviewOperationWithIndexes(MailCore.MailCore.MCOIndexSet indexes) inGroup(NSString @group);
        public MailCore.MailCore.MCONNTPFetchArticleOperation fetchArticleOperationWithIndex(UInt32 index) inGroup(NSString @group);
        public MailCore.MailCore.MCONNTPFetchArticleOperation fetchArticleOperationWithMessageID(NSString messageID) inGroup(NSString @group);
        public MailCore.MailCore.MCONNTPFetchServerTimeOperation fetchServerDateOperation();
        public MailCore.MailCore.MCONNTPListNewsgroupsOperation listAllNewsgroupsOperation();
        public MailCore.MailCore.MCONNTPListNewsgroupsOperation listDefaultNewsgroupsOperation();
        public MailCore.MailCore.MCONNTPOperation disconnectOperation();
        public MailCore.MailCore.MCONNTPOperation checkAccountOperation();
    }

    public class MailCore.MailCore.MCONNTPOperation: MailCore.MailCore.MCOOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MailCore.MCONNTPFetchHeaderOperation: MailCore.MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, MailCore.MailCore.MCOMessageHeader header) completionBlock);
    }

    public     public void (UInt32 current, UInt32 maximum);

    public class MailCore.MailCore.MCONNTPFetchArticleOperation: MailCore.MailCore.MCONNTPOperation
    {
        public MailCore.MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, NSData messageData) completionBlock);
    }

    public class MailCore.MailCore.MCONNTPFetchAllArticlesOperation: MailCore.MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, MailCore.MailCore.MCOIndexSet articles) completionBlock);
    }

    public class MailCore.MailCore.MCONNTPListNewsgroupsOperation: MailCore.MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, NSArray messages) completionBlock);
    }

    public class MailCore.MailCore.MCONNTPFetchOverviewOperation: MailCore.MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, NSArray messages) completionBlock);
    }

    public class MailCore.MailCore.MCONNTPFetchServerTimeOperation: MailCore.MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, NSDate date) completionBlock);
    }

    public class MailCore.MailCore.MCONNTPGroupInfo: NSObject
    {
        public NSString name { get; set; }
        public UInt32 messageCount { get; set; }
    }

    public class MailCore.MailCore.MCONNTPDisconnectOperation: NSObject {}

    public class MailCore.MailCore.MCONetService: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public MailCore.MailCore.MCOConnectionType connectionType { get; set; }
        public static MailCore.MailCore.MCONetService serviceWithInfo(NSDictionary info);
        public id initWithInfo(NSDictionary info);
        public NSDictionary info();
        public NSString hostnameWithEmail(NSString email);
    }

    public class MailCore.MailCore.MCOObjectWrapper: NSObject {}

    public class MailCore.MailCore.MCOPOPSession: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public NSString username { get; set; }
        public NSString password { get; set; }
        public MailCore.MailCore.MCOAuthType authType { get; set; }
        public MailCore.MailCore.MCOConnectionType connectionType { get; set; }
        public NSTimeInterval timeout { get; set; }
        public BOOL checkCertificateEnabled { get; set; }
        public MailCore.MailCore.MCOConnectionLogger connectionLogger { get; set; }
        public dispatch_queue_t dispatchQueue { get; set; }
        public BOOL operationQueueRunning { get; }
        public MailCore.MailCore.MCOOperationQueueRunningChangeBlock operationQueueRunningChangeBlock { get; set; }
        public void cancelAllOperations();
        public MailCore.MailCore.MCOPOPFetchMessagesOperation fetchMessagesOperation();
        public MailCore.MailCore.MCOPOPFetchHeaderOperation fetchHeaderOperationWithIndex(UInt32 index);
        public MailCore.MailCore.MCOPOPFetchMessageOperation fetchMessageOperationWithIndex(UInt32 index);
        public MailCore.MailCore.MCOPOPOperation deleteMessagesOperationWithIndexes(MailCore.MailCore.MCOIndexSet indexes);
        public MailCore.MailCore.MCOPOPOperation disconnectOperation();
        public MailCore.MailCore.MCOPOPOperation checkAccountOperation();
        public MailCore.MailCore.MCOPOPOperation noopOperation();
    }

    public class MailCore.MailCore.MCOPOPOperation: MailCore.MailCore.MCOOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MailCore.MCOPOPFetchHeaderOperation: MailCore.MailCore.MCOPOPOperation
    {
        public void start(        public void (NSError error, MailCore.MailCore.MCOMessageHeader header) completionBlock);
    }

    public     public void (UInt32 current, UInt32 maximum);

    public class MailCore.MailCore.MCOPOPFetchMessageOperation: MailCore.MailCore.MCOPOPOperation
    {
        public MailCore.MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, NSData messageData) completionBlock);
    }

    public class MailCore.MailCore.MCOPOPFetchMessagesOperation: MailCore.MailCore.MCOPOPOperation
    {
        public void start(        public void (NSError error, NSArray messages) completionBlock);
    }

    public class MailCore.MailCore.MCOPOPMessageInfo: NSObject
    {
        public UInt32 index { get; set; }
        public UInt32 size { get; set; }
        public NSString uid { get; set; }
    }

    public class MailCore.MailCore.MCOPOPNoopOperation: MailCore.MailCore.MCOPOPOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MailCore.MCOSMTPSession: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public NSString username { get; set; }
        public NSString password { get; set; }
        public NSString OAuth2Token { get; set; }
        public MailCore.MailCore.MCOAuthType authType { get; set; }
        public MailCore.MailCore.MCOConnectionType connectionType { get; set; }
        public NSTimeInterval timeout { get; set; }
        public BOOL checkCertificateEnabled { get; set; }
        public BOOL useHeloIPEnabled { get; set; }
        public MailCore.MailCore.MCOConnectionLogger connectionLogger { get; set; }
        public dispatch_queue_t dispatchQueue { get; set; }
        public BOOL operationQueueRunning { get; }
        public MailCore.MailCore.MCOOperationQueueRunningChangeBlock operationQueueRunningChangeBlock { get; set; }
        public void cancelAllOperations();
        public MailCore.MailCore.MCOSMTPOperation loginOperation();
        public MailCore.MailCore.MCOSMTPSendOperation sendOperationWithData(NSData messageData);
        public MailCore.MailCore.MCOSMTPSendOperation sendOperationWithData(NSData messageData) @from(MailCore.MailCore.MCOAddress @from) recipients(NSArray recipients);
        public MailCore.MailCore.MCOSMTPOperation checkAccountOperationWithFrom(MailCore.MailCore.MCOAddress @from);
        public MailCore.MailCore.MCOSMTPOperation noopOperation();
    }

    public class MailCore.MailCore.MCOSMTPOperation: MailCore.MailCore.MCOOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public     public void (UInt32 current, UInt32 maximum);

    public class MailCore.MailCore.MCOSMTPSendOperation: MailCore.MailCore.MCOSMTPOperation
    {
        public MailCore.MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MailCore.MCOSMTPLoginOperation: MailCore.MailCore.MCOSMTPOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    //  Extension methods for MailCore.MailCore.MCOCategory
    public static class MailCore.MailCore.MCOCategory {}

    //  Extension methods for MailCore.MailCore.NSString_MCOCategory
    public static class MailCore.MailCore.NSString_MCOCategory
    {
        public static NSString mco_flattenHTML(this NSString @this);
        public static NSString mco_flattenHTMLAndShowBlockquote(this NSString @this, BOOL showBlockquote);
        public static NSString mco_flattenHTMLAndShowBlockquote(this NSString @this, BOOL showBlockquote) showLink(BOOL showLink);
        public static NSString mco_htmlEncodedString(this NSString @this);
        public static NSString mco_cleanedHTMLString(this NSString @this);
        public static NSString mco_strippedWhitespace(this NSString @this);
    }

    //  Extension methods for MailCore.MailCore.NSDictionary_MCOCategory
    public static class MailCore.MailCore.NSDictionary_MCOCategory {}

    //  Extension methods for MailCore.MailCore.NSArray_MCOCategory
    public static class MailCore.MailCore.NSArray_MCOCategory {}

    //  Extension methods for MailCore.MailCore.NSObject_MCOCategory
    public static class MailCore.MailCore.NSObject_MCOCategory {}

    //  Extension methods for MailCore.MailCore.NSError_MCOCategory
    public static class MailCore.MailCore.NSError_MCOCategory {}

    //  Extension methods for MailCore.MailCore.NSValue_MCOCategory
    public static class MailCore.MailCore.NSValue_MCOCategory {}

    //  Extension methods for MailCore.MailCore.NSIndexSet_MCOCategory
    public static class MailCore.MailCore.NSIndexSet_MCOCategory
    {
        public static MailCore.MailCore.MCOIndexSet mcoIndexSet(this NSIndexSet @this);
    }
}
