//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSSESResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSSESResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSESResources

+ (instancetype)sharedInstance {
    static AWSSESResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSESResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2010-12-01\",\
    \"endpointPrefix\":\"email\",\
    \"protocol\":\"query\",\
    \"serviceAbbreviation\":\"Amazon SES\",\
    \"serviceFullName\":\"Amazon Simple Email Service\",\
    \"serviceId\":\"SES\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"ses\",\
    \"uid\":\"email-2010-12-01\",\
    \"xmlNamespace\":\"http://ses.amazonaws.com/doc/2010-12-01/\"\
  },\
  \"operations\":{\
    \"CloneReceiptRuleSet\":{\
      \"name\":\"CloneReceiptRuleSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CloneReceiptRuleSetRequest\"},\
      \"output\":{\
        \"shape\":\"CloneReceiptRuleSetResponse\",\
        \"resultWrapper\":\"CloneReceiptRuleSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"RuleSetDoesNotExistException\"},\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a receipt rule set by cloning an existing one. All receipt rules and configurations are copied to the new receipt rule set and are completely independent of the source rule set.</p> <p>For information about setting up rule sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"CreateConfigurationSet\":{\
      \"name\":\"CreateConfigurationSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateConfigurationSetRequest\"},\
      \"output\":{\
        \"shape\":\"CreateConfigurationSetResponse\",\
        \"resultWrapper\":\"CreateConfigurationSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetAlreadyExistsException\"},\
        {\"shape\":\"InvalidConfigurationSetException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a configuration set.</p> <p>Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"CreateConfigurationSetEventDestination\":{\
      \"name\":\"CreateConfigurationSetEventDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateConfigurationSetEventDestinationRequest\"},\
      \"output\":{\
        \"shape\":\"CreateConfigurationSetEventDestinationResponse\",\
        \"resultWrapper\":\"CreateConfigurationSetEventDestinationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"EventDestinationAlreadyExistsException\"},\
        {\"shape\":\"InvalidCloudWatchDestinationException\"},\
        {\"shape\":\"InvalidFirehoseDestinationException\"},\
        {\"shape\":\"InvalidSNSDestinationException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a configuration set event destination.</p> <note> <p>When you create or update an event destination, you must provide one, and only one, destination. The destination can be CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS).</p> </note> <p>An event destination is the AWS service to which Amazon SES publishes the email sending events associated with a configuration set. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"CreateConfigurationSetTrackingOptions\":{\
      \"name\":\"CreateConfigurationSetTrackingOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateConfigurationSetTrackingOptionsRequest\"},\
      \"output\":{\
        \"shape\":\"CreateConfigurationSetTrackingOptionsResponse\",\
        \"resultWrapper\":\"CreateConfigurationSetTrackingOptionsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"TrackingOptionsAlreadyExistsException\"},\
        {\"shape\":\"InvalidTrackingOptionsException\"}\
      ],\
      \"documentation\":\"<p>Creates an association between a configuration set and a custom domain for open and click event tracking. </p> <p>By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CreateCustomVerificationEmailTemplate\":{\
      \"name\":\"CreateCustomVerificationEmailTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCustomVerificationEmailTemplateRequest\"},\
      \"errors\":[\
        {\"shape\":\"CustomVerificationEmailTemplateAlreadyExistsException\"},\
        {\"shape\":\"FromEmailAddressNotVerifiedException\"},\
        {\"shape\":\"CustomVerificationEmailInvalidContentException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom verification email template.</p> <p>For more information about custom verification email templates, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html\\\">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"CreateReceiptFilter\":{\
      \"name\":\"CreateReceiptFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateReceiptFilterRequest\"},\
      \"output\":{\
        \"shape\":\"CreateReceiptFilterResponse\",\
        \"resultWrapper\":\"CreateReceiptFilterResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"AlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Creates a new IP address filter.</p> <p>For information about setting up IP address filters, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"CreateReceiptRule\":{\
      \"name\":\"CreateReceiptRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateReceiptRuleRequest\"},\
      \"output\":{\
        \"shape\":\"CreateReceiptRuleResponse\",\
        \"resultWrapper\":\"CreateReceiptRuleResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidSnsTopicException\"},\
        {\"shape\":\"InvalidS3ConfigurationException\"},\
        {\"shape\":\"InvalidLambdaFunctionException\"},\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"RuleDoesNotExistException\"},\
        {\"shape\":\"RuleSetDoesNotExistException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a receipt rule.</p> <p>For information about setting up receipt rules, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"CreateReceiptRuleSet\":{\
      \"name\":\"CreateReceiptRuleSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateReceiptRuleSetRequest\"},\
      \"output\":{\
        \"shape\":\"CreateReceiptRuleSetResponse\",\
        \"resultWrapper\":\"CreateReceiptRuleSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates an empty receipt rule set.</p> <p>For information about setting up receipt rule sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"CreateTemplate\":{\
      \"name\":\"CreateTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTemplateRequest\"},\
      \"output\":{\
        \"shape\":\"CreateTemplateResponse\",\
        \"resultWrapper\":\"CreateTemplateResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"InvalidTemplateException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteConfigurationSet\":{\
      \"name\":\"DeleteConfigurationSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteConfigurationSetRequest\"},\
      \"output\":{\
        \"shape\":\"DeleteConfigurationSetResponse\",\
        \"resultWrapper\":\"DeleteConfigurationSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Deletes a configuration set. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteConfigurationSetEventDestination\":{\
      \"name\":\"DeleteConfigurationSetEventDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteConfigurationSetEventDestinationRequest\"},\
      \"output\":{\
        \"shape\":\"DeleteConfigurationSetEventDestinationResponse\",\
        \"resultWrapper\":\"DeleteConfigurationSetEventDestinationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"EventDestinationDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Deletes a configuration set event destination. Configuration set event destinations are associated with configuration sets, which enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteConfigurationSetTrackingOptions\":{\
      \"name\":\"DeleteConfigurationSetTrackingOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteConfigurationSetTrackingOptionsRequest\"},\
      \"output\":{\
        \"shape\":\"DeleteConfigurationSetTrackingOptionsResponse\",\
        \"resultWrapper\":\"DeleteConfigurationSetTrackingOptionsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"TrackingOptionsDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Deletes an association between a configuration set and a custom domain for open and click event tracking.</p> <p>By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html\\\">Amazon SES Developer Guide</a>.</p> <note> <p>Deleting this kind of association will result in emails sent using the specified configuration set to capture open and click events using the standard, Amazon SES-operated domains.</p> </note>\"\
    },\
    \"DeleteCustomVerificationEmailTemplate\":{\
      \"name\":\"DeleteCustomVerificationEmailTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCustomVerificationEmailTemplateRequest\"},\
      \"documentation\":\"<p>Deletes an existing custom verification email template. </p> <p>For more information about custom verification email templates, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html\\\">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteIdentity\":{\
      \"name\":\"DeleteIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteIdentityRequest\"},\
      \"output\":{\
        \"shape\":\"DeleteIdentityResponse\",\
        \"resultWrapper\":\"DeleteIdentityResult\"\
      },\
      \"documentation\":\"<p>Deletes the specified identity (an email address or a domain) from the list of verified identities.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteIdentityPolicy\":{\
      \"name\":\"DeleteIdentityPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteIdentityPolicyRequest\"},\
      \"output\":{\
        \"shape\":\"DeleteIdentityPolicyResponse\",\
        \"resultWrapper\":\"DeleteIdentityPolicyResult\"\
      },\
      \"documentation\":\"<p>Deletes the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist.</p> <note> <p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p> </note> <p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteReceiptFilter\":{\
      \"name\":\"DeleteReceiptFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteReceiptFilterRequest\"},\
      \"output\":{\
        \"shape\":\"DeleteReceiptFilterResponse\",\
        \"resultWrapper\":\"DeleteReceiptFilterResult\"\
      },\
      \"documentation\":\"<p>Deletes the specified IP address filter.</p> <p>For information about managing IP address filters, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteReceiptRule\":{\
      \"name\":\"DeleteReceiptRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteReceiptRuleRequest\"},\
      \"output\":{\
        \"shape\":\"DeleteReceiptRuleResponse\",\
        \"resultWrapper\":\"DeleteReceiptRuleResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"RuleSetDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified receipt rule.</p> <p>For information about managing receipt rules, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteReceiptRuleSet\":{\
      \"name\":\"DeleteReceiptRuleSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteReceiptRuleSetRequest\"},\
      \"output\":{\
        \"shape\":\"DeleteReceiptRuleSetResponse\",\
        \"resultWrapper\":\"DeleteReceiptRuleSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CannotDeleteException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified receipt rule set and all of the receipt rules it contains.</p> <note> <p>The currently active rule set cannot be deleted.</p> </note> <p>For information about managing receipt rule sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteTemplate\":{\
      \"name\":\"DeleteTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTemplateRequest\"},\
      \"output\":{\
        \"shape\":\"DeleteTemplateResponse\",\
        \"resultWrapper\":\"DeleteTemplateResult\"\
      },\
      \"documentation\":\"<p>Deletes an email template.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DeleteVerifiedEmailAddress\":{\
      \"name\":\"DeleteVerifiedEmailAddress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVerifiedEmailAddressRequest\"},\
      \"documentation\":\"<p>Deprecated. Use the <code>DeleteIdentity</code> operation to delete email addresses and domains.</p>\"\
    },\
    \"DescribeActiveReceiptRuleSet\":{\
      \"name\":\"DescribeActiveReceiptRuleSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeActiveReceiptRuleSetRequest\"},\
      \"output\":{\
        \"shape\":\"DescribeActiveReceiptRuleSetResponse\",\
        \"resultWrapper\":\"DescribeActiveReceiptRuleSetResult\"\
      },\
      \"documentation\":\"<p>Returns the metadata and receipt rules for the receipt rule set that is currently active.</p> <p>For information about setting up receipt rule sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DescribeConfigurationSet\":{\
      \"name\":\"DescribeConfigurationSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeConfigurationSetRequest\"},\
      \"output\":{\
        \"shape\":\"DescribeConfigurationSetResponse\",\
        \"resultWrapper\":\"DescribeConfigurationSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Returns the details of the specified configuration set. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DescribeReceiptRule\":{\
      \"name\":\"DescribeReceiptRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeReceiptRuleRequest\"},\
      \"output\":{\
        \"shape\":\"DescribeReceiptRuleResponse\",\
        \"resultWrapper\":\"DescribeReceiptRuleResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"RuleDoesNotExistException\"},\
        {\"shape\":\"RuleSetDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Returns the details of the specified receipt rule.</p> <p>For information about setting up receipt rules, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"DescribeReceiptRuleSet\":{\
      \"name\":\"DescribeReceiptRuleSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeReceiptRuleSetRequest\"},\
      \"output\":{\
        \"shape\":\"DescribeReceiptRuleSetResponse\",\
        \"resultWrapper\":\"DescribeReceiptRuleSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"RuleSetDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Returns the details of the specified receipt rule set.</p> <p>For information about managing receipt rule sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"GetAccountSendingEnabled\":{\
      \"name\":\"GetAccountSendingEnabled\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"GetAccountSendingEnabledResponse\",\
        \"resultWrapper\":\"GetAccountSendingEnabledResult\"\
      },\
      \"documentation\":\"<p>Returns the email sending status of the Amazon SES account for the current region.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"GetCustomVerificationEmailTemplate\":{\
      \"name\":\"GetCustomVerificationEmailTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCustomVerificationEmailTemplateRequest\"},\
      \"output\":{\
        \"shape\":\"GetCustomVerificationEmailTemplateResponse\",\
        \"resultWrapper\":\"GetCustomVerificationEmailTemplateResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"CustomVerificationEmailTemplateDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Returns the custom email verification template for the template name you specify.</p> <p>For more information about custom verification email templates, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html\\\">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"GetIdentityDkimAttributes\":{\
      \"name\":\"GetIdentityDkimAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetIdentityDkimAttributesRequest\"},\
      \"output\":{\
        \"shape\":\"GetIdentityDkimAttributesResponse\",\
        \"resultWrapper\":\"GetIdentityDkimAttributesResult\"\
      },\
      \"documentation\":\"<p>Returns the current status of Easy DKIM signing for an entity. For domain name identities, this operation also returns the DKIM tokens that are required for Easy DKIM signing, and whether Amazon SES has successfully verified that these tokens have been published.</p> <p>This operation takes a list of identities as input and returns the following information for each:</p> <ul> <li> <p>Whether Easy DKIM signing is enabled or disabled.</p> </li> <li> <p>A set of DKIM tokens that represent the identity. If the identity is an email address, the tokens represent the domain of that address.</p> </li> <li> <p>Whether Amazon SES has successfully verified the DKIM tokens published in the domain's DNS. This information is only returned for domain name identities, not for email addresses.</p> </li> </ul> <p>This operation is throttled at one request per second and can only get DKIM attributes for up to 100 identities at a time.</p> <p>For more information about creating DNS records using DKIM tokens, go to the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"GetIdentityMailFromDomainAttributes\":{\
      \"name\":\"GetIdentityMailFromDomainAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetIdentityMailFromDomainAttributesRequest\"},\
      \"output\":{\
        \"shape\":\"GetIdentityMailFromDomainAttributesResponse\",\
        \"resultWrapper\":\"GetIdentityMailFromDomainAttributesResult\"\
      },\
      \"documentation\":\"<p>Returns the custom MAIL FROM attributes for a list of identities (email addresses : domains).</p> <p>This operation is throttled at one request per second and can only get custom MAIL FROM attributes for up to 100 identities at a time.</p>\"\
    },\
    \"GetIdentityNotificationAttributes\":{\
      \"name\":\"GetIdentityNotificationAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetIdentityNotificationAttributesRequest\"},\
      \"output\":{\
        \"shape\":\"GetIdentityNotificationAttributesResponse\",\
        \"resultWrapper\":\"GetIdentityNotificationAttributesResult\"\
      },\
      \"documentation\":\"<p>Given a list of verified identities (email addresses and/or domains), returns a structure describing identity notification attributes.</p> <p>This operation is throttled at one request per second and can only get notification attributes for up to 100 identities at a time.</p> <p>For more information about using notifications with Amazon SES, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"GetIdentityPolicies\":{\
      \"name\":\"GetIdentityPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetIdentityPoliciesRequest\"},\
      \"output\":{\
        \"shape\":\"GetIdentityPoliciesResponse\",\
        \"resultWrapper\":\"GetIdentityPoliciesResult\"\
      },\
      \"documentation\":\"<p>Returns the requested sending authorization policies for the given identity (an email address or a domain). The policies are returned as a map of policy names to policy contents. You can retrieve a maximum of 20 policies at a time.</p> <note> <p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p> </note> <p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"GetIdentityVerificationAttributes\":{\
      \"name\":\"GetIdentityVerificationAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetIdentityVerificationAttributesRequest\"},\
      \"output\":{\
        \"shape\":\"GetIdentityVerificationAttributesResponse\",\
        \"resultWrapper\":\"GetIdentityVerificationAttributesResult\"\
      },\
      \"documentation\":\"<p>Given a list of identities (email addresses and/or domains), returns the verification status and (for domain identities) the verification token for each identity.</p> <p>The verification status of an email address is \\\"Pending\\\" until the email address owner clicks the link within the verification email that Amazon SES sent to that address. If the email address owner clicks the link within 24 hours, the verification status of the email address changes to \\\"Success\\\". If the link is not clicked within 24 hours, the verification status changes to \\\"Failed.\\\" In that case, if you still want to verify the email address, you must restart the verification process from the beginning.</p> <p>For domain identities, the domain's verification status is \\\"Pending\\\" as Amazon SES searches for the required TXT record in the DNS settings of the domain. When Amazon SES detects the record, the domain's verification status changes to \\\"Success\\\". If Amazon SES is unable to detect the record within 72 hours, the domain's verification status changes to \\\"Failed.\\\" In that case, if you still want to verify the domain, you must restart the verification process from the beginning.</p> <p>This operation is throttled at one request per second and can only get verification attributes for up to 100 identities at a time.</p>\"\
    },\
    \"GetSendQuota\":{\
      \"name\":\"GetSendQuota\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"GetSendQuotaResponse\",\
        \"resultWrapper\":\"GetSendQuotaResult\"\
      },\
      \"documentation\":\"<p>Provides the sending limits for the Amazon SES account. </p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"GetSendStatistics\":{\
      \"name\":\"GetSendStatistics\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"GetSendStatisticsResponse\",\
        \"resultWrapper\":\"GetSendStatisticsResult\"\
      },\
      \"documentation\":\"<p>Provides sending statistics for the current AWS Region. The result is a list of data points, representing the last two weeks of sending activity. Each data point in the list contains statistics for a 15-minute period of time.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"GetTemplate\":{\
      \"name\":\"GetTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTemplateRequest\"},\
      \"output\":{\
        \"shape\":\"GetTemplateResponse\",\
        \"resultWrapper\":\"GetTemplateResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TemplateDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Displays the template object (which includes the Subject line, HTML part and text part) for the template you specify.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"ListConfigurationSets\":{\
      \"name\":\"ListConfigurationSets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListConfigurationSetsRequest\"},\
      \"output\":{\
        \"shape\":\"ListConfigurationSetsResponse\",\
        \"resultWrapper\":\"ListConfigurationSetsResult\"\
      },\
      \"documentation\":\"<p>Provides a list of the configuration sets associated with your Amazon SES account in the current AWS Region. For information about using configuration sets, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Monitoring Your Amazon SES Sending Activity</a> in the <i>Amazon SES Developer Guide.</i> </p> <p>You can execute this operation no more than once per second. This operation will return up to 1,000 configuration sets each time it is run. If your Amazon SES account has more than 1,000 configuration sets, this operation will also return a NextToken element. You can then execute the <code>ListConfigurationSets</code> operation again, passing the <code>NextToken</code> parameter and the value of the NextToken element to retrieve additional results.</p>\"\
    },\
    \"ListCustomVerificationEmailTemplates\":{\
      \"name\":\"ListCustomVerificationEmailTemplates\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCustomVerificationEmailTemplatesRequest\"},\
      \"output\":{\
        \"shape\":\"ListCustomVerificationEmailTemplatesResponse\",\
        \"resultWrapper\":\"ListCustomVerificationEmailTemplatesResult\"\
      },\
      \"documentation\":\"<p>Lists the existing custom verification email templates for your account in the current AWS Region.</p> <p>For more information about custom verification email templates, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html\\\">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"ListIdentities\":{\
      \"name\":\"ListIdentities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListIdentitiesRequest\"},\
      \"output\":{\
        \"shape\":\"ListIdentitiesResponse\",\
        \"resultWrapper\":\"ListIdentitiesResult\"\
      },\
      \"documentation\":\"<p>Returns a list containing all of the identities (email addresses and domains) for your AWS account in the current AWS Region, regardless of verification status.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"ListIdentityPolicies\":{\
      \"name\":\"ListIdentityPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListIdentityPoliciesRequest\"},\
      \"output\":{\
        \"shape\":\"ListIdentityPoliciesResponse\",\
        \"resultWrapper\":\"ListIdentityPoliciesResult\"\
      },\
      \"documentation\":\"<p>Returns a list of sending authorization policies that are attached to the given identity (an email address or a domain). This API returns only a list. If you want the actual policy content, you can use <code>GetIdentityPolicies</code>.</p> <note> <p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p> </note> <p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"ListReceiptFilters\":{\
      \"name\":\"ListReceiptFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListReceiptFiltersRequest\"},\
      \"output\":{\
        \"shape\":\"ListReceiptFiltersResponse\",\
        \"resultWrapper\":\"ListReceiptFiltersResult\"\
      },\
      \"documentation\":\"<p>Lists the IP address filters associated with your AWS account in the current AWS Region.</p> <p>For information about managing IP address filters, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-ip-filters.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"ListReceiptRuleSets\":{\
      \"name\":\"ListReceiptRuleSets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListReceiptRuleSetsRequest\"},\
      \"output\":{\
        \"shape\":\"ListReceiptRuleSetsResponse\",\
        \"resultWrapper\":\"ListReceiptRuleSetsResult\"\
      },\
      \"documentation\":\"<p>Lists the receipt rule sets that exist under your AWS account in the current AWS Region. If there are additional receipt rule sets to be retrieved, you will receive a <code>NextToken</code> that you can provide to the next call to <code>ListReceiptRuleSets</code> to retrieve the additional entries.</p> <p>For information about managing receipt rule sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"ListTemplates\":{\
      \"name\":\"ListTemplates\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTemplatesRequest\"},\
      \"output\":{\
        \"shape\":\"ListTemplatesResponse\",\
        \"resultWrapper\":\"ListTemplatesResult\"\
      },\
      \"documentation\":\"<p>Lists the email templates present in your Amazon SES account in the current AWS Region.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"ListVerifiedEmailAddresses\":{\
      \"name\":\"ListVerifiedEmailAddresses\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"ListVerifiedEmailAddressesResponse\",\
        \"resultWrapper\":\"ListVerifiedEmailAddressesResult\"\
      },\
      \"documentation\":\"<p>Deprecated. Use the <code>ListIdentities</code> operation to list the email addresses and domains associated with your account.</p>\"\
    },\
    \"PutConfigurationSetDeliveryOptions\":{\
      \"name\":\"PutConfigurationSetDeliveryOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutConfigurationSetDeliveryOptionsRequest\"},\
      \"output\":{\
        \"shape\":\"PutConfigurationSetDeliveryOptionsResponse\",\
        \"resultWrapper\":\"PutConfigurationSetDeliveryOptionsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"InvalidDeliveryOptionsException\"}\
      ],\
      \"documentation\":\"<p>Adds or updates the delivery options for a configuration set.</p>\"\
    },\
    \"PutIdentityPolicy\":{\
      \"name\":\"PutIdentityPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutIdentityPolicyRequest\"},\
      \"output\":{\
        \"shape\":\"PutIdentityPolicyResponse\",\
        \"resultWrapper\":\"PutIdentityPolicyResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidPolicyException\"}\
      ],\
      \"documentation\":\"<p>Adds or updates a sending authorization policy for the specified identity (an email address or a domain).</p> <note> <p>This API is for the identity owner only. If you have not verified the identity, this API will return an error.</p> </note> <p>Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"ReorderReceiptRuleSet\":{\
      \"name\":\"ReorderReceiptRuleSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ReorderReceiptRuleSetRequest\"},\
      \"output\":{\
        \"shape\":\"ReorderReceiptRuleSetResponse\",\
        \"resultWrapper\":\"ReorderReceiptRuleSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"RuleSetDoesNotExistException\"},\
        {\"shape\":\"RuleDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Reorders the receipt rules within a receipt rule set.</p> <note> <p>All of the rules in the rule set must be represented in this request. That is, this API will return an error if the reorder request doesn't explicitly position all of the rules.</p> </note> <p>For information about managing receipt rule sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"SendBounce\":{\
      \"name\":\"SendBounce\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SendBounceRequest\"},\
      \"output\":{\
        \"shape\":\"SendBounceResponse\",\
        \"resultWrapper\":\"SendBounceResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"MessageRejected\"}\
      ],\
      \"documentation\":\"<p>Generates and sends a bounce message to the sender of an email you received through Amazon SES. You can only use this API on an email up to 24 hours after you receive it.</p> <note> <p>You cannot use this API to send generic bounces for mail that was not received by Amazon SES.</p> </note> <p>For information about receiving email through Amazon SES, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"SendBulkTemplatedEmail\":{\
      \"name\":\"SendBulkTemplatedEmail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SendBulkTemplatedEmailRequest\"},\
      \"output\":{\
        \"shape\":\"SendBulkTemplatedEmailResponse\",\
        \"resultWrapper\":\"SendBulkTemplatedEmailResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"MessageRejected\"},\
        {\"shape\":\"MailFromDomainNotVerifiedException\"},\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"TemplateDoesNotExistException\"},\
        {\"shape\":\"ConfigurationSetSendingPausedException\"},\
        {\"shape\":\"AccountSendingPausedException\"}\
      ],\
      \"documentation\":\"<p>Composes an email message to multiple destinations. The message body is created using an email template.</p> <p>In order to send email using the <code>SendBulkTemplatedEmail</code> operation, your call to the API must meet the following requirements:</p> <ul> <li> <p>The call must refer to an existing email template. You can create email templates using the <a>CreateTemplate</a> operation.</p> </li> <li> <p>The message must be sent from a verified email address or domain.</p> </li> <li> <p>If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i> </p> </li> <li> <p>The maximum message size is 10 MB.</p> </li> <li> <p>Each <code>Destination</code> parameter must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message will be rejected, even if the message contains other recipients that are valid.</p> </li> <li> <p>The message may not include more than 50 recipients, across the To:, CC: and BCC: fields. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call the <code>SendBulkTemplatedEmail</code> operation several times to send the message to each group.</p> </li> <li> <p>The number of destinations you can contact in a single call to the API may be limited by your account's maximum sending rate.</p> </li> </ul>\"\
    },\
    \"SendCustomVerificationEmail\":{\
      \"name\":\"SendCustomVerificationEmail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SendCustomVerificationEmailRequest\"},\
      \"output\":{\
        \"shape\":\"SendCustomVerificationEmailResponse\",\
        \"resultWrapper\":\"SendCustomVerificationEmailResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"MessageRejected\"},\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"CustomVerificationEmailTemplateDoesNotExistException\"},\
        {\"shape\":\"FromEmailAddressNotVerifiedException\"},\
        {\"shape\":\"ProductionAccessNotGrantedException\"}\
      ],\
      \"documentation\":\"<p>Adds an email address to the list of identities for your Amazon SES account in the current AWS Region and attempts to verify it. As a result of executing this operation, a customized verification email is sent to the specified address.</p> <p>To use this operation, you must first create a custom verification email template. For more information about creating and using custom verification email templates, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html\\\">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"SendEmail\":{\
      \"name\":\"SendEmail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SendEmailRequest\"},\
      \"output\":{\
        \"shape\":\"SendEmailResponse\",\
        \"resultWrapper\":\"SendEmailResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"MessageRejected\"},\
        {\"shape\":\"MailFromDomainNotVerifiedException\"},\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"ConfigurationSetSendingPausedException\"},\
        {\"shape\":\"AccountSendingPausedException\"}\
      ],\
      \"documentation\":\"<p>Composes an email message and immediately queues it for sending. In order to send email using the <code>SendEmail</code> operation, your message must meet the following requirements:</p> <ul> <li> <p>The message must be sent from a verified email address or domain. If you attempt to send email using a non-verified address or domain, the operation will result in an \\\"Email address not verified\\\" error. </p> </li> <li> <p>If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i> </p> </li> <li> <p>The maximum message size is 10 MB.</p> </li> <li> <p>The message must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message will be rejected, even if the message contains other recipients that are valid.</p> </li> <li> <p>The message may not include more than 50 recipients, across the To:, CC: and BCC: fields. If you need to send an email message to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call the <code>SendEmail</code> operation several times to send the message to each group.</p> </li> </ul> <important> <p>For every message that you send, the total number of recipients (including each recipient in the To:, CC: and BCC: fields) is counted against the maximum number of emails you can send in a 24-hour period (your <i>sending quota</i>). For more information about sending quotas in Amazon SES, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html\\\">Managing Your Amazon SES Sending Limits</a> in the <i>Amazon SES Developer Guide.</i> </p> </important>\"\
    },\
    \"SendRawEmail\":{\
      \"name\":\"SendRawEmail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SendRawEmailRequest\"},\
      \"output\":{\
        \"shape\":\"SendRawEmailResponse\",\
        \"resultWrapper\":\"SendRawEmailResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"MessageRejected\"},\
        {\"shape\":\"MailFromDomainNotVerifiedException\"},\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"ConfigurationSetSendingPausedException\"},\
        {\"shape\":\"AccountSendingPausedException\"}\
      ],\
      \"documentation\":\"<p>Composes an email message and immediately queues it for sending.</p> <p>This operation is more flexible than the <code>SendEmail</code> API operation. When you use the <code>SendRawEmail</code> operation, you can specify the headers of the message as well as its content. This flexibility is useful, for example, when you want to send a multipart MIME email (such a message that contains both a text and an HTML version). You can also use this operation to send messages that include attachments.</p> <p>The <code>SendRawEmail</code> operation has the following requirements:</p> <ul> <li> <p>You can only send email from <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">verified email addresses or domains</a>. If you try to send email from an address that isn't verified, the operation results in an \\\"Email address not verified\\\" error.</p> </li> <li> <p>If your account is still in the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/request-production-access.html\\\">Amazon SES sandbox</a>, you can only send email to other verified addresses in your account, or to addresses that are associated with the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mailbox-simulator.html\\\">Amazon SES mailbox simulator</a>.</p> </li> <li> <p>The maximum message size, including attachments, is 10 MB.</p> </li> <li> <p>Each message has to include at least one recipient address. A recipient address includes any address on the To:, CC:, or BCC: lines.</p> </li> <li> <p>If you send a single message to more than one recipient address, and one of the recipient addresses isn't in a valid format (that is, it's not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), Amazon SES rejects the entire message, even if the other addresses are valid.</p> </li> <li> <p>Each message can include up to 50 recipient addresses across the To:, CC:, or BCC: lines. If you need to send a single message to more than 50 recipients, you have to split the list of recipient addresses into groups of less than 50 recipients, and send separate messages to each group.</p> </li> <li> <p>Amazon SES allows you to specify 8-bit Content-Transfer-Encoding for MIME message parts. However, if Amazon SES has to modify the contents of your message (for example, if you use open and click tracking), 8-bit content isn't preserved. For this reason, we highly recommend that you encode all content that isn't 7-bit ASCII. For more information, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html#send-email-mime-encoding\\\">MIME Encoding</a> in the <i>Amazon SES Developer Guide</i>.</p> </li> </ul> <p>Additionally, keep the following considerations in mind when using the <code>SendRawEmail</code> operation:</p> <ul> <li> <p>Although you can customize the message headers when using the <code>SendRawEmail</code> operation, Amazon SES will automatically apply its own <code>Message-ID</code> and <code>Date</code> headers; if you passed these headers when creating the message, they will be overwritten by the values that Amazon SES provides.</p> </li> <li> <p>If you are using sending authorization to send on behalf of another user, <code>SendRawEmail</code> enables you to specify the cross-account identity for the email's Source, From, and Return-Path parameters in one of two ways: you can pass optional parameters <code>SourceArn</code>, <code>FromArn</code>, and/or <code>ReturnPathArn</code> to the API, or you can include the following X-headers in the header of your raw email:</p> <ul> <li> <p> <code>X-SES-SOURCE-ARN</code> </p> </li> <li> <p> <code>X-SES-FROM-ARN</code> </p> </li> <li> <p> <code>X-SES-RETURN-PATH-ARN</code> </p> </li> </ul> <important> <p>Don't include these X-headers in the DKIM signature. Amazon SES removes these before it sends the email.</p> </important> <p>If you only specify the <code>SourceIdentityArn</code> parameter, Amazon SES sets the From and Return-Path addresses to the same identity that you specified.</p> <p>For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Using Sending Authorization with Amazon SES</a> in the <i>Amazon SES Developer Guide.</i> </p> </li> <li> <p>For every message that you send, the total number of recipients (including each recipient in the To:, CC: and BCC: fields) is counted against the maximum number of emails you can send in a 24-hour period (your <i>sending quota</i>). For more information about sending quotas in Amazon SES, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html\\\">Managing Your Amazon SES Sending Limits</a> in the <i>Amazon SES Developer Guide.</i> </p> </li> </ul>\"\
    },\
    \"SendTemplatedEmail\":{\
      \"name\":\"SendTemplatedEmail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SendTemplatedEmailRequest\"},\
      \"output\":{\
        \"shape\":\"SendTemplatedEmailResponse\",\
        \"resultWrapper\":\"SendTemplatedEmailResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"MessageRejected\"},\
        {\"shape\":\"MailFromDomainNotVerifiedException\"},\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"TemplateDoesNotExistException\"},\
        {\"shape\":\"ConfigurationSetSendingPausedException\"},\
        {\"shape\":\"AccountSendingPausedException\"}\
      ],\
      \"documentation\":\"<p>Composes an email message using an email template and immediately queues it for sending.</p> <p>In order to send email using the <code>SendTemplatedEmail</code> operation, your call to the API must meet the following requirements:</p> <ul> <li> <p>The call must refer to an existing email template. You can create email templates using the <a>CreateTemplate</a> operation.</p> </li> <li> <p>The message must be sent from a verified email address or domain.</p> </li> <li> <p>If your account is still in the Amazon SES sandbox, you may only send to verified addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. For more information, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i> </p> </li> <li> <p>The maximum message size is 10 MB.</p> </li> <li> <p>Calls to the <code>SendTemplatedEmail</code> operation may only include one <code>Destination</code> parameter. A destination is a set of recipients who will receive the same version of the email. The <code>Destination</code> parameter can include up to 50 recipients, across the To:, CC: and BCC: fields.</p> </li> <li> <p>The <code>Destination</code> parameter must include at least one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the format <i>UserName@[SubDomain.]Domain.TopLevelDomain</i>), the entire message will be rejected, even if the message contains other recipients that are valid.</p> </li> </ul> <important> <p>If your call to the <code>SendTemplatedEmail</code> operation includes all of the required parameters, Amazon SES accepts it and returns a Message ID. However, if Amazon SES can't render the email because the template contains errors, it doesn't send the email. Additionally, because it already accepted the message, Amazon SES doesn't return a message stating that it was unable to send the email.</p> <p>For these reasons, we highly recommend that you set up Amazon SES to send you notifications when Rendering Failure events occur. For more information, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html\\\">Sending Personalized Email Using the Amazon SES API</a> in the <i>Amazon Simple Email Service Developer Guide</i>.</p> </important>\"\
    },\
    \"SetActiveReceiptRuleSet\":{\
      \"name\":\"SetActiveReceiptRuleSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetActiveReceiptRuleSetRequest\"},\
      \"output\":{\
        \"shape\":\"SetActiveReceiptRuleSetResponse\",\
        \"resultWrapper\":\"SetActiveReceiptRuleSetResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"RuleSetDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Sets the specified receipt rule set as the active receipt rule set.</p> <note> <p>To disable your email-receiving through Amazon SES completely, you can call this API with RuleSetName set to null.</p> </note> <p>For information about managing receipt rule sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rule-sets.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"SetIdentityDkimEnabled\":{\
      \"name\":\"SetIdentityDkimEnabled\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetIdentityDkimEnabledRequest\"},\
      \"output\":{\
        \"shape\":\"SetIdentityDkimEnabledResponse\",\
        \"resultWrapper\":\"SetIdentityDkimEnabledResult\"\
      },\
      \"documentation\":\"<p>Enables or disables Easy DKIM signing of email sent from an identity. If Easy DKIM signing is enabled for a domain, then Amazon SES uses DKIM to sign all email that it sends from addresses on that domain. If Easy DKIM signing is enabled for an email address, then Amazon SES uses DKIM to sign all email it sends from that address.</p> <note> <p>For email addresses (for example, <code>user@example.com</code>), you can only enable DKIM signing if the corresponding domain (in this case, <code>example.com</code>) has been set up to use Easy DKIM.</p> </note> <p>You can enable DKIM signing for an identity at any time after you start the verification process for the identity, even if the verification process isn't complete. </p> <p>You can execute this operation no more than once per second.</p> <p>For more information about Easy DKIM signing, go to the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetIdentityFeedbackForwardingEnabled\":{\
      \"name\":\"SetIdentityFeedbackForwardingEnabled\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetIdentityFeedbackForwardingEnabledRequest\"},\
      \"output\":{\
        \"shape\":\"SetIdentityFeedbackForwardingEnabledResponse\",\
        \"resultWrapper\":\"SetIdentityFeedbackForwardingEnabledResult\"\
      },\
      \"documentation\":\"<p>Given an identity (an email address or a domain), enables or disables whether Amazon SES forwards bounce and complaint notifications as email. Feedback forwarding can only be disabled when Amazon Simple Notification Service (Amazon SNS) topics are specified for both bounces and complaints.</p> <note> <p>Feedback forwarding does not apply to delivery notifications. Delivery notifications are only available through Amazon SNS.</p> </note> <p>You can execute this operation no more than once per second.</p> <p>For more information about using notifications with Amazon SES, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetIdentityHeadersInNotificationsEnabled\":{\
      \"name\":\"SetIdentityHeadersInNotificationsEnabled\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetIdentityHeadersInNotificationsEnabledRequest\"},\
      \"output\":{\
        \"shape\":\"SetIdentityHeadersInNotificationsEnabledResponse\",\
        \"resultWrapper\":\"SetIdentityHeadersInNotificationsEnabledResult\"\
      },\
      \"documentation\":\"<p>Given an identity (an email address or a domain), sets whether Amazon SES includes the original email headers in the Amazon Simple Notification Service (Amazon SNS) notifications of a specified type.</p> <p>You can execute this operation no more than once per second.</p> <p>For more information about using notifications with Amazon SES, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetIdentityMailFromDomain\":{\
      \"name\":\"SetIdentityMailFromDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetIdentityMailFromDomainRequest\"},\
      \"output\":{\
        \"shape\":\"SetIdentityMailFromDomainResponse\",\
        \"resultWrapper\":\"SetIdentityMailFromDomainResult\"\
      },\
      \"documentation\":\"<p>Enables or disables the custom MAIL FROM domain setup for a verified identity (an email address or a domain).</p> <important> <p>To send emails using the specified MAIL FROM domain, you must add an MX record to your MAIL FROM domain's DNS settings. If you want your emails to pass Sender Policy Framework (SPF) checks, you must also add or update an SPF record. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from-set.html\\\">Amazon SES Developer Guide</a>.</p> </important> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"SetIdentityNotificationTopic\":{\
      \"name\":\"SetIdentityNotificationTopic\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetIdentityNotificationTopicRequest\"},\
      \"output\":{\
        \"shape\":\"SetIdentityNotificationTopicResponse\",\
        \"resultWrapper\":\"SetIdentityNotificationTopicResult\"\
      },\
      \"documentation\":\"<p>Sets an Amazon Simple Notification Service (Amazon SNS) topic to use when delivering notifications. When you use this operation, you specify a verified identity, such as an email address or domain. When you send an email that uses the chosen identity in the Source field, Amazon SES sends notifications to the topic you specified. You can send bounce, complaint, or delivery notifications (or any combination of the three) to the Amazon SNS topic that you specify.</p> <p>You can execute this operation no more than once per second.</p> <p>For more information about feedback notification, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetReceiptRulePosition\":{\
      \"name\":\"SetReceiptRulePosition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetReceiptRulePositionRequest\"},\
      \"output\":{\
        \"shape\":\"SetReceiptRulePositionResponse\",\
        \"resultWrapper\":\"SetReceiptRulePositionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"RuleSetDoesNotExistException\"},\
        {\"shape\":\"RuleDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Sets the position of the specified receipt rule in the receipt rule set.</p> <p>For information about managing receipt rules, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"TestRenderTemplate\":{\
      \"name\":\"TestRenderTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TestRenderTemplateRequest\"},\
      \"output\":{\
        \"shape\":\"TestRenderTemplateResponse\",\
        \"resultWrapper\":\"TestRenderTemplateResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TemplateDoesNotExistException\"},\
        {\"shape\":\"InvalidRenderingParameterException\"},\
        {\"shape\":\"MissingRenderingAttributeException\"}\
      ],\
      \"documentation\":\"<p>Creates a preview of the MIME content of an email when provided with a template and a set of replacement data.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"UpdateAccountSendingEnabled\":{\
      \"name\":\"UpdateAccountSendingEnabled\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateAccountSendingEnabledRequest\"},\
      \"documentation\":\"<p>Enables or disables email sending across your entire Amazon SES account in the current AWS Region. You can use this operation in conjunction with Amazon CloudWatch alarms to temporarily pause email sending across your Amazon SES account in a given AWS Region when reputation metrics (such as your bounce or complaint rates) reach certain thresholds.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"UpdateConfigurationSetEventDestination\":{\
      \"name\":\"UpdateConfigurationSetEventDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateConfigurationSetEventDestinationRequest\"},\
      \"output\":{\
        \"shape\":\"UpdateConfigurationSetEventDestinationResponse\",\
        \"resultWrapper\":\"UpdateConfigurationSetEventDestinationResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"EventDestinationDoesNotExistException\"},\
        {\"shape\":\"InvalidCloudWatchDestinationException\"},\
        {\"shape\":\"InvalidFirehoseDestinationException\"},\
        {\"shape\":\"InvalidSNSDestinationException\"}\
      ],\
      \"documentation\":\"<p>Updates the event destination of a configuration set. Event destinations are associated with configuration sets, which enable you to publish email sending events to Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS). For information about using configuration sets, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Monitoring Your Amazon SES Sending Activity</a> in the <i>Amazon SES Developer Guide.</i> </p> <note> <p>When you create or update an event destination, you must provide one, and only one, destination. The destination can be Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS).</p> </note> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"UpdateConfigurationSetReputationMetricsEnabled\":{\
      \"name\":\"UpdateConfigurationSetReputationMetricsEnabled\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateConfigurationSetReputationMetricsEnabledRequest\"},\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Enables or disables the publishing of reputation metrics for emails sent using a specific configuration set in a given AWS Region. Reputation metrics include bounce and complaint rates. These metrics are published to Amazon CloudWatch. By using CloudWatch, you can create alarms when bounce or complaint rates exceed certain thresholds.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"UpdateConfigurationSetSendingEnabled\":{\
      \"name\":\"UpdateConfigurationSetSendingEnabled\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateConfigurationSetSendingEnabledRequest\"},\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"}\
      ],\
      \"documentation\":\"<p>Enables or disables email sending for messages sent using a specific configuration set in a given AWS Region. You can use this operation in conjunction with Amazon CloudWatch alarms to temporarily pause email sending for a configuration set when the reputation metrics for that configuration set (such as your bounce on complaint rate) exceed certain thresholds.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"UpdateConfigurationSetTrackingOptions\":{\
      \"name\":\"UpdateConfigurationSetTrackingOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateConfigurationSetTrackingOptionsRequest\"},\
      \"output\":{\
        \"shape\":\"UpdateConfigurationSetTrackingOptionsResponse\",\
        \"resultWrapper\":\"UpdateConfigurationSetTrackingOptionsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ConfigurationSetDoesNotExistException\"},\
        {\"shape\":\"TrackingOptionsDoesNotExistException\"},\
        {\"shape\":\"InvalidTrackingOptionsException\"}\
      ],\
      \"documentation\":\"<p>Modifies an association between a configuration set and a custom domain for open and click event tracking. </p> <p>By default, images and links used for tracking open and click events are hosted on domains operated by Amazon SES. You can configure a subdomain of your own to handle these events. For information about using custom domains, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"UpdateCustomVerificationEmailTemplate\":{\
      \"name\":\"UpdateCustomVerificationEmailTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateCustomVerificationEmailTemplateRequest\"},\
      \"errors\":[\
        {\"shape\":\"CustomVerificationEmailTemplateDoesNotExistException\"},\
        {\"shape\":\"FromEmailAddressNotVerifiedException\"},\
        {\"shape\":\"CustomVerificationEmailInvalidContentException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing custom verification email template.</p> <p>For more information about custom verification email templates, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html\\\">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"UpdateReceiptRule\":{\
      \"name\":\"UpdateReceiptRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateReceiptRuleRequest\"},\
      \"output\":{\
        \"shape\":\"UpdateReceiptRuleResponse\",\
        \"resultWrapper\":\"UpdateReceiptRuleResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidSnsTopicException\"},\
        {\"shape\":\"InvalidS3ConfigurationException\"},\
        {\"shape\":\"InvalidLambdaFunctionException\"},\
        {\"shape\":\"RuleSetDoesNotExistException\"},\
        {\"shape\":\"RuleDoesNotExistException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Updates a receipt rule.</p> <p>For information about managing receipt rules, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-managing-receipt-rules.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"UpdateTemplate\":{\
      \"name\":\"UpdateTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateTemplateRequest\"},\
      \"output\":{\
        \"shape\":\"UpdateTemplateResponse\",\
        \"resultWrapper\":\"UpdateTemplateResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"TemplateDoesNotExistException\"},\
        {\"shape\":\"InvalidTemplateException\"}\
      ],\
      \"documentation\":\"<p>Updates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html\\\">Amazon SES Developer Guide</a>.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"VerifyDomainDkim\":{\
      \"name\":\"VerifyDomainDkim\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"VerifyDomainDkimRequest\"},\
      \"output\":{\
        \"shape\":\"VerifyDomainDkimResponse\",\
        \"resultWrapper\":\"VerifyDomainDkimResult\"\
      },\
      \"documentation\":\"<p>Returns a set of DKIM tokens for a domain identity.</p> <important> <p>When you execute the <code>VerifyDomainDkim</code> operation, the domain that you specify is added to the list of identities that are associated with your account. This is true even if you haven't already associated the domain with your account by using the <code>VerifyDomainIdentity</code> operation. However, you can't send email from the domain until you either successfully <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-domains.html\\\">verify it</a> or you successfully <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">set up DKIM for it</a>.</p> </important> <p>You use the tokens that are generated by this operation to create CNAME records. When Amazon SES detects that you've added these records to the DNS configuration for a domain, you can start sending email from that domain. You can start sending email even if you haven't added the TXT record provided by the VerifyDomainIdentity operation to the DNS configuration for your domain. All email that you send from the domain is authenticated using DKIM.</p> <p>To create the CNAME records for DKIM authentication, use the following values:</p> <ul> <li> <p> <b>Name</b>: <i>token</i>._domainkey.<i>example.com</i> </p> </li> <li> <p> <b>Type</b>: CNAME</p> </li> <li> <p> <b>Value</b>: <i>token</i>.dkim.amazonses.com</p> </li> </ul> <p>In the preceding example, replace <i>token</i> with one of the tokens that are generated when you execute this operation. Replace <i>example.com</i> with your domain. Repeat this process for each token that's generated by this operation.</p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"VerifyDomainIdentity\":{\
      \"name\":\"VerifyDomainIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"VerifyDomainIdentityRequest\"},\
      \"output\":{\
        \"shape\":\"VerifyDomainIdentityResponse\",\
        \"resultWrapper\":\"VerifyDomainIdentityResult\"\
      },\
      \"documentation\":\"<p>Adds a domain to the list of identities for your Amazon SES account in the current AWS Region and attempts to verify it. For more information about verifying domains, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Verifying Email Addresses and Domains</a> in the <i>Amazon SES Developer Guide.</i> </p> <p>You can execute this operation no more than once per second.</p>\"\
    },\
    \"VerifyEmailAddress\":{\
      \"name\":\"VerifyEmailAddress\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"VerifyEmailAddressRequest\"},\
      \"documentation\":\"<p>Deprecated. Use the <code>VerifyEmailIdentity</code> operation to verify a new email address.</p>\"\
    },\
    \"VerifyEmailIdentity\":{\
      \"name\":\"VerifyEmailIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"VerifyEmailIdentityRequest\"},\
      \"output\":{\
        \"shape\":\"VerifyEmailIdentityResponse\",\
        \"resultWrapper\":\"VerifyEmailIdentityResult\"\
      },\
      \"documentation\":\"<p>Adds an email address to the list of identities for your Amazon SES account in the current AWS region and attempts to verify it. As a result of executing this operation, a verification email is sent to the specified address.</p> <p>You can execute this operation no more than once per second.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccountSendingPausedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that email sending is disabled for your entire Amazon SES account.</p> <p>You can enable or disable email sending for your Amazon SES account using <a>UpdateAccountSendingEnabled</a>.</p>\",\
      \"error\":{\
        \"code\":\"AccountSendingPausedException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"AddHeaderAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HeaderName\",\
        \"HeaderValue\"\
      ],\
      \"members\":{\
        \"HeaderName\":{\
          \"shape\":\"HeaderName\",\
          \"documentation\":\"<p>The name of the header to add. Must be between 1 and 50 characters, inclusive, and consist of alphanumeric (a-z, A-Z, 0-9) characters and dashes only.</p>\"\
        },\
        \"HeaderValue\":{\
          \"shape\":\"HeaderValue\",\
          \"documentation\":\"<p>Must be less than 2048 characters, and must not contain newline characters (\\\"\\\\r\\\" or \\\"\\\\n\\\").</p>\"\
        }\
      },\
      \"documentation\":\"<p>When included in a receipt rule, this action adds a header to the received email.</p> <p>For information about adding a header using a receipt rule, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-add-header.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"Address\":{\"type\":\"string\"},\
    \"AddressList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Address\"}\
    },\
    \"AlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"RuleOrRuleSetName\",\
          \"documentation\":\"<p>Indicates that a resource could not be created because the resource name already exists.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that a resource could not be created because of a naming conflict.</p>\",\
      \"error\":{\
        \"code\":\"AlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"AmazonResourceName\":{\"type\":\"string\"},\
    \"ArrivalDate\":{\"type\":\"timestamp\"},\
    \"BehaviorOnMXFailure\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UseDefaultValue\",\
        \"RejectMessage\"\
      ]\
    },\
    \"Body\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>The content of the message, in text format. Use this for text-based email clients, or clients on high-latency networks (such as mobile devices).</p>\"\
        },\
        \"Html\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>The content of the message, in HTML format. Use this for email clients that can process HTML. You can include clickable links, formatted text, and much more in an HTML message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the body of the message. You can specify text, HTML, or both. If you use both, then the message should display correctly in the widest variety of email clients.</p>\"\
    },\
    \"BounceAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SmtpReplyCode\",\
        \"Message\",\
        \"Sender\"\
      ],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the bounce action is taken. An example of an Amazon SNS topic ARN is <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more information about Amazon SNS topics, see the <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html\\\">Amazon SNS Developer Guide</a>.</p>\"\
        },\
        \"SmtpReplyCode\":{\
          \"shape\":\"BounceSmtpReplyCode\",\
          \"documentation\":\"<p>The SMTP reply code, as defined by <a href=\\\"https://tools.ietf.org/html/rfc5321\\\">RFC 5321</a>.</p>\"\
        },\
        \"StatusCode\":{\
          \"shape\":\"BounceStatusCode\",\
          \"documentation\":\"<p>The SMTP enhanced status code, as defined by <a href=\\\"https://tools.ietf.org/html/rfc3463\\\">RFC 3463</a>.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"BounceMessage\",\
          \"documentation\":\"<p>Human-readable text to include in the bounce message.</p>\"\
        },\
        \"Sender\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address of the sender of the bounced email. This is the address from which the bounce message will be sent.</p>\"\
        }\
      },\
      \"documentation\":\"<p>When included in a receipt rule, this action rejects the received email by returning a bounce response to the sender and, optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS).</p> <p>For information about sending a bounce message in response to a received email, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-bounce.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"BounceMessage\":{\"type\":\"string\"},\
    \"BounceSmtpReplyCode\":{\"type\":\"string\"},\
    \"BounceStatusCode\":{\"type\":\"string\"},\
    \"BounceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DoesNotExist\",\
        \"MessageTooLarge\",\
        \"ExceededQuota\",\
        \"ContentRejected\",\
        \"Undefined\",\
        \"TemporaryFailure\"\
      ]\
    },\
    \"BouncedRecipientInfo\":{\
      \"type\":\"structure\",\
      \"required\":[\"Recipient\"],\
      \"members\":{\
        \"Recipient\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address of the recipient of the bounced email.</p>\"\
        },\
        \"RecipientArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to receive email for the recipient of the bounced email. For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        },\
        \"BounceType\":{\
          \"shape\":\"BounceType\",\
          \"documentation\":\"<p>The reason for the bounce. You must provide either this parameter or <code>RecipientDsnFields</code>.</p>\"\
        },\
        \"RecipientDsnFields\":{\
          \"shape\":\"RecipientDsnFields\",\
          \"documentation\":\"<p>Recipient-related DSN fields, most of which would normally be filled in automatically when provided with a <code>BounceType</code>. You must provide either this parameter or <code>BounceType</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Recipient-related information to include in the Delivery Status Notification (DSN) when an email that Amazon SES receives on your behalf bounces.</p> <p>For information about receiving email through Amazon SES, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"BouncedRecipientInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BouncedRecipientInfo\"}\
    },\
    \"BulkEmailDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\"Destination\"],\
      \"members\":{\
        \"Destination\":{\"shape\":\"Destination\"},\
        \"ReplacementTags\":{\
          \"shape\":\"MessageTagList\",\
          \"documentation\":\"<p>A list of tags, in the form of name/value pairs, to apply to an email that you send using <code>SendBulkTemplatedEmail</code>. Tags correspond to characteristics of the email that you define, so that you can publish email sending events.</p>\"\
        },\
        \"ReplacementTemplateData\":{\
          \"shape\":\"TemplateData\",\
          \"documentation\":\"<p>A list of replacement values to apply to the template. This parameter is a JSON object, typically consisting of key-value pairs in which the keys correspond to replacement tags in the email template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An array that contains one or more Destinations, as well as the tags and replacement data associated with each of those Destinations.</p>\"\
    },\
    \"BulkEmailDestinationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BulkEmailDestination\"}\
    },\
    \"BulkEmailDestinationStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"BulkEmailStatus\",\
          \"documentation\":\"<p>The status of a message sent using the <code>SendBulkTemplatedEmail</code> operation.</p> <p>Possible values for this parameter include:</p> <ul> <li> <p> <code>Success</code>: Amazon SES accepted the message, and will attempt to deliver it to the recipients.</p> </li> <li> <p> <code>MessageRejected</code>: The message was rejected because it contained a virus.</p> </li> <li> <p> <code>MailFromDomainNotVerified</code>: The sender's email address or domain was not verified.</p> </li> <li> <p> <code>ConfigurationSetDoesNotExist</code>: The configuration set you specified does not exist.</p> </li> <li> <p> <code>TemplateDoesNotExist</code>: The template you specified does not exist.</p> </li> <li> <p> <code>AccountSuspended</code>: Your account has been shut down because of issues related to your email sending practices.</p> </li> <li> <p> <code>AccountThrottled</code>: The number of emails you can send has been reduced because your account has exceeded its allocated sending limit.</p> </li> <li> <p> <code>AccountDailyQuotaExceeded</code>: You have reached or exceeded the maximum number of emails you can send from your account in a 24-hour period.</p> </li> <li> <p> <code>InvalidSendingPoolName</code>: The configuration set you specified refers to an IP pool that does not exist.</p> </li> <li> <p> <code>AccountSendingPaused</code>: Email sending for the Amazon SES account was disabled using the <a>UpdateAccountSendingEnabled</a> operation.</p> </li> <li> <p> <code>ConfigurationSetSendingPaused</code>: Email sending for this configuration set was disabled using the <a>UpdateConfigurationSetSendingEnabled</a> operation.</p> </li> <li> <p> <code>InvalidParameterValue</code>: One or more of the parameters you specified when calling this operation was invalid. See the error message for additional information.</p> </li> <li> <p> <code>TransientFailure</code>: Amazon SES was unable to process your request because of a temporary issue.</p> </li> <li> <p> <code>Failed</code>: Amazon SES was unable to process your request. See the error message for additional information.</p> </li> </ul>\"\
        },\
        \"Error\":{\
          \"shape\":\"Error\",\
          \"documentation\":\"<p>A description of an error that prevented a message being sent using the <code>SendBulkTemplatedEmail</code> operation.</p>\"\
        },\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The unique message identifier returned from the <code>SendBulkTemplatedEmail</code> operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains the response from the <code>SendBulkTemplatedEmail</code> operation.</p>\"\
    },\
    \"BulkEmailDestinationStatusList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BulkEmailDestinationStatus\"}\
    },\
    \"BulkEmailStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Success\",\
        \"MessageRejected\",\
        \"MailFromDomainNotVerified\",\
        \"ConfigurationSetDoesNotExist\",\
        \"TemplateDoesNotExist\",\
        \"AccountSuspended\",\
        \"AccountThrottled\",\
        \"AccountDailyQuotaExceeded\",\
        \"InvalidSendingPoolName\",\
        \"AccountSendingPaused\",\
        \"ConfigurationSetSendingPaused\",\
        \"InvalidParameterValue\",\
        \"TransientFailure\",\
        \"Failed\"\
      ]\
    },\
    \"CannotDeleteException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"RuleOrRuleSetName\",\
          \"documentation\":\"<p>Indicates that a resource could not be deleted because no resource with the specified name exists.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the delete operation could not be completed.</p>\",\
      \"error\":{\
        \"code\":\"CannotDelete\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Charset\":{\"type\":\"string\"},\
    \"Cidr\":{\"type\":\"string\"},\
    \"CloneReceiptRuleSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleSetName\",\
        \"OriginalRuleSetName\"\
      ],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the rule set to create. The name must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Start and end with a letter or number.</p> </li> <li> <p>Contain less than 64 characters.</p> </li> </ul>\"\
        },\
        \"OriginalRuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the rule set to clone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to create a receipt rule set by cloning an existing one. You use receipt rule sets to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CloneReceiptRuleSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"CloudWatchDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\"DimensionConfigurations\"],\
      \"members\":{\
        \"DimensionConfigurations\":{\
          \"shape\":\"CloudWatchDimensionConfigurations\",\
          \"documentation\":\"<p>A list of dimensions upon which to categorize your emails when you publish email sending events to Amazon CloudWatch.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information associated with an Amazon CloudWatch event destination to which email sending events are published.</p> <p>Event destinations, such as Amazon CloudWatch, are associated with configuration sets, which enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CloudWatchDimensionConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DimensionName\",\
        \"DimensionValueSource\",\
        \"DefaultDimensionValue\"\
      ],\
      \"members\":{\
        \"DimensionName\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>The name of an Amazon CloudWatch dimension associated with an email sending metric. The name must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Contain less than 256 characters.</p> </li> </ul>\"\
        },\
        \"DimensionValueSource\":{\
          \"shape\":\"DimensionValueSource\",\
          \"documentation\":\"<p>The place where Amazon SES finds the value of a dimension to publish to Amazon CloudWatch. If you want Amazon SES to use the message tags that you specify using an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to the <code>SendEmail</code>/<code>SendRawEmail</code> API, choose <code>messageTag</code>. If you want Amazon SES to use your own email headers, choose <code>emailHeader</code>.</p>\"\
        },\
        \"DefaultDimensionValue\":{\
          \"shape\":\"DefaultDimensionValue\",\
          \"documentation\":\"<p>The default value of the dimension that is published to Amazon CloudWatch if you do not provide the value of the dimension when you send an email. The default value must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Contain less than 256 characters.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the dimension configuration to use when you publish email sending events to Amazon CloudWatch.</p> <p>For information about publishing email sending events to Amazon CloudWatch, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CloudWatchDimensionConfigurations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CloudWatchDimensionConfiguration\"}\
    },\
    \"ConfigurationSet\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set. The name must meet the following requirements:</p> <ul> <li> <p>Contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Contain 64 characters or fewer.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The name of the configuration set.</p> <p>Configuration sets let you create groups of rules that you can apply to the emails you send using Amazon SES. For more information about using configuration sets, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/using-configuration-sets.html\\\">Using Amazon SES Configuration Sets</a> in the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ConfigurationSetAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Indicates that the configuration set does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the configuration set could not be created because of a naming conflict.</p>\",\
      \"error\":{\
        \"code\":\"ConfigurationSetAlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ConfigurationSetAttribute\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"eventDestinations\",\
        \"trackingOptions\",\
        \"deliveryOptions\",\
        \"reputationOptions\"\
      ]\
    },\
    \"ConfigurationSetAttributeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ConfigurationSetAttribute\"}\
    },\
    \"ConfigurationSetDoesNotExistException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Indicates that the configuration set does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the configuration set does not exist.</p>\",\
      \"error\":{\
        \"code\":\"ConfigurationSetDoesNotExist\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ConfigurationSetName\":{\"type\":\"string\"},\
    \"ConfigurationSetSendingPausedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set for which email sending is disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that email sending is disabled for the configuration set.</p> <p>You can enable or disable email sending for a configuration set using <a>UpdateConfigurationSetSendingEnabled</a>.</p>\",\
      \"error\":{\
        \"code\":\"ConfigurationSetSendingPausedException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ConfigurationSets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ConfigurationSet\"}\
    },\
    \"Content\":{\
      \"type\":\"structure\",\
      \"required\":[\"Data\"],\
      \"members\":{\
        \"Data\":{\
          \"shape\":\"MessageData\",\
          \"documentation\":\"<p>The textual data of the content.</p>\"\
        },\
        \"Charset\":{\
          \"shape\":\"Charset\",\
          \"documentation\":\"<p>The character set of the content.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents textual data, plus an optional character set specification.</p> <p>By default, the text must be 7-bit ASCII, due to the constraints of the SMTP protocol. If the text must contain any other characters, then you must also specify a character set. Examples include UTF-8, ISO-8859-1, and Shift_JIS.</p>\"\
    },\
    \"Counter\":{\"type\":\"long\"},\
    \"CreateConfigurationSetEventDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"EventDestination\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that the event destination should be associated with.</p>\"\
        },\
        \"EventDestination\":{\
          \"shape\":\"EventDestination\",\
          \"documentation\":\"<p>An object that describes the AWS service that email sending event information will be published to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to create a configuration set event destination. A configuration set event destination, which can be either Amazon CloudWatch or Amazon Kinesis Firehose, describes an AWS service in which Amazon SES publishes the email sending events associated with a configuration set. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CreateConfigurationSetEventDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"CreateConfigurationSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSet\"],\
      \"members\":{\
        \"ConfigurationSet\":{\
          \"shape\":\"ConfigurationSet\",\
          \"documentation\":\"<p>A data structure that contains the name of the configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to create a configuration set. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CreateConfigurationSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"CreateConfigurationSetTrackingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"TrackingOptions\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that the tracking options should be associated with.</p>\"\
        },\
        \"TrackingOptions\":{\"shape\":\"TrackingOptions\"}\
      },\
      \"documentation\":\"<p>Represents a request to create an open and click tracking option object in a configuration set. </p>\"\
    },\
    \"CreateConfigurationSetTrackingOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"CreateCustomVerificationEmailTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TemplateName\",\
        \"FromEmailAddress\",\
        \"TemplateSubject\",\
        \"TemplateContent\",\
        \"SuccessRedirectionURL\",\
        \"FailureRedirectionURL\"\
      ],\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the custom verification email template.</p>\"\
        },\
        \"FromEmailAddress\":{\
          \"shape\":\"FromAddress\",\
          \"documentation\":\"<p>The email address that the custom verification email is sent from.</p>\"\
        },\
        \"TemplateSubject\":{\
          \"shape\":\"Subject\",\
          \"documentation\":\"<p>The subject line of the custom verification email.</p>\"\
        },\
        \"TemplateContent\":{\
          \"shape\":\"TemplateContent\",\
          \"documentation\":\"<p>The content of the custom verification email. The total size of the email must be less than 10 MB. The message body may contain HTML, with some limitations. For more information, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html#custom-verification-emails-faq\\\">Custom Verification Email Frequently Asked Questions</a> in the <i>Amazon SES Developer Guide</i>.</p>\"\
        },\
        \"SuccessRedirectionURL\":{\
          \"shape\":\"SuccessRedirectionURL\",\
          \"documentation\":\"<p>The URL that the recipient of the verification email is sent to if his or her address is successfully verified.</p>\"\
        },\
        \"FailureRedirectionURL\":{\
          \"shape\":\"FailureRedirectionURL\",\
          \"documentation\":\"<p>The URL that the recipient of the verification email is sent to if his or her address is not successfully verified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to create a custom verification email template.</p>\"\
    },\
    \"CreateReceiptFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Filter\"],\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"ReceiptFilter\",\
          \"documentation\":\"<p>A data structure that describes the IP address filter to create, which consists of a name, an IP address range, and whether to allow or block mail from it.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to create a new IP address filter. You use IP address filters when you receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CreateReceiptFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"CreateReceiptRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleSetName\",\
        \"Rule\"\
      ],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the rule set that the receipt rule will be added to.</p>\"\
        },\
        \"After\":{\
          \"shape\":\"ReceiptRuleName\",\
          \"documentation\":\"<p>The name of an existing rule after which the new rule will be placed. If this parameter is null, the new rule will be inserted at the beginning of the rule list.</p>\"\
        },\
        \"Rule\":{\
          \"shape\":\"ReceiptRule\",\
          \"documentation\":\"<p>A data structure that contains the specified rule's name, actions, recipients, domains, enabled status, scan status, and TLS policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to create a receipt rule. You use receipt rules to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CreateReceiptRuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"CreateReceiptRuleSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"RuleSetName\"],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the rule set to create. The name must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Start and end with a letter or number.</p> </li> <li> <p>Contain less than 64 characters.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to create an empty receipt rule set. You use receipt rule sets to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CreateReceiptRuleSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"CreateTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Template\"],\
      \"members\":{\
        \"Template\":{\
          \"shape\":\"Template\",\
          \"documentation\":\"<p>The content of the email, composed of a subject line, an HTML part, and a text-only part.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to create an email template. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"CreateTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"CustomMailFromStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"Success\",\
        \"Failed\",\
        \"TemporaryFailure\"\
      ]\
    },\
    \"CustomRedirectDomain\":{\"type\":\"string\"},\
    \"CustomVerificationEmailInvalidContentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that custom verification email template provided content is invalid.</p>\",\
      \"error\":{\
        \"code\":\"CustomVerificationEmailInvalidContent\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CustomVerificationEmailTemplate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the custom verification email template.</p>\"\
        },\
        \"FromEmailAddress\":{\
          \"shape\":\"FromAddress\",\
          \"documentation\":\"<p>The email address that the custom verification email is sent from.</p>\"\
        },\
        \"TemplateSubject\":{\
          \"shape\":\"Subject\",\
          \"documentation\":\"<p>The subject line of the custom verification email.</p>\"\
        },\
        \"SuccessRedirectionURL\":{\
          \"shape\":\"SuccessRedirectionURL\",\
          \"documentation\":\"<p>The URL that the recipient of the verification email is sent to if his or her address is successfully verified.</p>\"\
        },\
        \"FailureRedirectionURL\":{\
          \"shape\":\"FailureRedirectionURL\",\
          \"documentation\":\"<p>The URL that the recipient of the verification email is sent to if his or her address is not successfully verified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a custom verification email template.</p>\"\
    },\
    \"CustomVerificationEmailTemplateAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomVerificationEmailTemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>Indicates that the provided custom verification email template with the specified template name already exists.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that a custom verification email template with the name you specified already exists.</p>\",\
      \"error\":{\
        \"code\":\"CustomVerificationEmailTemplateAlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CustomVerificationEmailTemplateDoesNotExistException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomVerificationEmailTemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>Indicates that the provided custom verification email template does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that a custom verification email template with the name you specified does not exist.</p>\",\
      \"error\":{\
        \"code\":\"CustomVerificationEmailTemplateDoesNotExist\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CustomVerificationEmailTemplates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CustomVerificationEmailTemplate\"}\
    },\
    \"DefaultDimensionValue\":{\"type\":\"string\"},\
    \"DeleteConfigurationSetEventDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"EventDestinationName\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set from which to delete the event destination.</p>\"\
        },\
        \"EventDestinationName\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>The name of the event destination to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete a configuration set event destination. Configuration set event destinations are associated with configuration sets, which enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DeleteConfigurationSetEventDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"DeleteConfigurationSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete a configuration set. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DeleteConfigurationSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"DeleteConfigurationSetTrackingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set from which you want to delete the tracking options.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete open and click tracking options in a configuration set. </p>\"\
    },\
    \"DeleteConfigurationSetTrackingOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"DeleteCustomVerificationEmailTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TemplateName\"],\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the custom verification email template that you want to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete an existing custom verification email template.</p>\"\
    },\
    \"DeleteIdentityPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Identity\",\
        \"PolicyName\"\
      ],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity that is associated with the policy that you want to delete. You can specify the identity by using its name or by using its Amazon Resource Name (ARN). Examples: <code>user@example.com</code>, <code>example.com</code>, <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.</p> <p>To successfully call this API, you must own the identity.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy to be deleted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete a sending authorization policy for an identity. Sending authorization is an Amazon SES feature that enables you to authorize other senders to use your identities. For information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DeleteIdentityPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"DeleteIdentityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Identity\"],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity to be removed from the list of identities for the AWS Account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete one of your Amazon SES identities (an email address or domain).</p>\"\
    },\
    \"DeleteIdentityResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"DeleteReceiptFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FilterName\"],\
      \"members\":{\
        \"FilterName\":{\
          \"shape\":\"ReceiptFilterName\",\
          \"documentation\":\"<p>The name of the IP address filter to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete an IP address filter. You use IP address filters when you receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DeleteReceiptFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"DeleteReceiptRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleSetName\",\
        \"RuleName\"\
      ],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the receipt rule set that contains the receipt rule to delete.</p>\"\
        },\
        \"RuleName\":{\
          \"shape\":\"ReceiptRuleName\",\
          \"documentation\":\"<p>The name of the receipt rule to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete a receipt rule. You use receipt rules to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DeleteReceiptRuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"DeleteReceiptRuleSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"RuleSetName\"],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the receipt rule set to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete a receipt rule set and all of the receipt rules it contains. You use receipt rule sets to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DeleteReceiptRuleSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"DeleteTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TemplateName\"],\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the template to be deleted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete an email template. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DeleteTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteVerifiedEmailAddressRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailAddress\"],\
      \"members\":{\
        \"EmailAddress\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>An email address to be removed from the list of verified addresses.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to delete an email address from the list of email addresses you have attempted to verify under your AWS account.</p>\"\
    },\
    \"DeliveryOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TlsPolicy\":{\
          \"shape\":\"TlsPolicy\",\
          \"documentation\":\"<p>Specifies whether messages that use the configuration set are required to use Transport Layer Security (TLS). If the value is <code>Require</code>, messages are only delivered if a TLS connection can be established. If the value is <code>Optional</code>, messages can be delivered in plain text if a TLS connection can't be established.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies whether messages that use the configuration set are required to use Transport Layer Security (TLS).</p>\"\
    },\
    \"DescribeActiveReceiptRuleSetRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents a request to return the metadata and receipt rules for the receipt rule set that is currently active. You use receipt rule sets to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DescribeActiveReceiptRuleSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metadata\":{\
          \"shape\":\"ReceiptRuleSetMetadata\",\
          \"documentation\":\"<p>The metadata for the currently active receipt rule set. The metadata consists of the rule set name and a timestamp of when the rule set was created.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"ReceiptRulesList\",\
          \"documentation\":\"<p>The receipt rules that belong to the active rule set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the metadata and receipt rules for the receipt rule set that is currently active.</p>\"\
    },\
    \"DescribeConfigurationSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set to describe.</p>\"\
        },\
        \"ConfigurationSetAttributeNames\":{\
          \"shape\":\"ConfigurationSetAttributeList\",\
          \"documentation\":\"<p>A list of configuration set attributes to return.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return the details of a configuration set. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DescribeConfigurationSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSet\":{\
          \"shape\":\"ConfigurationSet\",\
          \"documentation\":\"<p>The configuration set object associated with the specified configuration set.</p>\"\
        },\
        \"EventDestinations\":{\
          \"shape\":\"EventDestinations\",\
          \"documentation\":\"<p>A list of event destinations associated with the configuration set. </p>\"\
        },\
        \"TrackingOptions\":{\
          \"shape\":\"TrackingOptions\",\
          \"documentation\":\"<p>The name of the custom open and click tracking domain associated with the configuration set.</p>\"\
        },\
        \"DeliveryOptions\":{\"shape\":\"DeliveryOptions\"},\
        \"ReputationOptions\":{\
          \"shape\":\"ReputationOptions\",\
          \"documentation\":\"<p>An object that represents the reputation settings for the configuration set. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the details of a configuration set. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DescribeReceiptRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleSetName\",\
        \"RuleName\"\
      ],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the receipt rule set that the receipt rule belongs to.</p>\"\
        },\
        \"RuleName\":{\
          \"shape\":\"ReceiptRuleName\",\
          \"documentation\":\"<p>The name of the receipt rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return the details of a receipt rule. You use receipt rules to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DescribeReceiptRuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Rule\":{\
          \"shape\":\"ReceiptRule\",\
          \"documentation\":\"<p>A data structure that contains the specified receipt rule's name, actions, recipients, domains, enabled status, scan status, and Transport Layer Security (TLS) policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the details of a receipt rule.</p>\"\
    },\
    \"DescribeReceiptRuleSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"RuleSetName\"],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the receipt rule set to describe.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return the details of a receipt rule set. You use receipt rule sets to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"DescribeReceiptRuleSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metadata\":{\
          \"shape\":\"ReceiptRuleSetMetadata\",\
          \"documentation\":\"<p>The metadata for the receipt rule set, which consists of the rule set name and the timestamp of when the rule set was created.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"ReceiptRulesList\",\
          \"documentation\":\"<p>A list of the receipt rules that belong to the specified receipt rule set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the details of the specified receipt rule set.</p>\"\
    },\
    \"Destination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ToAddresses\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>The recipients to place on the To: line of the message.</p>\"\
        },\
        \"CcAddresses\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>The recipients to place on the CC: line of the message.</p>\"\
        },\
        \"BccAddresses\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>The recipients to place on the BCC: line of the message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the destination of the message, consisting of To:, CC:, and BCC: fields.</p> <note> <p>Amazon SES does not support the SMTPUTF8 extension, as described in <a href=\\\"https://tools.ietf.org/html/rfc6531\\\">RFC6531</a>. For this reason, the <i>local part</i> of a destination email address (the part of the email address that precedes the @ sign) may only contain <a href=\\\"https://en.wikipedia.org/wiki/Email_address#Local-part\\\">7-bit ASCII characters</a>. If the <i>domain part</i> of an address (the part after the @ sign) contains non-ASCII characters, they must be encoded using Punycode, as described in <a href=\\\"https://tools.ietf.org/html/rfc3492.html\\\">RFC3492</a>.</p> </note>\"\
    },\
    \"DiagnosticCode\":{\"type\":\"string\"},\
    \"DimensionName\":{\"type\":\"string\"},\
    \"DimensionValueSource\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"messageTag\",\
        \"emailHeader\",\
        \"linkTag\"\
      ]\
    },\
    \"DkimAttributes\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Identity\"},\
      \"value\":{\"shape\":\"IdentityDkimAttributes\"}\
    },\
    \"Domain\":{\"type\":\"string\"},\
    \"DsnAction\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"failed\",\
        \"delayed\",\
        \"delivered\",\
        \"relayed\",\
        \"expanded\"\
      ]\
    },\
    \"DsnStatus\":{\"type\":\"string\"},\
    \"Enabled\":{\"type\":\"boolean\"},\
    \"Error\":{\"type\":\"string\"},\
    \"EventDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"MatchingEventTypes\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>The name of the event destination. The name must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Contain less than 64 characters.</p> </li> </ul>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Sets whether Amazon SES publishes events to this destination when you send an email with the associated configuration set. Set to <code>true</code> to enable publishing to this destination; set to <code>false</code> to prevent publishing to this destination. The default value is <code>false</code>.</p>\"\
        },\
        \"MatchingEventTypes\":{\
          \"shape\":\"EventTypes\",\
          \"documentation\":\"<p>The type of email sending events to publish to the event destination.</p>\"\
        },\
        \"KinesisFirehoseDestination\":{\
          \"shape\":\"KinesisFirehoseDestination\",\
          \"documentation\":\"<p>An object that contains the delivery stream ARN and the IAM role ARN associated with an Amazon Kinesis Firehose event destination.</p>\"\
        },\
        \"CloudWatchDestination\":{\
          \"shape\":\"CloudWatchDestination\",\
          \"documentation\":\"<p>An object that contains the names, default values, and sources of the dimensions associated with an Amazon CloudWatch event destination.</p>\"\
        },\
        \"SNSDestination\":{\
          \"shape\":\"SNSDestination\",\
          \"documentation\":\"<p>An object that contains the topic ARN associated with an Amazon Simple Notification Service (Amazon SNS) event destination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the event destination that the specified email sending events will be published to.</p> <note> <p>When you create or update an event destination, you must provide one, and only one, destination. The destination can be Amazon CloudWatch, Amazon Kinesis Firehose or Amazon Simple Notification Service (Amazon SNS).</p> </note> <p>Event destinations are associated with configuration sets, which enable you to publish email sending events to Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS). For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"EventDestinationAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Indicates that the configuration set does not exist.</p>\"\
        },\
        \"EventDestinationName\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>Indicates that the event destination does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the event destination could not be created because of a naming conflict.</p>\",\
      \"error\":{\
        \"code\":\"EventDestinationAlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"EventDestinationDoesNotExistException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Indicates that the configuration set does not exist.</p>\"\
        },\
        \"EventDestinationName\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>Indicates that the event destination does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the event destination does not exist.</p>\",\
      \"error\":{\
        \"code\":\"EventDestinationDoesNotExist\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"EventDestinationName\":{\"type\":\"string\"},\
    \"EventDestinations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventDestination\"}\
    },\
    \"EventType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"send\",\
        \"reject\",\
        \"bounce\",\
        \"complaint\",\
        \"delivery\",\
        \"open\",\
        \"click\",\
        \"renderingFailure\"\
      ]\
    },\
    \"EventTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventType\"}\
    },\
    \"Explanation\":{\"type\":\"string\"},\
    \"ExtensionField\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ExtensionFieldName\",\
          \"documentation\":\"<p>The name of the header to add. Must be between 1 and 50 characters, inclusive, and consist of alphanumeric (a-z, A-Z, 0-9) characters and dashes only.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ExtensionFieldValue\",\
          \"documentation\":\"<p>The value of the header to add. Must be less than 2048 characters, and must not contain newline characters (\\\"\\\\r\\\" or \\\"\\\\n\\\").</p>\"\
        }\
      },\
      \"documentation\":\"<p>Additional X-headers to include in the Delivery Status Notification (DSN) when an email that Amazon SES receives on your behalf bounces.</p> <p>For information about receiving email through Amazon SES, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ExtensionFieldList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExtensionField\"}\
    },\
    \"ExtensionFieldName\":{\"type\":\"string\"},\
    \"ExtensionFieldValue\":{\"type\":\"string\"},\
    \"FailureRedirectionURL\":{\"type\":\"string\"},\
    \"FromAddress\":{\"type\":\"string\"},\
    \"FromEmailAddressNotVerifiedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FromEmailAddress\":{\
          \"shape\":\"FromAddress\",\
          \"documentation\":\"<p>Indicates that the from email address associated with the custom verification email template is not verified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the sender address specified for a custom verification email is not verified, and is therefore not eligible to send the custom verification email. </p>\",\
      \"error\":{\
        \"code\":\"FromEmailAddressNotVerified\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"GetAccountSendingEnabledResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether email sending is enabled or disabled for your Amazon SES account in the current AWS Region.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return the email sending status for your Amazon SES account in the current AWS Region.</p>\"\
    },\
    \"GetCustomVerificationEmailTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TemplateName\"],\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the custom verification email template that you want to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to retrieve an existing custom verification email template.</p>\"\
    },\
    \"GetCustomVerificationEmailTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the custom verification email template.</p>\"\
        },\
        \"FromEmailAddress\":{\
          \"shape\":\"FromAddress\",\
          \"documentation\":\"<p>The email address that the custom verification email is sent from.</p>\"\
        },\
        \"TemplateSubject\":{\
          \"shape\":\"Subject\",\
          \"documentation\":\"<p>The subject line of the custom verification email.</p>\"\
        },\
        \"TemplateContent\":{\
          \"shape\":\"TemplateContent\",\
          \"documentation\":\"<p>The content of the custom verification email.</p>\"\
        },\
        \"SuccessRedirectionURL\":{\
          \"shape\":\"SuccessRedirectionURL\",\
          \"documentation\":\"<p>The URL that the recipient of the verification email is sent to if his or her address is successfully verified.</p>\"\
        },\
        \"FailureRedirectionURL\":{\
          \"shape\":\"FailureRedirectionURL\",\
          \"documentation\":\"<p>The URL that the recipient of the verification email is sent to if his or her address is not successfully verified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The content of the custom verification email template.</p>\"\
    },\
    \"GetIdentityDkimAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Identities\"],\
      \"members\":{\
        \"Identities\":{\
          \"shape\":\"IdentityList\",\
          \"documentation\":\"<p>A list of one or more verified identities - email addresses, domains, or both.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request for the status of Amazon SES Easy DKIM signing for an identity. For domain identities, this request also returns the DKIM tokens that are required for Easy DKIM signing, and whether Amazon SES successfully verified that these tokens were published. For more information about Easy DKIM, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"GetIdentityDkimAttributesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DkimAttributes\"],\
      \"members\":{\
        \"DkimAttributes\":{\
          \"shape\":\"DkimAttributes\",\
          \"documentation\":\"<p>The DKIM attributes for an email address or a domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the status of Amazon SES Easy DKIM signing for an identity. For domain identities, this response also contains the DKIM tokens that are required for Easy DKIM signing, and whether Amazon SES successfully verified that these tokens were published.</p>\"\
    },\
    \"GetIdentityMailFromDomainAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Identities\"],\
      \"members\":{\
        \"Identities\":{\
          \"shape\":\"IdentityList\",\
          \"documentation\":\"<p>A list of one or more identities.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return the Amazon SES custom MAIL FROM attributes for a list of identities. For information about using a custom MAIL FROM domain, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"GetIdentityMailFromDomainAttributesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"MailFromDomainAttributes\"],\
      \"members\":{\
        \"MailFromDomainAttributes\":{\
          \"shape\":\"MailFromDomainAttributes\",\
          \"documentation\":\"<p>A map of identities to custom MAIL FROM attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the custom MAIL FROM attributes for a list of identities.</p>\"\
    },\
    \"GetIdentityNotificationAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Identities\"],\
      \"members\":{\
        \"Identities\":{\
          \"shape\":\"IdentityList\",\
          \"documentation\":\"<p>A list of one or more identities. You can specify an identity by using its name or by using its Amazon Resource Name (ARN). Examples: <code>user@example.com</code>, <code>example.com</code>, <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return the notification attributes for a list of identities you verified with Amazon SES. For information about Amazon SES notifications, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"GetIdentityNotificationAttributesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotificationAttributes\"],\
      \"members\":{\
        \"NotificationAttributes\":{\
          \"shape\":\"NotificationAttributes\",\
          \"documentation\":\"<p>A map of Identity to IdentityNotificationAttributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the notification attributes for a list of identities.</p>\"\
    },\
    \"GetIdentityPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Identity\",\
        \"PolicyNames\"\
      ],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity for which the policies will be retrieved. You can specify an identity by using its name or by using its Amazon Resource Name (ARN). Examples: <code>user@example.com</code>, <code>example.com</code>, <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.</p> <p>To successfully call this API, you must own the identity.</p>\"\
        },\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNameList\",\
          \"documentation\":\"<p>A list of the names of policies to be retrieved. You can retrieve a maximum of 20 policies at a time. If you do not know the names of the policies that are attached to the identity, you can use <code>ListIdentityPolicies</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return the requested sending authorization policies for an identity. Sending authorization is an Amazon SES feature that enables you to authorize other senders to use your identities. For information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"GetIdentityPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Policies\"],\
      \"members\":{\
        \"Policies\":{\
          \"shape\":\"PolicyMap\",\
          \"documentation\":\"<p>A map of policy names to policies.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the requested sending authorization policies.</p>\"\
    },\
    \"GetIdentityVerificationAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Identities\"],\
      \"members\":{\
        \"Identities\":{\
          \"shape\":\"IdentityList\",\
          \"documentation\":\"<p>A list of identities.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return the Amazon SES verification status of a list of identities. For domain identities, this request also returns the verification token. For information about verifying identities with Amazon SES, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"GetIdentityVerificationAttributesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"VerificationAttributes\"],\
      \"members\":{\
        \"VerificationAttributes\":{\
          \"shape\":\"VerificationAttributes\",\
          \"documentation\":\"<p>A map of Identities to IdentityVerificationAttributes objects.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon SES verification status of a list of identities. For domain identities, this response also contains the verification token.</p>\"\
    },\
    \"GetSendQuotaResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Max24HourSend\":{\
          \"shape\":\"Max24HourSend\",\
          \"documentation\":\"<p>The maximum number of emails the user is allowed to send in a 24-hour interval. A value of -1 signifies an unlimited quota.</p>\"\
        },\
        \"MaxSendRate\":{\
          \"shape\":\"MaxSendRate\",\
          \"documentation\":\"<p>The maximum number of emails that Amazon SES can accept from the user's account per second.</p> <note> <p>The rate at which Amazon SES accepts the user's messages might be less than the maximum send rate.</p> </note>\"\
        },\
        \"SentLast24Hours\":{\
          \"shape\":\"SentLast24Hours\",\
          \"documentation\":\"<p>The number of emails sent during the previous 24 hours.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents your Amazon SES daily sending quota, maximum send rate, and the number of emails you have sent in the last 24 hours.</p>\"\
    },\
    \"GetSendStatisticsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SendDataPoints\":{\
          \"shape\":\"SendDataPointList\",\
          \"documentation\":\"<p>A list of data points, each of which represents 15 minutes of activity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a list of data points. This list contains aggregated data from the previous two weeks of your sending activity with Amazon SES.</p>\"\
    },\
    \"GetTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TemplateName\"],\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the template you want to retrieve.</p>\"\
        }\
      }\
    },\
    \"GetTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Template\":{\"shape\":\"Template\"}\
      }\
    },\
    \"HeaderName\":{\"type\":\"string\"},\
    \"HeaderValue\":{\"type\":\"string\"},\
    \"HtmlPart\":{\"type\":\"string\"},\
    \"Identity\":{\"type\":\"string\"},\
    \"IdentityDkimAttributes\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DkimEnabled\",\
        \"DkimVerificationStatus\"\
      ],\
      \"members\":{\
        \"DkimEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Is true if DKIM signing is enabled for email sent from the identity. It's false otherwise. The default value is true.</p>\"\
        },\
        \"DkimVerificationStatus\":{\
          \"shape\":\"VerificationStatus\",\
          \"documentation\":\"<p>Describes whether Amazon SES has successfully verified the DKIM DNS records (tokens) published in the domain name's DNS. (This only applies to domain identities, not email address identities.)</p>\"\
        },\
        \"DkimTokens\":{\
          \"shape\":\"VerificationTokenList\",\
          \"documentation\":\"<p>A set of character strings that represent the domain's identity. Using these tokens, you need to create DNS CNAME records that point to DKIM public keys that are hosted by Amazon SES. Amazon Web Services eventually detects that you've updated your DNS records. This detection process might take up to 72 hours. After successful detection, Amazon SES is able to DKIM-sign email originating from that domain. (This only applies to domain identities, not email address identities.)</p> <p>For more information about creating DNS records using DKIM tokens, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the DKIM attributes of a verified email address or a domain.</p>\"\
    },\
    \"IdentityList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Identity\"}\
    },\
    \"IdentityMailFromDomainAttributes\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MailFromDomain\",\
        \"MailFromDomainStatus\",\
        \"BehaviorOnMXFailure\"\
      ],\
      \"members\":{\
        \"MailFromDomain\":{\
          \"shape\":\"MailFromDomainName\",\
          \"documentation\":\"<p>The custom MAIL FROM domain that the identity is configured to use.</p>\"\
        },\
        \"MailFromDomainStatus\":{\
          \"shape\":\"CustomMailFromStatus\",\
          \"documentation\":\"<p>The state that indicates whether Amazon SES has successfully read the MX record required for custom MAIL FROM domain setup. If the state is <code>Success</code>, Amazon SES uses the specified custom MAIL FROM domain when the verified identity sends an email. All other states indicate that Amazon SES takes the action described by <code>BehaviorOnMXFailure</code>.</p>\"\
        },\
        \"BehaviorOnMXFailure\":{\
          \"shape\":\"BehaviorOnMXFailure\",\
          \"documentation\":\"<p>The action that Amazon SES takes if it cannot successfully read the required MX record when you send an email. A value of <code>UseDefaultValue</code> indicates that if Amazon SES cannot read the required MX record, it uses amazonses.com (or a subdomain of that) as the MAIL FROM domain. A value of <code>RejectMessage</code> indicates that if Amazon SES cannot read the required MX record, Amazon SES returns a <code>MailFromDomainNotVerified</code> error and does not send the email.</p> <p>The custom MAIL FROM setup states that result in this behavior are <code>Pending</code>, <code>Failed</code>, and <code>TemporaryFailure</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the custom MAIL FROM domain attributes of a verified identity (email address or domain).</p>\"\
    },\
    \"IdentityNotificationAttributes\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BounceTopic\",\
        \"ComplaintTopic\",\
        \"DeliveryTopic\",\
        \"ForwardingEnabled\"\
      ],\
      \"members\":{\
        \"BounceTopic\":{\
          \"shape\":\"NotificationTopic\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will publish bounce notifications.</p>\"\
        },\
        \"ComplaintTopic\":{\
          \"shape\":\"NotificationTopic\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will publish complaint notifications.</p>\"\
        },\
        \"DeliveryTopic\":{\
          \"shape\":\"NotificationTopic\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES will publish delivery notifications.</p>\"\
        },\
        \"ForwardingEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether Amazon SES will forward bounce and complaint notifications as email. <code>true</code> indicates that Amazon SES will forward bounce and complaint notifications as email, while <code>false</code> indicates that bounce and complaint notifications will be published only to the specified bounce and complaint Amazon SNS topics.</p>\"\
        },\
        \"HeadersInBounceNotificationsEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether Amazon SES includes the original email headers in Amazon SNS notifications of type <code>Bounce</code>. A value of <code>true</code> specifies that Amazon SES will include headers in bounce notifications, and a value of <code>false</code> specifies that Amazon SES will not include headers in bounce notifications.</p>\"\
        },\
        \"HeadersInComplaintNotificationsEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether Amazon SES includes the original email headers in Amazon SNS notifications of type <code>Complaint</code>. A value of <code>true</code> specifies that Amazon SES will include headers in complaint notifications, and a value of <code>false</code> specifies that Amazon SES will not include headers in complaint notifications.</p>\"\
        },\
        \"HeadersInDeliveryNotificationsEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether Amazon SES includes the original email headers in Amazon SNS notifications of type <code>Delivery</code>. A value of <code>true</code> specifies that Amazon SES will include headers in delivery notifications, and a value of <code>false</code> specifies that Amazon SES will not include headers in delivery notifications.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the notification attributes of an identity, including whether an identity has Amazon Simple Notification Service (Amazon SNS) topics set for bounce, complaint, and/or delivery notifications, and whether feedback forwarding is enabled for bounce and complaint notifications.</p>\"\
    },\
    \"IdentityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EmailAddress\",\
        \"Domain\"\
      ]\
    },\
    \"IdentityVerificationAttributes\":{\
      \"type\":\"structure\",\
      \"required\":[\"VerificationStatus\"],\
      \"members\":{\
        \"VerificationStatus\":{\
          \"shape\":\"VerificationStatus\",\
          \"documentation\":\"<p>The verification status of the identity: \\\"Pending\\\", \\\"Success\\\", \\\"Failed\\\", or \\\"TemporaryFailure\\\".</p>\"\
        },\
        \"VerificationToken\":{\
          \"shape\":\"VerificationToken\",\
          \"documentation\":\"<p>The verification token for a domain identity. Null for email address identities.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the verification attributes of a single identity.</p>\"\
    },\
    \"InvalidCloudWatchDestinationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Indicates that the configuration set does not exist.</p>\"\
        },\
        \"EventDestinationName\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>Indicates that the event destination does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the Amazon CloudWatch destination is invalid. See the error message for details.</p>\",\
      \"error\":{\
        \"code\":\"InvalidCloudWatchDestination\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidConfigurationSetException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that the configuration set is invalid. See the error message for details.</p>\",\
      \"error\":{\
        \"code\":\"InvalidConfigurationSet\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidDeliveryOptionsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that provided delivery option is invalid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidDeliveryOptions\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidFirehoseDestinationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Indicates that the configuration set does not exist.</p>\"\
        },\
        \"EventDestinationName\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>Indicates that the event destination does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the Amazon Kinesis Firehose destination is invalid. See the error message for details.</p>\",\
      \"error\":{\
        \"code\":\"InvalidFirehoseDestination\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidLambdaFunctionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FunctionArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>Indicates that the ARN of the function was not found.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the provided AWS Lambda function is invalid, or that Amazon SES could not execute the provided function, possibly due to permissions issues. For information about giving permissions, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html\\\">Amazon SES Developer Guide</a>.</p>\",\
      \"error\":{\
        \"code\":\"InvalidLambdaFunction\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidPolicyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that the provided policy is invalid. Check the error stack for more information about what caused the error.</p>\",\
      \"error\":{\
        \"code\":\"InvalidPolicy\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidRenderingParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateName\":{\"shape\":\"TemplateName\"}\
      },\
      \"documentation\":\"<p>Indicates that one or more of the replacement values you provided is invalid. This error may occur when the TemplateData object contains invalid JSON.</p>\",\
      \"error\":{\
        \"code\":\"InvalidRenderingParameter\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidS3ConfigurationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"S3BucketName\",\
          \"documentation\":\"<p>Indicated that the S3 Bucket was not found.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the provided Amazon S3 bucket or AWS KMS encryption key is invalid, or that Amazon SES could not publish to the bucket, possibly due to permissions issues. For information about giving permissions, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html\\\">Amazon SES Developer Guide</a>.</p>\",\
      \"error\":{\
        \"code\":\"InvalidS3Configuration\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSNSDestinationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Indicates that the configuration set does not exist.</p>\"\
        },\
        \"EventDestinationName\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>Indicates that the event destination does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the Amazon Simple Notification Service (Amazon SNS) destination is invalid. See the error message for details.</p>\",\
      \"error\":{\
        \"code\":\"InvalidSNSDestination\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidSnsTopicException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Topic\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>Indicates that the topic does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the provided Amazon SNS topic is invalid, or that Amazon SES could not publish to the topic, possibly due to permissions issues. For information about giving permissions, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html\\\">Amazon SES Developer Guide</a>.</p>\",\
      \"error\":{\
        \"code\":\"InvalidSnsTopic\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidTemplateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateName\":{\"shape\":\"TemplateName\"}\
      },\
      \"documentation\":\"<p>Indicates that the template that you specified could not be rendered. This issue may occur when a template refers to a partial that does not exist.</p>\",\
      \"error\":{\
        \"code\":\"InvalidTemplate\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidTrackingOptionsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that the custom domain to be used for open and click tracking redirects is invalid. This error appears most often in the following situations:</p> <ul> <li> <p>When the tracking domain you specified is not verified in Amazon SES.</p> </li> <li> <p>When the tracking domain you specified is not a valid domain or subdomain.</p> </li> </ul>\",\
      \"error\":{\
        \"code\":\"InvalidTrackingOptions\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Event\",\
        \"RequestResponse\"\
      ]\
    },\
    \"KinesisFirehoseDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IAMRoleARN\",\
        \"DeliveryStreamARN\"\
      ],\
      \"members\":{\
        \"IAMRoleARN\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the IAM role under which Amazon SES publishes email sending events to the Amazon Kinesis Firehose stream.</p>\"\
        },\
        \"DeliveryStreamARN\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the Amazon Kinesis Firehose stream that email sending events should be published to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the delivery stream ARN and the IAM role ARN associated with an Amazon Kinesis Firehose event destination.</p> <p>Event destinations, such as Amazon Kinesis Firehose, are associated with configuration sets, which enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"LambdaAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the Lambda action is taken. An example of an Amazon SNS topic ARN is <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more information about Amazon SNS topics, see the <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html\\\">Amazon SNS Developer Guide</a>.</p>\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Lambda function. An example of an AWS Lambda function ARN is <code>arn:aws:lambda:us-west-2:account-id:function:MyFunction</code>. For more information about AWS Lambda, see the <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/welcome.html\\\">AWS Lambda Developer Guide</a>.</p>\"\
        },\
        \"InvocationType\":{\
          \"shape\":\"InvocationType\",\
          \"documentation\":\"<p>The invocation type of the AWS Lambda function. An invocation type of <code>RequestResponse</code> means that the execution of the function will immediately result in a response, and a value of <code>Event</code> means that the function will be invoked asynchronously. The default value is <code>Event</code>. For information about AWS Lambda invocation types, see the <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html\\\">AWS Lambda Developer Guide</a>.</p> <important> <p>There is a 30-second timeout on <code>RequestResponse</code> invocations. You should use <code>Event</code> invocation in most cases. Use <code>RequestResponse</code> only when you want to make a mail flow decision, such as whether to stop the receipt rule or the receipt rule set.</p> </important>\"\
        }\
      },\
      \"documentation\":\"<p>When included in a receipt rule, this action calls an AWS Lambda function and, optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS).</p> <p>To enable Amazon SES to call your AWS Lambda function or to publish to an Amazon SNS topic of another account, Amazon SES must have permission to access those resources. For information about giving permissions, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html\\\">Amazon SES Developer Guide</a>.</p> <p>For information about using AWS Lambda actions in receipt rules, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-lambda.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"LastAttemptDate\":{\"type\":\"timestamp\"},\
    \"LastFreshStart\":{\"type\":\"timestamp\"},\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that a resource could not be created because of service limits. For a list of Amazon SES limits, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/limits.html\\\">Amazon SES Developer Guide</a>.</p>\",\
      \"error\":{\
        \"code\":\"LimitExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ListConfigurationSetsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token returned from a previous call to <code>ListConfigurationSets</code> to indicate the position of the configuration set in the configuration set list.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The number of configuration sets to return.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to list the configuration sets associated with your AWS account. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ListConfigurationSetsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSets\":{\
          \"shape\":\"ConfigurationSets\",\
          \"documentation\":\"<p>A list of configuration sets.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token indicating that there are additional configuration sets available to be listed. Pass this token to successive calls of <code>ListConfigurationSets</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of configuration sets associated with your AWS account. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ListCustomVerificationEmailTemplatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>An array the contains the name and creation time stamp for each template in your Amazon SES account.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of custom verification email templates to return. This value must be at least 1 and less than or equal to 50. If you do not specify a value, or if you specify a value less than 1 or greater than 50, the operation will return up to 50 results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to list the existing custom verification email templates for your account.</p> <p>For more information about custom verification email templates, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html\\\">Using Custom Verification Email Templates</a> in the <i>Amazon SES Developer Guide</i>.</p>\"\
    },\
    \"ListCustomVerificationEmailTemplatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomVerificationEmailTemplates\":{\
          \"shape\":\"CustomVerificationEmailTemplates\",\
          \"documentation\":\"<p>A list of the custom verification email templates that exist in your account.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token indicating that there are additional custom verification email templates available to be listed. Pass this token to a subsequent call to <code>ListTemplates</code> to retrieve the next 50 custom verification email templates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A paginated list of custom verification email templates.</p>\"\
    },\
    \"ListIdentitiesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityType\":{\
          \"shape\":\"IdentityType\",\
          \"documentation\":\"<p>The type of the identities to list. Possible values are \\\"EmailAddress\\\" and \\\"Domain\\\". If this parameter is omitted, then all identities will be listed.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use for pagination.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The maximum number of identities per page. Possible values are 1-1000 inclusive.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return a list of all identities (email addresses and domains) that you have attempted to verify under your AWS account, regardless of verification status.</p>\"\
    },\
    \"ListIdentitiesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Identities\"],\
      \"members\":{\
        \"Identities\":{\
          \"shape\":\"IdentityList\",\
          \"documentation\":\"<p>A list of identities.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token used for pagination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of all identities that you have attempted to verify under your AWS account, regardless of verification status.</p>\"\
    },\
    \"ListIdentityPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Identity\"],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity that is associated with the policy for which the policies will be listed. You can specify an identity by using its name or by using its Amazon Resource Name (ARN). Examples: <code>user@example.com</code>, <code>example.com</code>, <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.</p> <p>To successfully call this API, you must own the identity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to return a list of sending authorization policies that are attached to an identity. Sending authorization is an Amazon SES feature that enables you to authorize other senders to use your identities. For information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ListIdentityPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyNames\"],\
      \"members\":{\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNameList\",\
          \"documentation\":\"<p>A list of names of policies that apply to the specified identity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of names of sending authorization policies that apply to an identity.</p>\"\
    },\
    \"ListReceiptFiltersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents a request to list the IP address filters that exist under your AWS account. You use IP address filters when you receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ListReceiptFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filters\":{\
          \"shape\":\"ReceiptFilterList\",\
          \"documentation\":\"<p>A list of IP address filter data structures, which each consist of a name, an IP address range, and whether to allow or block mail from it.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of IP address filters that exist under your AWS account.</p>\"\
    },\
    \"ListReceiptRuleSetsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token returned from a previous call to <code>ListReceiptRuleSets</code> to indicate the position in the receipt rule set list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to list the receipt rule sets that exist under your AWS account. You use receipt rule sets to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ListReceiptRuleSetsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RuleSets\":{\
          \"shape\":\"ReceiptRuleSetsLists\",\
          \"documentation\":\"<p>The metadata for the currently active receipt rule set. The metadata consists of the rule set name and the timestamp of when the rule set was created.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token indicating that there are additional receipt rule sets available to be listed. Pass this token to successive calls of <code>ListReceiptRuleSets</code> to retrieve up to 100 receipt rule sets at a time.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of receipt rule sets that exist under your AWS account.</p>\"\
    },\
    \"ListTemplatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token returned from a previous call to <code>ListTemplates</code> to indicate the position in the list of email templates.</p>\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The maximum number of templates to return. This value must be at least 1 and less than or equal to 10. If you do not specify a value, or if you specify a value less than 1 or greater than 10, the operation will return up to 10 results.</p>\"\
        }\
      }\
    },\
    \"ListTemplatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplatesMetadata\":{\
          \"shape\":\"TemplateMetadataList\",\
          \"documentation\":\"<p>An array the contains the name and creation time stamp for each template in your Amazon SES account.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token indicating that there are additional email templates available to be listed. Pass this token to a subsequent call to <code>ListTemplates</code> to retrieve the next 50 email templates.</p>\"\
        }\
      }\
    },\
    \"ListVerifiedEmailAddressesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VerifiedEmailAddresses\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>A list of email addresses that have been verified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of email addresses that you have verified with Amazon SES under your AWS account.</p>\"\
    },\
    \"MailFromDomainAttributes\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Identity\"},\
      \"value\":{\"shape\":\"IdentityMailFromDomainAttributes\"}\
    },\
    \"MailFromDomainName\":{\"type\":\"string\"},\
    \"MailFromDomainNotVerifiedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p> Indicates that the message could not be sent because Amazon SES could not read the MX record required to use the specified MAIL FROM domain. For information about editing the custom MAIL FROM domain settings for an identity, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from-edit.html\\\">Amazon SES Developer Guide</a>.</p>\",\
      \"error\":{\
        \"code\":\"MailFromDomainNotVerifiedException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Max24HourSend\":{\"type\":\"double\"},\
    \"MaxItems\":{\"type\":\"integer\"},\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":50,\
      \"min\":1\
    },\
    \"MaxSendRate\":{\"type\":\"double\"},\
    \"Message\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Subject\",\
        \"Body\"\
      ],\
      \"members\":{\
        \"Subject\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>The subject of the message: A short summary of the content, which will appear in the recipient's inbox.</p>\"\
        },\
        \"Body\":{\
          \"shape\":\"Body\",\
          \"documentation\":\"<p>The message body.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the message to be sent, composed of a subject and a body.</p>\"\
    },\
    \"MessageData\":{\"type\":\"string\"},\
    \"MessageDsn\":{\
      \"type\":\"structure\",\
      \"required\":[\"ReportingMta\"],\
      \"members\":{\
        \"ReportingMta\":{\
          \"shape\":\"ReportingMta\",\
          \"documentation\":\"<p>The reporting MTA that attempted to deliver the message, formatted as specified in <a href=\\\"https://tools.ietf.org/html/rfc3464\\\">RFC 3464</a> (<code>mta-name-type; mta-name</code>). The default value is <code>dns; inbound-smtp.[region].amazonaws.com</code>.</p>\"\
        },\
        \"ArrivalDate\":{\
          \"shape\":\"ArrivalDate\",\
          \"documentation\":\"<p>When the message was received by the reporting mail transfer agent (MTA), in <a href=\\\"https://www.ietf.org/rfc/rfc0822.txt\\\">RFC 822</a> date-time format.</p>\"\
        },\
        \"ExtensionFields\":{\
          \"shape\":\"ExtensionFieldList\",\
          \"documentation\":\"<p>Additional X-headers to include in the DSN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Message-related information to include in the Delivery Status Notification (DSN) when an email that Amazon SES receives on your behalf bounces.</p> <p>For information about receiving email through Amazon SES, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"MessageId\":{\"type\":\"string\"},\
    \"MessageRejected\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that the action failed, and the message could not be sent. Check the error stack for more information about what caused the error.</p>\",\
      \"error\":{\
        \"code\":\"MessageRejected\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"MessageTag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"MessageTagName\",\
          \"documentation\":\"<p>The name of the tag. The name must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Contain less than 256 characters.</p> </li> </ul>\"\
        },\
        \"Value\":{\
          \"shape\":\"MessageTagValue\",\
          \"documentation\":\"<p>The value of the tag. The value must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Contain less than 256 characters.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the name and value of a tag that you can provide to <code>SendEmail</code> or <code>SendRawEmail</code> to apply to an email.</p> <p>Message tags, which you use with configuration sets, enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"MessageTagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MessageTag\"}\
    },\
    \"MessageTagName\":{\"type\":\"string\"},\
    \"MessageTagValue\":{\"type\":\"string\"},\
    \"MissingRenderingAttributeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateName\":{\"shape\":\"TemplateName\"}\
      },\
      \"documentation\":\"<p>Indicates that one or more of the replacement values for the specified template was not specified. Ensure that the TemplateData object contains references to all of the replacement tags in the specified template.</p>\",\
      \"error\":{\
        \"code\":\"MissingRenderingAttribute\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"NextToken\":{\"type\":\"string\"},\
    \"NotificationAttributes\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Identity\"},\
      \"value\":{\"shape\":\"IdentityNotificationAttributes\"}\
    },\
    \"NotificationTopic\":{\"type\":\"string\"},\
    \"NotificationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Bounce\",\
        \"Complaint\",\
        \"Delivery\"\
      ]\
    },\
    \"Policy\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"PolicyMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"PolicyName\"},\
      \"value\":{\"shape\":\"Policy\"}\
    },\
    \"PolicyName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"PolicyNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyName\"}\
    },\
    \"ProductionAccessNotGrantedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Indicates that the account has not been granted production access.</p>\",\
      \"error\":{\
        \"code\":\"ProductionAccessNotGranted\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"PutConfigurationSetDeliveryOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to specify the delivery options for.</p>\"\
        },\
        \"DeliveryOptions\":{\
          \"shape\":\"DeliveryOptions\",\
          \"documentation\":\"<p>Specifies whether messages that use the configuration set are required to use Transport Layer Security (TLS).</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to modify the delivery options for a configuration set.</p>\"\
    },\
    \"PutConfigurationSetDeliveryOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutIdentityPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Identity\",\
        \"PolicyName\",\
        \"Policy\"\
      ],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity that the policy will apply to. You can specify an identity by using its name or by using its Amazon Resource Name (ARN). Examples: <code>user@example.com</code>, <code>example.com</code>, <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.</p> <p>To successfully call this API, you must own the identity.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy.</p> <p>The policy name cannot exceed 64 characters and can only include alphanumeric characters, dashes, and underscores.</p>\"\
        },\
        \"Policy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The text of the policy in JSON format. The policy cannot exceed 4 KB.</p> <p>For information about the syntax of sending authorization policies, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-policies.html\\\">Amazon SES Developer Guide</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to add or update a sending authorization policy for an identity. Sending authorization is an Amazon SES feature that enables you to authorize other senders to use your identities. For information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"PutIdentityPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"RawMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"Data\"],\
      \"members\":{\
        \"Data\":{\
          \"shape\":\"RawMessageData\",\
          \"documentation\":\"<p>The raw data of the message. This data needs to base64-encoded if you are accessing Amazon SES directly through the HTTPS interface. If you are accessing Amazon SES using an AWS SDK, the SDK takes care of the base 64-encoding for you. In all cases, the client must ensure that the message format complies with Internet email standards regarding email header fields, MIME types, and MIME encoding.</p> <p>The To:, CC:, and BCC: headers in the raw message can contain a group list.</p> <p>If you are using <code>SendRawEmail</code> with sending authorization, you can include X-headers in the raw message to specify the \\\"Source,\\\" \\\"From,\\\" and \\\"Return-Path\\\" addresses. For more information, see the documentation for <code>SendRawEmail</code>. </p> <important> <p>Do not include these X-headers in the DKIM signature, because they are removed by Amazon SES before sending the email.</p> </important> <p>For more information, go to the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the raw data of the message.</p>\"\
    },\
    \"RawMessageData\":{\"type\":\"blob\"},\
    \"ReceiptAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Action\":{\
          \"shape\":\"S3Action\",\
          \"documentation\":\"<p>Saves the received message to an Amazon Simple Storage Service (Amazon S3) bucket and, optionally, publishes a notification to Amazon SNS.</p>\"\
        },\
        \"BounceAction\":{\
          \"shape\":\"BounceAction\",\
          \"documentation\":\"<p>Rejects the received email by returning a bounce response to the sender and, optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS).</p>\"\
        },\
        \"WorkmailAction\":{\
          \"shape\":\"WorkmailAction\",\
          \"documentation\":\"<p>Calls Amazon WorkMail and, optionally, publishes a notification to Amazon Amazon SNS.</p>\"\
        },\
        \"LambdaAction\":{\
          \"shape\":\"LambdaAction\",\
          \"documentation\":\"<p>Calls an AWS Lambda function, and optionally, publishes a notification to Amazon SNS.</p>\"\
        },\
        \"StopAction\":{\
          \"shape\":\"StopAction\",\
          \"documentation\":\"<p>Terminates the evaluation of the receipt rule set and optionally publishes a notification to Amazon SNS.</p>\"\
        },\
        \"AddHeaderAction\":{\
          \"shape\":\"AddHeaderAction\",\
          \"documentation\":\"<p>Adds a header to the received email.</p>\"\
        },\
        \"SNSAction\":{\
          \"shape\":\"SNSAction\",\
          \"documentation\":\"<p>Publishes the email content within a notification to Amazon SNS.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An action that Amazon SES can take when it receives an email on behalf of one or more email addresses or domains that you own. An instance of this data type can represent only one action.</p> <p>For information about setting up receipt rules, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ReceiptActionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReceiptAction\"}\
    },\
    \"ReceiptFilter\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"IpFilter\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReceiptFilterName\",\
          \"documentation\":\"<p>The name of the IP address filter. The name must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Start and end with a letter or number.</p> </li> <li> <p>Contain less than 64 characters.</p> </li> </ul>\"\
        },\
        \"IpFilter\":{\
          \"shape\":\"ReceiptIpFilter\",\
          \"documentation\":\"<p>A structure that provides the IP addresses to block or allow, and whether to block or allow incoming mail from them.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A receipt IP address filter enables you to specify whether to accept or reject mail originating from an IP address or range of IP addresses.</p> <p>For information about setting up IP address filters, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ReceiptFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReceiptFilter\"}\
    },\
    \"ReceiptFilterName\":{\"type\":\"string\"},\
    \"ReceiptFilterPolicy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Block\",\
        \"Allow\"\
      ]\
    },\
    \"ReceiptIpFilter\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Policy\",\
        \"Cidr\"\
      ],\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"ReceiptFilterPolicy\",\
          \"documentation\":\"<p>Indicates whether to block or allow incoming mail from the specified IP addresses.</p>\"\
        },\
        \"Cidr\":{\
          \"shape\":\"Cidr\",\
          \"documentation\":\"<p>A single IP address or a range of IP addresses that you want to block or allow, specified in Classless Inter-Domain Routing (CIDR) notation. An example of a single email address is 10.0.0.1. An example of a range of IP addresses is 10.0.0.1/24. For more information about CIDR notation, see <a href=\\\"https://tools.ietf.org/html/rfc2317\\\">RFC 2317</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A receipt IP address filter enables you to specify whether to accept or reject mail originating from an IP address or range of IP addresses.</p> <p>For information about setting up IP address filters, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-ip-filters.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ReceiptRule\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReceiptRuleName\",\
          \"documentation\":\"<p>The name of the receipt rule. The name must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Start and end with a letter or number.</p> </li> <li> <p>Contain less than 64 characters.</p> </li> </ul>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>If <code>true</code>, the receipt rule is active. The default value is <code>false</code>.</p>\"\
        },\
        \"TlsPolicy\":{\
          \"shape\":\"TlsPolicy\",\
          \"documentation\":\"<p>Specifies whether Amazon SES should require that incoming email is delivered over a connection encrypted with Transport Layer Security (TLS). If this parameter is set to <code>Require</code>, Amazon SES will bounce emails that are not received over TLS. The default is <code>Optional</code>.</p>\"\
        },\
        \"Recipients\":{\
          \"shape\":\"RecipientsList\",\
          \"documentation\":\"<p>The recipient domains and email addresses that the receipt rule applies to. If this field is not specified, this rule will match all recipients under all verified domains.</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"ReceiptActionsList\",\
          \"documentation\":\"<p>An ordered list of actions to perform on messages that match at least one of the recipient email addresses or domains specified in the receipt rule.</p>\"\
        },\
        \"ScanEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>If <code>true</code>, then messages that this receipt rule applies to are scanned for spam and viruses. The default value is <code>false</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Receipt rules enable you to specify which actions Amazon SES should take when it receives mail on behalf of one or more email addresses or domains that you own.</p> <p>Each receipt rule defines a set of email addresses or domains that it applies to. If the email addresses or domains match at least one recipient address of the message, Amazon SES executes all of the receipt rule's actions on the message.</p> <p>For information about setting up receipt rules, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rules.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ReceiptRuleName\":{\"type\":\"string\"},\
    \"ReceiptRuleNamesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReceiptRuleName\"}\
    },\
    \"ReceiptRuleSetMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the receipt rule set. The name must:</p> <ul> <li> <p>This value can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>Start and end with a letter or number.</p> </li> <li> <p>Contain less than 64 characters.</p> </li> </ul>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time the receipt rule set was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a receipt rule set.</p> <p>A receipt rule set is a collection of rules that specify what Amazon SES should do with mail it receives on behalf of your account's verified domains.</p> <p>For information about setting up receipt rule sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-receipt-rule-set.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ReceiptRuleSetName\":{\"type\":\"string\"},\
    \"ReceiptRuleSetsLists\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReceiptRuleSetMetadata\"}\
    },\
    \"ReceiptRulesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReceiptRule\"}\
    },\
    \"Recipient\":{\"type\":\"string\"},\
    \"RecipientDsnFields\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Action\",\
        \"Status\"\
      ],\
      \"members\":{\
        \"FinalRecipient\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address that the message was ultimately delivered to. This corresponds to the <code>Final-Recipient</code> in the DSN. If not specified, <code>FinalRecipient</code> will be set to the <code>Recipient</code> specified in the <code>BouncedRecipientInfo</code> structure. Either <code>FinalRecipient</code> or the recipient in <code>BouncedRecipientInfo</code> must be a recipient of the original bounced message.</p> <note> <p>Do not prepend the <code>FinalRecipient</code> email address with <code>rfc 822;</code>, as described in <a href=\\\"https://tools.ietf.org/html/rfc3798\\\">RFC 3798</a>.</p> </note>\"\
        },\
        \"Action\":{\
          \"shape\":\"DsnAction\",\
          \"documentation\":\"<p>The action performed by the reporting mail transfer agent (MTA) as a result of its attempt to deliver the message to the recipient address. This is required by <a href=\\\"https://tools.ietf.org/html/rfc3464\\\">RFC 3464</a>.</p>\"\
        },\
        \"RemoteMta\":{\
          \"shape\":\"RemoteMta\",\
          \"documentation\":\"<p>The MTA to which the remote MTA attempted to deliver the message, formatted as specified in <a href=\\\"https://tools.ietf.org/html/rfc3464\\\">RFC 3464</a> (<code>mta-name-type; mta-name</code>). This parameter typically applies only to propagating synchronous bounces.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DsnStatus\",\
          \"documentation\":\"<p>The status code that indicates what went wrong. This is required by <a href=\\\"https://tools.ietf.org/html/rfc3464\\\">RFC 3464</a>.</p>\"\
        },\
        \"DiagnosticCode\":{\
          \"shape\":\"DiagnosticCode\",\
          \"documentation\":\"<p>An extended explanation of what went wrong; this is usually an SMTP response. See <a href=\\\"https://tools.ietf.org/html/rfc3463\\\">RFC 3463</a> for the correct formatting of this parameter.</p>\"\
        },\
        \"LastAttemptDate\":{\
          \"shape\":\"LastAttemptDate\",\
          \"documentation\":\"<p>The time the final delivery attempt was made, in <a href=\\\"https://www.ietf.org/rfc/rfc0822.txt\\\">RFC 822</a> date-time format.</p>\"\
        },\
        \"ExtensionFields\":{\
          \"shape\":\"ExtensionFieldList\",\
          \"documentation\":\"<p>Additional X-headers to include in the DSN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Recipient-related information to include in the Delivery Status Notification (DSN) when an email that Amazon SES receives on your behalf bounces.</p> <p>For information about receiving email through Amazon SES, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"RecipientsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Recipient\"}\
    },\
    \"RemoteMta\":{\"type\":\"string\"},\
    \"RenderedTemplate\":{\"type\":\"string\"},\
    \"ReorderReceiptRuleSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleSetName\",\
        \"RuleNames\"\
      ],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the receipt rule set to reorder.</p>\"\
        },\
        \"RuleNames\":{\
          \"shape\":\"ReceiptRuleNamesList\",\
          \"documentation\":\"<p>A list of the specified receipt rule set's receipt rules in the order that you want to put them.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to reorder the receipt rules within a receipt rule set. You use receipt rule sets to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"ReorderReceiptRuleSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"ReportingMta\":{\"type\":\"string\"},\
    \"ReputationOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SendingEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether email sending is enabled or disabled for the configuration set. If the value is <code>true</code>, then Amazon SES will send emails that use the configuration set. If the value is <code>false</code>, Amazon SES will not send emails that use the configuration set. The default value is <code>true</code>. You can change this setting using <a>UpdateConfigurationSetSendingEnabled</a>.</p>\"\
        },\
        \"ReputationMetricsEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether or not Amazon SES publishes reputation metrics for the configuration set, such as bounce and complaint rates, to Amazon CloudWatch.</p> <p>If the value is <code>true</code>, reputation metrics are published. If the value is <code>false</code>, reputation metrics are not published. The default value is <code>false</code>.</p>\"\
        },\
        \"LastFreshStart\":{\
          \"shape\":\"LastFreshStart\",\
          \"documentation\":\"<p>The date and time at which the reputation metrics for the configuration set were last reset. Resetting these metrics is known as a <i>fresh start</i>.</p> <p>When you disable email sending for a configuration set using <a>UpdateConfigurationSetSendingEnabled</a> and later re-enable it, the reputation metrics for the configuration set (but not for the entire Amazon SES account) are reset.</p> <p>If email sending for the configuration set has never been disabled and later re-enabled, the value of this attribute is <code>null</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the reputation settings for a configuration set.</p>\"\
    },\
    \"RuleDoesNotExistException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"RuleOrRuleSetName\",\
          \"documentation\":\"<p>Indicates that the named receipt rule does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the provided receipt rule does not exist.</p>\",\
      \"error\":{\
        \"code\":\"RuleDoesNotExist\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"RuleOrRuleSetName\":{\"type\":\"string\"},\
    \"RuleSetDoesNotExistException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"RuleOrRuleSetName\",\
          \"documentation\":\"<p>Indicates that the named receipt rule set does not exist.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the provided receipt rule set does not exist.</p>\",\
      \"error\":{\
        \"code\":\"RuleSetDoesNotExist\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"S3Action\":{\
      \"type\":\"structure\",\
      \"required\":[\"BucketName\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the Amazon SNS topic to notify when the message is saved to the Amazon S3 bucket. An example of an Amazon SNS topic ARN is <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more information about Amazon SNS topics, see the <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html\\\">Amazon SNS Developer Guide</a>.</p>\"\
        },\
        \"BucketName\":{\
          \"shape\":\"S3BucketName\",\
          \"documentation\":\"<p>The name of the Amazon S3 bucket that incoming email will be saved to.</p>\"\
        },\
        \"ObjectKeyPrefix\":{\
          \"shape\":\"S3KeyPrefix\",\
          \"documentation\":\"<p>The key prefix of the Amazon S3 bucket. The key prefix is similar to a directory name that enables you to store similar data under the same directory in a bucket.</p>\"\
        },\
        \"KmsKeyArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The customer master key that Amazon SES should use to encrypt your emails before saving them to the Amazon S3 bucket. You can use the default master key or a custom master key you created in AWS KMS as follows:</p> <ul> <li> <p>To use the default master key, provide an ARN in the form of <code>arn:aws:kms:REGION:ACCOUNT-ID-WITHOUT-HYPHENS:alias/aws/ses</code>. For example, if your AWS account ID is 123456789012 and you want to use the default master key in the US West (Oregon) region, the ARN of the default master key would be <code>arn:aws:kms:us-west-2:123456789012:alias/aws/ses</code>. If you use the default master key, you don't need to perform any extra steps to give Amazon SES permission to use the key.</p> </li> <li> <p>To use a custom master key you created in AWS KMS, provide the ARN of the master key and ensure that you add a statement to your key's policy to give Amazon SES permission to use it. For more information about giving permissions, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html\\\">Amazon SES Developer Guide</a>.</p> </li> </ul> <p>For more information about key policies, see the <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html\\\">AWS KMS Developer Guide</a>. If you do not specify a master key, Amazon SES will not encrypt your emails.</p> <important> <p>Your mail is encrypted by Amazon SES using the Amazon S3 encryption client before the mail is submitted to Amazon S3 for storage. It is not encrypted using Amazon S3 server-side encryption. This means that you must use the Amazon S3 encryption client to decrypt the email after retrieving it from Amazon S3, as the service has no access to use your AWS KMS keys for decryption. This encryption client is currently available with the <a href=\\\"http://aws.amazon.com/sdk-for-java/\\\">AWS SDK for Java</a> and <a href=\\\"http://aws.amazon.com/sdk-for-ruby/\\\">AWS SDK for Ruby</a> only. For more information about client-side encryption using AWS KMS master keys, see the <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html\\\">Amazon S3 Developer Guide</a>.</p> </important>\"\
        }\
      },\
      \"documentation\":\"<p>When included in a receipt rule, this action saves the received message to an Amazon Simple Storage Service (Amazon S3) bucket and, optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS).</p> <p>To enable Amazon SES to write emails to your Amazon S3 bucket, use an AWS KMS key to encrypt your emails, or publish to an Amazon SNS topic of another account, Amazon SES must have permission to access those resources. For information about giving permissions, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html\\\">Amazon SES Developer Guide</a>.</p> <note> <p>When you save your emails to an Amazon S3 bucket, the maximum email size (including headers) is 30 MB. Emails larger than that will bounce.</p> </note> <p>For information about specifying Amazon S3 actions in receipt rules, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-s3.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"S3BucketName\":{\"type\":\"string\"},\
    \"S3KeyPrefix\":{\"type\":\"string\"},\
    \"SNSAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"TopicArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic to notify. An example of an Amazon SNS topic ARN is <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more information about Amazon SNS topics, see the <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html\\\">Amazon SNS Developer Guide</a>.</p>\"\
        },\
        \"Encoding\":{\
          \"shape\":\"SNSActionEncoding\",\
          \"documentation\":\"<p>The encoding to use for the email within the Amazon SNS notification. UTF-8 is easier to use, but may not preserve all special characters when a message was encoded with a different encoding format. Base64 preserves all special characters. The default value is UTF-8.</p>\"\
        }\
      },\
      \"documentation\":\"<p>When included in a receipt rule, this action publishes a notification to Amazon Simple Notification Service (Amazon SNS). This action includes a complete copy of the email content in the Amazon SNS notifications. Amazon SNS notifications for all other actions simply provide information about the email. They do not include the email content itself.</p> <p>If you own the Amazon SNS topic, you don't need to do anything to give Amazon SES permission to publish emails to it. However, if you don't own the Amazon SNS topic, you need to attach a policy to the topic to give Amazon SES permissions to access it. For information about giving permissions, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html\\\">Amazon SES Developer Guide</a>.</p> <important> <p>You can only publish emails that are 150 KB or less (including the header) to Amazon SNS. Larger emails will bounce. If you anticipate emails larger than 150 KB, use the S3 action instead.</p> </important> <p>For information about using a receipt rule to publish an Amazon SNS notification, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-sns.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SNSActionEncoding\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UTF-8\",\
        \"Base64\"\
      ]\
    },\
    \"SNSDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\"TopicARN\"],\
      \"members\":{\
        \"TopicARN\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the Amazon SNS topic that email sending events will be published to. An example of an Amazon SNS topic ARN is <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more information about Amazon SNS topics, see the <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html\\\">Amazon SNS Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the topic ARN associated with an Amazon Simple Notification Service (Amazon SNS) event destination.</p> <p>Event destinations, such as Amazon SNS, are associated with configuration sets, which enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SendBounceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"OriginalMessageId\",\
        \"BounceSender\",\
        \"BouncedRecipientInfoList\"\
      ],\
      \"members\":{\
        \"OriginalMessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The message ID of the message to be bounced.</p>\"\
        },\
        \"BounceSender\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The address to use in the \\\"From\\\" header of the bounce message. This must be an identity that you have verified with Amazon SES.</p>\"\
        },\
        \"Explanation\":{\
          \"shape\":\"Explanation\",\
          \"documentation\":\"<p>Human-readable text for the bounce message to explain the failure. If not specified, the text will be auto-generated based on the bounced recipient information.</p>\"\
        },\
        \"MessageDsn\":{\
          \"shape\":\"MessageDsn\",\
          \"documentation\":\"<p>Message-related DSN fields. If not specified, Amazon SES will choose the values.</p>\"\
        },\
        \"BouncedRecipientInfoList\":{\
          \"shape\":\"BouncedRecipientInfoList\",\
          \"documentation\":\"<p>A list of recipients of the bounced message, including the information required to create the Delivery Status Notifications (DSNs) for the recipients. You must specify at least one <code>BouncedRecipientInfo</code> in the list.</p>\"\
        },\
        \"BounceSenderArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to use the address in the \\\"From\\\" header of the bounce. For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to send a bounce message to the sender of an email you received through Amazon SES.</p>\"\
    },\
    \"SendBounceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The message ID of the bounce message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a unique message ID.</p>\"\
    },\
    \"SendBulkTemplatedEmailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Source\",\
        \"Template\",\
        \"Destinations\"\
      ],\
      \"members\":{\
        \"Source\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address that is sending the email. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES. For information about verifying identities, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Amazon SES Developer Guide</a>.</p> <p>If you are sending on behalf of another user and have been permitted to do so by a sending authorization policy, then you must also specify the <code>SourceArn</code> parameter. For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p> <note> <p>Amazon SES does not support the SMTPUTF8 extension, as described in <a href=\\\"https://tools.ietf.org/html/rfc6531\\\">RFC6531</a>. For this reason, the <i>local part</i> of a source email address (the part of the email address that precedes the @ sign) may only contain <a href=\\\"https://en.wikipedia.org/wiki/Email_address#Local-part\\\">7-bit ASCII characters</a>. If the <i>domain part</i> of an address (the part after the @ sign) contains non-ASCII characters, they must be encoded using Punycode, as described in <a href=\\\"https://tools.ietf.org/html/rfc3492.html\\\">RFC3492</a>. The sender name (also known as the <i>friendly name</i>) may contain non-ASCII characters. These characters must be encoded using MIME encoded-word syntax, as described in <a href=\\\"https://tools.ietf.org/html/rfc2047\\\">RFC 2047</a>. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>.</p> </note>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to send for the email address specified in the <code>Source</code> parameter.</p> <p>For example, if the owner of <code>example.com</code> (which has ARN <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>) attaches a policy to it that authorizes you to send from <code>user@example.com</code>, then you would specify the <code>SourceArn</code> to be <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and the <code>Source</code> to be <code>user@example.com</code>.</p> <p>For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        },\
        \"ReplyToAddresses\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>The reply-to email address(es) for the message. If the recipient replies to the message, each reply-to address will receive the reply.</p>\"\
        },\
        \"ReturnPath\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address that bounces and complaints will be forwarded to when feedback forwarding is enabled. If the message cannot be delivered to the recipient, then an error message will be returned from the recipient's ISP; this message will then be forwarded to the email address specified by the <code>ReturnPath</code> parameter. The <code>ReturnPath</code> parameter is never overwritten. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES. </p>\"\
        },\
        \"ReturnPathArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to use the email address specified in the <code>ReturnPath</code> parameter.</p> <p>For example, if the owner of <code>example.com</code> (which has ARN <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>) attaches a policy to it that authorizes you to use <code>feedback@example.com</code>, then you would specify the <code>ReturnPathArn</code> to be <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and the <code>ReturnPath</code> to be <code>feedback@example.com</code>.</p> <p>For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        },\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set to use when you send an email using <code>SendBulkTemplatedEmail</code>.</p>\"\
        },\
        \"DefaultTags\":{\
          \"shape\":\"MessageTagList\",\
          \"documentation\":\"<p>A list of tags, in the form of name/value pairs, to apply to an email that you send to a destination using <code>SendBulkTemplatedEmail</code>.</p>\"\
        },\
        \"Template\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The template to use when sending this email.</p>\"\
        },\
        \"TemplateArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the template to use when sending this email.</p>\"\
        },\
        \"DefaultTemplateData\":{\
          \"shape\":\"TemplateData\",\
          \"documentation\":\"<p>A list of replacement values to apply to the template when replacement data is not specified in a Destination object. These values act as a default or fallback option when no other data is available.</p> <p>The template data is a JSON object, typically consisting of key-value pairs in which the keys correspond to replacement tags in the email template.</p>\"\
        },\
        \"Destinations\":{\
          \"shape\":\"BulkEmailDestinationList\",\
          \"documentation\":\"<p>One or more <code>Destination</code> objects. All of the recipients in a <code>Destination</code> will receive the same version of the email. You can specify up to 50 <code>Destination</code> objects within a <code>Destinations</code> array.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to send a templated email to multiple destinations using Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SendBulkTemplatedEmailResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Status\"],\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"BulkEmailDestinationStatusList\",\
          \"documentation\":\"<p>The unique message identifier returned from the <code>SendBulkTemplatedEmail</code> action.</p>\"\
        }\
      }\
    },\
    \"SendCustomVerificationEmailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EmailAddress\",\
        \"TemplateName\"\
      ],\
      \"members\":{\
        \"EmailAddress\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address to verify.</p>\"\
        },\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the custom verification email template to use when sending the verification email.</p>\"\
        },\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Name of a configuration set to use when sending the verification email.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to send a custom verification email to a specified recipient.</p>\"\
    },\
    \"SendCustomVerificationEmailResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The unique message identifier returned from the <code>SendCustomVerificationEmail</code> operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response received when attempting to send the custom verification email.</p>\"\
    },\
    \"SendDataPoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time of the data point.</p>\"\
        },\
        \"DeliveryAttempts\":{\
          \"shape\":\"Counter\",\
          \"documentation\":\"<p>Number of emails that have been sent.</p>\"\
        },\
        \"Bounces\":{\
          \"shape\":\"Counter\",\
          \"documentation\":\"<p>Number of emails that have bounced.</p>\"\
        },\
        \"Complaints\":{\
          \"shape\":\"Counter\",\
          \"documentation\":\"<p>Number of unwanted emails that were rejected by recipients.</p>\"\
        },\
        \"Rejects\":{\
          \"shape\":\"Counter\",\
          \"documentation\":\"<p>Number of emails rejected by Amazon SES.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents sending statistics data. Each <code>SendDataPoint</code> contains statistics for a 15-minute period of sending activity. </p>\"\
    },\
    \"SendDataPointList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SendDataPoint\"}\
    },\
    \"SendEmailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Source\",\
        \"Destination\",\
        \"Message\"\
      ],\
      \"members\":{\
        \"Source\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address that is sending the email. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES. For information about verifying identities, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Amazon SES Developer Guide</a>.</p> <p>If you are sending on behalf of another user and have been permitted to do so by a sending authorization policy, then you must also specify the <code>SourceArn</code> parameter. For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p> <note> <p>Amazon SES does not support the SMTPUTF8 extension, as described in <a href=\\\"https://tools.ietf.org/html/rfc6531\\\">RFC6531</a>. For this reason, the <i>local part</i> of a source email address (the part of the email address that precedes the @ sign) may only contain <a href=\\\"https://en.wikipedia.org/wiki/Email_address#Local-part\\\">7-bit ASCII characters</a>. If the <i>domain part</i> of an address (the part after the @ sign) contains non-ASCII characters, they must be encoded using Punycode, as described in <a href=\\\"https://tools.ietf.org/html/rfc3492.html\\\">RFC3492</a>. The sender name (also known as the <i>friendly name</i>) may contain non-ASCII characters. These characters must be encoded using MIME encoded-word syntax, as described in <a href=\\\"https://tools.ietf.org/html/rfc2047\\\">RFC 2047</a>. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>.</p> </note>\"\
        },\
        \"Destination\":{\
          \"shape\":\"Destination\",\
          \"documentation\":\"<p>The destination for this email, composed of To:, CC:, and BCC: fields.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message to be sent.</p>\"\
        },\
        \"ReplyToAddresses\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>The reply-to email address(es) for the message. If the recipient replies to the message, each reply-to address will receive the reply.</p>\"\
        },\
        \"ReturnPath\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address that bounces and complaints will be forwarded to when feedback forwarding is enabled. If the message cannot be delivered to the recipient, then an error message will be returned from the recipient's ISP; this message will then be forwarded to the email address specified by the <code>ReturnPath</code> parameter. The <code>ReturnPath</code> parameter is never overwritten. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES. </p>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to send for the email address specified in the <code>Source</code> parameter.</p> <p>For example, if the owner of <code>example.com</code> (which has ARN <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>) attaches a policy to it that authorizes you to send from <code>user@example.com</code>, then you would specify the <code>SourceArn</code> to be <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and the <code>Source</code> to be <code>user@example.com</code>.</p> <p>For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        },\
        \"ReturnPathArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to use the email address specified in the <code>ReturnPath</code> parameter.</p> <p>For example, if the owner of <code>example.com</code> (which has ARN <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>) attaches a policy to it that authorizes you to use <code>feedback@example.com</code>, then you would specify the <code>ReturnPathArn</code> to be <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and the <code>ReturnPath</code> to be <code>feedback@example.com</code>.</p> <p>For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"MessageTagList\",\
          \"documentation\":\"<p>A list of tags, in the form of name/value pairs, to apply to an email that you send using <code>SendEmail</code>. Tags correspond to characteristics of the email that you define, so that you can publish email sending events.</p>\"\
        },\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set to use when you send an email using <code>SendEmail</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to send a single formatted email using Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-formatted.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SendEmailResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"MessageId\"],\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The unique message identifier returned from the <code>SendEmail</code> action. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a unique message ID.</p>\"\
    },\
    \"SendRawEmailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"RawMessage\"],\
      \"members\":{\
        \"Source\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The identity's email address. If you do not provide a value for this parameter, you must specify a \\\"From\\\" address in the raw text of the message. (You can also specify both.)</p> <note> <p>Amazon SES does not support the SMTPUTF8 extension, as described in<a href=\\\"https://tools.ietf.org/html/rfc6531\\\">RFC6531</a>. For this reason, the <i>local part</i> of a source email address (the part of the email address that precedes the @ sign) may only contain <a href=\\\"https://en.wikipedia.org/wiki/Email_address#Local-part\\\">7-bit ASCII characters</a>. If the <i>domain part</i> of an address (the part after the @ sign) contains non-ASCII characters, they must be encoded using Punycode, as described in <a href=\\\"https://tools.ietf.org/html/rfc3492.html\\\">RFC3492</a>. The sender name (also known as the <i>friendly name</i>) may contain non-ASCII characters. These characters must be encoded using MIME encoded-word syntax, as described in <a href=\\\"https://tools.ietf.org/html/rfc2047\\\">RFC 2047</a>. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>.</p> </note> <p>If you specify the <code>Source</code> parameter and have feedback forwarding enabled, then bounces and complaints will be sent to this email address. This takes precedence over any Return-Path header that you might include in the raw text of the message.</p>\"\
        },\
        \"Destinations\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>A list of destinations for the message, consisting of To:, CC:, and BCC: addresses.</p>\"\
        },\
        \"RawMessage\":{\
          \"shape\":\"RawMessage\",\
          \"documentation\":\"<p>The raw email message itself. The message has to meet the following criteria:</p> <ul> <li> <p>The message has to contain a header and a body, separated by a blank line.</p> </li> <li> <p>All of the required header fields must be present in the message.</p> </li> <li> <p>Each part of a multipart MIME message must be formatted properly.</p> </li> <li> <p>Attachments must be of a content type that Amazon SES supports. For a list on unsupported content types, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mime-types.html\\\">Unsupported Attachment Types</a> in the <i>Amazon SES Developer Guide</i>.</p> </li> <li> <p>The entire message must be base64-encoded.</p> </li> <li> <p>If any of the MIME parts in your message contain content that is outside of the 7-bit ASCII character range, we highly recommend that you encode that content. For more information, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html\\\">Sending Raw Email</a> in the <i>Amazon SES Developer Guide</i>.</p> </li> <li> <p>Per <a href=\\\"https://tools.ietf.org/html/rfc5321#section-4.5.3.1.6\\\">RFC 5321</a>, the maximum length of each line of text, including the &lt;CRLF&gt;, must not exceed 1,000 characters.</p> </li> </ul>\"\
        },\
        \"FromArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to specify a particular \\\"From\\\" address in the header of the raw email.</p> <p>Instead of using this parameter, you can use the X-header <code>X-SES-FROM-ARN</code> in the raw message of the email. If you use both the <code>FromArn</code> parameter and the corresponding X-header, Amazon SES uses the value of the <code>FromArn</code> parameter.</p> <note> <p>For information about when to use this parameter, see the description of <code>SendRawEmail</code> in this guide, or see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-delegate-sender-tasks-email.html\\\">Amazon SES Developer Guide</a>.</p> </note>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to send for the email address specified in the <code>Source</code> parameter.</p> <p>For example, if the owner of <code>example.com</code> (which has ARN <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>) attaches a policy to it that authorizes you to send from <code>user@example.com</code>, then you would specify the <code>SourceArn</code> to be <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and the <code>Source</code> to be <code>user@example.com</code>.</p> <p>Instead of using this parameter, you can use the X-header <code>X-SES-SOURCE-ARN</code> in the raw message of the email. If you use both the <code>SourceArn</code> parameter and the corresponding X-header, Amazon SES uses the value of the <code>SourceArn</code> parameter.</p> <note> <p>For information about when to use this parameter, see the description of <code>SendRawEmail</code> in this guide, or see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-delegate-sender-tasks-email.html\\\">Amazon SES Developer Guide</a>.</p> </note>\"\
        },\
        \"ReturnPathArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to use the email address specified in the <code>ReturnPath</code> parameter.</p> <p>For example, if the owner of <code>example.com</code> (which has ARN <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>) attaches a policy to it that authorizes you to use <code>feedback@example.com</code>, then you would specify the <code>ReturnPathArn</code> to be <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and the <code>ReturnPath</code> to be <code>feedback@example.com</code>.</p> <p>Instead of using this parameter, you can use the X-header <code>X-SES-RETURN-PATH-ARN</code> in the raw message of the email. If you use both the <code>ReturnPathArn</code> parameter and the corresponding X-header, Amazon SES uses the value of the <code>ReturnPathArn</code> parameter.</p> <note> <p>For information about when to use this parameter, see the description of <code>SendRawEmail</code> in this guide, or see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization-delegate-sender-tasks-email.html\\\">Amazon SES Developer Guide</a>.</p> </note>\"\
        },\
        \"Tags\":{\
          \"shape\":\"MessageTagList\",\
          \"documentation\":\"<p>A list of tags, in the form of name/value pairs, to apply to an email that you send using <code>SendRawEmail</code>. Tags correspond to characteristics of the email that you define, so that you can publish email sending events.</p>\"\
        },\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set to use when you send an email using <code>SendRawEmail</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to send a single raw email using Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-raw.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SendRawEmailResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"MessageId\"],\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The unique message identifier returned from the <code>SendRawEmail</code> action. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a unique message ID.</p>\"\
    },\
    \"SendTemplatedEmailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Source\",\
        \"Destination\",\
        \"Template\",\
        \"TemplateData\"\
      ],\
      \"members\":{\
        \"Source\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address that is sending the email. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES. For information about verifying identities, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html\\\">Amazon SES Developer Guide</a>.</p> <p>If you are sending on behalf of another user and have been permitted to do so by a sending authorization policy, then you must also specify the <code>SourceArn</code> parameter. For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p> <note> <p>Amazon SES does not support the SMTPUTF8 extension, as described in <a href=\\\"https://tools.ietf.org/html/rfc6531\\\">RFC6531</a>. For this reason, the <i>local part</i> of a source email address (the part of the email address that precedes the @ sign) may only contain <a href=\\\"https://en.wikipedia.org/wiki/Email_address#Local-part\\\">7-bit ASCII characters</a>. If the <i>domain part</i> of an address (the part after the @ sign) contains non-ASCII characters, they must be encoded using Punycode, as described in <a href=\\\"https://tools.ietf.org/html/rfc3492.html\\\">RFC3492</a>. The sender name (also known as the <i>friendly name</i>) may contain non-ASCII characters. These characters must be encoded using MIME encoded-word syntax, as described in<a href=\\\"https://tools.ietf.org/html/rfc2047\\\">RFC 2047</a>. MIME encoded-word syntax uses the following form: <code>=?charset?encoding?encoded-text?=</code>.</p> </note>\"\
        },\
        \"Destination\":{\
          \"shape\":\"Destination\",\
          \"documentation\":\"<p>The destination for this email, composed of To:, CC:, and BCC: fields. A Destination can include up to 50 recipients across these three fields.</p>\"\
        },\
        \"ReplyToAddresses\":{\
          \"shape\":\"AddressList\",\
          \"documentation\":\"<p>The reply-to email address(es) for the message. If the recipient replies to the message, each reply-to address will receive the reply.</p>\"\
        },\
        \"ReturnPath\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address that bounces and complaints will be forwarded to when feedback forwarding is enabled. If the message cannot be delivered to the recipient, then an error message will be returned from the recipient's ISP; this message will then be forwarded to the email address specified by the <code>ReturnPath</code> parameter. The <code>ReturnPath</code> parameter is never overwritten. This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES. </p>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to send for the email address specified in the <code>Source</code> parameter.</p> <p>For example, if the owner of <code>example.com</code> (which has ARN <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>) attaches a policy to it that authorizes you to send from <code>user@example.com</code>, then you would specify the <code>SourceArn</code> to be <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and the <code>Source</code> to be <code>user@example.com</code>.</p> <p>For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        },\
        \"ReturnPathArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>This parameter is used only for sending authorization. It is the ARN of the identity that is associated with the sending authorization policy that permits you to use the email address specified in the <code>ReturnPath</code> parameter.</p> <p>For example, if the owner of <code>example.com</code> (which has ARN <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>) attaches a policy to it that authorizes you to use <code>feedback@example.com</code>, then you would specify the <code>ReturnPathArn</code> to be <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>, and the <code>ReturnPath</code> to be <code>feedback@example.com</code>.</p> <p>For more information about sending authorization, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"MessageTagList\",\
          \"documentation\":\"<p>A list of tags, in the form of name/value pairs, to apply to an email that you send using <code>SendTemplatedEmail</code>. Tags correspond to characteristics of the email that you define, so that you can publish email sending events.</p>\"\
        },\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set to use when you send an email using <code>SendTemplatedEmail</code>.</p>\"\
        },\
        \"Template\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The template to use when sending this email.</p>\"\
        },\
        \"TemplateArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the template to use when sending this email.</p>\"\
        },\
        \"TemplateData\":{\
          \"shape\":\"TemplateData\",\
          \"documentation\":\"<p>A list of replacement values to apply to the template. This parameter is a JSON object, typically consisting of key-value pairs in which the keys correspond to replacement tags in the email template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to send a templated email using Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SendTemplatedEmailResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"MessageId\"],\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"MessageId\",\
          \"documentation\":\"<p>The unique message identifier returned from the <code>SendTemplatedEmail</code> action. </p>\"\
        }\
      }\
    },\
    \"SentLast24Hours\":{\"type\":\"double\"},\
    \"SetActiveReceiptRuleSetRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the receipt rule set to make active. Setting this value to null disables all email receiving.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to set a receipt rule set as the active receipt rule set. You use receipt rule sets to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetActiveReceiptRuleSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"SetIdentityDkimEnabledRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Identity\",\
        \"DkimEnabled\"\
      ],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity for which DKIM signing should be enabled or disabled.</p>\"\
        },\
        \"DkimEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Sets whether DKIM signing is enabled for an identity. Set to <code>true</code> to enable DKIM signing for this identity; <code>false</code> to disable it. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to enable or disable Amazon SES Easy DKIM signing for an identity. For more information about setting up Easy DKIM, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetIdentityDkimEnabledResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"SetIdentityFeedbackForwardingEnabledRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Identity\",\
        \"ForwardingEnabled\"\
      ],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity for which to set bounce and complaint notification forwarding. Examples: <code>user@example.com</code>, <code>example.com</code>.</p>\"\
        },\
        \"ForwardingEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Sets whether Amazon SES will forward bounce and complaint notifications as email. <code>true</code> specifies that Amazon SES will forward bounce and complaint notifications as email, in addition to any Amazon SNS topic publishing otherwise specified. <code>false</code> specifies that Amazon SES will publish bounce and complaint notifications only through Amazon SNS. This value can only be set to <code>false</code> when Amazon SNS topics are set for both <code>Bounce</code> and <code>Complaint</code> notification types.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to enable or disable whether Amazon SES forwards you bounce and complaint notifications through email. For information about email feedback forwarding, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications-via-email.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetIdentityFeedbackForwardingEnabledResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"SetIdentityHeadersInNotificationsEnabledRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Identity\",\
        \"NotificationType\",\
        \"Enabled\"\
      ],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity for which to enable or disable headers in notifications. Examples: <code>user@example.com</code>, <code>example.com</code>.</p>\"\
        },\
        \"NotificationType\":{\
          \"shape\":\"NotificationType\",\
          \"documentation\":\"<p>The notification type for which to enable or disable headers in notifications. </p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Sets whether Amazon SES includes the original email headers in Amazon SNS notifications of the specified notification type. A value of <code>true</code> specifies that Amazon SES will include headers in notifications, and a value of <code>false</code> specifies that Amazon SES will not include headers in notifications.</p> <p>This value can only be set when <code>NotificationType</code> is already set to use a particular Amazon SNS topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to set whether Amazon SES includes the original email headers in the Amazon SNS notifications of a specified type. For information about notifications, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications-via-sns.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetIdentityHeadersInNotificationsEnabledResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"SetIdentityMailFromDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Identity\"],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The verified identity for which you want to enable or disable the specified custom MAIL FROM domain.</p>\"\
        },\
        \"MailFromDomain\":{\
          \"shape\":\"MailFromDomainName\",\
          \"documentation\":\"<p>The custom MAIL FROM domain that you want the verified identity to use. The MAIL FROM domain must 1) be a subdomain of the verified identity, 2) not be used in a \\\"From\\\" address if the MAIL FROM domain is the destination of email feedback forwarding (for more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from.html\\\">Amazon SES Developer Guide</a>), and 3) not be used to receive emails. A value of <code>null</code> disables the custom MAIL FROM setting for the identity.</p>\"\
        },\
        \"BehaviorOnMXFailure\":{\
          \"shape\":\"BehaviorOnMXFailure\",\
          \"documentation\":\"<p>The action that you want Amazon SES to take if it cannot successfully read the required MX record when you send an email. If you choose <code>UseDefaultValue</code>, Amazon SES will use amazonses.com (or a subdomain of that) as the MAIL FROM domain. If you choose <code>RejectMessage</code>, Amazon SES will return a <code>MailFromDomainNotVerified</code> error and not send the email.</p> <p>The action specified in <code>BehaviorOnMXFailure</code> is taken when the custom MAIL FROM domain setup is in the <code>Pending</code>, <code>Failed</code>, and <code>TemporaryFailure</code> states.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to enable or disable the Amazon SES custom MAIL FROM domain setup for a verified identity. For information about using a custom MAIL FROM domain, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetIdentityMailFromDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"SetIdentityNotificationTopicRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Identity\",\
        \"NotificationType\"\
      ],\
      \"members\":{\
        \"Identity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity (email address or domain) that you want to set the Amazon SNS topic for.</p> <important> <p>You can only specify a verified identity for this parameter.</p> </important> <p>You can specify an identity by using its name or by using its Amazon Resource Name (ARN). The following examples are all valid identities: <code>sender@example.com</code>, <code>example.com</code>, <code>arn:aws:ses:us-east-1:123456789012:identity/example.com</code>.</p>\"\
        },\
        \"NotificationType\":{\
          \"shape\":\"NotificationType\",\
          \"documentation\":\"<p>The type of notifications that will be published to the specified Amazon SNS topic.</p>\"\
        },\
        \"SnsTopic\":{\
          \"shape\":\"NotificationTopic\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic. If the parameter is omitted from the request or a null value is passed, <code>SnsTopic</code> is cleared and publishing is disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to specify the Amazon SNS topic to which Amazon SES will publish bounce, complaint, or delivery notifications for emails sent with that identity as the Source. For information about Amazon SES notifications, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/notifications-via-sns.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetIdentityNotificationTopicResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"SetReceiptRulePositionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleSetName\",\
        \"RuleName\"\
      ],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the receipt rule set that contains the receipt rule to reposition.</p>\"\
        },\
        \"RuleName\":{\
          \"shape\":\"ReceiptRuleName\",\
          \"documentation\":\"<p>The name of the receipt rule to reposition.</p>\"\
        },\
        \"After\":{\
          \"shape\":\"ReceiptRuleName\",\
          \"documentation\":\"<p>The name of the receipt rule after which to place the specified receipt rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to set the position of a receipt rule in a receipt rule set. You use receipt rule sets to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"SetReceiptRulePositionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"StopAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"Scope\"],\
      \"members\":{\
        \"Scope\":{\
          \"shape\":\"StopScope\",\
          \"documentation\":\"<p>The scope of the StopAction. The only acceptable value is <code>RuleSet</code>.</p>\"\
        },\
        \"TopicArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the stop action is taken. An example of an Amazon SNS topic ARN is <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more information about Amazon SNS topics, see the <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html\\\">Amazon SNS Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>When included in a receipt rule, this action terminates the evaluation of the receipt rule set and, optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS).</p> <p>For information about setting a stop action in a receipt rule, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-stop.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"StopScope\":{\
      \"type\":\"string\",\
      \"enum\":[\"RuleSet\"]\
    },\
    \"Subject\":{\"type\":\"string\"},\
    \"SubjectPart\":{\"type\":\"string\"},\
    \"SuccessRedirectionURL\":{\"type\":\"string\"},\
    \"Template\":{\
      \"type\":\"structure\",\
      \"required\":[\"TemplateName\"],\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the template. You will refer to this name when you send email using the <code>SendTemplatedEmail</code> or <code>SendBulkTemplatedEmail</code> operations.</p>\"\
        },\
        \"SubjectPart\":{\
          \"shape\":\"SubjectPart\",\
          \"documentation\":\"<p>The subject line of the email.</p>\"\
        },\
        \"TextPart\":{\
          \"shape\":\"TextPart\",\
          \"documentation\":\"<p>The email body that will be visible to recipients whose email clients do not display HTML.</p>\"\
        },\
        \"HtmlPart\":{\
          \"shape\":\"HtmlPart\",\
          \"documentation\":\"<p>The HTML body of the email.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The content of the email, composed of a subject line, an HTML part, and a text-only part.</p>\"\
    },\
    \"TemplateContent\":{\"type\":\"string\"},\
    \"TemplateData\":{\
      \"type\":\"string\",\
      \"max\":262144\
    },\
    \"TemplateDoesNotExistException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateName\":{\"shape\":\"TemplateName\"}\
      },\
      \"documentation\":\"<p>Indicates that the Template object you specified does not exist in your Amazon SES account.</p>\",\
      \"error\":{\
        \"code\":\"TemplateDoesNotExist\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TemplateMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the template.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time and date the template was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about an email template.</p>\"\
    },\
    \"TemplateMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TemplateMetadata\"}\
    },\
    \"TemplateName\":{\"type\":\"string\"},\
    \"TestRenderTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TemplateName\",\
        \"TemplateData\"\
      ],\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the template that you want to render.</p>\"\
        },\
        \"TemplateData\":{\
          \"shape\":\"TemplateData\",\
          \"documentation\":\"<p>A list of replacement values to apply to the template. This parameter is a JSON object, typically consisting of key-value pairs in which the keys correspond to replacement tags in the email template.</p>\"\
        }\
      }\
    },\
    \"TestRenderTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RenderedTemplate\":{\
          \"shape\":\"RenderedTemplate\",\
          \"documentation\":\"<p>The complete MIME message rendered by applying the data in the TemplateData parameter to the template specified in the TemplateName parameter.</p>\"\
        }\
      }\
    },\
    \"TextPart\":{\"type\":\"string\"},\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TlsPolicy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Require\",\
        \"Optional\"\
      ]\
    },\
    \"TrackingOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomRedirectDomain\":{\
          \"shape\":\"CustomRedirectDomain\",\
          \"documentation\":\"<p>The custom subdomain that will be used to redirect email recipients to the Amazon SES event tracking domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A domain that is used to redirect email recipients to an Amazon SES-operated domain. This domain captures open and click events generated by Amazon SES emails.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/configure-custom-open-click-domains.html\\\">Configuring Custom Domains to Handle Open and Click Tracking</a> in the <i>Amazon SES Developer Guide</i>.</p>\"\
    },\
    \"TrackingOptionsAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Indicates that a TrackingOptions object already exists in the specified configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the configuration set you specified already contains a TrackingOptions object.</p>\",\
      \"error\":{\
        \"code\":\"TrackingOptionsAlreadyExistsException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"TrackingOptionsDoesNotExistException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>Indicates that a TrackingOptions object does not exist in the specified configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that the TrackingOptions object you specified does not exist.</p>\",\
      \"error\":{\
        \"code\":\"TrackingOptionsDoesNotExistException\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"UpdateAccountSendingEnabledRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether email sending is enabled or disabled for your Amazon SES account in the current AWS Region.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to enable or disable the email sending capabilities for your entire Amazon SES account.</p>\"\
    },\
    \"UpdateConfigurationSetEventDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"EventDestination\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that contains the event destination that you want to update.</p>\"\
        },\
        \"EventDestination\":{\
          \"shape\":\"EventDestination\",\
          \"documentation\":\"<p>The event destination object that you want to apply to the specified configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to update the event destination of a configuration set. Configuration sets enable you to publish email sending events. For information about using configuration sets, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"UpdateConfigurationSetEventDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"UpdateConfigurationSetReputationMetricsEnabledRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"Enabled\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to update.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether or not Amazon SES will publish reputation metrics for the configuration set, such as bounce and complaint rates, to Amazon CloudWatch.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to modify the reputation metric publishing settings for a configuration set.</p>\"\
    },\
    \"UpdateConfigurationSetSendingEnabledRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"Enabled\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to update.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Describes whether email sending is enabled or disabled for the configuration set. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to enable or disable the email sending capabilities for a specific configuration set.</p>\"\
    },\
    \"UpdateConfigurationSetTrackingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"TrackingOptions\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set for which you want to update the custom tracking domain.</p>\"\
        },\
        \"TrackingOptions\":{\"shape\":\"TrackingOptions\"}\
      },\
      \"documentation\":\"<p>Represents a request to update the tracking options for a configuration set. </p>\"\
    },\
    \"UpdateConfigurationSetTrackingOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"UpdateCustomVerificationEmailTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TemplateName\"],\
      \"members\":{\
        \"TemplateName\":{\
          \"shape\":\"TemplateName\",\
          \"documentation\":\"<p>The name of the custom verification email template that you want to update.</p>\"\
        },\
        \"FromEmailAddress\":{\
          \"shape\":\"FromAddress\",\
          \"documentation\":\"<p>The email address that the custom verification email is sent from.</p>\"\
        },\
        \"TemplateSubject\":{\
          \"shape\":\"Subject\",\
          \"documentation\":\"<p>The subject line of the custom verification email.</p>\"\
        },\
        \"TemplateContent\":{\
          \"shape\":\"TemplateContent\",\
          \"documentation\":\"<p>The content of the custom verification email. The total size of the email must be less than 10 MB. The message body may contain HTML, with some limitations. For more information, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/custom-verification-emails.html#custom-verification-emails-faq\\\">Custom Verification Email Frequently Asked Questions</a> in the <i>Amazon SES Developer Guide</i>.</p>\"\
        },\
        \"SuccessRedirectionURL\":{\
          \"shape\":\"SuccessRedirectionURL\",\
          \"documentation\":\"<p>The URL that the recipient of the verification email is sent to if his or her address is successfully verified.</p>\"\
        },\
        \"FailureRedirectionURL\":{\
          \"shape\":\"FailureRedirectionURL\",\
          \"documentation\":\"<p>The URL that the recipient of the verification email is sent to if his or her address is not successfully verified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to update an existing custom verification email template.</p>\"\
    },\
    \"UpdateReceiptRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleSetName\",\
        \"Rule\"\
      ],\
      \"members\":{\
        \"RuleSetName\":{\
          \"shape\":\"ReceiptRuleSetName\",\
          \"documentation\":\"<p>The name of the receipt rule set that the receipt rule belongs to.</p>\"\
        },\
        \"Rule\":{\
          \"shape\":\"ReceiptRule\",\
          \"documentation\":\"<p>A data structure that contains the updated receipt rule information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to update a receipt rule. You use receipt rules to receive email with Amazon SES. For more information, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-concepts.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"UpdateReceiptRuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"UpdateTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Template\"],\
      \"members\":{\
        \"Template\":{\"shape\":\"Template\"}\
      }\
    },\
    \"UpdateTemplateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"VerificationAttributes\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Identity\"},\
      \"value\":{\"shape\":\"IdentityVerificationAttributes\"}\
    },\
    \"VerificationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"Success\",\
        \"Failed\",\
        \"TemporaryFailure\",\
        \"NotStarted\"\
      ]\
    },\
    \"VerificationToken\":{\"type\":\"string\"},\
    \"VerificationTokenList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VerificationToken\"}\
    },\
    \"VerifyDomainDkimRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Domain\"],\
      \"members\":{\
        \"Domain\":{\
          \"shape\":\"Domain\",\
          \"documentation\":\"<p>The name of the domain to be verified for Easy DKIM signing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to generate the CNAME records needed to set up Easy DKIM with Amazon SES. For more information about setting up Easy DKIM, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"VerifyDomainDkimResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DkimTokens\"],\
      \"members\":{\
        \"DkimTokens\":{\
          \"shape\":\"VerificationTokenList\",\
          \"documentation\":\"<p>A set of character strings that represent the domain's identity. If the identity is an email address, the tokens represent the domain of that address.</p> <p>Using these tokens, you need to create DNS CNAME records that point to DKIM public keys that are hosted by Amazon SES. Amazon Web Services eventually detects that you've updated your DNS records. This detection process might take up to 72 hours. After successful detection, Amazon SES is able to DKIM-sign email originating from that domain. (This only applies to domain identities, not email address identities.)</p> <p>For more information about creating DNS records using DKIM tokens, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Amazon SES Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returns CNAME records that you must publish to the DNS server of your domain to set up Easy DKIM with Amazon SES.</p>\"\
    },\
    \"VerifyDomainIdentityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Domain\"],\
      \"members\":{\
        \"Domain\":{\
          \"shape\":\"Domain\",\
          \"documentation\":\"<p>The domain to be verified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to begin Amazon SES domain verification and to generate the TXT records that you must publish to the DNS server of your domain to complete the verification. For information about domain verification, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-domains.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"VerifyDomainIdentityResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"VerificationToken\"],\
      \"members\":{\
        \"VerificationToken\":{\
          \"shape\":\"VerificationToken\",\
          \"documentation\":\"<p>A TXT record that you must place in the DNS settings of the domain to complete domain verification with Amazon SES.</p> <p>As Amazon SES searches for the TXT record, the domain's verification status is \\\"Pending\\\". When Amazon SES detects the record, the domain's verification status changes to \\\"Success\\\". If Amazon SES is unable to detect the record within 72 hours, the domain's verification status changes to \\\"Failed.\\\" In that case, if you still want to verify the domain, you must restart the verification process from the beginning.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returns a TXT record that you must publish to the DNS server of your domain to complete domain verification with Amazon SES.</p>\"\
    },\
    \"VerifyEmailAddressRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailAddress\"],\
      \"members\":{\
        \"EmailAddress\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address to be verified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to begin email address verification with Amazon SES. For information about email address verification, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-email-addresses.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"VerifyEmailIdentityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailAddress\"],\
      \"members\":{\
        \"EmailAddress\":{\
          \"shape\":\"Address\",\
          \"documentation\":\"<p>The email address to be verified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a request to begin email address verification with Amazon SES. For information about email address verification, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-email-addresses.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    },\
    \"VerifyEmailIdentityResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An empty element returned on a successful request.</p>\"\
    },\
    \"WorkmailAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"OrganizationArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the WorkMail action is called. An example of an Amazon SNS topic ARN is <code>arn:aws:sns:us-west-2:123456789012:MyTopic</code>. For more information about Amazon SNS topics, see the <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html\\\">Amazon SNS Developer Guide</a>.</p>\"\
        },\
        \"OrganizationArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the Amazon WorkMail organization. An example of an Amazon WorkMail organization ARN is <code>arn:aws:workmail:us-west-2:123456789012:organization/m-68755160c4cb4e29a2b2f8fb58f359d7</code>. For information about Amazon WorkMail organizations, see the <a href=\\\"https://docs.aws.amazon.com/workmail/latest/adminguide/organizations_overview.html\\\">Amazon WorkMail Administrator Guide</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>When included in a receipt rule, this action calls Amazon WorkMail and, optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS). You will typically not use this action directly because Amazon WorkMail adds the rule automatically during its setup procedure.</p> <p>For information using a receipt rule to call Amazon WorkMail, see the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-action-workmail.html\\\">Amazon SES Developer Guide</a>.</p>\"\
    }\
  },\
  \"documentation\":\"<fullname>Amazon Simple Email Service</fullname> <p> This document contains reference information for the <a href=\\\"https://aws.amazon.com/ses/\\\">Amazon Simple Email Service</a> (Amazon SES) API, version 2010-12-01. This document is best used in conjunction with the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html\\\">Amazon SES Developer Guide</a>. </p> <note> <p> For a list of Amazon SES endpoints to use in service requests, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html\\\">Regions and Amazon SES</a> in the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/Welcome.html\\\">Amazon SES Developer Guide</a>.</p> </note>\"\
}\
";
}

@end
