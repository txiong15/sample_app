class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def hello
<<<<<<< HEAD
    render text: "Hello, World!!!"
=======
    render text: "hello, world!"
>>>>>>> master
  end
  
end
