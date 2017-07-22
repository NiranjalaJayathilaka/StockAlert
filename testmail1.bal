import org.wso2.ballerina.connectors.gmail;
import ballerina.lang.messages;
import ballerina.net.http;
import ballerina.lang.system;

const string userId = "vlashi93@gmail.com";
const string accessToken = "ya29.GluQBGnYW-pkn-rHUvR28XI1_VI3Jbm809B5pvlCf80HTIVXjTz2MzCJWoX9cFbcIMKelODQzSx-eyOgKI2EXcnNipA2-44YY1udl-bA9JwOI4IqSEIbT4v05WId";
const string refreshToken = "1/CRkP_GR4oK5juml97or7-xTUSJkrevw1zDLW8c-3WBc";
const string clientId = "593465642228-n0rsgo1aj60ee2s3iqe794169gbod6mo.apps.googleusercontent.com";
const string clientSecret = "zhmGUdU2JJKHBkZL6r391ED4";
const string recipientAddress = "nirathebesthi@gmail.com";

message gmailResponse;
json gmailJSONResponse;
string deleteResponse;

function main(string[]args){
    testSendMails();
}
function init () (gmail:ClientConnector gmailConnector) {
    gmailConnector = create gmail:ClientConnector(userId, accessToken, refreshToken, clientId, clientSecret);
    return;
}
function testSendMails (){
    string to = recipientAddress;
    string subject = "Stock Level";
    string from = userId;
    string messageBody = "Stock level is low.Refill soon!";
    string cc = userId;
    string bcc = userId;
    string id = "154b8c77e551c511";
    string threadId = "154b8c77e551c512";
    gmail:ClientConnector connectorInstance = init();
    

    gmailResponse = gmail:ClientConnector.sendMail (connectorInstance, to, subject, from, messageBody
                                                   , cc, bcc, id, threadId);
    gmailJSONResponse = messages:getJsonPayload(gmailResponse);
    int statusCode = http:getStatusCode(gmailResponse);
    system:println(statusCode);
}
