require 'sinatra'
require 'haml'
require 'i18n'

I18n.load_path << Dir[File.expand_path('locales') + "/*.yml"]
I18n.default_locale = :cz

get '/' do
  redirect to('/index/')
end

get '/index/:lang?' do |lang|
  path = request.fullpath
  if path =~ /en/
    @otherlang = 'CZ'
    path.slice!('en')
    @switchtoen = path
  else
    @otherlang = 'EN'
    @switchtoen = path + 'en'
  end
  if lang == 'en'
    I18n.locale = :en
    @home = '/index/en'
    @about = '/about/en'
    @about_footer = '/about/en'
    @products = '/products/en'
    @sale = '/sale/en'
    @support = '/support/en'
    @contact = '/index/en#contact'
  else
    I18n.locale = :cz
    @home = '/index/'
    @about = '/about/'
    @products = '/products/'
    @sale = '/sale/'
    @support = '/support/'
    @contact = '/index/#contact'
  end
  @title = 'title-index'
  @description = 'description-index'
  haml :index
end

get '/about/:lang?' do |lang|
  path = request.fullpath
  if path =~ /en/
    @otherlang = 'CZ'
    path.slice!('en')
    @switchtoen = path
  else
    @otherlang = 'EN'
    @switchtoen = path + 'en'
  end
  if lang == 'en'
    I18n.locale = :en
    @home = '/index/en'
    @about = '/about/en'
    @about_footer = '/about/en'
    @products = '/products/en'
    @sale = '/sale/en'
    @support = '/support/en'
    @contact = '/index/en#contact'
  else
    I18n.locale = :cz
    @home = '/index/'
    @about = '/about/'
    @products = '/products/'
    @sale = '/sale/'
    @support = '/support/'
    @contact = '/index/#contact'
  end
  @title = 'title-index'
  @description = 'description-index'
  haml :index
end




