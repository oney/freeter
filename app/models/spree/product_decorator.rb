Spree::Product.class_eval do
  validates :work_time, numericality: true
  validates_each :video_url do |record, attr, value|
    if value.present?
      begin
        video = VideoInfo.new(value)
        record.errors.add(attr, 'Your video url is not YouTube') if video.provider != 'YouTube'
      rescue
        record.errors.add(attr, 'Your video url has problem')
      end
    end
  end
end