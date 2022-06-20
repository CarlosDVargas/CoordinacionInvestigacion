class PagesController < ApplicationController
    def home
        if !current_user
            flash[:notice] = "Para acceder a la aplicación, debe iniciar sesión."
            redirect_to new_user_session_path
        end
    end
end
