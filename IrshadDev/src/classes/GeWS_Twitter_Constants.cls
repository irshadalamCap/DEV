public with sharing class GeWS_Twitter_Constants {
     /****************************************************************
     * OAuth 1.0 Constant
     * used for Twitter Status API 
     * 
     ****************************************************************/
      public static final String[] SIGNATURE_KEYS = new String[]
        {'oauth_consumer_key', 
        'oauth_nonce', 
        'oauth_signature_method', 
        'oauth_timestamp', 
        'oauth_token', 
        'oauth_version' ,
        'status'};
     
      public static final String[] OAUTH_KEYS = new String[]
        {'oauth_consumer_key',
        'oauth_nonce',
        'oauth_signature',
        'oauth_signature_method',
        'oauth_timestamp',
        'oauth_token',
        'oauth_version'};
      
      public Static final string HMAC_SHA1                                    = 'HMAC-SHA1';
      public Static final string OAUTH_VERSION                                = '1.0';
      public static final string TWITTER_API_STATUS_UPDATE                    = 'twitter-api-status-update';
      public static final string HMAC_SHA                                     = 'hmacSHA1';
      public static final string CONTENT_LENGTH                               = 'Content-Length'; 
}