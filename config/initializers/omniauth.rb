Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['634606990432873'], ENV['b29ce51c4d830bae726e1c9cd68b1b21']
  end

