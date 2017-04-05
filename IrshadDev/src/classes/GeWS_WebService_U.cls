/**********************************************************************
Name:  GeWS_WebService_U
Copyright © 2016
======================================================
======================================================
Purpose:  utility class for OAuth 1.0 credentials setup

-------                                                             
======================================================
======================================================
History                                                            
-------                                                            
VERSION      AUTHOR                DATE             DETAIL             Description
   1.0      Irshad Alam           06 JAN 2017         Multiples method created for OAuth 1.0 cred setup
            
***********************************************************************/
public class GeWS_WebService_U{
    
    /*******************************************************************
    * @description : this method is used to generateNonce
    * @return randomString
    * @Throws [Exceptions]: EXCEPTION                                                 
    ********************************************************************/ 
    public static string generateNonce() {
        String validChars = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        Integer len = validChars.length();
        String randomString = '';
        for(Integer i=0; i<32; i++) {
            Integer rInt = Integer.valueOf(Math.rint(Math.random()*(len-1)));
            randomString += validChars.substring(rInt, rInt+1);
        }
        return randomString;
    }

    /*******************************************************************
    * @description : this method is used to createParameterString
    * @param: List<String>,Map<String,String>
    * @return paramString
    * @Throws [Exceptions]: EXCEPTION                                                 
    ********************************************************************/ 
    public static String createParameterString(List<String> SIGNATURE_KEYS,Map<String,String> signaturePairs) {
        String paramString = '';
        SIGNATURE_KEYS.sort();
        for(String key : SIGNATURE_KEYS) {
            paramString += TwitterStringUtil.percentEncode(key);
            paramString += '=';
            paramString += TwitterStringUtil.percentEncode(signaturePairs.get(key));
            paramString += '&';
        }
        paramString = removeLastNLetters(paramString, 1);
        system.debug('@@@ Parameter String=='+paramString);
        return paramString;
    }
    
     /*******************************************************************
    * @description : this method is used to createParameterString
    * @param: string,string
    * @return string
    * @Throws [Exceptions]: EXCEPTION                                                 
    ********************************************************************/
     public Static String createSignatureBaseString(string base_url,string parameterString) {
        String sigBase = '';
        sigBase += 'POST';
        sigBase += '&';
        sigBase += TwitterStringUtil.percentEncode(base_url);
        sigBase += '&';
        sigBase += TwitterStringUtil.percentEncode(parameterString);
        system.debug('@@@ Signature Base String=='+sigBase);
        return sigBase;
    }
    
    /*******************************************************************
    * @description : this method is used to createSigningKey
    * @param: string,string
    * @return string
    * @Throws [Exceptions]: EXCEPTION                                                 
    ********************************************************************/
    public static String createSigningKey(string oauth_consumer_secret,string oauth_token_secret) {
        String signKey = TwitterStringUtil.percentEncode(oauth_consumer_secret);
        signKey += '&';
        signKey += TwitterStringUtil.percentEncode(oauth_token_secret);
        return signKey;
    }
    
    /*******************************************************************
    * @description : this method is used to createSigningKey
    * @param: string,string,string
    * @return string
    * @Throws [Exceptions]: EXCEPTION                                                 
    ********************************************************************/
    public static String createOauthSignature(string algorithmName,string signatureBaseString,string signingKey) {
        Blob mac = Crypto.generateMac(algorithmName, Blob.valueOf(signatureBaseString), Blob.valueOf(signingKey)); 
        string hashedValue = EncodingUtil.convertToHex(mac);
        String oauthSig = EncodingUtil.base64Encode(mac);
        return oauthSig;  
    }
    
    /*******************************************************************
    * @description : this method is used to generateOauthHeader
    * @param: string,string,string,string,string,string
    * @return string
    * @Throws [Exceptions]: EXCEPTION                                                 
    ********************************************************************/
    public static string generateOauthHeader(string oauth_consumer_key,string oauth_nonce,
                                            string oauth_signature,string oauth_signature_method,
                                            string oauth_timestamp,string oauth_version,string oauth_token) {
                                            
        String[] OAUTH_KEYS = GeWS_Twitter_Constants.OAUTH_KEYS;
        map<String, String> oauthParams = new map<String, String>();
        oauthParams.put('oauth_consumer_key', oauth_consumer_key);
        oauthParams.put('oauth_nonce', oauth_nonce);
        oauthParams.put('oauth_signature', oauth_signature);
        oauthParams.put('oauth_signature_method', oauth_signature_method);
        oauthParams.put('oauth_timestamp', oauth_timestamp);
        oauthParams.put('oauth_version', oauth_version);
        oauthParams.put('oauth_token', oauth_token);
        String header = 'OAuth ';
        for(String key : OAUTH_KEYS) {
            header += TwitterStringUtil.percentEncode(key);
            header += '="';
            header += TwitterStringUtil.percentEncode(oauthParams.get(key));
            header += '", ';
        }
        String oauth_header = removeLastNLetters(header, 2);
        return oauth_header;
    }
    
    /*******************************************************************
    * @description : this method is used to generateHttpBody
    * @param: string,map<String, String>
    * @return string
    * @Throws [Exceptions]: EXCEPTION                                                 
    ********************************************************************/
    public static String generateHttpBody(string status, map<String, String> additionalParams) {
        String httpBody = 'status='+EncodingUtil.urlEncode(status, 'UTF-8');
        if(additionalParams != null && additionalParams.keySet() != null) {
            for(String key : additionalParams.keySet()) {
                if(additionalParams.get(key) != null) {
                    httpBody += '&';
                    httpBody += EncodingUtil.urlEncode(key, 'UTF-8');
                    httpBody += '=';
                    httpBody += EncodingUtil.urlEncode(additionalParams.get(key), 'UTF-8');
                }
            }
        }
        return httpBody.replace('*', '%2A'); //for some reason, '*' breaks twitter
    }
    
    /*******************************************************************
    * @description : this method is used to removeLastNLetters
    * @param: string,Integer 
    * @return string
    * @Throws [Exceptions]: EXCEPTION                                                 
    ********************************************************************/
    
    private static String removeLastNLetters(String source, Integer numToRemove) {
        return source.subString(0, source.length()-numToRemove);
    }
}