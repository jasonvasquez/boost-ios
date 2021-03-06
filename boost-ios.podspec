Pod::Spec.new do |s|
  s.name             = "boost-ios"
  s.version          = "1.59.0"
  s.summary          = "Boost provides free peer-reviewed portable C++ source libraries."

  s.description      = <<-DESC
        We emphasize libraries that work well with the C++ Standard Library. Boost libraries
        are intended to be widely useful, and usable across a broad spectrum of applications.
        The Boost license encourages both commercial and non-commercial use.
                       DESC

  s.homepage         = "http://www.boost.org"
  s.license          = { :type => 'Boost Software License', :file => "boost/LICENSE_1_0.txt" }
  s.author           = { "Jason Vasquez" => "jason@mugfu.com" }
  s.source           = { :git => "https://github.com/jasonvasquez/boost-ios.git" }

  s.platform         = :ios, '7.0'
  s.requires_arc     = false

  boost_archive_dir = "boost_#{s.version.to_s.gsub(".", "_")}"
  boost_archive_filename = "#{boost_archive_dir}.tar.bz2"
  boost_archive_url = "http://downloads.sourceforge.net/project/boost/boost/#{s.version}/#{boost_archive_filename}"

  s.prepare_command = <<-CMD
    if [ ! -d boost ]; then
        curl -LO #{boost_archive_url}
        tar xjf #{boost_archive_filename}
        mv #{boost_archive_dir} boost
    fi
  CMD

  s.header_mappings_dir = "boost/boost"
  s.preserve_paths = "boost/boost"
  s.public_header_files = "boost/boost/**/*.{hpp,ipp,h}"
  s.header_dir = "boost"
end

