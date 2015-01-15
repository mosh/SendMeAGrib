//  Import of libMailCore ()
//  Frameworks:
//  Targets: x86_64
//  Dep fx:rtl, Foundation
//  Dep libs:MailCore, ctemplate, etpan, uchardet, xml2, sasl2, iconv, tidy, crypto, ssl, z, c++
using MailCore.UChar = UChar;
using MailCore.mailimap = mailimap;
using MailCore.mailpop3 = mailpop3;
using MailCore.mailsmtp = mailsmtp;
using MailCore.newsnntp = newsnntp;
using MailCore.UDateFormat = UDateFormat;

namespace 
{
    public class MailCore.__Global
    {
        public static Int32 MCLogEnabled;

        public static void MCLogInternal(AnsiChar* user, AnsiChar* filename, UInt32 line, Int32 dumpStack, AnsiChar* format, params uint16_t Param5);
        public static void MCAssertInternal(AnsiChar* filename, UInt32 line, Int32 cond, AnsiChar* condString);

        public static MailCore.MCORange MCORangeEmpty;

        public static MailCore.MCORange MCORangeMake(uint64_t location, uint64_t length);
        public static MailCore.MCOIndexSet MCORangeRemoveRange(MailCore.MCORange range1, MailCore.MCORange range2);
        public static MailCore.MCOIndexSet MCORangeUnion(MailCore.MCORange range1, MailCore.MCORange range2);
        public static MailCore.MCORange MCORangeIntersection(MailCore.MCORange range1, MailCore.MCORange range2);
        public static BOOL MCORangeHasIntersection(MailCore.MCORange range1, MailCore.MCORange range2);
        public static uint64_t MCORangeLeftBound(MailCore.MCORange range);
        public static uint64_t MCORangeRightBound(MailCore.MCORange range);
        public static NSString MCORangeToString(MailCore.MCORange range);
        public static MailCore.MCORange MCORangeFromString(NSString rangeString);

        public static const Void MCOIMAPNamespacePersonal;
        public static const Void MCOIMAPNamespaceOther;
        public static const Void MCOIMAPNamespaceShared;
        public static const Void MCOErrorDomain;

        public static uint16_t MCO_NATIVE_INSTANCE();
    }

    public class MailCore.MCOAbstractMessage: NSObject
    {
        public MailCore.MCOMessageHeader header { get; set; }
        public MailCore.MCOAbstractPart partForContentID(NSString contentID);
        public MailCore.MCOAbstractPart partForUniqueID(NSString uniqueID);
        public NSArray attachments();
        public NSArray htmlInlineAttachments();
        public NSArray requiredPartsForRendering();
    }

    public enum MailCore.MCOPartType: NSInteger
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

    public class MailCore.MCOAbstractPart: NSObject
    {
        public MailCore.MCOPartType partType { get; set; }
        public NSString filename { get; set; }
        public NSString mimeType { get; set; }
        public NSString charset { get; set; }
        public NSString uniqueID { get; set; }
        public NSString contentID { get; set; }
        public NSString contentLocation { get; set; }
        public NSString contentDescription { get; set; }
        public BOOL inlineAttachment { get; set; }
        public MailCore.MCOAbstractPart partForContentID(NSString contentID);
        public MailCore.MCOAbstractPart partForUniqueID(NSString uniqueID);
        public NSString decodedStringForData(NSData data);
        public void setContentTypeParameterValue(NSString @value) forName(NSString name);
        public void removeContentTypeParameterForName(NSString name);
        public NSString contentTypeParameterValueForName(NSString name);
        public NSArray allContentTypeParametersNames();
    }

    public class MailCore.MCOAbstractMessagePart: MailCore.MCOAbstractPart
    {
        public MailCore.MCOMessageHeader header { get; set; }
        public MailCore.MCOAbstractPart mainPart { get; set; }
    }

    public class MailCore.MCOAbstractMultipart: MailCore.MCOAbstractPart
    {
        public NSArray parts { get; set; }
    }

    public class MailCore.MCOAddress: NSObject
    {
        public static MailCore.MCOAddress addressWithDisplayName(NSString displayName) mailbox(NSString mailbox);
        public static MailCore.MCOAddress addressWithMailbox(NSString mailbox);
        public static MailCore.MCOAddress addressWithRFC822String(NSString RFC822String);
        public static MailCore.MCOAddress addressWithNonEncodedRFC822String(NSString nonEncodedRFC822String);
        public static NSArray addressesWithRFC822String(NSString @string);
        public static NSArray addressesWithNonEncodedRFC822String(NSString @string);

        public NSString displayName { get; set; }
        public NSString mailbox { get; set; }
        public NSString RFC822String();
        public NSString nonEncodedRFC822String();
    }

    //  Extension methods for MailCore.MCOAddressCategory
    public static class MailCore.MCOAddressCategory
    {
        public static NSString mco_RFC822StringForAddresses(this NSArray @this);
        public static NSString mco_nonEncodedRFC822StringForAddresses(this NSArray @this);
    }

    public enum MailCore.MCOConnectionType: NSInteger
    {
        MCOConnectionTypeClear,
        Clear,
        MCOConnectionTypeStartTLS,
        StartTLS,
        MCOConnectionTypeTLS,
        TLS
    }

    public enum MailCore.MCOAuthType: NSInteger
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

    public enum MailCore.MCOIMAPFolderFlag: NSInteger
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

    public enum MailCore.MCOMessageFlag: NSInteger
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

