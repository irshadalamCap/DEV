public class TweeterAPI{
    public boolean sendTweets(String Status){
        String oauth_nonce = GeWS_WebService_U.generateNonce();
        String oauth_signature_method = GeWS_Twitter_Constants.HMAC_SHA1;
        String oauth_timestamp = String.valueOf(DateTime.now().getTime()/1000);
        String oauth_version = GeWS_Twitter_Constants.OAUTH_VERSION;
        // put these credential values into custon setting
        string base_url = 'https://api.twitter.com/1.1/statuses/update.json';
        String oauth_consumer_key = 'XXXXXXXXXXX'; // pass your credentials here 
        string oauth_token='XXXXXXXXXXXXXXX';
        string oauth_consumer_secret = 'XXXXXXXXXXXXXXXXXXXXXX';
        string oauth_token_secret ='XXXXXXXXXXXXXXX';
        
        Map<String, String> signaturePairs = new map<String, String>();
        signaturePairs.put('status',status);
        signaturePairs.put('oauth_consumer_key', oauth_consumer_key);
        signaturePairs.put('oauth_nonce', oauth_nonce);
        signaturePairs.put('oauth_signature_method', oauth_signature_method);
        signaturePairs.put('oauth_timestamp', oauth_timestamp);
        signaturePairs.put('oauth_token', oauth_token);
        signaturePairs.put('oauth_version', oauth_version);
        system.debug(json.serializepretty(signaturePairs));
        
        
        String createParameterString = GeWS_WebService_U.createParameterString(GeWS_Twitter_Constants.SIGNATURE_KEYS,signaturePairs);
        string signatureBaseString = GeWS_WebService_U.createSignatureBaseString(base_url,createParameterString );
        string signingKey = GeWS_WebService_U.createSigningKey(oauth_consumer_secret ,oauth_token_secret );
        
        string algorithmName = GeWS_Twitter_Constants.HMAC_SHA;
        String oauth_signature = GeWS_WebService_U.createOauthSignature(algorithmName,signatureBaseString,signingKey);
        
        string oauth_header = GeWS_WebService_U.generateOauthHeader(oauth_consumer_key,oauth_nonce,
                                            oauth_signature ,oauth_signature_method,
                                            oauth_timestamp,oauth_version,oauth_token);
                                            
        // encode the status you want to update and pass the status into the body
        string statusEncode = GeWS_WebService_U.generateHttpBody(status, null);
        Http h = new Http();
        HttpRequest request= new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(base_url);
        request.setBody(statusEncode);
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setHeader('Authorization', oauth_header);
        request.setHeader(GeWS_Twitter_Constants.CONTENT_LENGTH, String.valueOf(request.getBody().length())); 
        try {
            HttpResponse res = h.send(request);
            system.debug('@@response==='+res);
            system.debug(res.getBody());
            if(res.getStatusCode() == 200)
                return true;
            else 
                return false;
        } catch (CalloutException e) {
            return false;
        }
        
        return null;
        
    
    }


}