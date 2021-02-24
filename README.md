-----------------------------------The Divide--------------------------------------------------------------
The Divide is a rails application that has a live API feeding the Articles Table within the Database of the application.
This API has current articles from all over the world. The Divide gives you the option to join the community and comment
 on articles and reply to comments on the articles. The application has full CRUD functionality!
--------------------------------------Installation-----------------------------------------------------------
 Upon cloning the application
 1)'bundle install' in console

    2)migrate tables with command 'rails db:migrate' in console

        3)obtain omniauth key and secret
            a. https://developers.facebook.com/
                b.sign in to Facebook
                    c.obtain key and secret
                        d.navigate to or create file .env
                            e. set key and secret to constant variables to be called with devise
                                f. navigate to config/initializers/devise.rb and place your key and secret within the file as so "config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']"   
                        
                4)run 'rails s' in console

                    5)navigate to 'localhost:3000' and sign up 
                    
                        6)you can now proceed with full CRUD functionality!
----------------------------------------------------------------------------------------------------------------------------

