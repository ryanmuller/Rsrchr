class User < ActiveRecord::Base

  has_many :user_citations
  has_many :citations, :through => :user_citations
  has_many :scrobbles
  has_many :ref_links
  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :postings

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :omniauthable

  before_save :ensure_authentication_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates :name, :presence => true

  def percent_encode(string)
    require 'uri'
    URI.escape( string, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]") ).gsub('*', '%2A')
  end

  def mendeley_query_string(parsed_url)
    require 'openssl'
    require 'base64'
    require 'cgi'

    # nonce
    nonce = Array.new( 5 ) { rand(256) }.pack('C*').unpack('H*').first

    params = {
      'oauth_consumer_key' => ENV['MENDELEY_KEY'],
      'oauth_token' => mendeley_token,
      'oauth_nonce' => nonce,
      'oauth_signature_method' => 'HMAC-SHA1',
      'oauth_timestamp' => Time.now.to_i.to_s,
      'oauth_version' => '1.0'
    }

j    # query_string 

    pairs = []
    params.sort.each { | key, val | 
      pairs.push( "#{ percent_encode( key ) }=#{ percent_encode( val.to_s ) }" )
    }
    query_string = pairs.join '&'

    # base_str
    
    # if url has query, merge key/values into params obj overwriting defaults
    if parsed_url.query
      params.merge! CGI.parse( parsed_url.query )
    end

    req_url = parsed_url.scheme + '://' + parsed_url.host + parsed_url.path
    req_method = 'GET'
    
    # ref http://oauth.net/core/1.0/#anchor14
    base_str = [ 
      req_method, 
      percent_encode( req_url ), 
      
      # normalization is just x-www-form-urlencoded
      percent_encode( query_string ) 
      
    ].join( '&' )

    # signature
    key = percent_encode( ENV['MENDELEY_SECRET'] ) + '&' + percent_encode( mendeley_secret )
    
    # ref: http://blog.nathanielbibler.com/post/63031273/openssl-hmac-vs-ruby-hmac-benchmarks
    digest = OpenSSL::Digest::Digest.new( 'sha1' )
    hmac = OpenSSL::HMAC.digest( digest, key, base_str )
    
    # ref http://groups.google.com/group/oauth-ruby/browse_thread/thread/9110ed8c8f3cae81
    signature = Base64.encode64( hmac ).chomp.gsub( /\n/, '' )

    params[ 'oauth_signature' ] = signature

    # query_string (again?!)

    pairs = []
    params.sort.each { | key, val | 
      pairs.push( "#{ percent_encode( key ) }=#{ percent_encode( val.to_s ) }" )
    }
    pairs.join '&'
  end
  
end
