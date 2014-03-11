class ApplicationController < ActionController::Base
  protect_from_forgery

  #show error pages
  [404, 500].each do |num|
    define_method :"show_#{num}" do
      render file: "#{Rails.root}/public/404.html", status: 404, layout: false
    end
  end
end
