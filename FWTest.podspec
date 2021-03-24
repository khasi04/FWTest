Pod::Spec.new do |s|
    s.name              = 'FWTest'
    s.version           = '1.0.0'
    s.summary           = 'Framework test'
    s.homepage          = 'http://example.com'

    s.author            = { 'Name' => 'khasi04@gmail.com' }
    s.license           = { :type => 'Custom', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :http => 'https://github.com/khasi04/FWTest/releases/download/1.0.0/FWTest.zip' }

    s.ios.deployment_target = '9.0'
    s.ios.vendored_frameworks = 'FWTest.framework'

end