    public enum MailCore.MCOEncoding: NSInteger
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

    public enum MailCore.MCOIMAPMessagesRequestKind: NSInteger
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

    public enum MailCore.MCOIMAPStoreFlagsRequestKind: NSInteger
    {
        MCOIMAPStoreFlagsRequestKindAdd,
        Add,
        MCOIMAPStoreFlagsRequestKindRemove,
        Remove,
        MCOIMAPStoreFlagsRequestKindSet,
        Set
    }

    public enum MailCore.MCOIMAPSearchKind: NSInteger
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

    public enum MailCore.MCOIMAPCapability: NSInteger
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

    public enum MailCore.MCOErrorCode: NSInteger
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

    public enum MailCore.MCOConnectionLogType: NSInteger
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

    public     public void (Void* connectionID, MailCore.MCOConnectionLogType type, NSData data);

    public     public void ();

    public class MailCore.MCOMessageHeader: NSObject
    {
        public NSString messageID { get; set; }
        public BOOL messageIDAutoGenerated { get; }
        public NSArray references { get; set; }
        public NSArray inReplyTo { get; set; }
        public NSDate date { get; set; }
        public NSDate receivedDate { get; set; }
        public MailCore.MCOAddress sender { get; set; }
        public MailCore.MCOAddress @from { get; set; }
        public NSArray to { get; set; }
        public NSArray cc { get; set; }
        public NSArray bcc { get; set; }
        public NSArray replyTo { get; set; }
        public NSString subject { get; set; }
        public NSString userAgent { get; set; }
        public static MailCore.MCOMessageHeader headerWithData(NSData data);
        public id initWithData(NSData data);
        public void setExtraHeaderValue(NSString @value) forName(NSString name);
        public void removeExtraHeaderForName(NSString name);
        public NSString extraHeaderValueForName(NSString name);
        public NSArray allExtraHeadersNames();
        public NSString extractedSubject();
        public NSString partialExtractedSubject();
        public void importHeadersData(NSData data);
        public MailCore.MCOMessageHeader replyHeaderWithExcludedRecipients(NSArray excludedRecipients);
        public MailCore.MCOMessageHeader replyAllHeaderWithExcludedRecipients(NSArray excludedRecipients);
        public MailCore.MCOMessageHeader forwardHeader();
    }

    public interface MailCore.IMCOHTMLRendererDelegate
    {
        BOOL MCOAbstractMessage(MailCore.MCOAbstractMessage msg) canPreviewPart(MailCore.MCOAbstractPart part);
        BOOL MCOAbstractMessage(MailCore.MCOAbstractMessage msg) shouldShowPart(MailCore.MCOAbstractPart part);
        NSDictionary MCOAbstractMessage(MailCore.MCOAbstractMessage msg) templateValuesForHeader(MailCore.MCOMessageHeader header);
        NSDictionary MCOAbstractMessage(MailCore.MCOAbstractMessage msg) templateValuesForPart(MailCore.MCOAbstractPart part);
        NSString MCOAbstractMessage(MailCore.MCOAbstractMessage msg) templateForMainHeader(MailCore.MCOMessageHeader header);
        NSString MCOAbstractMessage(MailCore.MCOAbstractMessage msg) templateForImage(MailCore.MCOAbstractPart header);
        NSString MCOAbstractMessage(MailCore.MCOAbstractMessage msg) templateForAttachment(MailCore.MCOAbstractPart part);
        NSString MCOAbstractMessage_templateForMessage(MailCore.MCOAbstractMessage msg);
        NSString MCOAbstractMessage(MailCore.MCOAbstractMessage msg) templateForEmbeddedMessage(MailCore.MCOAbstractMessagePart part);
        NSString MCOAbstractMessage(MailCore.MCOAbstractMessage msg) templateForEmbeddedMessageHeader(MailCore.MCOMessageHeader header);
        NSString MCOAbstractMessage_templateForAttachmentSeparator(MailCore.MCOAbstractMessage msg);
        NSString MCOAbstractMessage(MailCore.MCOAbstractMessage msg) cleanHTMLForPart(NSString html);
        NSString MCOAbstractMessage(MailCore.MCOAbstractMessage msg) filterHTMLForPart(NSString html);
        NSString MCOAbstractMessage(MailCore.MCOAbstractMessage msg) filterHTMLForMessage(NSString html);
    }

    public interface MailCore.IMCOHTMLRendererIMAPDelegate
    {
        NSData MCOAbstractMessage(MailCore.MCOAbstractMessage msg) dataForIMAPPart(MailCore.MCOIMAPPart part) folder(NSString folder);
        void MCOAbstractMessage(MailCore.MCOAbstractMessage msg) prefetchAttachmentIMAPPart(MailCore.MCOIMAPPart part) folder(NSString folder);
        void MCOAbstractMessage(MailCore.MCOAbstractMessage msg) prefetchImageIMAPPart(MailCore.MCOIMAPPart part) folder(NSString folder);
    }

    public class MailCore.MCOAttachment: MailCore.MCOAbstractPart
    {
        public static NSString mimeTypeForFilename(NSString filename);
        public static MailCore.MCOAttachment attachmentWithContentsOfFile(NSString filename);
        public static MailCore.MCOAttachment attachmentWithData(NSData data) filename(NSString filename);
        public static MailCore.MCOAttachment attachmentWithHTMLString(NSString htmlString);
        public static MailCore.MCOAttachment attachmentWithRFC822Message(NSData messageData);
        public static MailCore.MCOAttachment attachmentWithText(NSString text);

