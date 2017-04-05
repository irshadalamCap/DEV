/**********************************************************************
Name:  GeWS_Constants
Copyright © 2016
======================================================
======================================================
Purpose:  Constants class to store WS Related Constants

-------                                                             
======================================================
======================================================
History                                                            
-------                                                            
VERSION      AUTHOR                DATE             DETAIL             Description
   1.0      Irshad             12 jan 2017          
***********************************************************************/ 
public with sharing class GeWS_Constants {
    /****************************************************************
     * WEB SERVICE
     * All web service related constants go here 
     ****************************************************************/
    public static final String WS_AUTHORIZATION_HEADER                      = 'Authorization'; 
    public static final String WS_X_HTTP_METHOD_OVERRIDE_HEADER             = 'X-HTTP-Method-Override';
    public static final String WS_X_FULLCONTACT_APIKEY_HEADER               = 'X-FullContact-APIKey';
    public static final String WS_HEADER                                    = 'Header';
    public static final String WS_AUTH_TYPE_BASIC                           = 'Basic ';
    public static final String WS_BEARER                                    = 'Bearer ';
    public static final String WS_BASIC_AUTH                                = 'Basic Auth';
    public static final String WS_OAUTH_2                                   = 'OAuth 2.0';
    public static final String WS_OTHER                                     = 'Other';
    public static final String WS_API_KEY_ONLY                              = 'API Key Only';
    public static final String WS_OCP_APIM_SUBSCRIPTION_KEY                 = 'Ocp-Apim-Subscription-Key';
    public static final String WS_USER_AGENT                                = 'User-Agent';
    public static final String WS_EXCEPTION                                 = 'Exception';
    public static final String CONTENT_TYPE                                 = 'Content-Type';
    public static final String GRANT_TYPE                                   = 'grant_type';
    public static final String WS_HTTP_CODE_SUCCESS_START                   = '2';
    public static final String HTTP_CONTENT_TYPE_JSON                       = 'application/json';
    public static final String HTTP_CONTENT_TYPE_URL                        = 'application/x-www-form-urlencoded';
    public static final String HTTP_GRANT_TYPE_PASSWORD                     = 'password';
    public static final String HTTP_GRANT_TYPE_CLIENT_CREDENTIALS           = 'client_credentials';
    public static final String HTTP_PARAMETER_USERNAME                      = 'username';
    public static final String HTTP_PARAMETER_PASSWORD                      = 'password';
    public static final String HTTP_PARAMETER_CLIENT_ID                     = 'client_id';
    public static final String HTTP_PARAMETER_CLIENT_SECRET                 = 'client_secret';
    public static final String WS_OAUTH_ACCESS_TOKEN                        = 'access_token';
    public static final String HTTP_CONTENT_TYPE_TEXT                       = 'text/plain';
    public static final String HTTP_CHARSET_UTF8                            = 'UTF-8';
    public static final String HTTP_LANG_EN_US                              = 'en-us';
    public static final String WS_SOURCE_TWITTER                            = 'twitter';
    public static final String WS_METHOD_GET                                = 'GET';
    public static final String WS_METHOD_POST                               = 'POST';
    public static final String WS_METHOD_PATCH                              = 'patch';
    public static final String SERVICE_PERSONALITY_INSIGHTS                 = 'personality-insights';
    public static final String SERVICE_TWITTER_API                          = 'twitter-api';
    public static final String SERVICE_FULL_CONTACT_API                     = 'full-contact-api';
    
    public static final String PARAMETER_SCREEN_NAME                        = 'screen_name';
    public static final String PARAMETER_COUNT                              = 'count';
    public static final String PARAMETER_EMAIL                              = 'email';
    public static final String PARAMETER_TWITTER_HANDLE                     = 'twitter';
    
    
    /****************************************************************
     * JSON PARSER
     * All web service related constants go here 
     ****************************************************************/
    public static final String JSON_PARSE_ERRORS_TEXT                        = 'errors';
    public static final String JSON_PARSE_ERROR_TEXT                         = 'error';
    public static final String JSON_PARSE_CODE_TEXT                          = 'code';
    
    /****************************************************************
     * IBM Watson Personality (To be used in GeWS_IBMPersonalityService_U) 
     * All IBM Watson Personality service related constants go here 
     ****************************************************************/
    public static final String SoPI_ACHIEVEMENT                            = 'Achievement striving';
    public static final String SoPI_AGREEABLENESS                          = 'Agreeableness';
    public static final String SoPI_CHALLENGE                              = 'Challenge';
    public static final String SoPI_CLOSENESS                              = 'Closeness';
    public static final String SoPI_CONSCIENTIOUSNESS                      = 'Conscientiousness';
    public static final String SoPI_CURIOSITY                              = 'Curiosity';
    public static final String SoPI_EMOTIONAL_RANGE                        = 'Emotional range';
    public static final String SoPI_EXCITEMENT_RANGE                       = 'Excitement';
    public static final String SoPI_HELPING_OTHERS                         = 'SoPI Helping others';
    public static final String SoPI_HARMONY                                = 'Harmony';
    public static final String SoPI_IDEAL                                  = 'Ideal';
    public static final String SoPI_INTROVERSION_EXTRAVERSION              = 'Extraversion';
    public static final String SoPI_LIBERTY                                = 'Liberty';
    public static final String SoPI_LOVE                                   = 'Love';
    public static final String SoPI_OPENNESS                               = 'Openness';
    public static final String SoPI_STABILITY                              = 'Stability';
    public static final String SoPI_SELF_EXPRESSION                        = 'Self-expression';
    public static final String SoPI_PRACTICALITY                           = 'Practicality';
    public static final String SoPI_STIMULATION                            = 'Stimulation';
    public static final String SoPI_STRUCTURE                              = 'Structure';
    public static final String SoPI_TAKING_PLEASURE_IN_LIFE                = 'Taking pleasure in life';
    public static final String SoPI_TRADITION                              = 'Tradition';
    /****************************************************************
     * Social Persona Constants (To be used in Social Persona) 
     * All Social Persona Trigger related constants go here 
     ****************************************************************/
    public static final String TWITTER                                     = 'Twitter';
    public static final Integer TWEETCOUNT                                 = 2000;
    
    /****************************************************************
     * hashTag search Constants  
     * used in getTweetsBasedOnHashTags
     ****************************************************************/
     public static final String SEARCH_QUERY                                = 'q';
     public static final String RESULT_TYPE                                 = 'result_type';
     public static final String RESULT_TYPE_VALUE                           = 'recent';
     public static final String LANG                                        = 'lang';
     public static final String LANG_VALUE                                  = 'en';
     public static final String INCLUDE_ENTITIES                            = 'include_entities';
     public static final String TWITTER_API_HASHTAG_SEARCH                  = 'twitter-api-hashtag-search'; 
     
     /****************************************************************
     * Batch Class Constant  
     * used in GeBS_hashTag_B.cls
     ****************************************************************/
     public static final String MAX_RESULTS                                 = '5';
     public static final String NEUTRAL                                     = 'neutral';
     public static final String POSTITIVE                                   = 'positive';
     public static final String ACCOUNT_NAME                                = 'Future of Loyalty';
     
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