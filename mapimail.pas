unit mapimail;
// --------------------------------------------------------------
// Simple wrapper for Simple MAPI.  Sends an email with an
// optional file attachment using the client's MAPI client, e.g.
// Outlook or NS Communicator.  Very simple implementation
// limited to one target and one attachment.
// --------------------------------------------------------------

interface

uses
   sysutils, dialogs, forms, Windows, MAPI;

type
   tMailFileException = class( Exception );
const
   ERROR = 'Unable to send email message.' + #10#10 + 'Reason: %s.';

function sendMail( const TargetName, TargetAddr,
                         SenderName, SenderAddr,
                         MsgSubject, MsgContent,
                         Attachment : String;
                         PreviewMsg : Boolean = TRUE ) : Integer;
function getMAPIError( intErrorCode : Integer ) : String;

implementation

function sendMail( const TargetName, TargetAddr,
                         SenderName, SenderAddr,
                         MsgSubject, MsgContent,
                         Attachment : String;
                         PreviewMsg : Boolean = TRUE ) : Integer;
var
  msg       : TMapiMessage;    // Pointer to the message itself
  mrdSender,                   // Who's sending it?
  mrdTarget : TMapiRecipDesc;  // Who's going to get it?
  mfdAttach : TMapiFileDesc;   // The attached file.
  liFlags   : Longint;         // Flags for MAPI.
  strError  : String;          // Holds MAPI error results;
begin
 result := 0;
 liFlags := 0;
 fillChar( msg, sizeOf( msg ), 0 );
 with msg do
 begin

   if TargetAddr = '' then
      raise tMailFileException.createFmt( ERROR,
         [ 'Target email address not specified' ] )
   else begin
      if TargetName = '' then
         mrdTarget.lpszName := pChar( TargetAddr )
      else
         mrdTarget.lpszName := pChar( TargetName );
      mrdTarget.ulRecipClass := MAPI_TO;
      mrdTarget.lpszAddress := pChar( TargetAddr );
      mrdTarget.ulReserved := 0;
      mrdTarget.ulEIDSize := 0;
      mrdTarget.lpEntryID := NIL;
      nRecipCount := 1;
      lpRecips := @mrdTarget;

   end;

   if SenderAddr = '' then
      raise tMailFileException.createFmt( ERROR,
         [ 'Sender email address not specified' ] )
   else begin
      if SenderName = '' then
         mrdSender.lpszName := pChar( SenderAddr )
      else
         mrdSender.lpszName := pChar( SenderName );
      mrdSender.ulRecipClass := MAPI_ORIG;
      mrdSender.lpszAddress := pChar( 'SMTP:' + SenderAddr );
      mrdSender.ulReserved := 0;
      mrdSender.ulEIDSize := 0;
      mrdSender.lpEntryID := NIL;
      lpOriginator := @mrdSender;
   end;

   if MsgSubject = '' then
      lpszSubject := '<Unspecified Subject>'
   else
      lpszSubject := pChar( MsgSubject );

   if ( MsgContent = '' ) AND ( Attachment = '' ) then
      raise tMailFileException.createFmt( ERROR,
         [ 'Tried to send an empty message (no content or attachment)' ] )
   else begin
      if MsgContent = '' then
         lpszNoteText := 'Please see the attached file.'
      else
         lpszNoteText := pChar( MsgContent );

      if Attachment = '' then begin
         nFileCount := 0;
         lpFiles := NIL;
      end else begin
         fillChar( mfdAttach, sizeOf( mfdAttach ), 0 );
         mfdAttach.nPosition := cardinal( $FFFFFFFF );
         mfdAttach.lpszPathName := pChar( Attachment );
         nFileCount := 1;
         lpFiles := @mfdAttach;
      end;
   end; // with

   if previewMsg then liFlags := MAPI_DIALOG;

   result := mapiSendMail( 0, application.Handle, msg, liFlags, 0 );

   if result <> 0 then
      raise tMailFileException.createFmt( ERROR,
         [ 'MAPI triggered an error ('
           + getMAPIError( result ) + ')' ] );
  end;

end;

function getMAPIError( intErrorCode : Integer ) : String;
begin

   result := 'Unknown Error Code: ' + intToStr( intErrorCode );
   case intErrorCode of
     MAPI_E_USER_ABORT               : result := 'User cancelled request';
     MAPI_E_FAILURE                  : result := 'General MAPI failure';
     MAPI_E_LOGON_FAILURE            : result := 'Logon failure';
     MAPI_E_DISK_FULL                : result := 'Disk full';
     MAPI_E_INSUFFICIENT_MEMORY      : result := 'Insufficient memory';
     MAPI_E_ACCESS_DENIED            : result := 'Access denied';
     MAPI_E_TOO_MANY_SESSIONS        : result := 'Too many sessions';
     MAPI_E_TOO_MANY_FILES           : result := 'Too many files open';
     MAPI_E_TOO_MANY_RECIPIENTS      : result := 'Too many recipients';
     MAPI_E_ATTACHMENT_NOT_FOUND     : result := 'Attachment not found';
     MAPI_E_ATTACHMENT_OPEN_FAILURE  : result := 'Failed to open attachment';
     MAPI_E_ATTACHMENT_WRITE_FAILURE : result := 'Failed to write attachment';
     MAPI_E_UNKNOWN_RECIPIENT        : result := 'Unknown recipient';
     MAPI_E_BAD_RECIPTYPE            : result := 'Invalid recipient type';
     MAPI_E_NO_MESSAGES              : result := 'No messages';
     MAPI_E_INVALID_MESSAGE          : result := 'Invalid message';
     MAPI_E_TEXT_TOO_LARGE           : result := 'Text too large.';
     MAPI_E_INVALID_SESSION          : result := 'Invalid session';
     MAPI_E_TYPE_NOT_SUPPORTED       : result := 'Type not supported';
     MAPI_E_AMBIGUOUS_RECIPIENT      : result := 'Ambiguous recipient';
     MAPI_E_MESSAGE_IN_USE           : result := 'Message in use';
     MAPI_E_NETWORK_FAILURE          : result := 'Network failure';
     MAPI_E_INVALID_EDITFIELDS       : result := 'Invalid edit fields';
     MAPI_E_INVALID_RECIPS           : result := 'Invalid recipients';
     MAPI_E_NOT_SUPPORTED            : result := 'Not supported';
   end;
end;

end.
