Pod::Spec.new do |s|
    s.name              = 'FWTestKhasi04'
    s.version           = '1.0.0'
    s.summary           = 'Framework test'
    s.homepage          = 'http://example.com'

    s.author            = { 'Name' => 'khasi04@gmail.com' }
    s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    LICENSE
  }

    s.platform          = :ios
    s.source            = { :http => 'https://storage.googleapis.com/beaconbank_wiki/Pods/1.0.0/FWTest.zip' }

    s.ios.deployment_target = '9.0'
    s.ios.vendored_frameworks = 'FWTest/FWTest.framework'

    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

end
