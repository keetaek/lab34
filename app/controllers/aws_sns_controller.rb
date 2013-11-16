class AwsSnsController < ApplicationController
  def video_complete
    
    #request.body.class = StringIO (stream)
    body = JSON.parse request.body.read
    message_type = env["HTTP_X_AMZ_SNS_MESSAGE_TYPE"]
    if message_type == "SubscriptionConfirmation"
      sns = AWS::SNS.new
      client = sns.client #=> returns an AWS::SNS::Client
      token = body["Token"]
      topic_arn = body["TopicArn"]
      client.confirm_subscription({:token => token, :topic_arn =>  topic_arn})
      logger.info "Type Subscription \n body is #{body}"
    elsif message_type == "Notification"
      subject = body["Subject"]
      message = body["Message"]
      logger.info "Type Notification \n body is #{body}"
    else
      # TODO - Shouldn't happen..
    end
    head :no_content
  end
end
