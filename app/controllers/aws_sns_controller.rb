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
      process_video_complete_message body["Message"]

    else
      # TODO - Shouldn't happen..
    end
    head :no_content
  end

  def test
    filename = "VID_20131015_214809.mp4"
    TranscodeWorker.perform_async(filename)
    head :ok
  end

  private 
  def process_video_complete_message(sns_message)
    message = JSON.parse sns_message if !sns_message.nil?
    status = message["state"]
    if status == "COMPLETED"
      output_prefix = message["outputKeyPrefix"]
      output_key = message["outputs"]["key"]
      pipeline_id = message["pipelineId"]
    elsif status == "ERROR"
      error_message = message["messageDetails"]
      pipeline_id = message["pipelineId"]
    end
    logger.info "Type Notification \n body is #{sns_message}"
  end
end
