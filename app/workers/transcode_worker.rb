class TranscodeWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  WEB_MP4_PRESET_ID = '1351620000000-100070'
  PIPELINE_ID = AWS_CONFIG[Rails.env]["odtion_video_transcode"]["pipeline"]
  VIDEO_INPUT_BUCKET = AWS_CONFIG[Rails.env]["odtion_video_transcode"]["input_bucket"]
  VIDEO_OUTPUT_BUCKET = AWS_CONFIG[Rails.env]["odtion_video_transcode"]["output_bucket"]
  VIDEO_OUTPUT_PREFIX = AWS_CONFIG[Rails.env]["odtion_video_transcode"]["output_prefix"]

  def perform(filename)
    basename  = File.basename(filename,".*")
    transcoder = AWS::ElasticTranscoder::Client.new
    transcoder.create_job(
      pipeline_id: PIPELINE_ID,
      output_key_prefix: VIDEO_OUTPUT_PREFIX,
      input: {
        key: filename,
        frame_rate: 'auto',
        resolution: 'auto',
        aspect_ratio: 'auto',
        interlaced: 'auto',
        container: 'auto'
      },
      output: {
        key: filename,
        preset_id: WEB_MP4_PRESET_ID,
        thumbnail_pattern: "#{basename}-{count}",
        rotate: 'auto'
      }
    )
  end
end