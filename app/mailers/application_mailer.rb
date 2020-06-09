class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGur" <mail@testguru.com>}
  layout 'mailer'
end