        public NSData data { get; set; }
        public NSString decodedString();
    }

    public class MailCore.MCOIMAPSession: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public NSString username { get; set; }
        public NSString password { get; set; }
        public NSString OAuth2Token { get; set; }
        public MailCore.MCOAuthType authType { get; set; }
        public MailCore.MCOConnectionType connectionType { get; set; }
        public NSTimeInterval timeout { get; set; }
        public BOOL checkCertificateEnabled { get; set; }
        public BOOL voIPEnabled { get; set; }
        public MailCore.MCOIMAPNamespace defaultNamespace { get; set; }
        public MailCore.MCOIMAPIdentity clientIdentity { get; }
        public MailCore.MCOIMAPIdentity serverIdentity { get; }
        public NSString gmailUserDisplayName { get; }
        public BOOL allowsFolderConcurrentAccessEnabled { get; set; }
        public UInt32 maximumConnections { get; set; }
        public MailCore.MCOConnectionLogger connectionLogger { get; set; }
        public dispatch_queue_t dispatchQueue { get; set; }
        public BOOL operationQueueRunning { get; }
        public MailCore.MCOOperationQueueRunningChangeBlock operationQueueRunningChangeBlock { get; set; }
        public void cancelAllOperations();
        public MailCore.MCOIMAPFolderInfoOperation folderInfoOperation(NSString folder);
        public MailCore.MCOIMAPFolderStatusOperation folderStatusOperation(NSString folder);
        public MailCore.MCOIMAPFetchFoldersOperation fetchSubscribedFoldersOperation();
        public MailCore.MCOIMAPFetchFoldersOperation fetchAllFoldersOperation();
        public MailCore.MCOIMAPOperation renameFolderOperation(NSString folder) otherName(NSString otherName);
        public MailCore.MCOIMAPOperation deleteFolderOperation(NSString folder);
        public MailCore.MCOIMAPOperation createFolderOperation(NSString folder);
        public MailCore.MCOIMAPOperation subscribeFolderOperation(NSString folder);
        public MailCore.MCOIMAPOperation unsubscribeFolderOperation(NSString folder);
        public MailCore.MCOIMAPOperation expungeOperation(NSString folder);
        public MailCore.MCOIMAPAppendMessageOperation appendMessageOperationWithFolder(NSString folder) messageData(NSData messageData) flags(MailCore.MCOMessageFlag flags);
        public MailCore.MCOIMAPAppendMessageOperation appendMessageOperationWithFolder(NSString folder) messageData(NSData messageData) flags(MailCore.MCOMessageFlag flags) customFlags(NSArray customFlags);
        public MailCore.MCOIMAPCopyMessagesOperation copyMessagesOperationWithFolder(NSString folder) uids(MailCore.MCOIndexSet uids) destFolder(NSString destFolder);
        public MailCore.MCOIMAPOperation storeFlagsOperationWithFolder(NSString folder) uids(MailCore.MCOIndexSet uids) kind(MailCore.MCOIMAPStoreFlagsRequestKind kind) flags(MailCore.MCOMessageFlag flags);
        public MailCore.MCOIMAPOperation storeFlagsOperationWithFolder(NSString folder) numbers(MailCore.MCOIndexSet numbers) kind(MailCore.MCOIMAPStoreFlagsRequestKind kind) flags(MailCore.MCOMessageFlag flags);
        public MailCore.MCOIMAPOperation storeFlagsOperationWithFolder(NSString folder) uids(MailCore.MCOIndexSet uids) kind(MailCore.MCOIMAPStoreFlagsRequestKind kind) flags(MailCore.MCOMessageFlag flags) customFlags(NSArray customFlags);
        public MailCore.MCOIMAPOperation storeFlagsOperationWithFolder(NSString folder) numbers(MailCore.MCOIndexSet numbers) kind(MailCore.MCOIMAPStoreFlagsRequestKind kind) flags(MailCore.MCOMessageFlag flags) customFlags(NSArray customFlags);
        public MailCore.MCOIMAPOperation storeLabelsOperationWithFolder(NSString folder) numbers(MailCore.MCOIndexSet numbers) kind(MailCore.MCOIMAPStoreFlagsRequestKind kind) labels(NSArray labels);
        public MailCore.MCOIMAPOperation storeLabelsOperationWithFolder(NSString folder) uids(MailCore.MCOIndexSet uids) kind(MailCore.MCOIMAPStoreFlagsRequestKind kind) labels(NSArray labels);
        public MailCore.MCOIMAPFetchMessagesOperation fetchMessagesByUIDOperationWithFolder(NSString folder) requestKind(MailCore.MCOIMAPMessagesRequestKind requestKind) uids(MailCore.MCOIndexSet uids);
        public MailCore.MCOIMAPFetchMessagesOperation fetchMessagesOperationWithFolder(NSString folder) requestKind(MailCore.MCOIMAPMessagesRequestKind requestKind) uids(MailCore.MCOIndexSet uids);
        public MailCore.MCOIMAPFetchMessagesOperation fetchMessagesByNumberOperationWithFolder(NSString folder) requestKind(MailCore.MCOIMAPMessagesRequestKind requestKind) numbers(MailCore.MCOIndexSet numbers);
        public MailCore.MCOIMAPFetchMessagesOperation syncMessagesByUIDWithFolder(NSString folder) requestKind(MailCore.MCOIMAPMessagesRequestKind requestKind) uids(MailCore.MCOIndexSet uids) modSeq(uint64_t modSeq);
        public MailCore.MCOIMAPFetchMessagesOperation syncMessagesWithFolder(NSString folder) requestKind(MailCore.MCOIMAPMessagesRequestKind requestKind) uids(MailCore.MCOIndexSet uids) modSeq(uint64_t modSeq);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageByUIDOperationWithFolder(NSString folder) uid(uint32_t uid) urgent(BOOL urgent);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageByUIDOperationWithFolder(NSString folder) uid(uint32_t uid);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageOperationWithFolder(NSString folder) uid(uint32_t uid) urgent(BOOL urgent);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageOperationWithFolder(NSString folder) uid(uint32_t uid);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageOperationWithFolder(NSString folder) number(uint32_t number) urgent(BOOL urgent);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageOperationWithFolder(NSString folder) number(uint32_t number);
        public MailCore.MCOIMAPFetchParsedContentOperation fetchParsedMessageOperationWithFolder(NSString folder) uid(uint32_t uid) urgent(BOOL urgent);
        public MailCore.MCOIMAPFetchParsedContentOperation fetchParsedMessageOperationWithFolder(NSString folder) uid(uint32_t uid);
        public MailCore.MCOIMAPFetchParsedContentOperation fetchParsedMessageOperationWithFolder(NSString folder) number(uint32_t number) urgent(BOOL urgent);
        public MailCore.MCOIMAPFetchParsedContentOperation fetchParsedMessageOperationWithFolder(NSString folder) number(uint32_t number);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentByUIDOperationWithFolder(NSString folder) uid(uint32_t uid) partID(NSString partID) encoding(MailCore.MCOEncoding encoding) urgent(BOOL urgent);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentByUIDOperationWithFolder(NSString folder) uid(uint32_t uid) partID(NSString partID) encoding(MailCore.MCOEncoding encoding);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentOperationWithFolder(NSString folder) uid(uint32_t uid) partID(NSString partID) encoding(MailCore.MCOEncoding encoding) urgent(BOOL urgent);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentOperationWithFolder(NSString folder) uid(uint32_t uid) partID(NSString partID) encoding(MailCore.MCOEncoding encoding);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentOperationWithFolder(NSString folder) number(uint32_t number) partID(NSString partID) encoding(MailCore.MCOEncoding encoding) urgent(BOOL urgent);
        public MailCore.MCOIMAPFetchContentOperation fetchMessageAttachmentOperationWithFolder(NSString folder) number(uint32_t number) partID(NSString partID) encoding(MailCore.MCOEncoding encoding);
        public MailCore.MCOIMAPIdleOperation idleOperationWithFolder(NSString folder) lastKnownUID(uint32_t lastKnownUID);
        public MailCore.MCOIMAPFetchNamespaceOperation fetchNamespaceOperation();
        public MailCore.MCOIMAPIdentityOperation identityOperationWithClientIdentity(MailCore.MCOIMAPIdentity identity);
        public MailCore.MCOIMAPOperation connectOperation();
        public MailCore.MCOIMAPOperation noopOperation();
        public MailCore.MCOIMAPOperation checkAccountOperation();
        public MailCore.MCOIMAPCapabilityOperation capabilityOperation();
        public MailCore.MCOIMAPQuotaOperation quotaOperation();
        public MailCore.MCOIMAPSearchOperation searchOperationWithFolder(NSString folder) kind(MailCore.MCOIMAPSearchKind kind) searchString(NSString searchString);
        public MailCore.MCOIMAPSearchOperation searchExpressionOperationWithFolder(NSString folder) expression(MailCore.MCOIMAPSearchExpression expression);
        public MailCore.MCOIMAPMessageRenderingOperation htmlRenderingOperationWithMessage(MailCore.MCOIMAPMessage message) folder(NSString folder);
        public MailCore.MCOIMAPMessageRenderingOperation htmlBodyRenderingOperationWithMessage(MailCore.MCOIMAPMessage message) folder(NSString folder);
        public MailCore.MCOIMAPMessageRenderingOperation plainTextRenderingOperationWithMessage(MailCore.MCOIMAPMessage message) folder(NSString folder);
        public MailCore.MCOIMAPMessageRenderingOperation plainTextBodyRenderingOperationWithMessage(MailCore.MCOIMAPMessage message) folder(NSString folder) stripWhitespace(BOOL stripWhitespace);
        public MailCore.MCOIMAPMessageRenderingOperation plainTextBodyRenderingOperationWithMessage(MailCore.MCOIMAPMessage message) folder(NSString folder);
        public MailCore.MCOIMAPOperation disconnectOperation();
    }

    public class MailCore.MCOOperation: NSObject
    {
        public BOOL isCancelled { get; }
        public BOOL shouldRunWhenCancelled { get; set; }
        public dispatch_queue_t callbackDispatchQueue { get; set; }
        public void operationCompleted();
        public void cancel();
    }

    public     public void (UInt32 current, UInt32 maximum);

    public     public void (UInt32 current);

    public class MailCore.MCOIMAPBaseOperation: MailCore.MCOOperation
    {
        public BOOL urgent { get; set; }
        public void bodyProgress(UInt32 current) maximum(UInt32 maximum);
        public void itemProgress(UInt32 current) maximum(UInt32 maximum);
    }

    public class MailCore.MCOIMAPOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MCOIMAPFetchFoldersOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSArray folders) completionBlock);
    }

    public class MailCore.MCOIMAPFolder: NSObject
    {
        public NSString path { get; set; }
        public AnsiChar delimiter { get; set; }
        public MailCore.MCOIMAPFolderFlag flags { get; set; }
    }

    public class MailCore.MCOIMAPMessage: MailCore.MCOAbstractMessage
    {
        public uint32_t uid { get; set; }
        public uint32_t sequenceNumber { get; set; }
        public uint32_t size { get; set; }
        public MailCore.MCOMessageFlag flags { get; set; }
        public MailCore.MCOMessageFlag originalFlags { get; set; }
        public NSArray customFlags { get; set; }
        public uint64_t modSeqValue { get; set; }
        public MailCore.MCOAbstractPart mainPart { get; set; }
        public NSArray gmailLabels { get; set; }
        public uint64_t gmailMessageID { get; set; }
        public uint64_t gmailThreadID { get; set; }
        public MailCore.MCOAbstractPart partForPartID(NSString partID);
        public NSString htmlRenderingWithFolder(NSString folder) @delegate(MailCore.IMCOHTMLRendererIMAPDelegate @delegate);
    }

    public class MailCore.MCOIMAPMessagePart: MailCore.MCOAbstractMessagePart
    {
        public NSString partID { get; set; }
    }

    public class MailCore.MCOIMAPMultipart: MailCore.MCOAbstractMultipart
    {
        public NSString partID { get; set; }
    }

    public class MailCore.MCOIMAPNamespace: NSObject
    {
        public static MailCore.MCOIMAPNamespace namespaceWithPrefix(NSString prefix) delimiter(AnsiChar delimiter);
        public NSString mainPrefix();
        public AnsiChar mainDelimiter();
        public NSArray prefixes();
        public NSString pathForComponents(NSArray components);
        public NSString pathForComponents(NSArray components) prefix(NSString prefix);
        public NSArray componentsFromPath(NSString path);
        public BOOL containsFolderPath(NSString path);
    }

    public class MailCore.MCOIMAPNamespaceItem: NSObject
    {
        public NSString prefix { get; set; }
        public AnsiChar delimiter { get; set; }
        public NSString pathForComponents(NSArray components);
        public NSArray componentsForPath(NSString path);
        public BOOL containsFolder(NSString folder);
    }

    public class MailCore.MCOIMAPIdentity: NSObject
    {
        public static MailCore.MCOIMAPIdentity identityWithVendor(NSString vendor) name(NSString name) version(NSString version);

        public NSString vendor { get; set; }
        public NSString name { get; set; }
        public NSString version { get; set; }
        public NSArray allInfoKeys();
        public NSString infoForKey(NSString key);
        public void setInfo(NSString @value) forKey(NSString key);
        public void removeAllInfos();
    }

    public class MailCore.MCOIMAPPart: MailCore.MCOAbstractPart
    {
        public NSString partID { get; set; }
        public UInt32 size { get; set; }
        public MailCore.MCOEncoding encoding { get; set; }
        public UInt32 decodedSize();
    }

    public class MailCore.MCOIMAPFolderInfoOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, MailCore.MCOIMAPFolderInfo info) completionBlock);
    }

    public class MailCore.MCOIMAPFolderInfo: NSObject
    {
        public static MailCore.MCOIMAPFolderInfo info();

        public uint32_t uidNext { get; set; }
        public uint32_t uidValidity { get; set; }
        public uint64_t modSequenceValue { get; set; }
        public Int32 messageCount { get; set; }
        public uint32_t firstUnseenUid { get; set; }
        public BOOL allowsNewPermanentFlags { get; set; }
    }

    public class MailCore.MCOIMAPFolderStatusOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, MailCore.MCOIMAPFolderStatus status) completionBlock);
    }

    public class MailCore.MCOIMAPFolderStatus: NSObject
    {
        public uint32_t uidNext { get; set; }
        public uint32_t uidValidity { get; set; }
        public uint32_t recentCount { get; set; }
        public uint32_t unseenCount { get; set; }
        public uint32_t messageCount { get; set; }
        public uint64_t highestModSeqValue { get; set; }
    }

    public class MailCore.MCOIMAPAppendMessageOperation: MailCore.MCOIMAPBaseOperation
    {
        public time_t date { get; set; }
        public MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, uint32_t createdUID) completionBlock);
    }

    public class MailCore.MCOIMAPCopyMessagesOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSDictionary uidMapping) completionBlock);
    }

    public class MailCore.MCOIMAPFetchMessagesOperation: MailCore.MCOIMAPBaseOperation
    {
        public MailCore.MCOIMAPBaseOperationItemProgressBlock progress { get; set; }
        public NSArray extraHeaders { get; set; }
        public void start(        public void (NSError error, NSArray messages, MailCore.MCOIndexSet vanishedMessages) completionBlock);
    }

    public class MailCore.MCOIMAPFetchContentOperation: MailCore.MCOIMAPBaseOperation
    {
        public MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, NSData data) completionBlock);
    }

    public class MailCore.MCOIMAPFetchParsedContentOperation: MailCore.MCOIMAPBaseOperation
    {
        public MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, MailCore.MCOMessageParser parser) completionBlock);
    }

    public class MailCore.MCOIMAPSearchOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, MailCore.MCOIndexSet searchResult) completionBlock);
    }

    public class MailCore.MCOIMAPIdleOperation: MailCore.MCOIMAPBaseOperation
    {
        public void interruptIdle();
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MCOIMAPFetchNamespaceOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSDictionary namespaces) completionBlock);
    }

    public class MailCore.MCOIMAPIdentityOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSDictionary serverIdentity) completionBlock);
    }

    public class MailCore.MCOIMAPCapabilityOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, MailCore.MCOIndexSet capabilities) completionBlock);
    }

    public class MailCore.MCOIMAPQuotaOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSError error, NSUInteger usage, NSUInteger limit) completionBlock);
    }

    public struct MailCore.MCORange
    {
        public uint64_t location;
        public uint64_t length;
    }

    public class MailCore.MCOIndexSet: NSObject
    {
        public static MailCore.MCOIndexSet indexSet();
        public static MailCore.MCOIndexSet indexSetWithRange(MailCore.MCORange range);
        public static MailCore.MCOIndexSet indexSetWithIndex(uint64_t idx);
        public UInt32 count();
        public void addIndex(uint64_t idx);
        public void removeIndex(uint64_t idx);
        public BOOL containsIndex(uint64_t idx);
        public void addRange(MailCore.MCORange range);
        public void removeRange(MailCore.MCORange range);
        public void intersectsRange(MailCore.MCORange range);
        public void addIndexSet(MailCore.MCOIndexSet indexSet);
        public void removeIndexSet(MailCore.MCOIndexSet indexSet);
        public void intersectsIndexSet(MailCore.MCOIndexSet indexSet);
        public MailCore.MCORange* allRanges();
        public UInt32 rangesCount();
        public void enumerateIndexes(        public void (uint64_t idx) block);
        public NSIndexSet nsIndexSet();
    }

    public class MailCore.MCOIMAPSearchExpression: NSObject
    {
        public static MailCore.MCOIMAPSearchExpression searchAll();
        public static MailCore.MCOIMAPSearchExpression searchFrom(NSString @value);
        public static MailCore.MCOIMAPSearchExpression searchRecipient(NSString @value);
        public static MailCore.MCOIMAPSearchExpression searchTo(NSString @value);
        public static MailCore.MCOIMAPSearchExpression searchCc(NSString @value);
        public static MailCore.MCOIMAPSearchExpression searchBcc(NSString @value);
        public static MailCore.MCOIMAPSearchExpression searchSubject(NSString @value);
        public static MailCore.MCOIMAPSearchExpression searchContent(NSString @value);
        public static MailCore.MCOIMAPSearchExpression searchBody(NSString @value);
        public static MailCore.MCOIMAPSearchExpression searchUIDs(MailCore.MCOIndexSet uids);
        public static MailCore.MCOIMAPSearchExpression searchHeader(NSString header) @value(NSString @value);
        public static MailCore.MCOIMAPSearchExpression searchRead();
        public static MailCore.MCOIMAPSearchExpression searchUnread();
        public static MailCore.MCOIMAPSearchExpression searchFlagged();
        public static MailCore.MCOIMAPSearchExpression searchUnflagged();
        public static MailCore.MCOIMAPSearchExpression searchAnswered();
        public static MailCore.MCOIMAPSearchExpression searchUnanswered();
        public static MailCore.MCOIMAPSearchExpression searchDraft();
        public static MailCore.MCOIMAPSearchExpression searchUndraft();
        public static MailCore.MCOIMAPSearchExpression searchDeleted();
        public static MailCore.MCOIMAPSearchExpression searchSpam();
        public static MailCore.MCOIMAPSearchExpression searchBeforeDate(NSDate date);
        public static MailCore.MCOIMAPSearchExpression searchOnDate(NSDate date);
        public static MailCore.MCOIMAPSearchExpression searchSinceDate(NSDate date);
        public static MailCore.MCOIMAPSearchExpression searchBeforeReceivedDate(NSDate date);
        public static MailCore.MCOIMAPSearchExpression searchOnReceivedDate(NSDate date);
        public static MailCore.MCOIMAPSearchExpression searchSinceReceivedDate(NSDate date);
        public static MailCore.MCOIMAPSearchExpression searchSizeLargerThan(uint32_t size);
        public static MailCore.MCOIMAPSearchExpression searchSizeSmallerThan(uint32_t size);
        public static MailCore.MCOIMAPSearchExpression searchGmailThreadID(uint64_t number);
        public static MailCore.MCOIMAPSearchExpression searchGmailMessageID(uint64_t number);
        public static MailCore.MCOIMAPSearchExpression searchGmailRaw(NSString expr);
        public static MailCore.MCOIMAPSearchExpression searchAnd(MailCore.MCOIMAPSearchExpression expression) other(MailCore.MCOIMAPSearchExpression other);
        public static MailCore.MCOIMAPSearchExpression searchOr(MailCore.MCOIMAPSearchExpression expression) other(MailCore.MCOIMAPSearchExpression other);
        public static MailCore.MCOIMAPSearchExpression searchNot(MailCore.MCOIMAPSearchExpression expression);
    }

    public class MailCore.MCOIMAPMessageRenderingOperation: MailCore.MCOIMAPBaseOperation
    {
        public void start(        public void (NSString htmlString, NSError error) completionBlock);
    }

    public class MailCore.MCOMailProvider: NSObject
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

    public class MailCore.MCOMailProvidersManager: NSObject
    {
        public static MailCore.MCOMailProvidersManager sharedManager();
        public MailCore.MCOMailProvider providerForEmail(NSString email);
        public MailCore.MCOMailProvider providerForMX(NSString hostname);
        public MailCore.MCOMailProvider providerForIdentifier(NSString identifier);
        public void registerProvidersWithFilename(NSString filename);
    }

    public class MailCore.MCOMessageBuilder: MailCore.MCOAbstractMessage
    {
        public NSString htmlBody { get; set; }
        public NSString textBody { get; set; }
        public NSArray attachments { get; set; }
        public NSArray relatedAttachments { get; set; }
        public NSString boundaryPrefix { get; set; }
        public void addAttachment(MailCore.MCOAttachment attachment);
        public void addRelatedAttachment(MailCore.MCOAttachment attachment);
        public NSData data();
        public NSData dataForEncryption();
        public NSData openPGPSignedMessageDataWithSignatureData(NSData signature);
        public NSData openPGPEncryptedMessageDataWithEncryptedData(NSData encryptedData);
        public NSString htmlRenderingWithDelegate(MailCore.IMCOHTMLRendererDelegate @delegate);
        public NSString htmlBodyRendering();
        public NSString plainTextRendering();
        public NSString plainTextBodyRendering();
        public NSString plainTextBodyRenderingAndStripWhitespace(BOOL stripWhitespace);
    }

    public class MailCore.MCOMessageParser: MailCore.MCOAbstractMessage
    {
        public static MailCore.MCOMessageParser messageParserWithData(NSData data);
        public id initWithData(NSData data);
        public void dealloc();
        public MailCore.MCOAbstractPart mainPart();
        public NSData data();
        public NSString htmlRenderingWithDelegate(MailCore.IMCOHTMLRendererDelegate @delegate);
        public NSString htmlBodyRendering();
        public NSString plainTextRendering();
        public NSString plainTextBodyRendering();
        public NSString plainTextBodyRenderingAndStripWhitespace(BOOL stripWhitespace);
    }

    public class MailCore.MCOMessagePart: MailCore.MCOAbstractMessagePart {}

    public class MailCore.MCOMultipart: MailCore.MCOAbstractMultipart {}

    public class MailCore.MCONNTPSession: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public NSString username { get; set; }
        public NSString password { get; set; }
        public MailCore.MCOConnectionType connectionType { get; set; }
        public NSTimeInterval timeout { get; set; }
        public BOOL checkCertificateEnabled { get; set; }
        public MailCore.MCOConnectionLogger connectionLogger { get; set; }
        public dispatch_queue_t dispatchQueue { get; set; }
        public BOOL operationQueueRunning { get; }
        public MailCore.MCOOperationQueueRunningChangeBlock operationQueueRunningChangeBlock { get; set; }
        public void cancelAllOperations();
        public MailCore.MCONNTPFetchAllArticlesOperation fetchAllArticlesOperation(NSString @group);
        public MailCore.MCONNTPFetchHeaderOperation fetchHeaderOperationWithIndex(UInt32 index) inGroup(NSString @group);
        public MailCore.MCONNTPFetchOverviewOperation fetchOverviewOperationWithIndexes(MailCore.MCOIndexSet indexes) inGroup(NSString @group);
        public MailCore.MCONNTPFetchArticleOperation fetchArticleOperationWithIndex(UInt32 index) inGroup(NSString @group);
        public MailCore.MCONNTPFetchArticleOperation fetchArticleOperationWithMessageID(NSString messageID) inGroup(NSString @group);
        public MailCore.MCONNTPFetchServerTimeOperation fetchServerDateOperation();
        public MailCore.MCONNTPListNewsgroupsOperation listAllNewsgroupsOperation();
        public MailCore.MCONNTPListNewsgroupsOperation listDefaultNewsgroupsOperation();
        public MailCore.MCONNTPOperation disconnectOperation();
        public MailCore.MCONNTPOperation checkAccountOperation();
    }

    public class MailCore.MCONNTPOperation: MailCore.MCOOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MCONNTPFetchHeaderOperation: MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, MailCore.MCOMessageHeader header) completionBlock);
    }

    public     public void (UInt32 current, UInt32 maximum);

    public class MailCore.MCONNTPFetchArticleOperation: MailCore.MCONNTPOperation
    {
        public MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, NSData messageData) completionBlock);
    }

    public class MailCore.MCONNTPFetchAllArticlesOperation: MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, MailCore.MCOIndexSet articles) completionBlock);
    }

    public class MailCore.MCONNTPListNewsgroupsOperation: MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, NSArray messages) completionBlock);
    }

    public class MailCore.MCONNTPFetchOverviewOperation: MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, NSArray messages) completionBlock);
    }

    public class MailCore.MCONNTPFetchServerTimeOperation: MailCore.MCONNTPOperation
    {
        public void start(        public void (NSError error, NSDate date) completionBlock);
    }

    public class MailCore.MCONNTPGroupInfo: NSObject
    {
        public NSString name { get; set; }
        public UInt32 messageCount { get; set; }
    }

    public class MailCore.MCONNTPDisconnectOperation: NSObject {}

    public class MailCore.MCONetService: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public MailCore.MCOConnectionType connectionType { get; set; }
        public static MailCore.MCONetService serviceWithInfo(NSDictionary info);
        public id initWithInfo(NSDictionary info);
        public NSDictionary info();
        public NSString hostnameWithEmail(NSString email);
    }

    public class MailCore.MCOObjectWrapper: NSObject {}

    public class MailCore.MCOPOPSession: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public NSString username { get; set; }
        public NSString password { get; set; }
        public MailCore.MCOAuthType authType { get; set; }
        public MailCore.MCOConnectionType connectionType { get; set; }
        public NSTimeInterval timeout { get; set; }
        public BOOL checkCertificateEnabled { get; set; }
        public MailCore.MCOConnectionLogger connectionLogger { get; set; }
        public dispatch_queue_t dispatchQueue { get; set; }
        public BOOL operationQueueRunning { get; }
        public MailCore.MCOOperationQueueRunningChangeBlock operationQueueRunningChangeBlock { get; set; }
        public void cancelAllOperations();
        public MailCore.MCOPOPFetchMessagesOperation fetchMessagesOperation();
        public MailCore.MCOPOPFetchHeaderOperation fetchHeaderOperationWithIndex(UInt32 index);
        public MailCore.MCOPOPFetchMessageOperation fetchMessageOperationWithIndex(UInt32 index);
        public MailCore.MCOPOPOperation deleteMessagesOperationWithIndexes(MailCore.MCOIndexSet indexes);
        public MailCore.MCOPOPOperation disconnectOperation();
        public MailCore.MCOPOPOperation checkAccountOperation();
        public MailCore.MCOPOPOperation noopOperation();
    }

    public class MailCore.MCOPOPOperation: MailCore.MCOOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MCOPOPFetchHeaderOperation: MailCore.MCOPOPOperation
    {
        public void start(        public void (NSError error, MailCore.MCOMessageHeader header) completionBlock);
    }

    public     public void (UInt32 current, UInt32 maximum);

    public class MailCore.MCOPOPFetchMessageOperation: MailCore.MCOPOPOperation
    {
        public MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error, NSData messageData) completionBlock);
    }

    public class MailCore.MCOPOPFetchMessagesOperation: MailCore.MCOPOPOperation
    {
        public void start(        public void (NSError error, NSArray messages) completionBlock);
    }

    public class MailCore.MCOPOPMessageInfo: NSObject
    {
        public UInt32 index { get; set; }
        public UInt32 size { get; set; }
        public NSString uid { get; set; }
    }

    public class MailCore.MCOPOPNoopOperation: MailCore.MCOPOPOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MCOSMTPSession: NSObject
    {
        public NSString hostname { get; set; }
        public UInt32 port { get; set; }
        public NSString username { get; set; }
        public NSString password { get; set; }
        public NSString OAuth2Token { get; set; }
        public MailCore.MCOAuthType authType { get; set; }
        public MailCore.MCOConnectionType connectionType { get; set; }
        public NSTimeInterval timeout { get; set; }
        public BOOL checkCertificateEnabled { get; set; }
        public BOOL useHeloIPEnabled { get; set; }
        public MailCore.MCOConnectionLogger connectionLogger { get; set; }
        public dispatch_queue_t dispatchQueue { get; set; }
        public BOOL operationQueueRunning { get; }
        public MailCore.MCOOperationQueueRunningChangeBlock operationQueueRunningChangeBlock { get; set; }
        public void cancelAllOperations();
        public MailCore.MCOSMTPOperation loginOperation();
        public MailCore.MCOSMTPSendOperation sendOperationWithData(NSData messageData);
        public MailCore.MCOSMTPSendOperation sendOperationWithData(NSData messageData) @from(MailCore.MCOAddress @from) recipients(NSArray recipients);
        public MailCore.MCOSMTPOperation checkAccountOperationWithFrom(MailCore.MCOAddress @from);
        public MailCore.MCOSMTPOperation noopOperation();
    }

    public class MailCore.MCOSMTPOperation: MailCore.MCOOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    public     public void (UInt32 current, UInt32 maximum);

    public class MailCore.MCOSMTPSendOperation: MailCore.MCOSMTPOperation
    {
        public MailCore.MCOIMAPBaseOperationProgressBlock progress { get; set; }
        public void start(        public void (NSError error) completionBlock);
    }

    public class MailCore.MCOSMTPLoginOperation: MailCore.MCOSMTPOperation
    {
        public void start(        public void (NSError error) completionBlock);
    }

    //  Extension methods for MailCore.MCOCategory
    public static class MailCore.MCOCategory {}

    //  Extension methods for MailCore.NSString_MCOCategory
    public static class MailCore.NSString_MCOCategory
    {
        public static NSString mco_flattenHTML(this NSString @this);
        public static NSString mco_flattenHTMLAndShowBlockquote(this NSString @this, BOOL showBlockquote);
        public static NSString mco_flattenHTMLAndShowBlockquote(this NSString @this, BOOL showBlockquote) showLink(BOOL showLink);
        public static NSString mco_htmlEncodedString(this NSString @this);
        public static NSString mco_cleanedHTMLString(this NSString @this);
        public static NSString mco_strippedWhitespace(this NSString @this);
    }

    //  Extension methods for MailCore.NSDictionary_MCOCategory
    public static class MailCore.NSDictionary_MCOCategory {}

    //  Extension methods for MailCore.NSArray_MCOCategory
    public static class MailCore.NSArray_MCOCategory {}

    //  Extension methods for MailCore.NSObject_MCOCategory
    public static class MailCore.NSObject_MCOCategory {}

    //  Extension methods for MailCore.NSError_MCOCategory
    public static class MailCore.NSError_MCOCategory {}

    //  Extension methods for MailCore.NSValue_MCOCategory
    public static class MailCore.NSValue_MCOCategory {}

    //  Extension methods for MailCore.NSIndexSet_MCOCategory
    public static class MailCore.NSIndexSet_MCOCategory
    {
        public static MailCore.MCOIndexSet mcoIndexSet(this NSIndexSet @this);
    }
}
