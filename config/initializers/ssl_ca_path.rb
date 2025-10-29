ca_prefix = ENV['HOMEBREW_PREFIX'] || `brew --prefix`.strip
ca_file   = File.join(ca_prefix, 'etc/openssl@3/cert.pem')
ca_dir    = File.join(ca_prefix, 'etc/openssl@3/certs')

ENV['SSL_CERT_FILE'] ||= ca_file
ENV['SSL_CERT_DIR']  ||= ca_dir

require 'openssl'
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:ca_file] = ca_file
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:ca_path] = ca_dir
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:verify_mode] = OpenSSL::SSL::VERIFY_PEER